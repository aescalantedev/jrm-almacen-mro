import { getDB } from './db';
import { fetchStockFromSQLServer } from './sqlserver';

export async function syncStock() {
  const db = getDB();
  try {
    const stockData = await fetchStockFromSQLServer();

    const upsertMaster = db.prepare(`
      INSERT INTO productos_master (producto, glosa, unidad, familia, subfamilia, tipo,
        peso, tipo_acero, grado_acero, espesor_acero, peso_producto, updated_at)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, datetime('now', '-5 hours'))
      ON CONFLICT(producto) DO UPDATE SET
        glosa = excluded.glosa, unidad = excluded.unidad,
        familia = excluded.familia, subfamilia = excluded.subfamilia,
        tipo = excluded.tipo, peso = excluded.peso,
        tipo_acero = excluded.tipo_acero, grado_acero = excluded.grado_acero,
        espesor_acero = excluded.espesor_acero, peso_producto = excluded.peso_producto,
        updated_at = datetime('now', '-5 hours')
    `);

    const upsertStock = db.prepare(`
      INSERT INTO stock_cache (empresa, bodega, ubicacion, lote, producto,
        stock, ultimo_ingreso, fecha_sync)
      VALUES (?, ?, ?, ?, ?, ?, ?, datetime('now', '-5 hours'))
      ON CONFLICT(lote, producto) DO UPDATE SET
        stock = excluded.stock, ubicacion = excluded.ubicacion,
        ultimo_ingreso = excluded.ultimo_ingreso,
        fecha_sync = datetime('now', '-5 hours')
    `);

    const updateInventarioDif = db.prepare(`
      UPDATE inventario SET
        dif = cantidad_fisica - ?,
        total_costo = ? * (SELECT costo_unitario FROM productos_master WHERE producto = ?),
        s_dif = (cantidad_fisica - ?) * (SELECT costo_unitario FROM productos_master WHERE producto = ?)
      WHERE producto = ? AND lote = ?
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
        const rawLote = sanitizeStr(row.Lote);
        const lote = (rawLote === '' || rawLote === '0') ? '' : '';
        const stockNum = sanitizeNum(row.Stock);

        upsertMaster.run(
          prod,
          sanitizeStr(row.GLOSA),
          sanitizeStr(row.UNIDAD),
          sanitizeStr(row.FAMILIA),
          sanitizeStr(row.SUB_FAMILIA || row.SUBFAMILIA),
          sanitizeStr(row.TIPO),
          sanitizeNum(row.PESO),
          sanitizeStr(row['TIPO DE ACERO'] || row.TIPO_ACERO),
          sanitizeStr(row['GRADO DE ACERO'] || row.GRADO_ACERO),
          sanitizeStr(row['ESPESOR DE ACERO'] || row.ESPESOR_ACERO),
          sanitizeNum(row.PesoProducto || row.PESO_PRODUCTO)
        );

        upsertStock.run(
          sanitizeStr(row.EMPRESA),
          sanitizeStr(row.Bodega),
          sanitizeStr(row.Ubicacion),
          lote,
          prod,
          stockNum,
          sanitizeDate(row.UltimoIngreso)
        );

        updateInventarioDif.run(stockNum, stockNum, prod, stockNum, prod, prod, lote);
        count++;
      }
      return count;
    });

    const count = upsertMany(stockData);

    const newProducts = db.prepare(`
      INSERT OR IGNORE INTO inventario (producto, lote, familia2, cantidad_fisica, dif, observacion, fecha_conteo)
      SELECT s.producto, s.lote, '', 0, 0 - s.stock, 'PENDIENTE', datetime('now', '-5 hours')
      FROM stock_cache s
      WHERE NOT EXISTS (
        SELECT 1 FROM inventario i WHERE i.producto = s.producto
      )
    `).run();
    const newCount = newProducts.changes;

    const msg = newCount > 0
      ? `Sync completado: ${count} registros actualizados, ${newCount} nuevos pendientes de conteo`
      : `Sync completado: ${count} registros actualizados`;
    db.prepare(`INSERT INTO sync_log (tipo, registros_sync, estado, detalle) VALUES ('stock', ?, 'ok', ?)`)
      .run(count, msg);
    return { success: true, registros: count, nuevos: newCount };
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
