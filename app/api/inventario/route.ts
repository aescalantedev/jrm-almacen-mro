import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const usuario_id = searchParams.get('usuario_id') || '';
    const observacion = searchParams.get('observacion') || '';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '9999');
    const offset = (page - 1) * limit;

    let q = supabase
      .from('v_inventario')
      .select('*', { count: 'exact' })
      .or('cantidad_fisica.neq.0,usuario_id.not.is.null');

    if (query) {
      const searchPattern = `%${query.trim()}%`;
      q = q.or(`producto.ilike.${searchPattern},descripcion.ilike.${searchPattern},lote.ilike.${searchPattern}`);
    }
    if (usuario_id) {
      q = q.eq('usuario_id', usuario_id);
    }
    if (observacion) {
      q = q.eq('observacion', observacion);
    }

    const { data: items, count: total, error } = await q
      .order('updated_at', { ascending: false })
      .range(offset, offset + limit - 1);

    if (error) throw error;

    return NextResponse.json({ items: items || [], total: total || 0, page, limit });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });

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

    // Obtener datos maestros del producto
    const { data: master } = await supabase
      .from('productos')
      .select('costo_unitario_actual, peso_neto, contenedor_id, tipo_almacenamiento_id')
      .eq('sku', cleanSKU)
      .single();
      
    // Stock teórico inicial dinámico (esto asume que se usa la vista)
    // Para simplificar, obtenemos los movimientos para ese SKU
    const { data: movs } = await supabase.from('movimientos').select('tipo, cantidad').eq('producto', cleanSKU);
    let stock_sistema = 0;
    movs?.forEach(m => {
      if (m.tipo === 'INGRESO') stock_sistema += Number(m.cantidad);
      if (m.tipo === 'SALIDA') stock_sistema -= Number(m.cantidad);
    });

    const costo_unitario = master?.costo_unitario_actual || 0;
    const peso = master?.peso_neto || 0;

    const cantFisica = Number(cantidad_fisica) || 0;
    const dif = cantFisica - stock_sistema;
    const peso_total = cantFisica * peso;
    const total_costo = cantFisica * costo_unitario;
    const s_dif = dif * costo_unitario;
    
    const obs = observacion || (dif > 0 ? 'SOBRANTE' : dif < 0 ? 'FALTANTE' : 'OK');
    const estadoAuditoria = (dif === 0) ? 'CONFORME' : 'DISCREPANCIA';

    let durSec = Number(duracion_segundos) || 0;
    if (!durSec && fecha_inicio && fecha_fin) {
      const start = new Date(fecha_inicio).getTime();
      const end = new Date(fecha_fin).getTime();
      if (end > start) {
        durSec = Math.round((end - start) / 1000);
      }
    }

    const payload = {
      producto: cleanSKU, lote: cleanLote, familia2: familia2 || '', 
      cantidad_fisica: cantFisica, dif, um: um || '', presentacion: presentacion || '', 
      n_cajas_bultos: n_cajas_bultos || '', largo: largo || 0, ancho: ancho || 0, alto: alto || 0, 
      peso_total_cant_fisica: peso_total, observacion: obs, comentario: comentario || '', 
      rack: rack || '', ubicacion_actual: ubicacion_actual || '', almacenamiento: almacenamiento || '', 
      contenedor: contenedor || '', fecha_conteo: fecha_conteo || '', total_costo, s_dif,
      rotacion: rotacion || '', linea: linea || '', prioridad: prioridad || '', 
      vida_util_ssoma: vida_util_ssoma || '', compatibilidad_segregacion: compatibilidad_segregacion || '',
      condiciones_almacenamiento: condiciones_almacenamiento || '', foto_path: foto_path || null, 
      usuario_id: usuario_id || user.id,
      fecha_inicio: fecha_inicio || null, fecha_fin: fecha_fin || null, duracion_segundos: durSec, 
      estado_auditoria: estadoAuditoria, updated_at: new Date().toISOString()
    };

    const { data: existing } = await supabase.from('inventario').select('id, duracion_segundos').eq('producto', cleanSKU).eq('lote', cleanLote).single();

    let resultId;
    if (existing) {
      if (durSec <= 0) payload.duracion_segundos = existing.duracion_segundos;
      const { data: updated, error: updError } = await supabase.from('inventario').update(payload).eq('id', existing.id).select('id').single();
      if (updError) throw updError;
      resultId = updated?.id;
    } else {
      const { data: inserted, error: insError } = await supabase.from('inventario').insert(payload).select('id').single();
      if (insError) throw insError;
      resultId = inserted?.id;
    }

    // Actualizar producto master
    if (rack || ubicacion_actual || foto_path) {
      const prodUpdates: any = { updated_at: new Date().toISOString() };
      if (rack) prodUpdates.rack = rack;
      if (ubicacion_actual) prodUpdates.posicion_detalle = ubicacion_actual;
      if (foto_path) prodUpdates.foto_url = foto_path;
      
      await supabase.from('productos').update(prodUpdates).eq('sku', cleanSKU);
    }

    return NextResponse.json({ id: resultId, success: true, dif, obs, estadoAuditoria }, { status: 201 });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
