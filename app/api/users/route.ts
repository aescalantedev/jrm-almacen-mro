import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

export async function GET(req: NextRequest) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || (user.rol !== 'admin' && user.rol !== 'auditor')) {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const db = getDB();
    const rows = db.prepare(`
      SELECT id, nombre, usuario, rol, activo, created_at 
      FROM usuarios
      ORDER BY id DESC
    `).all();

    return NextResponse.json({ users: rows });
  } catch (error) {
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || user.rol !== 'admin') {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const { id, nombre, usuario, rol, activo } = await req.json();
    if (!id) {
      return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
    }

    const db = getDB();
    const stmt = db.prepare(`
      UPDATE usuarios 
      SET nombre = COALESCE(?, nombre),
          usuario = COALESCE(?, usuario),
          rol = COALESCE(?, rol),
          activo = COALESCE(?, activo)
      WHERE id = ?
    `);
    stmt.run(
      nombre ?? null, 
      usuario ?? null, 
      rol ?? null, 
      activo !== undefined ? (activo ? 1 : 0) : null, 
      id
    );

    return NextResponse.json({ success: true });
  } catch (error) {
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  // Trigger rebuild
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || user.rol !== 'admin') {
      return NextResponse.json({ error: 'No autorizado' }, { status: 401 });
    }

    const { searchParams } = new URL(req.url);
    const id = searchParams.get('id');
    
    if (!id) {
      return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
    }

    const db = getDB();
    try {
      db.prepare(`DELETE FROM usuarios WHERE id = ?`).run(id);
    } catch (e: any) {
      db.prepare(`UPDATE usuarios SET activo = 0 WHERE id = ?`).run(id);
    }

    return NextResponse.json({ success: true });
  } catch (error) {
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}
