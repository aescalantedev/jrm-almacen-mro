import { NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function GET() {
  try {
    const db = getDB();
    const totalRegistros = db.prepare('SELECT COUNT(*) as total FROM inventario').get() as { total: number };

    const totalAuditados = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number };

    const totalOk = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE observacion = 'OK' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number };

    const totalFaltante = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE observacion = 'FALTANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number };

    const totalSobrante = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE observacion = 'SOBRANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { total: number };

    const totalPendiente = db.prepare(`
      SELECT COUNT(*) as total FROM inventario
      WHERE cantidad_fisica IS NULL OR cantidad_fisica = 0
    `).get() as { total: number };

    const totalStockSistema = db.prepare(`
      SELECT COALESCE(SUM(s.stock), 0) as total
      FROM inventario i JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
    `).get() as { total: number };
    const totalCantFisica = db.prepare('SELECT COALESCE(SUM(cantidad_fisica), 0) as total FROM inventario').get() as { total: number };
    const totalValor = db.prepare(`
      SELECT COALESCE(SUM(i.cantidad_fisica * p.costo_unitario), 0) as total
      FROM inventario i JOIN productos_master p ON i.producto = p.producto
    `).get() as { total: number };
    const totalValorSistema = db.prepare(`
      SELECT COALESCE(SUM(s.stock * p.costo_unitario), 0) as total
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
    `).get() as { total: number };
    const totalDiferenciaValor = db.prepare('SELECT COALESCE(SUM(s_dif), 0) as total FROM inventario').get() as { total: number };
    const stockTotal = db.prepare('SELECT COUNT(*) as total FROM stock_cache').get() as { total: number };

    const porFamilia = db.prepare(`
      SELECT
        COALESCE(NULLIF(i.familia2, ''), 'OTROS') as name,
        COUNT(*) as total_items,
        SUM(CASE WHEN i.observacion = 'OK' THEN 1 ELSE 0 END) as ok_count,
        SUM(CASE WHEN i.observacion = 'FALTANTE' THEN 1 ELSE 0 END) as faltante_count,
        SUM(CASE WHEN i.observacion = 'SOBRANTE' THEN 1 ELSE 0 END) as sobrante_count,
        ROUND(COALESCE(SUM(i.cantidad_fisica), 0), 2) as cant_fisica,
        ROUND(COALESCE(SUM(s.stock), 0), 2) as stock_sistema,
        ROUND(COALESCE(SUM(i.cantidad_fisica * p.costo_unitario), 0), 2) as valor_total
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
      GROUP BY i.familia2
      ORDER BY total_items DESC
      LIMIT 10
    `).all();

    const porEstado = [
      { name: 'OK', value: totalOk.total, color: '#10B981' },
      { name: 'Faltante', value: totalFaltante.total, color: '#F43F5E' },
      { name: 'Sobrante', value: totalSobrante.total, color: '#F59E0B' },
      { name: 'Pendiente', value: totalPendiente.total, color: '#94A3B8' },
    ];

    const porRack = db.prepare(`
      SELECT
        COALESCE(NULLIF(i.rack, ''), 'SIN RACK') as rack,
        COUNT(*) as count,
        SUM(CASE WHEN i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0 THEN 1 ELSE 0 END) as auditados
      FROM inventario i
      GROUP BY i.rack
      ORDER BY count DESC
      LIMIT 8
    `).all();

    const topDiferencias = db.prepare(`
      SELECT i.id, i.producto, p.glosa as descripcion, s.stock as stock_sistema,
             i.cantidad_fisica, i.dif, i.s_dif, i.observacion, i.rack, i.ubicacion_actual, i.familia2
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
      WHERE i.dif != 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0
      ORDER BY ABS(i.dif) DESC
      LIMIT 10
    `).all();

    const porUsuario = db.prepare(`
      SELECT u.nombre, u.usuario, COUNT(i.id) as registros,
             SUM(CASE WHEN i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0 THEN 1 ELSE 0 END) as auditados
      FROM usuarios u
      LEFT JOIN inventario i ON u.id = i.usuario_id
      WHERE u.rol = 'contador' OR u.rol = 'admin'
      GROUP BY u.id
    `).all();

    const ultimosRegistros = db.prepare(`
      SELECT i.*, p.glosa as descripcion, p.unidad, p.familia, p.costo_unitario,
             s.stock as stock_sistema, u.nombre as usuario_nombre
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
      LEFT JOIN usuarios u ON i.usuario_id = u.id
      ORDER BY i.updated_at DESC
      LIMIT 15
    `).all();

    return NextResponse.json({
      stats: {
        totalRegistros: totalRegistros.total,
        totalAuditados: totalAuditados.total,
        totalOk: totalOk.total,
        totalFaltante: totalFaltante.total,
        totalSobrante: totalSobrante.total,
        totalStockSistema: totalStockSistema.total,
        totalCantFisica: totalCantFisica.total,
        totalValor: totalValor.total,
        totalValorSistema: totalValorSistema.total,
        totalDiferenciaValor: totalDiferenciaValor.total,
        stockTotal: stockTotal.total,
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
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
