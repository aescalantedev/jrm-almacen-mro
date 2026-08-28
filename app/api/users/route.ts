import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    
    // Verificar permisos
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }
    
    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'auditor' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    // Obtener usuarios
    const { data: users, error } = await supabase
      .from('usuarios')
      .select('id, nombre, rol, activo')
      .order('nombre', { ascending: false });

    if (error) throw error;

    return NextResponse.json({ users: users || [] });
  } catch (error) {
    console.error(error);
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  try {
    const supabase = await createClient();
    
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const { id, nombre, rol, activo } = await req.json();
    if (!id) {
      return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
    }

    const updates: any = {};
    if (nombre !== undefined) updates.nombre = nombre;
    if (rol !== undefined) updates.rol = rol;
    if (activo !== undefined) updates.activo = activo ? 1 : 0;
    

    const { error } = await supabase
      .from('usuarios')
      .update(updates)
      .eq('id', id);

    if (error) throw error;

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error(error);
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  try {
    const supabase = await createClient();
    
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const { searchParams } = new URL(req.url);
    const id = searchParams.get('id');
    
    if (!id) {
      return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
    }

    // Solo desactivar, no borrar físicamente para evitar problemas de Foreign Keys en Supabase
    const { error } = await supabase
      .from('usuarios')
      .update({ activo: 0 })
      .eq('id', id);

    if (error) throw error;

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error(error);
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}
