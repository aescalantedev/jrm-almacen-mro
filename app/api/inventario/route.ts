import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function GET(req: NextRequest) {
  try {
    const db = getDB();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const usuario_id = searchParams.get('usuario_id') || '';
    const observacion = searchParams.get('observacion') || '';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '9999');
    const offset = (page - 1) * limit;
    let conditions: string[] = [];
    let params: unknown[] = [];
    if (query) { conditions.push('(producto LIKE ? OR descripcion LIKE ? OR lote LIKE ?)'); const p = `%${query}%`; params.push(p, p, p); }
    if (usuario_id) { conditions.push('usuario_id = ?'); params.push(parseInt(usuario_id)); }
    if (observacion) { conditions.push('observacion = ?'); params.push(observacion); }
    const where = conditions.length > 0 ? 'WHERE ' + conditions.join(' AND ') : '';
    const items = db.prepare(`SELECT i.*, u.nombre as usuario_nombre FROM inventario i LEFT JOIN usuarios u ON i.usuario_id = u.id ${where} ORDER BY i.updated_at DESC LIMIT ? OFFSET ?`).all(...params, limit, offset);
    const countRow = db.prepare(`SELECT COUNT(*) as total FROM inventario i ${where}`).get(...params) as { total: number };
    return NextResponse.json({ items, total: countRow.total, page, limit });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const db = getDB();
    const body = await req.json();
    const { producto, lote, descripcion, stock_sistema, unidad, familia, familia2,
      cantidad_fisica, um, presentacion, n_cajas_bultos, largo, ancho, alto,
      peso_aprox_unitario, observacion, comentario, rack, ubicacion_actual,
      almacenamiento, contenedor, responsable, fecha_conteo, costo_unitario,
      rotacion, linea, prioridad, vida_util_ssoma, compatibilidad_segregacion,
      condiciones_almacenamiento, foto_path, usuario_id } = body;
    if (!producto) return NextResponse.json({ error: 'El campo producto es requerido' }, { status: 400 });
    const dif = (cantidad_fisica || 0) - (stock_sistema || 0);
    const peso_total = (cantidad_fisica || 0) * (peso_aprox_unitario || 0);
    const total_costo = (stock_sistema || 0) * (costo_unitario || 0);
    const s_dif = dif * (costo_unitario || 0);
    const obs = observacion || (dif > 0 ? 'SOBRANTE' : dif < 0 ? 'FALTANTE' : 'OK');
    const result = db.prepare(`INSERT INTO inventario (producto, lote, descripcion, stock_sistema, unidad, familia, familia2, cantidad_fisica, dif, um, presentacion, n_cajas_bultos, largo, ancho, alto, peso_aprox_unitario, peso_total_cant_fisica, observacion, comentario, rack, ubicacion_actual, almacenamiento, contenedor, responsable, fecha_conteo, costo_unitario, total_costo, s_dif, rotacion, linea, prioridad, vida_util_ssoma, compatibilidad_segregacion, condiciones_almacenamiento, foto_path, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`)
      .run(producto, lote || '', descripcion, stock_sistema || 0, unidad, familia, familia2, cantidad_fisica || 0, dif, um, presentacion, n_cajas_bultos, largo || 0, ancho || 0, alto || 0, peso_aprox_unitario || 0, peso_total, obs, comentario, rack, ubicacion_actual, almacenamiento, contenedor, responsable, fecha_conteo, costo_unitario || 0, total_costo, s_dif, rotacion, linea, prioridad, vida_util_ssoma, compatibilidad_segregacion, condiciones_almacenamiento, foto_path, usuario_id);
    return NextResponse.json({ id: result.lastInsertRowid, success: true }, { status: 201 });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
