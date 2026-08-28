import { NextRequest, NextResponse } from 'next/server';
import { getDB, getStockTeorico } from '@/lib/db';

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

    if (query) {
      conditions.push('(UPPER(i.producto) LIKE UPPER(?) OR UPPER(p.glosa) LIKE UPPER(?) OR UPPER(i.lote) LIKE UPPER(?))');
      const p = `%${query.trim()}%`;
      params.push(p, p, p);
    }
    if (usuario_id) {
      conditions.push('i.usuario_id = ?');
      params.push(parseInt(usuario_id));
    }
    if (observacion) {
      conditions.push('i.observacion = ?');
      params.push(observacion);
    }

    const where = conditions.length > 0 ? 'WHERE ' + conditions.join(' AND ') : '';

    const items = db.prepare(`
      SELECT i.*, 
             p.glosa as descripcion, 
             p.unidad_codigo as unidad, 
             COALESCE(g.nombre, 'GENERAL') as familia, 
             p.peso_neto as peso_aprox_unitario,
             p.costo_unitario_actual as costo_unitario, 
             (COALESCE(i.cantidad_fisica, 0) + COALESCE(m.total_ingresos, 0) - COALESCE(m.total_salidas, 0)) as stock_sistema, 
             u.nombre as usuario_nombre
      FROM inventario i
      JOIN productos p ON i.producto = p.sku
      LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
      LEFT JOIN (
        SELECT producto,
               SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as total_ingresos,
               SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as total_salidas
        FROM movimientos
        GROUP BY producto
      ) m ON i.producto = m.producto
      LEFT JOIN usuarios u ON i.usuario_id = u.id
      ${where} 
      ORDER BY i.updated_at DESC 
      LIMIT ? OFFSET ?
    `).all(...params, limit, offset);

    const countRow = db.prepare(`
      SELECT COUNT(*) as total
      FROM inventario i
      JOIN productos p ON i.producto = p.sku
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
    const { 
      producto, lote = '', familia2,
      cantidad_fisica, um, presentacion, n_cajas_bultos, largo, ancho, alto,
      observacion, comentario, rack, ubicacion_actual,
      almacenamiento, contenedor, fecha_conteo,
      rotacion, linea, prioridad, vida_util_ssoma, compatibilidad_segregacion,
      condiciones_almacenamiento, foto_path, usuario_id,
      fecha_inicio, fecha_fin, duracion_segundos
    } = body;
    
    if (!producto) return NextResponse.json({ error: 'El campo producto es requerido' }, { status: 400 });

    const cleanSKU = String(producto).trim().toUpperCase();
    const cleanLote = String(lote || '').trim();

    const master = db.prepare('SELECT costo_unitario_actual as costo_unitario, peso_neto as peso, contenedor_id, tipo_almacenamiento_id FROM productos WHERE sku = ?').get(cleanSKU) as { costo_unitario: number; peso: number; contenedor_id: number; tipo_almacenamiento_id: number } | undefined;
    
    // Calcular Stock Teórico Real y Dinámico (Stock Inicial + Ingresos - Salidas)
    const stock_sistema = getStockTeorico(db, cleanSKU, cleanLote);
    const costo_unitario = master?.costo_unitario || 0;
    const peso = master?.peso || 0;

    const cantFisica = Number(cantidad_fisica) || 0;
    const dif = cantFisica - stock_sistema;
    const peso_total = cantFisica * peso;
    const total_costo = cantFisica * costo_unitario;
    const s_dif = dif * costo_unitario;
    
    const obs = observacion || (dif > 0 ? 'SOBRANTE' : dif < 0 ? 'FALTANTE' : 'OK');
    const estadoAuditoria = (dif === 0) ? 'CONFORME' : 'DISCREPANCIA';

    // Duración en segundos calculada
    let durSec = Number(duracion_segundos) || 0;
    if (!durSec && fecha_inicio && fecha_fin) {
      const start = new Date(fecha_inicio).getTime();
      const end = new Date(fecha_fin).getTime();
      if (end > start) {
        durSec = Math.round((end - start) / 1000);
      }
    }

    const stmt = db.prepare(`
      INSERT INTO inventario (
        producto, lote, familia2, cantidad_fisica, dif, um, presentacion, n_cajas_bultos,
        largo, ancho, alto, peso_total_cant_fisica, observacion, comentario, rack,
        ubicacion_actual, almacenamiento, contenedor, fecha_conteo, total_costo, s_dif,
        rotacion, linea, prioridad, vida_util_ssoma, compatibilidad_segregacion,
        condiciones_almacenamiento, foto_path, usuario_id,
        fecha_inicio, fecha_fin, duracion_segundos, estado_auditoria,
        updated_at
      ) VALUES (
        ?, ?, ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?, ?,
        ?, ?, ?,
        ?, ?, ?, ?,
        datetime('now', '-5 hours')
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
        fecha_inicio = COALESCE(excluded.fecha_inicio, inventario.fecha_inicio),
        fecha_fin = COALESCE(excluded.fecha_fin, inventario.fecha_fin),
        duracion_segundos = CASE WHEN excluded.duracion_segundos > 0 THEN excluded.duracion_segundos ELSE inventario.duracion_segundos END,
        estado_auditoria = excluded.estado_auditoria,
        updated_at = datetime('now', '-5 hours')
    `);

    stmt.run(
      cleanSKU, cleanLote, familia2 || '', cantFisica, dif, um || '', presentacion || '', n_cajas_bultos || '',
      largo || 0, ancho || 0, alto || 0, peso_total, obs, comentario || '', rack || '',
      ubicacion_actual || '', almacenamiento || '', contenedor || '', fecha_conteo || '', total_costo, s_dif,
      rotacion || '', linea || '', prioridad || '', vida_util_ssoma || '', compatibilidad_segregacion || '',
      condiciones_almacenamiento || '', foto_path || null, usuario_id || null,
      fecha_inicio || null, fecha_fin || null, durSec, estadoAuditoria
    );

    // Actualizar ubicación física y foto en el maestro de productos
    db.prepare(`
      UPDATE productos SET
        rack = CASE WHEN ? != '' THEN ? ELSE rack END,
        posicion_detalle = CASE WHEN ? != '' THEN ? ELSE posicion_detalle END,
        foto_url = CASE WHEN ? IS NOT NULL AND ? != '' THEN ? ELSE foto_url END,
        updated_at = datetime('now', '-5 hours')
      WHERE sku = ?
    `).run(
      rack || '', rack || '',
      ubicacion_actual || '', ubicacion_actual || '',
      foto_path || null, foto_path || null, foto_path || null,
      cleanSKU
    );

    const insertedOrUpdated = db.prepare('SELECT id FROM inventario WHERE producto = ? AND IFNULL(lote, \'\') = ?').get(cleanSKU, cleanLote) as { id: number } | undefined;
    return NextResponse.json({ id: insertedOrUpdated?.id, success: true, dif, obs, estadoAuditoria }, { status: 201 });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
