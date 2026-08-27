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
      LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
      LEFT JOIN stock_cache sc ON pr.sku = sc.producto
      LEFT JOIN inventario i ON pr.sku = i.producto
      LEFT JOIN (
        SELECT producto,
               SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as total_ingresos,
               SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as total_salidas
        FROM movimientos
        GROUP BY producto
      ) m ON pr.sku = m.producto
    `;
    const conditions = [];
    const params = [];

    if (pendingOnly) {
      conditions.push(`(i.id IS NULL OR i.cantidad_fisica = 0 OR i.cantidad_fisica IS NULL)`);
    }

    if (query) {
      conditions.push(`(UPPER(pr.sku) LIKE UPPER(?) OR UPPER(pr.glosa) LIKE UPPER(?) OR UPPER(COALESCE(g.nombre, '')) LIKE UPPER(?) OR UPPER(pr.rack) LIKE UPPER(?))`);
      const p = `%${query.trim()}%`;
      params.push(p, p, p, p);
    }

    const whereClause = conditions.length > 0 ? `WHERE ${conditions.join(' AND ')}` : '';

    const stock = db.prepare(`
      SELECT 
        pr.sku as producto,
        COALESCE(sc.lote, '') as lote,
        pr.glosa,
        pr.unidad_codigo as unidad,
        (COALESCE(i.cantidad_fisica, sc.stock, 0) + COALESCE(m.total_ingresos, 0) - COALESCE(m.total_salidas, 0)) as stock,
        COALESCE(g.nombre, 'GENERAL') as familia,
        pr.peso_neto as peso,
        sc.ultimo_ingreso,
        sc.fecha_sync,
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
        COALESCE(NULLIF(i.rack, ''), NULLIF(pr.rack, ''), 'Sin asignar') as rack,
        COALESCE(NULLIF(i.ubicacion_actual, ''), pr.posicion_detalle, '') as ubicacion_actual,
        COALESCE(NULLIF(i.almacenamiento, ''), pr.almacenamiento_codigo, 'C.C.01') as almacenamiento,
        COALESCE(NULLIF(i.contenedor, ''), '1') as contenedor,
        i.responsable,
        i.fecha_conteo,
        i.familia2,
        COALESCE(i.foto_path, pr.foto_url) as foto_path,
        i.usuario_id,
        i.updated_at as inventario_updated_at,
        (CASE WHEN (i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0) OR i.usuario_id IS NOT NULL OR (i.comentario IS NOT NULL AND i.comentario != '') THEN 1 ELSE 0 END) as ya_contado,
        COALESCE(m.total_ingresos, 0) as total_ingresos,
        COALESCE(m.total_salidas, 0) as total_salidas,
        (COALESCE(i.cantidad_fisica, sc.stock, 0) + COALESCE(m.total_ingresos, 0) - COALESCE(m.total_salidas, 0)) as stock_disponible
      FROM productos pr
      ${joins}
      ${whereClause}
      ORDER BY pr.glosa LIMIT ? OFFSET ?
    `).all(...params, limit, offset);

    const countRow = db.prepare(`
      SELECT COUNT(DISTINCT pr.sku) as total 
      FROM productos pr
      ${joins}
      ${whereClause}
    `).get(...params) as { total: number };

    const total = countRow.total;
    return NextResponse.json({ stock, total, page, limit });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
