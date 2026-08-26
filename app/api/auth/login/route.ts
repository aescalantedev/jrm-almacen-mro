import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { comparePassword, generateToken } from '@/lib/auth';

export async function POST(req: NextRequest) {
  try {
    const { usuario, password } = await req.json();
    if (!usuario || !password) {
      return NextResponse.json({ error: 'Campos requeridos: usuario, password' }, { status: 400 });
    }
    const db = getDB();
    const user = db.prepare('SELECT id, nombre, usuario, password_hash, rol, activo FROM usuarios WHERE usuario = ?')
      .get(usuario) as { id: number; nombre: string; usuario: string; password_hash: string; rol: string; activo: number } | undefined;
    if (!user) return NextResponse.json({ error: 'Usuario no encontrado' }, { status: 401 });
    if (!comparePassword(password, user.password_hash)) {
      return NextResponse.json({ error: 'Contraseña incorrecta' }, { status: 401 });
    }
    if (!user.activo) {
      return NextResponse.json({ error: 'Tu cuenta está registrada pero aún no ha sido activada por el administrador.' }, { status: 403 });
    }
    const token = generateToken({ id: user.id, nombre: user.nombre, usuario: user.usuario, rol: user.rol as 'contador' | 'admin' | 'almacenero' | 'auditor' });
    return NextResponse.json({ user: { id: user.id, nombre: user.nombre, usuario: user.usuario, rol: user.rol }, token });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
