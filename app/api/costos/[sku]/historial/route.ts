import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest, context: { params: Promise<{ sku: string }> }) {
  try {
    const { sku } = await context.params;
    const supabase = await createClient();
    const { data: { user }, error: authError } = await supabase.auth.getUser();
    if (authError || !user) {
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 401 });
    }

    const { data: profile } = await supabase.from('usuarios').select('rol').eq('id', user.id).single();
    if (!profile || (profile.rol !== 'admin' && profile.rol !== 'superadmin')) {
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });
    }

    const { data: history, error } = await supabase
      .from('producto_costos_historial')
      .select('*, usuarios!producto_costos_historial_created_by_fkey(nombre)')
      .eq('producto_sku', sku)
      .order('id', { ascending: false });

    if (error) throw error;

    const { data: product } = await supabase
      .from('productos')
      .select('sku, glosa')
      .eq('sku', sku)
      .single();

    const formattedHistory = history.map((h: any) => ({
      ...h,
      usuario_nombre: h.usuarios?.nombre || 'Desconocido'
    }));

    return NextResponse.json({ 
      historial: formattedHistory,
      product: product || { sku, glosa: 'Producto no encontrado' }
    });
  } catch (error) {
    return NextResponse.json({ error: 'Error del servidor' }, { status: 500 });
  }
}
