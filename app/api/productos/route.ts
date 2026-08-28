import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    let q = supabase
      .from('v_productos')
      .select('*', { count: 'exact' });

    if (query) {
      const searchPattern = `%${query.trim()}%`;
      q = q.or(`producto.ilike.${searchPattern},glosa.ilike.${searchPattern},familia.ilike.${searchPattern},rack.ilike.${searchPattern},contenedor_nombre.ilike.${searchPattern}`);
    }

    const { data: items, count: total, error } = await q
      .order('glosa', { ascending: true })
      .range(offset, offset + limit - 1);

    if (error) throw error;

    return NextResponse.json({ items, total: total || 0, page, limit });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  try {
    const supabase = await createClient();
    const body = await req.json();
    const { producto, ...fields } = body;
    
    if (!producto) return NextResponse.json({ error: 'El campo producto es requerido' }, { status: 400 });
    const cleanSKU = String(producto).trim().toUpperCase();

    // Mapping inputs to database columns
    const updates: any = {};
    if (fields.glosa !== undefined) updates.glosa = String(fields.glosa).trim();
    if (fields.unidad !== undefined) updates.unidad_codigo = String(fields.unidad).trim().toUpperCase();
    if (fields.unidad_codigo !== undefined) updates.unidad_codigo = String(fields.unidad_codigo).trim().toUpperCase();
    if (fields.grupo_articulo_id !== undefined) updates.grupo_articulo_id = Number(fields.grupo_articulo_id) || 1;
    if (fields.contenedor_id !== undefined) updates.contenedor_id = Number(fields.contenedor_id) || 1;
    if (fields.tipo_almacenamiento_id !== undefined) updates.tipo_almacenamiento_id = Number(fields.tipo_almacenamiento_id) || 1;
    if (fields.peso !== undefined || fields.peso_neto !== undefined) updates.peso_neto = Number(fields.peso_neto ?? fields.peso) || 0;
    if (fields.stock_seguridad_min !== undefined) updates.stock_seguridad_min = Number(fields.stock_seguridad_min) || 0;
    if (fields.stock_maximo !== undefined) updates.stock_maximo = Number(fields.stock_maximo) || 0;
    if (fields.rack !== undefined) updates.rack = String(fields.rack).trim();
    if (fields.nivel_rack !== undefined) updates.nivel_rack = String(fields.nivel_rack).trim();
    if (fields.posicion_detalle !== undefined) updates.posicion_detalle = String(fields.posicion_detalle).trim();
    if (fields.tipo_acero !== undefined) updates.tipo_acero = String(fields.tipo_acero);
    if (fields.grado_acero !== undefined) updates.grado_acero = String(fields.grado_acero);
    if (fields.espesor_acero !== undefined) updates.espesor_acero = String(fields.espesor_acero);
    
    // Handing Cost changes
    let nuevoCosto: number | undefined;
    if (fields.costo_unitario !== undefined || fields.costo_unitario_actual !== undefined) {
      nuevoCosto = Number(fields.costo_unitario_actual ?? fields.costo_unitario) || 0;
      updates.costo_unitario_actual = nuevoCosto;
    }

    if (Object.keys(updates).length > 0) {
      updates.updated_at = new Date().toISOString();
      const { error: updateError } = await supabase.from('productos').update(updates).eq('sku', cleanSKU);
      if (updateError) throw updateError;
    }

    // Cost History Update (If cost changed)
    if (nuevoCosto !== undefined) {
      const today = new Date().toISOString().split('T')[0];
      
      // Close old validity
      await supabase
        .from('producto_costos_historial')
        .update({ fecha_validez_hasta: today })
        .eq('producto_sku', cleanSKU)
        .is('fecha_validez_hasta', null);

      // Insert new validity
      const { error: insertError } = await supabase
        .from('producto_costos_historial')
        .insert({
          producto_sku: cleanSKU,
          costo_unitario: nuevoCosto,
          moneda: 'PEN',
          fecha_validez_desde: today,
          motivo_modificacion: 'Modificación desde ficha técnica'
        });
      if (insertError) throw insertError;
    }

    return NextResponse.json({ success: true });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const supabase = await createClient();
    const body = await req.json();
    
    if (!body.sku || !body.glosa) {
      return NextResponse.json({ error: 'El SKU y la Descripción (Glosa) son obligatorios' }, { status: 400 });
    }

    const cleanSKU = String(body.sku).trim().toUpperCase();
    const { data: existing } = await supabase.from('productos').select('sku').eq('sku', cleanSKU).single();
    
    if (existing) {
      return NextResponse.json({ error: `El producto con SKU ${cleanSKU} ya existe en el sistema` }, { status: 409 });
    }

    const costo_unitario = Number(body.costo_unitario) || 0;

    const { error: insertError } = await supabase.from('productos').insert({
      sku: cleanSKU,
      glosa: String(body.glosa).trim(),
      unidad_codigo: String(body.unidad_codigo || body.unidad || 'UND').trim().toUpperCase(),
      grupo_articulo_id: Number(body.grupo_articulo_id) || 1,
      contenedor_id: Number(body.contenedor_id) || 1,
      tipo_almacenamiento_id: Number(body.tipo_almacenamiento_id) || 1,
      rack: String(body.rack || '').trim(),
      nivel_rack: String(body.nivel_rack || '').trim(),
      posicion_detalle: String(body.posicion_detalle || '').trim(),
      costo_unitario_actual: costo_unitario,
      moneda: 'PEN',
      peso_neto: Number(body.peso_neto ?? body.peso) || 0,
      stock_seguridad_min: Number(body.stock_seguridad_min) || 0,
      stock_maximo: Number(body.stock_maximo) || 0,
      tipo_acero: String(body.tipo_acero || ''),
      grado_acero: String(body.grado_acero || ''),
      espesor_acero: String(body.espesor_acero || ''),
      bodega_id: 1 // TODO: Dynamic bodega assignment
    });

    if (insertError) throw insertError;

    // Crear registro base en la tabla inventario para que aparezca en el conteo de inmediato
    const { error: invError } = await supabase.from('inventario').insert({
      producto: cleanSKU,
      lote: '',
      ubicacion_actual: String(body.rack || '').trim(),
      contenedor: String(body.contenedor_id || 1).trim(), // Puedes ajustar esto si guardas el nombre real
      observacion: 'PENDIENTE',
      cantidad_fisica: null,
      bodega_id: 1 // TODO: Dynamic bodega assignment
    });
    if (invError) console.error("Error creating base inventario record:", invError);

    if (costo_unitario > 0) {
      const today = new Date().toISOString().split('T')[0];
      await supabase.from('producto_costos_historial').insert({
        producto_sku: cleanSKU,
        costo_unitario: costo_unitario,
        moneda: 'PEN',
        fecha_validez_desde: today,
        motivo_modificacion: 'Alta de nuevo producto'
      });
    }

    return NextResponse.json({ success: true, sku: cleanSKU });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { searchParams } = new URL(req.url);
    const skuParam = searchParams.get('sku');

    let skusToDelete: string[] = [];
    if (skuParam) {
      skusToDelete = [skuParam.trim().toUpperCase()];
    } else {
      const body = await req.json().catch(() => ({}));
      if (Array.isArray(body.skus) && body.skus.length > 0) {
        skusToDelete = body.skus.map((s: string) => String(s).trim().toUpperCase());
      } else if (body.sku) {
        skusToDelete = [String(body.sku).trim().toUpperCase()];
      }
    }

    if (skusToDelete.length === 0) {
      return NextResponse.json({ error: 'No se especificaron SKUs para eliminar' }, { status: 400 });
    }

    // Soft Delete instead of Hard Delete
    const { error: updateError } = await supabase
      .from('productos')
      .update({ is_deleted: 1, deleted_at: new Date().toISOString() })
      .in('sku', skusToDelete);

    if (updateError) throw updateError;

    return NextResponse.json({ success: true, deleted: skusToDelete.length });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
