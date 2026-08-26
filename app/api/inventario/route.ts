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
    let conditions: string[] = ['(i.cantidad_fisica != 0 OR i.usuario_id IS NOT NULL)'];
    let params: unknown[] = [];
    if (query) { conditions.push('(UPPER(i.producto) LIKE UPPER(?) OR UPPER(p.glosa) LIKE UPPER(?) OR UPPER(i.lote) LIKE UPPER(?))'); const p = `%${query.trim()}%`; params.push(p, p, p); }
    if (usuario_id) { conditions.push('i.usuario_id = ?'); params.push(parseInt(usuario_id)); }
    if (observacion) { conditions.push('i.observacion = ?'); params.push(observacion); }
    const where = conditions.length > 0 ? 'WHERE ' + conditions.join(' AND ') : '';
    const items = db.prepare(`
      SELECT i.*, p.glosa as descripcion, p.unidad, p.familia, p.peso as peso_aprox_unitario,
             p.costo_unitario, s.stock as stock_sistema, u.nombre as usuario_nombre
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND IFNULL(i.lote, '') = IFNULL(s.lote, '')
      LEFT JOIN usuarios u ON i.usuario_id = u.id
      ${where} ORDER BY i.updated_at DESC LIMIT ? OFFSET ?
    `).all(...params, limit, offset);
    const countRow = db.prepare(`
      SELECT COUNT(*) as total
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      ${where}
    `).get(...params) as { total: number };
    return NextResponse.json({ items, total: countRow.total, page, limit });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const db = getDB();
    const body = await req.json();
    const { producto, lote, familia2,
      cantidad_fisica, um, presentacion, n_cajas_bultos, largo, ancho, alto,
      observacion, comentario, rack, ubicacion_actual,
      almacenamiento, contenedor, fecha_conteo,
      rotacion, linea, prioridad, vida_util_ssoma, compatibilidad_segregacion,
      condiciones_almacenamiento, foto_path, usuario_id } = body;
    if (!producto) return NextResponse.json({ error: 'El campo producto es requerido' }, { status: 400 });

    const master = db.prepare('SELECT costo_unitario, peso FROM productos_master WHERE producto = ?').get(producto) as { costo_unitario: number; peso: number } | undefined;
    const stockRow = db.prepare("SELECT stock FROM stock_cache WHERE producto = ? AND COALESCE(lote, '') = ? LIMIT 1").get(producto, lote || '') as { stock: number } | undefined;
    const stock_sistema = stockRow?.stock || 0;
    const costo_unitario = master?.costo_unitario || 0;
    const peso = master?.peso || 0;

    const cantFisica = Number(cantidad_fisica) || 0;
    const dif = cantFisica - stock_sistema;
    const peso_total = cantFisica * peso;
    const total_costo = stock_sistema * costo_unitario;
    const s_dif = dif * costo_unitario;
    const obs = observacion || (dif > 0 ? 'SOBRANTE' : dif < 0 ? 'FALTANTE' : 'OK');

    const stmt = db.prepare(`
      INSERT INTO inventario (
        producto, lote, familia2, cantidad_fisica, dif, um, presentacion, n_cajas_bultos,
        largo, ancho, alto, peso_total_cant_fisica, observacion, comentario, rack,
        ubicacion_actual, almacenamiento, contenedor, fecha_conteo, total_costo, s_dif,
        rotacion, linea, prioridad, vida_util_ssoma, compatibilidad_segregacion,
        condiciones_almacenamiento, foto_path, usuario_id, updated_at
      ) VALUES (
        ?, ?, ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?,
        ?, ?, ?, datetime('now', '-5 hours')
      )
      ON CONFLICT(producto, lote) DO UPDATE SET
        familia2 = excluded.familia2,
        cantidad_fisica = excluded.cantidad_fisica,
        dif = excluded.dif,
        um = excluded.um,
        presentacion = excluded.presentacion,
        n_cajas_bultos = excluded.n_cajas_bultos,
        largo = excluded.largo,
        ancho = excluded.ancho,
        alto = excluded.alto,
        peso_total_cant_fisica = excluded.peso_total_cant_fisica,
        observacion = excluded.observacion,
        comentario = excluded.comentario,
        rack = excluded.rack,
        ubicacion_actual = excluded.ubicacion_actual,
        almacenamiento = excluded.almacenamiento,
        contenedor = excluded.contenedor,
        fecha_conteo = excluded.fecha_conteo,
        total_costo = excluded.total_costo,
        s_dif = excluded.s_dif,
        rotacion = excluded.rotacion,
        linea = excluded.linea,
        prioridad = excluded.prioridad,
        vida_util_ssoma = excluded.vida_util_ssoma,
        compatibilidad_segregacion = excluded.compatibilidad_segregacion,
        condiciones_almacenamiento = excluded.condiciones_almacenamiento,
        foto_path = COALESCE(excluded.foto_path, inventario.foto_path),
        usuario_id = COALESCE(excluded.usuario_id, inventario.usuario_id),
        updated_at = datetime('now', '-5 hours')
    `);

    stmt.run(
      producto, lote || '', familia2 || '', cantFisica, dif, um || '', presentacion || '', n_cajas_bultos || '',
      largo || 0, ancho || 0, alto || 0, peso_total, obs, comentario || '', rack || '',
      ubicacion_actual || '', almacenamiento || '', contenedor || '', fecha_conteo || '', total_costo, s_dif,
      rotacion || '', linea || '', prioridad || '', vida_util_ssoma || '', compatibilidad_segregacion || '',
      condiciones_almacenamiento || '', foto_path || null, usuario_id || null
    );

    const insertedOrUpdated = db.prepare('SELECT id FROM inventario WHERE producto = ? AND lote = ?').get(producto, lote || '') as { id: number } | undefined;
    return NextResponse.json({ id: insertedOrUpdated?.id, success: true }, { status: 201 });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
