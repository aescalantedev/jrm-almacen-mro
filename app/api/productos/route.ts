import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function GET(req: NextRequest) {
  try {
    const db = getDB();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    let items, total;
    if (query) {
      const p = `%${query.trim()}%`;
      items = db.prepare(`
        SELECT p.*,
               COUNT(DISTINCT i.id) as inventario_count,
               COUNT(DISTINCT s.lote) as lotes_count,
               COALESCE(
                 NULLIF((SELECT inv.rack FROM inventario inv WHERE inv.producto = p.producto AND inv.rack != '' ORDER BY inv.id DESC LIMIT 1), ''),
                 NULLIF((SELECT inv.ubicacion_actual FROM inventario inv WHERE inv.producto = p.producto AND inv.ubicacion_actual != '' ORDER BY inv.id DESC LIMIT 1), ''),
                 NULLIF((SELECT sc.ubicacion FROM stock_cache sc WHERE sc.producto = p.producto AND sc.ubicacion != '' LIMIT 1), ''),
                 NULLIF((SELECT m.rack FROM movimientos m WHERE m.producto = p.producto AND m.rack != '' ORDER BY m.id DESC LIMIT 1), ''),
                 'Sin asignar'
               ) as rack,
               COALESCE(
                 (
                   SELECT SUM(COALESCE(inv.cantidad_fisica, sc.stock, 0))
                   FROM stock_cache sc
                   LEFT JOIN inventario inv ON sc.producto = inv.producto AND IFNULL(sc.lote, '') = IFNULL(inv.lote, '')
                   WHERE sc.producto = p.producto
                 ),
                 0
               ) + COALESCE(
                 (SELECT SUM(CASE WHEN m.tipo = 'INGRESO' THEN m.cantidad ELSE -m.cantidad END) FROM movimientos m WHERE m.producto = p.producto),
                 0
               ) as stock_total
        FROM productos_master p
        LEFT JOIN inventario i ON p.producto = i.producto
        LEFT JOIN stock_cache s ON p.producto = s.producto
        WHERE UPPER(p.producto) LIKE UPPER(?) OR UPPER(p.glosa) LIKE UPPER(?) OR UPPER(p.familia) LIKE UPPER(?)
        GROUP BY p.producto
        ORDER BY p.glosa LIMIT ? OFFSET ?
      `).all(p, p, p, limit, offset);
      const c = db.prepare(`
        SELECT COUNT(*) as total FROM productos_master p
        WHERE UPPER(p.producto) LIKE UPPER(?) OR UPPER(p.glosa) LIKE UPPER(?) OR UPPER(p.familia) LIKE UPPER(?)
      `).get(p, p, p) as { total: number };
      total = c.total;
    } else {
      items = db.prepare(`
        SELECT p.*,
               COUNT(DISTINCT i.id) as inventario_count,
               COUNT(DISTINCT s.lote) as lotes_count,
               COALESCE(
                 NULLIF((SELECT inv.rack FROM inventario inv WHERE inv.producto = p.producto AND inv.rack != '' ORDER BY inv.id DESC LIMIT 1), ''),
                 NULLIF((SELECT inv.ubicacion_actual FROM inventario inv WHERE inv.producto = p.producto AND inv.ubicacion_actual != '' ORDER BY inv.id DESC LIMIT 1), ''),
                 NULLIF((SELECT sc.ubicacion FROM stock_cache sc WHERE sc.producto = p.producto AND sc.ubicacion != '' LIMIT 1), ''),
                 NULLIF((SELECT m.rack FROM movimientos m WHERE m.producto = p.producto AND m.rack != '' ORDER BY m.id DESC LIMIT 1), ''),
                 'Sin asignar'
               ) as rack,
               COALESCE(
                 (
                   SELECT SUM(COALESCE(inv.cantidad_fisica, sc.stock, 0))
                   FROM stock_cache sc
                   LEFT JOIN inventario inv ON sc.producto = inv.producto AND IFNULL(sc.lote, '') = IFNULL(inv.lote, '')
                   WHERE sc.producto = p.producto
                 ),
                 0
               ) + COALESCE(
                 (SELECT SUM(CASE WHEN m.tipo = 'INGRESO' THEN m.cantidad ELSE -m.cantidad END) FROM movimientos m WHERE m.producto = p.producto),
                 0
               ) as stock_total
        FROM productos_master p
        LEFT JOIN inventario i ON p.producto = i.producto
        LEFT JOIN stock_cache s ON p.producto = s.producto
        GROUP BY p.producto
        ORDER BY p.glosa LIMIT ? OFFSET ?
      `).all(limit, offset);
      const c = db.prepare('SELECT COUNT(*) as total FROM productos_master').get() as { total: number };
      total = c.total;
    }
    return NextResponse.json({ items, total, page, limit });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  try {
    const db = getDB();
    const body = await req.json();
    const { producto, ...fields } = body;
    if (!producto) return NextResponse.json({ error: 'El campo producto es requerido' }, { status: 400 });

    const allowed = ['glosa', 'unidad', 'familia', 'subfamilia', 'tipo', 'peso', 'costo_unitario', 'tipo_acero', 'grado_acero', 'espesor_acero', 'peso_producto'];
    const setClauses: string[] = [];
    const values: (string | number)[] = [];

    for (const key of allowed) {
      if (fields[key] !== undefined) {
        setClauses.push(`${key} = ?`);
        values.push(typeof fields[key] === 'string' ? fields[key] : Number(fields[key]));
      }
    }

    if (setClauses.length === 0) {
      return NextResponse.json({ error: 'No hay campos para actualizar' }, { status: 400 });
    }

    setClauses.push("updated_at = datetime('now', '-5 hours')");
    values.push(producto);

    db.prepare(`UPDATE productos_master SET ${setClauses.join(', ')} WHERE producto = ?`).run(...values);

    if (fields.costo_unitario !== undefined) {
      const costo = Number(fields.costo_unitario);
      db.prepare(`
        UPDATE inventario SET
          total_costo = (
            SELECT COALESCE(s.stock, 0) * ? FROM stock_cache s
            WHERE s.producto = inventario.producto AND s.lote = inventario.lote
          ),
          s_dif = dif * ?
        WHERE producto = ?
      `).run(costo, costo, producto);
    }

    return NextResponse.json({ success: true });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
