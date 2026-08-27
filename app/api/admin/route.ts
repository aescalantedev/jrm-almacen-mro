import { NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function GET() {
  try {
    const db = getDB();

    const totalRegistros = db.prepare('SELECT COUNT(*) as total FROM inventario').get() as { total: number } || { total: 0 };

    const totalAuditados = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number } || { total: 0 };

    const totalOk = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE observacion = 'OK' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number } || { total: 0 };

    const totalFaltante = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE observacion = 'FALTANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number } || { total: 0 };

    const totalSobrante = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE observacion = 'SOBRANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number } || { total: 0 };

    const totalPendiente = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE cantidad_fisica IS NULL OR cantidad_fisica = 0
    `).get() as { total: number } || { total: 0 };

    // Stock dinámico total del sistema
    const totalStockSistema = db.prepare(`
      SELECT COALESCE(SUM(s.stock), 0) + COALESCE((SELECT SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE -cantidad END) FROM movimientos), 0) as total
      FROM stock_cache s
    `).get() as { total: number } || { total: 0 };

    const totalCantFisica = db.prepare('SELECT COALESCE(SUM(cantidad_fisica), 0) as total FROM inventario').get() as { total: number } || { total: 0 };
    
    const totalValor = db.prepare(`
      SELECT COALESCE(SUM(i.cantidad_fisica * COALESCE(p.costo_unitario_actual, 0)), 0) as total
      FROM inventario i 
      LEFT JOIN productos p ON i.producto = p.sku
    `).get() as { total: number } || { total: 0 };

    const totalValorSistema = db.prepare(`
      SELECT COALESCE(SUM(s.stock * COALESCE(p.costo_unitario_actual, 0)), 0) as total
      FROM stock_cache s
      LEFT JOIN productos p ON s.producto = p.sku
    `).get() as { total: number } || { total: 0 };

    const totalDiferenciaValor = db.prepare('SELECT COALESCE(SUM(s_dif), 0) as total FROM inventario').get() as { total: number } || { total: 0 };
    
    let stockTotal = { total: 0 };
    try {
      stockTotal = db.prepare('SELECT COUNT(*) as total FROM productos WHERE is_deleted = 0').get() as { total: number } || { total: 0 };
    } catch {
      stockTotal = db.prepare('SELECT COUNT(*) as total FROM productos').get() as { total: number } || { total: 0 };
    }

    let porFamilia: any[] = [];
    try {
      porFamilia = db.prepare(`
        SELECT
          COALESCE(g.nombre, NULLIF(i.familia2, ''), 'GENERAL') as name,
          COUNT(*) as total_items,
          SUM(CASE WHEN i.observacion = 'OK' THEN 1 ELSE 0 END) as ok_count,
          SUM(CASE WHEN i.observacion = 'FALTANTE' THEN 1 ELSE 0 END) as faltante_count,
          SUM(CASE WHEN i.observacion = 'SOBRANTE' THEN 1 ELSE 0 END) as sobrante_count,
          ROUND(COALESCE(SUM(i.cantidad_fisica), 0), 2) as cant_fisica,
          ROUND(COALESCE(SUM(s.stock), 0), 2) as stock_sistema,
          ROUND(COALESCE(SUM(i.cantidad_fisica * COALESCE(p.costo_unitario_actual, 0)), 0), 2) as valor_total
        FROM inventario i
        LEFT JOIN productos p ON i.producto = p.sku
        LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
        LEFT JOIN stock_cache s ON i.producto = s.producto AND IFNULL(i.lote, '') = IFNULL(s.lote, '')
        GROUP BY name
        ORDER BY total_items DESC
        LIMIT 10
      `).all();
    } catch (err) {
      console.warn('[API /api/admin] porFamilia query warning:', err);
    }

    const porEstado = [
      { name: 'OK', value: totalOk.total || 0, color: '#10B981' },
      { name: 'Faltante', value: totalFaltante.total || 0, color: '#F43F5E' },
      { name: 'Sobrante', value: totalSobrante.total || 0, color: '#F59E0B' },
      { name: 'Pendiente', value: totalPendiente.total || 0, color: '#94A3B8' },
    ];

    let porRack: any[] = [];
    try {
      porRack = db.prepare(`
        SELECT
          COALESCE(NULLIF(i.rack, ''), NULLIF(p.rack, ''), 'SIN RACK') as rack,
          COUNT(*) as count,
          SUM(CASE WHEN i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0 THEN 1 ELSE 0 END) as auditados
        FROM inventario i
        LEFT JOIN productos p ON i.producto = p.sku
        GROUP BY rack
        ORDER BY count DESC
        LIMIT 8
      `).all();
    } catch (err) {
      console.warn('[API /api/admin] porRack query warning:', err);
    }

    let topDiferencias: any[] = [];
    try {
      topDiferencias = db.prepare(`
        SELECT i.id, i.producto, 
               COALESCE(p.glosa, i.producto) as descripcion, 
               (COALESCE(s.stock, 0) + COALESCE(m.ingresos, 0) - COALESCE(m.salidas, 0)) as stock_sistema,
               i.cantidad_fisica, i.dif, i.s_dif, i.observacion, 
               COALESCE(NULLIF(i.rack, ''), p.rack, '') as rack, 
               COALESCE(NULLIF(i.ubicacion_actual, ''), p.posicion_detalle, '') as ubicacion_actual,
               COALESCE(g.nombre, 'GENERAL') as familia2
        FROM inventario i
        LEFT JOIN productos p ON i.producto = p.sku
        LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
        LEFT JOIN stock_cache s ON i.producto = s.producto AND IFNULL(i.lote, '') = IFNULL(s.lote, '')
        LEFT JOIN (
          SELECT producto,
                 SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as ingresos,
                 SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as salidas
          FROM movimientos
          GROUP BY producto
        ) m ON i.producto = m.producto
        WHERE i.dif != 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0
        ORDER BY ABS(i.dif) DESC
        LIMIT 10
      `).all();
    } catch (err) {
      console.warn('[API /api/admin] topDiferencias warning:', err);
    }

    let porUsuario: any[] = [];
    try {
      porUsuario = db.prepare(`
        SELECT u.nombre, u.usuario, COUNT(i.id) as registros,
               SUM(CASE WHEN i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0 THEN 1 ELSE 0 END) as auditados,
               ROUND(AVG(NULLIF(i.duracion_segundos, 0)), 1) as tiempo_promedio_seg
        FROM usuarios u
        LEFT JOIN inventario i ON u.id = i.usuario_id
        WHERE u.rol IN ('contador', 'admin', 'almacenero', 'auditor')
        GROUP BY u.id
      `).all();
    } catch (err) {
      console.warn('[API /api/admin] porUsuario warning:', err);
    }

    let ultimosRegistros: any[] = [];
    try {
      ultimosRegistros = db.prepare(`
        SELECT i.*, 
               COALESCE(p.glosa, i.producto) as descripcion, 
               COALESCE(p.unidad_codigo, 'UND') as unidad, 
               COALESCE(g.nombre, 'GENERAL') as familia, 
               COALESCE(p.costo_unitario_actual, 0) as costo_unitario,
               (COALESCE(s.stock, 0) + COALESCE(m.ingresos, 0) - COALESCE(m.salidas, 0)) as stock_sistema, 
               u.nombre as usuario_nombre
        FROM inventario i
        LEFT JOIN productos p ON i.producto = p.sku
        LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
        LEFT JOIN stock_cache s ON i.producto = s.producto AND IFNULL(i.lote, '') = IFNULL(s.lote, '')
        LEFT JOIN (
          SELECT producto,
                 SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as ingresos,
                 SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as salidas
          FROM movimientos
          GROUP BY producto
        ) m ON i.producto = m.producto
        LEFT JOIN usuarios u ON i.usuario_id = u.id
        ORDER BY i.updated_at DESC
        LIMIT 15
      `).all();
    } catch (err) {
      console.warn('[API /api/admin] ultimosRegistros warning:', err);
    }

    return NextResponse.json({
      stats: {
        totalRegistros: totalRegistros.total || 0,
        totalAuditados: totalAuditados.total || 0,
        totalOk: totalOk.total || 0,
        totalFaltante: totalFaltante.total || 0,
        totalSobrante: totalSobrante.total || 0,
        totalStockSistema: Math.round((totalStockSistema.total || 0) * 100) / 100,
        totalCantFisica: Math.round((totalCantFisica.total || 0) * 100) / 100,
        totalValor: Math.round((totalValor.total || 0) * 100) / 100,
        totalValorSistema: Math.round((totalValorSistema.total || 0) * 100) / 100,
        totalDiferenciaValor: Math.round((totalDiferenciaValor.total || 0) * 100) / 100,
        stockTotal: stockTotal.total || 0,
        porcentajeCompletado: totalRegistros.total > 0 ? Math.round((totalAuditados.total / totalRegistros.total) * 100) : 0,
      },
      porFamilia,
      porEstado,
      porRack,
      topDiferencias,
      porUsuario,
      ultimosRegistros,
    });
  } catch (error: unknown) {
    const errorMsg = error instanceof Error ? error.message : String(error);
    console.error('[API /api/admin FATAL ERROR]:', error);
    return NextResponse.json({ 
      error: errorMsg,
      stats: {
        totalRegistros: 0,
        totalAuditados: 0,
        totalOk: 0,
        totalFaltante: 0,
        totalSobrante: 0,
        totalStockSistema: 0,
        totalCantFisica: 0,
        totalValor: 0,
        totalValorSistema: 0,
        totalDiferenciaValor: 0,
        stockTotal: 0,
        porcentajeCompletado: 0,
      },
      porFamilia: [],
      porEstado: [],
      porRack: [],
      topDiferencias: [],
      porUsuario: [],
      ultimosRegistros: [],
    }, { status: 200 }); // Return status 200 with fallback empty data so UI never crashes!
  }
}
