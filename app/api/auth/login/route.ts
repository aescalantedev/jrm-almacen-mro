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
    const user = db.prepare('SELECT id, nombre, usuario, password_hash, rol FROM usuarios WHERE usuario = ? AND activo = 1')
      .get(usuario) as { id: number; nombre: string; usuario: string; password_hash: string; rol: string } | undefined;
    if (!user) return NextResponse.json({ error: 'Usuario no encontrado' }, { status: 401 });
    if (!comparePassword(password, user.password_hash)) {
      return NextResponse.json({ error: 'Contrasena incorrecta' }, { status: 401 });
    }
    const token = generateToken({ id: user.id, nombre: user.nombre, usuario: user.usuario, rol: user.rol as 'contador' | 'admin' });
    return NextResponse.json({ user: { id: user.id, nombre: user.nombre, usuario: user.usuario, rol: user.rol }, token });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
