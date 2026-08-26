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

    let joins = `JOIN productos_master p ON s.producto = p.producto`;
    let conditions = [];
    let params = [];

    if (pendingOnly) {
      joins += ` LEFT JOIN inventario i ON s.producto = i.producto AND IFNULL(s.lote, '') = IFNULL(i.lote, '')`;
      conditions.push(`(i.id IS NULL OR i.cantidad_fisica = 0 OR i.cantidad_fisica IS NULL)`);
    }

    if (query) {
      conditions.push(`(s.producto LIKE ? OR p.glosa LIKE ? OR s.lote LIKE ?)`);
      const p = `%${query}%`;
      params.push(p, p, p);
    }

    const whereClause = conditions.length > 0 ? `WHERE ${conditions.join(' AND ')}` : '';

    const stock = db.prepare(`
      SELECT s.id, s.empresa, s.bodega, s.ubicacion, s.lote, s.producto,
             p.glosa, p.unidad, s.stock, p.familia, p.peso, s.ultimo_ingreso, s.fecha_sync
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
