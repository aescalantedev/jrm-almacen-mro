import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function POST(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 401 });
    }

    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden importar costos' }, { status: 403 });
    }

    const { items, motivo, documento_referencia } = await req.json();
    if (!Array.isArray(items) || items.length === 0) {
      return NextResponse.json({ error: 'Se requiere una lista de items con SKU y costo' }, { status: 400 });
    }

    const today = new Date().toISOString().split('T')[0];
    let actualizados = 0;

    for (const item of items) {
      if (!item.sku || item.costo === undefined) continue;

      const cleanSKU = item.sku.trim().toUpperCase();
      const costoNum = Number(item.costo) || 0;

      // Close previous
      await supabase
        .from('producto_costos_historial')
        .update({ fecha_validez_hasta: today })
        .eq('producto_sku', cleanSKU)
        .is('fecha_validez_hasta', null);

      // Insert new
      const { error: histError } = await supabase
        .from('producto_costos_historial')
        .insert({
          producto_sku: cleanSKU,
          costo_unitario: costoNum,
          moneda: item.moneda || 'PEN',
          fecha_validez_desde: today,
          motivo_modificacion: motivo || 'Importación Masiva de Costos',
          documento_referencia: documento_referencia || '',
          created_by: user.id
        });

      if (!histError) {
        // Update product
        await supabase
          .from('productos')
          .update({ costo_unitario_actual: costoNum })
          .eq('sku', cleanSKU);
        
        actualizados++;
      }
    }

    return NextResponse.json({ 
      success: true, 
      message: `Se actualizaron ${actualizados} costos correctamente` 
    });
  } catch (error) {
    console.error("Error importando costos:", error);
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}
