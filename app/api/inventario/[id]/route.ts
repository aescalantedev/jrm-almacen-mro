import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function PUT(
  req: NextRequest,
  context: { params: Promise<{ id: string }> | { id: string } }
) {
  try {
    const supabase = await createClient();
    const resolvedParams = await context.params;
    const body = await req.json();
    const { id: bodyId, ...fields } = body;
    const id = bodyId || resolvedParams?.id;
    if (!id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });

    const { data: existing, error: existError } = await supabase
      .from('v_inventario')
      .select('*')
      .eq('id', id)
      .single();

    if (existError || !existing) return NextResponse.json({ error: 'Registro no encontrado' }, { status: 404 });

    const allowedFields = [
      'cantidad_fisica', 'observacion', 'comentario', 'rack', 'ubicacion_actual',
      'almacenamiento', 'contenedor', 'responsable', 'fecha_conteo', 'foto_path',
      'lote', 'familia2', 'um', 'presentacion', 'n_cajas_bultos', 'largo', 'ancho',
      'alto', 'rotacion', 'linea', 'prioridad', 'vida_util_ssoma',
      'compatibilidad_segregacion', 'condiciones_almacenamiento'
    ];

    const updates: any = {};
    for (const field of allowedFields) {
      if (fields[field] !== undefined) {
        updates[field] = fields[field];
      }
    }

    if (Object.keys(updates).length === 0) {
      return NextResponse.json({ error: 'No hay campos para actualizar' }, { status: 400 });
    }

    updates.updated_at = new Date().toISOString();

    const newCantFisica = fields.cantidad_fisica !== undefined ? Number(fields.cantidad_fisica) : Number(existing.cantidad_fisica);
    const stockSis = Number(existing.stock_sistema || 0);
    const costoUnit = Number(existing.costo_unitario || 0);
    const pesoUnit = Number(existing.peso_aprox_unitario || 0);
    const dif = newCantFisica - stockSis;

    updates.dif = dif;
    updates.peso_total_cant_fisica = newCantFisica * pesoUnit;
    updates.total_costo = stockSis * costoUnit;
    updates.s_dif = dif * costoUnit;
    
    if (!fields.observacion) {
      updates.observacion = dif > 0 ? 'SOBRANTE' : dif < 0 ? 'FALTANTE' : 'OK';
    }

    const { error: updateError } = await supabase.from('inventario').update(updates).eq('id', id);
    if (updateError) throw updateError;

    return NextResponse.json({ success: true });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

export async function DELETE(
  req: NextRequest,
  context: { params: Promise<{ id: string }> | { id: string } }
) {
  try {
    const supabase = await createClient();
    const resolvedParams = await context.params;
    const { searchParams } = new URL(req.url);
    const id = resolvedParams?.id || searchParams.get('id');
    
    if (!id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });

    const { error } = await supabase.from('inventario').delete().eq('id', id);
    if (error) throw error;

    return NextResponse.json({ success: true });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
