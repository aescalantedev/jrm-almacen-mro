import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 401 });
    }

    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden ver costos' }, { status: 403 });
    }

    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const status = searchParams.get('status') || 'ALL';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    let pQuery = supabase.from('productos').select('sku, glosa, unidad_codigo, costo_unitario_actual, moneda', { count: 'exact' });
    if (query) {
      pQuery = pQuery.or(`sku.ilike.%${query}%,glosa.ilike.%${query}%`);
    }

    if (status === 'CON_COSTO') {
      pQuery = pQuery.gt('costo_unitario_actual', 0);
    } else if (status === 'SIN_COSTO') {
      pQuery = pQuery.or('costo_unitario_actual.eq.0,costo_unitario_actual.is.null');
    }

    const { data: items, count, error } = await pQuery
      .range(offset, offset + limit - 1)
      .order('sku', { ascending: true });

    if (error) throw error;

    const mappedItems = items?.map(item => ({
      ...item,
      unidad: item.unidad_codigo,
      costo_unitario: Number(item.costo_unitario_actual || 0)
    })) || [];

    return NextResponse.json({ items: mappedItems, total: count || 0, page, totalPages: Math.ceil((count || 0) / limit) });
  } catch (error) {
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 401 });
    }

    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden editar costos' }, { status: 403 });
    }

    const { sku, costo, motivo, documento_referencia, moneda } = await req.json();
    if (!sku || costo === undefined) {
      return NextResponse.json({ error: 'Faltan datos obligatorios' }, { status: 400 });
    }

    const today = new Date().toISOString().split('T')[0];

    // Cerrar el historial anterior
    await supabase
      .from('producto_costos_historial')
      .update({ fecha_validez_hasta: today })
      .eq('producto_sku', sku)
      .is('fecha_validez_hasta', null);

    // Insertar nuevo registro
    const { error: histError } = await supabase
      .from('producto_costos_historial')
      .insert({
        producto_sku: sku,
        costo_unitario: Number(costo),
        moneda: moneda || 'PEN',
        fecha_validez_desde: today,
        motivo_modificacion: motivo || 'Actualizacin manual',
        documento_referencia: documento_referencia || '',
        created_by: user.id
      });

    if (histError) throw histError;

    // Actualizar producto master
    await supabase
      .from('productos')
      .update({ costo_unitario_actual: Number(costo) })
      .eq('sku', sku);

    return NextResponse.json({ success: true });
  } catch (error) {
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 401 });
    }

    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden editar costos' }, { status: 403 });
    }

    const { sku } = await req.json();
    if (!sku) {
      return NextResponse.json({ error: 'Falta el SKU' }, { status: 400 });
    }

    const today = new Date().toISOString().split('T')[0];

    // Cerrar el historial anterior
    await supabase
      .from('producto_costos_historial')
      .update({ fecha_validez_hasta: today })
      .eq('producto_sku', sku)
      .is('fecha_validez_hasta', null);

    // Insertar nuevo registro con 0
    const { error: histError } = await supabase
      .from('producto_costos_historial')
      .insert({
        producto_sku: sku,
        costo_unitario: 0,
        moneda: 'PEN',
        fecha_validez_desde: today,
        motivo_modificacion: 'Eliminacion de costo',
        documento_referencia: '',
        created_by: user.id
      });

    if (histError) throw histError;

    // Actualizar producto master
    await supabase
      .from('productos')
      .update({ costo_unitario_actual: 0 })
      .eq('sku', sku);

    return NextResponse.json({ success: true });
  } catch (error) {
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}
