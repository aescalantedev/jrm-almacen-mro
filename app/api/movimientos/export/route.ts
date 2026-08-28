import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';
import { generateKardexExcel, KardexExcelRow } from '@/lib/reports/kardex-excel';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const tipo = searchParams.get('tipo') || '';
    const desde = searchParams.get('desde') || '';
    const hasta = searchParams.get('hasta') || '';

    let q = supabase.from('v_movimientos_export').select('*');

    if (query) {
      const p = `%${query.trim()}%`;
      q = q.or(`producto.ilike.${p},producto_glosa.ilike.${p},documento_referencia.ilike.${p},solicitante.ilike.${p}`);
    }

    if (tipo) {
      q = q.eq('tipo', tipo);
    }

    if (desde) {
      q = q.gte('fecha', desde);
    }

    if (hasta) {
      // add one day to hasta to include the whole day
      const endDate = new Date(hasta);
      endDate.setDate(endDate.getDate() + 1);
      q = q.lt('fecha', endDate.toISOString().split('T')[0]);
    }

    const { data: rowsData, error } = await q.order('fecha', { ascending: false }).order('id', { ascending: false });
    
    if (error) throw error;

    // Map to KardexExcelRow
    const rows: KardexExcelRow[] = (rowsData || []).map((m: any) => ({
      id: m.id,
      created_at: m.fecha,
      tipo: m.tipo,
      producto: m.producto,
      descripcion: m.producto_glosa,
      unidad: m.unidad || 'UND', // Add unit if needed
      lote: m.lote,
      cantidad: m.cantidad,
      stock_anterior: m.stock_anterior,
      stock_resultante: m.stock_resultante,
      motivo: m.motivo,
      documento_referencia: m.documento_referencia,
      solicitante: m.solicitante,
      rack: m.rack,
      usuario_nombre: m.usuario_nombre,
      comentario: m.comentario
    }));

    const excelBuffer = await generateKardexExcel(rows, { tipo, desde, hasta, q: query });
    const filename = `Kardex_Movimientos_${new Date().toISOString().slice(0, 10)}.xlsx`;

    return new NextResponse(new Uint8Array(excelBuffer), {
      status: 200,
      headers: {
        'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'Content-Disposition': `attachment; filename="${filename}"`,
        'Cache-Control': 'no-store',
      },
    });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
