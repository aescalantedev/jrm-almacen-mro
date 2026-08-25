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
    let stock, total;
    if (query) {
      const p = `%${query}%`;
      stock = db.prepare('SELECT * FROM stock_cache WHERE producto LIKE ? OR glosa LIKE ? OR lote LIKE ? ORDER BY glosa LIMIT ? OFFSET ?').all(p, p, p, limit, offset);
      const c = db.prepare('SELECT COUNT(*) as total FROM stock_cache WHERE producto LIKE ? OR glosa LIKE ? OR lote LIKE ?').get(p, p, p) as { total: number };
      total = c.total;
    } else {
      stock = db.prepare('SELECT * FROM stock_cache ORDER BY glosa LIMIT ? OFFSET ?').all(limit, offset);
      const c = db.prepare('SELECT COUNT(*) as total FROM stock_cache').get() as { total: number };
      total = c.total;
    }
    return NextResponse.json({ stock, total, page, limit });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
