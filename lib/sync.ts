import { getDB } from './db';
import { fetchStockFromSQLServer } from './sqlserver';

export async function syncStock() {
  const db = getDB();
  try {
    const stockData = await fetchStockFromSQLServer();
    const upsert = db.prepare(`
      INSERT INTO stock_cache (empresa, bodega, ubicacion, lote, producto,
        glosa, tipoproducto, unidad, stock, familia, subfamilia, tipo,
        peso, tipo_acero, grado_acero, espesor_acero, peso_producto,
        ultimo_ingreso, fecha_sync)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, datetime('now'))
      ON CONFLICT(lote, producto) DO UPDATE SET
        stock = excluded.stock, ubicacion = excluded.ubicacion,
        glosa = excluded.glosa, unidad = excluded.unidad,
        familia = excluded.familia, subfamilia = excluded.subfamilia,
        tipo = excluded.tipo, peso = excluded.peso,
        tipo_acero = excluded.tipo_acero, grado_acero = excluded.grado_acero,
        espesor_acero = excluded.espesor_acero, peso_producto = excluded.peso_producto,
        ultimo_ingreso = excluded.ultimo_ingreso, fecha_sync = datetime('now')
    `);
    const updateInventarioStock = db.prepare(`
      UPDATE inventario 
      SET stock_sistema = ?,
          dif = cantidad_fisica - ?,
          total_costo = ? * costo_unitario,
          s_dif = (cantidad_fisica - ?) * costo_unitario
      WHERE producto = ? AND (lote = ? OR (lote IS NULL AND ? = '') OR lote = '')
    `);

    const sanitizeStr = (val: unknown, defaultVal = "") => {
      if (val === undefined || val === null) return defaultVal;
      if (val instanceof Date) return val.toISOString();
      return String(val);
    };

    const sanitizeNum = (val: unknown, defaultVal = 0) => {
      if (val === undefined || val === null) return defaultVal;
      const num = Number(val);
      return isNaN(num) ? defaultVal : num;
    };

    const sanitizeDate = (val: unknown) => {
      if (val === undefined || val === null) return null;
      if (val instanceof Date) return isNaN(val.getTime()) ? null : val.toISOString();
      return String(val);
    };

    const upsertMany = db.transaction((rows: Record<string, unknown>[]) => {
      let count = 0;
      for (const row of rows) {
        const prod = sanitizeStr(row.PRODUCTO);
        const lote = sanitizeStr(row.Lote);
        const stockNum = sanitizeNum(row.Stock);

        upsert.run(
          sanitizeStr(row.EMPRESA),
          sanitizeStr(row.Bodega),
          sanitizeStr(row.Ubicacion),
          lote,
          prod,
          sanitizeStr(row.GLOSA),
          sanitizeStr(row.TIPOPRODUCTO),
          sanitizeStr(row.UNIDAD),
          stockNum,
          sanitizeStr(row.FAMILIA),
          sanitizeStr(row.SUB_FAMILIA || row.SUBFAMILIA),
          sanitizeStr(row.TIPO),
          sanitizeNum(row.PESO),
          sanitizeStr(row['TIPO DE ACERO'] || row.TIPO_ACERO),
          sanitizeStr(row['GRADO DE ACERO'] || row.GRADO_ACERO),
          sanitizeStr(row['ESPESOR DE ACERO'] || row.ESPESOR_ACERO),
          sanitizeNum(row.PesoProducto || row.PESO_PRODUCTO),
          sanitizeDate(row.UltimoIngreso)
        );

        // Update system stock in inventario matching (producto, lote) without deleting user fields
        updateInventarioStock.run(stockNum, stockNum, stockNum, stockNum, prod, lote, lote);

        count++;
      }
      return count;
    });
    const count = upsertMany(stockData);
    db.prepare(`INSERT INTO sync_log (tipo, registros_sync, estado, detalle) VALUES ('stock', ?, 'ok', ?)`)
      .run(count, `Sync completado: ${count} registros actualizados`);
    return { success: true, registros: count };
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    db.prepare(`INSERT INTO sync_log (tipo, registros_sync, estado, detalle) VALUES ('stock', 0, 'error', ?)`).run(msg);
    return { success: false, error: msg };
  }
}

export function getSyncLog(limit = 20) {
  const db = getDB();
  return db.prepare('SELECT * FROM sync_log ORDER BY fecha DESC LIMIT ?').all(limit);
}

export function getLastSync() {
  const db = getDB();
  return db.prepare("SELECT * FROM sync_log WHERE estado = 'ok' ORDER BY fecha DESC LIMIT 1").get();
}
