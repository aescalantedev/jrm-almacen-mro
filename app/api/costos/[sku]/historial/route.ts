import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

export async function GET(req: NextRequest, { params }: { params: Promise<{ sku: string }> }) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || user.rol !== 'admin') {
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });
    }

    const { sku } = await params;
    const cleanSKU = decodeURIComponent(sku).trim().toUpperCase();

    const db = getDB();
    const product = db.prepare(`
      SELECT pr.sku, pr.glosa, pr.unidad_codigo as unidad, pr.costo_unitario_actual, pr.moneda,
             COALESCE(g.nombre, 'GENERAL') as familia
      FROM productos pr
      LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
      WHERE pr.sku = ?
    `).get(cleanSKU) as Record<string, unknown> | undefined;

    if (!product) {
      return NextResponse.json({ error: 'Producto no encontrado' }, { status: 404 });
    }

    const historial = db.prepare(`
      SELECT h.*, u.nombre as usuario_nombre
      FROM producto_costos_historial h
      LEFT JOIN usuarios u ON h.created_by = u.id
      WHERE h.producto_sku = ?
      ORDER BY h.id DESC
    `).all(cleanSKU);

    return NextResponse.json({ product, historial });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
