import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function POST(req: NextRequest) {
  try {
    const { email, password } = await req.json();
    if (!email || !password) {
      return NextResponse.json({ error: 'Campos requeridos: email, password' }, { status: 400 });
    }

    const supabase = await createClient();

    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (error) {
      return NextResponse.json({ error: 'Credenciales incorrectas o usuario no encontrado' }, { status: 401 });
    }

    // Obtener datos del perfil
    const { data: profile, error: dbError } = await supabase
      .from('usuarios')
      .select('id, nombre, rol, activo')
      .eq('id', data.user.id)
      .single();

    if (profile && profile.activo === 0) {
      await supabase.auth.signOut();
      return NextResponse.json({ error: 'Tu cuenta está inactiva' }, { status: 403 });
    }

    return NextResponse.json({ 
      user: profile || { 
        id: data.user.id, 
        usuario: email, 
        nombre: data.user.user_metadata?.nombre || email,
        rol: data.user.user_metadata?.rol || 'almacenero' 
      },
      token: data.session?.access_token // Frontend expects a token
    });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
