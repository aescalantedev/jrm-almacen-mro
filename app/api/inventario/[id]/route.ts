import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function PUT(
  req: NextRequest,
  context: { params: Promise<{ id: string }> | { id: string } }
) {
  try {
    const db = getDB();
    const resolvedParams = await context.params;
    const body = await req.json();
    const { id: bodyId, ...fields } = body;
    const id = bodyId || resolvedParams?.id;
    if (!id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
    const existing = db.prepare('SELECT * FROM inventario WHERE id = ?').get(id) as Record<string, unknown> | undefined;
    if (!existing) return NextResponse.json({ error: 'Registro no encontrado' }, { status: 404 });
    const allowedFields = [
      'cantidad_fisica', 'observacion', 'comentario', 'rack', 'ubicacion_actual',
      'almacenamiento', 'contenedor', 'responsable', 'fecha_conteo', 'foto_path',
      'lote', 'familia2', 'um', 'presentacion', 'n_cajas_bultos', 'largo', 'ancho',
      'alto', 'peso_aprox_unitario', 'peso_total_cant_fisica', 'costo_unitario',
      'total_costo', 's_dif', 'rotacion', 'linea', 'prioridad', 'vida_util_ssoma',
      'compatibilidad_segregacion', 'condiciones_almacenamiento'
    ];
    const updates: string[] = [];
    const values: unknown[] = [];
    for (const field of allowedFields) {
      if (fieldsKey(fields, field) !== undefined) { updates.push(`${field} = ?`); values.push(fields[field]); }
    }
    if (updates.length === 0) return NextResponse.json({ error: 'No hay campos para actualizar' }, { status: 400 });
    updates.push("updated_at = datetime('now')");
    const newCantFisica = fields.cantidad_fisica !== undefined ? fields.cantidad_fisica : existing.cantidad_fisica;
    const stockSis = existing.stock_sistema;
    const dif = (newCantFisica as number) - (stockSis as number);
    const pesoUnit = existing.peso_aprox_unitario;
    const costoUnit = existing.costo_unitario;
    updates.push('dif = ?'); values.push(dif);
    updates.push('peso_total_cant_fisica = ?'); values.push((newCantFisica as number) * (pesoUnit as number));
    updates.push('s_dif = ?'); values.push(dif * (costoUnit as number));
    if (!fields.observacion) { updates.push('observacion = ?'); values.push(dif > 0 ? 'SOBRANTE' : dif < 0 ? 'FALTANTE' : 'OK'); }
    values.push(id);
    db.prepare(`UPDATE inventario SET ${updates.join(', ')} WHERE id = ?`).run(...values);
    return NextResponse.json({ success: true });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

function fieldsKey(obj: Record<string, unknown>, key: string) {
  return obj[key];
}

export async function DELETE(
  req: NextRequest,
  context: { params: Promise<{ id: string }> | { id: string } }
) {
  try {
    const db = getDB();
    const resolvedParams = await context.params;
    const { searchParams } = new URL(req.url);
    const id = resolvedParams?.id || searchParams.get('id');
    if (!id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
    db.prepare('DELETE FROM inventario WHERE id = ?').run(parseInt(String(id)));
    return NextResponse.json({ success: true });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
