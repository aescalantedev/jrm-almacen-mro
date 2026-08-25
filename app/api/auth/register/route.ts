import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { hashPassword, generateToken } from '@/lib/auth';

export async function POST(req: NextRequest) {
  try {
    const { nombre, usuario, password, rol } = await req.json();
    if (!nombre || !usuario || !password) {
      return NextResponse.json({ error: 'Campos requeridos: nombre, usuario, password' }, { status: 400 });
    }
    const db = getDB();
    const existing = db.prepare('SELECT id FROM usuarios WHERE usuario = ?').get(usuario);
    if (existing) {
      return NextResponse.json({ error: 'El usuario ya existe' }, { status: 409 });
    }
    const password_hash = hashPassword(password);
    const result = db.prepare('INSERT INTO usuarios (nombre, usuario, password_hash, rol) VALUES (?, ?, ?, ?)')
      .run(nombre, usuario, password_hash, rol || 'contador');
    const user = { id: result.lastInsertRowid as number, nombre, usuario, rol: rol || 'contador' };
    const token = generateToken(user);
    return NextResponse.json({ user, token }, { status: 201 });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
