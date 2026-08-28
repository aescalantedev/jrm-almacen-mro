import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const pendingOnly = searchParams.get('pending') === 'true';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    let q = supabase.from('v_inventario').select('*', { count: 'exact' });

    if (pendingOnly) {
      q = q.or('cantidad_fisica.is.null,cantidad_fisica.eq.0');
    }

    if (query) {
      const searchPattern = `%${query.trim()}%`;
      q = q.or(`producto.ilike.${searchPattern},descripcion.ilike.${searchPattern},rack.ilike.${searchPattern},familia.ilike.${searchPattern}`);
    }

    const { data: rawStock, count: total, error } = await q
      .order('descripcion', { ascending: true })
      .range(offset, offset + limit - 1);

    if (error) throw error;

    // Map to frontend expected format
    const stock = (rawStock || []).map((i: any) => ({
      producto: i.producto,
      lote: i.lote || '',
      glosa: i.descripcion,
      unidad: i.unidad,
      stock: i.stock_sistema,
      familia: i.familia,
      peso: i.peso_aprox_unitario,
      inventario_id: i.id,
      cantidad_fisica: i.cantidad_fisica,
      dif: i.dif,
      inventario_um: i.um,
      presentacion: i.presentacion,
      n_cajas_bultos: i.n_cajas_bultos,
      largo: i.largo,
      ancho: i.ancho,
      alto: i.alto,
      peso_total_cant_fisica: i.peso_total_cant_fisica,
      inventario_observacion: i.observacion,
      comentario: i.comentario,
      rack: i.rack || 'Sin asignar',
      ubicacion_actual: i.ubicacion_actual,
      almacenamiento: i.almacenamiento || 'C.C.01',
      contenedor: i.contenedor || '1',
      responsable: i.responsable,
      fecha_conteo: i.fecha_conteo,
      familia2: i.familia2 || i.familia,
      foto_path: i.foto_path,
      usuario_id: i.usuario_id,
      inventario_updated_at: i.updated_at,
      ya_contado: (i.cantidad_fisica !== null && i.cantidad_fisica !== 0) || i.usuario_id || (i.comentario) ? 1 : 0,
      stock_disponible: i.stock_sistema,
    }));

    return NextResponse.json({ stock, total: total || 0, page, limit });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
