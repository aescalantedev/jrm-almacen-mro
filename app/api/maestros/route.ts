import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });

    const results = await Promise.all([
      supabase.from('v_maestro_locales').select('*').order('codigo', { ascending: true }),
      supabase.from('v_maestro_bodegas').select('*').order('codigo', { ascending: true }),
      supabase.from('v_maestro_zonas').select('*').order('codigo', { ascending: true }),
      supabase.from('v_maestro_grupos').select('*').order('nombre', { ascending: true }),
      supabase.from('v_maestro_unidades').select('*').order('codigo_unidad', { ascending: true }),
      supabase.from('v_maestro_contenedores').select('*').order('codigo_contenedor', { ascending: true }),
      supabase.from('v_maestro_tipos').select('*').order('codigo', { ascending: true })
    ]);

    for (let i = 0; i < results.length; i++) {
      if (results[i].error) console.error(`Error in maestros query ${i}:`, results[i].error);
    }

    const [
      { data: locales },
      { data: bodegas },
      { data: zonas },
      { data: grupos },
      { data: unidades },
      { data: contenedores },
      { data: tiposAlmacenamiento }
    ] = results;

    return NextResponse.json({
      locales: locales || [],
      bodegas: bodegas || [],
      zonas: zonas || [],
      grupos: grupos || [],
      unidades: unidades || [],
      contenedores: contenedores || [],
      tiposAlmacenamiento: tiposAlmacenamiento || [],
    });
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
    const { entity, action, data } = body;

    if (!entity || !action || !data) {
      return NextResponse.json({ error: 'Entidad, acción y datos son requeridos' }, { status: 400 });
    }

    const primaryKey = entity === 'unidades_medida' ? 'codigo_unidad' : 'id';
    const primaryValue = entity === 'unidades_medida' ? data.codigo_unidad : data.id;

    if (action === 'create') {
      const payload = { ...data, created_by: user.id };
      delete payload.id; // Don't insert empty ID
      
      const { error } = await supabase.from(entity).insert(payload);
      if (error) throw error;
      return NextResponse.json({ success: true, message: 'Registro creado correctamente' });
    }

    if (action === 'update') {
      if (!primaryValue) return NextResponse.json({ error: 'ID requerido' }, { status: 400 });
      const payload = { ...data, updated_by: user.id, updated_at: new Date().toISOString() };
      
      const { error } = await supabase.from(entity).update(payload).eq(primaryKey, primaryValue);
      if (error) throw error;
      return NextResponse.json({ success: true, message: 'Registro actualizado' });
    }

    if (action === 'delete') {
      if (!primaryValue) return NextResponse.json({ error: 'ID requerido' }, { status: 400 });
      
      const { error } = await supabase.from(entity).update({ 
        is_deleted: 1, 
        updated_by: user.id, 
        updated_at: new Date().toISOString() 
      }).eq(primaryKey, primaryValue);
      
      if (error) throw error;
      return NextResponse.json({ success: true, message: 'Registro desactivado' });
    }

    return NextResponse.json({ error: 'Acción no válida' }, { status: 400 });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
