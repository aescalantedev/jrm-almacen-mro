import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

export const dynamic = 'force-dynamic';

export async function GET(req: NextRequest) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const token = authHeader.replace('Bearer ', '').trim();

    if (!token) {
      return NextResponse.json({ error: 'Token no proporcionado' }, { status: 401 });
    }

    const payload = verifyToken(token);
    if (!payload) {
      return NextResponse.json({ error: 'Token inválido o expirado' }, { status: 401 });
    }

    const db = getDB();
    const user = db.prepare('SELECT id, nombre, usuario, rol, activo FROM usuarios WHERE id = ?').get(payload.id) as {
      id: number;
      nombre: string;
      usuario: string;
      rol: string;
      activo: number;
    } | undefined;

    if (!user || !user.activo) {
      return NextResponse.json({ error: 'Usuario no activo o no encontrado' }, { status: 401 });
    }

    return NextResponse.json({
      user: {
        id: user.id,
        nombre: user.nombre,
        usuario: user.usuario,
        rol: user.rol,
      },
    });
  } catch (error: unknown) {
    return NextResponse.json({ error: 'Error al verificar sesión' }, { status: 500 });
  }
}
