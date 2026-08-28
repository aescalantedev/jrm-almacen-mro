import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const tipo = searchParams.get('tipo') || '';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    let q = supabase.from('v_movimientos').select('*', { count: 'exact' });

    if (query) {
      const searchPattern = `%${query.trim()}%`;
      q = q.or(`producto.ilike.${searchPattern},descripcion.ilike.${searchPattern},lote.ilike.${searchPattern}`);
    }

    if (tipo && tipo !== 'ALL') {
      q = q.eq('tipo', tipo.toUpperCase());
    }

    const { data: items, count: total, error } = await q
      .order('created_at', { ascending: false })
      .order('id', { ascending: false })
      .range(offset, offset + limit - 1);

    if (error) throw error;

    const movimientos = items || [];
    
    // Quick stats for the result set
    const stats = {
      ingresos_count: 0,
      salidas_count: 0,
      total_unidades_ingresadas: 0,
      total_unidades_salidas: 0,
    };
    
    movimientos.forEach((m: any) => {
      if (m.tipo === 'INGRESO') {
        stats.ingresos_count++;
        stats.total_unidades_ingresadas += Number(m.cantidad);
      } else if (m.tipo === 'SALIDA') {
        stats.salidas_count++;
        stats.total_unidades_salidas += Number(m.cantidad);
      }
    });

    return NextResponse.json({ movimientos, stats, total: total || 0, page, limit });
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
      tipo, items, producto, lote = '', cantidad, motivo,
      documento_referencia = '', solicitante = '', ubicacion_origen = '',
      ubicacion_destino = '', rack = '', comentario = '', foto_path, permitir_negativo = false
    } = body;

    if (!tipo || !['INGRESO', 'SALIDA', 'AJUSTE'].includes(tipo)) {
      return NextResponse.json({ error: 'Tipo de movimiento inválido' }, { status: 400 });
    }

    if (!motivo) {
      return NextResponse.json({ error: 'El motivo del movimiento es obligatorio' }, { status: 400 });
    }

    const itemsToProcess = [];

    if (Array.isArray(items) && items.length > 0) {
      for (const it of items) {
        itemsToProcess.push({
          producto: (it.producto || '').trim().toUpperCase(),
          lote: it.lote || '',
          cantidad: Math.abs(Number(it.cantidad)),
          rack: it.rack || '',
        });
      }
    } else if (producto && cantidad) {
      itemsToProcess.push({
        producto: String(producto).trim().toUpperCase(),
        lote,
        cantidad: Math.abs(Number(cantidad)),
        rack,
      });
    } else {
      return NextResponse.json({ error: 'Faltan productos o cantidades' }, { status: 400 });
    }

    const createdIds = [];

    // En Supabase, para transacciones atómicas complejas lo ideal es un RPC,
    // pero lo haremos iterando para mantener la compatibilidad rápida.
    for (const item of itemsToProcess) {
      const { data: prod, error: prodErr } = await supabase.from('productos').select('sku, glosa, unidad_codigo').eq('sku', item.producto).single();
      if (prodErr || !prod) {
        throw new Error(`El producto ${item.producto} no existe en el catálogo maestro`);
      }

      const { data: movs } = await supabase.from('movimientos').select('tipo, cantidad').eq('producto', item.producto);
      let stockAnterior = 0;
      movs?.forEach(m => {
        if (m.tipo === 'INGRESO') stockAnterior += Number(m.cantidad);
        if (m.tipo === 'SALIDA') stockAnterior -= Number(m.cantidad);
      });

      if (tipo === 'SALIDA' && !permitir_negativo && item.cantidad > stockAnterior) {
        throw new Error(`Stock insuficiente para ${item.producto} (${prod.glosa}): Disponible (${stockAnterior} ${prod.unidad_codigo}), Intentando retirar (${item.cantidad})`);
      }

      let stockResultante = stockAnterior;
      if (tipo === 'INGRESO') stockResultante += item.cantidad;
      if (tipo === 'SALIDA') stockResultante -= item.cantidad;
      if (tipo === 'AJUSTE') stockResultante = item.cantidad; // Ajuste simplificado

      const payload = {
        tipo, producto: item.producto, lote: item.lote, cantidad: item.cantidad,
        stock_anterior: stockAnterior, stock_resultante: stockResultante,
        motivo, documento_referencia, solicitante, ubicacion_origen,
        ubicacion_destino: ubicacion_destino || item.rack, rack: item.rack,
        foto_path: foto_path || null, comentario, usuario_id: user.id
      };

      const { data: inserted, error: insertError } = await supabase.from('movimientos').insert(payload).select('id').single();
      if (insertError) throw insertError;
      createdIds.push(inserted.id);
    }

    const actionLabel = tipo === 'INGRESO' ? 'Ingreso' : 'Salida';
    return NextResponse.json({ 
      success: true, 
      count: createdIds.length,
      message: createdIds.length === 1
        ? `${actionLabel} registrado(a) con éxito.`
        : `${actionLabel} de ${createdIds.length} repuestos registrado(a) con éxito bajo ${documento_referencia || 'vale'}.`,
    }, { status: 201 });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 400 });
  }
}
