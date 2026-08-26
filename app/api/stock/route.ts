import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function GET(req: NextRequest) {
  try {
    const db = getDB();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const pendingOnly = searchParams.get('pending') === 'true';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    const joins = `
      JOIN productos_master p ON s.producto = p.producto
      LEFT JOIN inventario i ON s.producto = i.producto AND IFNULL(s.lote, '') = IFNULL(i.lote, '')
      LEFT JOIN (
        SELECT producto, IFNULL(lote, '') as m_lote,
               SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as total_ingresos,
               SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as total_salidas
        FROM movimientos
        GROUP BY producto, IFNULL(lote, '')
      ) m ON s.producto = m.producto AND IFNULL(s.lote, '') = m.m_lote
    `;
    const conditions = [];
    const params = [];

    if (pendingOnly) {
      conditions.push(`(i.id IS NULL OR i.cantidad_fisica = 0 OR i.cantidad_fisica IS NULL)`);
    }

    if (query) {
      conditions.push(`(UPPER(s.producto) LIKE UPPER(?) OR UPPER(p.glosa) LIKE UPPER(?) OR UPPER(s.lote) LIKE UPPER(?))`);
      const p = `%${query.trim()}%`;
      params.push(p, p, p);
    }

    const whereClause = conditions.length > 0 ? `WHERE ${conditions.join(' AND ')}` : '';

    const stock = db.prepare(`
      SELECT s.id, s.empresa, s.bodega, s.ubicacion, s.lote, s.producto,
             p.glosa, p.unidad, s.stock, p.familia, p.peso, s.ultimo_ingreso, s.fecha_sync,
             i.id as inventario_id,
             i.cantidad_fisica,
             i.dif,
             i.um as inventario_um,
             i.presentacion,
             i.n_cajas_bultos,
             i.largo,
             i.ancho,
             i.alto,
             i.peso_total_cant_fisica,
             i.observacion as inventario_observacion,
             i.comentario,
             i.rack,
             i.ubicacion_actual,
             i.almacenamiento,
             i.contenedor,
             i.responsable,
             i.fecha_conteo,
             i.familia2,
             i.foto_path,
             i.usuario_id,
             i.updated_at as inventario_updated_at,
             (CASE WHEN (i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0) OR i.usuario_id IS NOT NULL OR (i.comentario IS NOT NULL AND i.comentario != '') THEN 1 ELSE 0 END) as ya_contado,
             COALESCE(m.total_ingresos, 0) as total_ingresos,
             COALESCE(m.total_salidas, 0) as total_salidas,
             (COALESCE(i.cantidad_fisica, s.stock, 0) + COALESCE(m.total_ingresos, 0) - COALESCE(m.total_salidas, 0)) as stock_disponible
      FROM stock_cache s
      ${joins}
      ${whereClause}
      ORDER BY p.glosa LIMIT ? OFFSET ?
    `).all(...params, limit, offset);

    const countRow = db.prepare(`
      SELECT COUNT(*) as total 
      FROM stock_cache s
      ${joins}
      ${whereClause}
    `).get(...params) as { total: number };

    const total = countRow.total;
    return NextResponse.json({ stock, total, page, limit });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
