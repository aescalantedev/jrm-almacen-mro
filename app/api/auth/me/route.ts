import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export const dynamic = 'force-dynamic';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    
    const { data: { user }, error } = await supabase.auth.getUser();

    if (error || !user) {
      return NextResponse.json({ error: 'Token inválido o expirado' }, { status: 401 });
    }

    const { data: profile } = await supabase
      .from('usuarios')
      .select('id, nombre, rol, activo')
      .eq('id', user.id)
      .single();

    if (profile && profile.activo === 0) {
      return NextResponse.json({ error: 'Usuario no activo' }, { status: 401 });
    }

    return NextResponse.json({
      user: profile || {
        id: user.id,
        usuario: user.email,
        nombre: user.user_metadata?.nombre || user.email,
        rol: user.user_metadata?.rol || 'almacenero',
      },
    });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
