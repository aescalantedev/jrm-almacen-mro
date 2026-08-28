import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function POST(req: NextRequest) {
  try {
    const { nombre, email, password } = await req.json();
    if (!nombre || !email || !password) {
      return NextResponse.json({ error: 'Campos requeridos: nombre, email, password' }, { status: 400 });
    }

    const supabase = await createClient();

    // Si es el primer usuario o quieres forzar admin para pruebas, usa 'superadmin'
    // En produccion deberia ser 'almacenero'
    const assignedRol = 'superadmin'; 

    const { data, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          nombre,
          rol: assignedRol
        }
      }
    });

    if (error) {
      return NextResponse.json({ error: error.message }, { status: 409 });
    }

    return NextResponse.json({
      success: true,
      message: 'Usuario registrado exitosamente (Auto-asignado como superadmin temporalmente).',
      userId: data.user?.id
    }, { status: 201 });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
