import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

function fieldsKey(obj: Record<string, unknown>, key: string) {
  return obj[key];
}

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
    const existing = db.prepare(`
      SELECT i.*, p.costo_unitario_actual as costo_unitario, p.peso_neto as peso_aprox_unitario
      FROM inventario i
      JOIN productos p ON i.producto = p.sku
      WHERE i.id = ?
    `).get(id) as Record<string, unknown> | undefined;
    if (!existing) return NextResponse.json({ error: 'Registro no encontrado' }, { status: 404 });
    const allowedFields = [
      'cantidad_fisica', 'observacion', 'comentario', 'rack', 'ubicacion_actual',
      'almacenamiento', 'contenedor', 'responsable', 'fecha_conteo', 'foto_path',
      'lote', 'familia2', 'um', 'presentacion', 'n_cajas_bultos', 'largo', 'ancho',
      'alto', 'rotacion', 'linea', 'prioridad', 'vida_util_ssoma',
      'compatibilidad_segregacion', 'condiciones_almacenamiento'
    ];
    const updates: string[] = [];
    const values: unknown[] = [];
    for (const field of allowedFields) {
      if (fieldsKey(fields, field) !== undefined) { updates.push(`${field} = ?`); values.push(fields[field]); }
    }
    if (updates.length === 0) return NextResponse.json({ error: 'No hay campos para actualizar' }, { status: 400 });
    updates.push("updated_at = datetime('now', '-5 hours')");
    const newCantFisica = fields.cantidad_fisica !== undefined ? fields.cantidad_fisica : existing.cantidad_fisica;
    const stockSis = Number(existing.stock_sistema || 0);
    const costoUnit = Number(existing.costo_unitario || 0);
    const pesoUnit = Number(existing.peso_aprox_unitario || 0);
    const dif = (newCantFisica as number) - (stockSis as number);
    updates.push('dif = ?'); values.push(dif);
    updates.push('peso_total_cant_fisica = ?'); values.push((newCantFisica as number) * pesoUnit);
    updates.push('total_costo = ?'); values.push(stockSis * costoUnit);
    updates.push('s_dif = ?'); values.push(dif * costoUnit);
    if (!fields.observacion) { updates.push('observacion = ?'); values.push(dif > 0 ? 'SOBRANTE' : dif < 0 ? 'FALTANTE' : 'OK'); }
    values.push(id);
    db.prepare(`UPDATE inventario SET ${updates.join(', ')} WHERE id = ?`).run(...values);
    return NextResponse.json({ success: true });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
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
