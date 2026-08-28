import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();

    // In Supabase without RPC, doing complex group-bys requires either views or fetching raw and reducing in JS.
    // Since this is for a dashboard of recent data, we will fetch the raw data for the last 30 days.
    
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
    const dateLimit = thirtyDaysAgo.toISOString();

    const { data: rawMovs, error } = await supabase
      .from('v_movimientos')
      .select('tipo, cantidad, motivo, producto, descripcion, unidad, solicitante, created_at')
      .gte('created_at', dateLimit);

    if (error) throw error;
    
    const movs = rawMovs || [];

    // 1. Tendencia
    const tendenciaMap: Record<string, any> = {};
    const motivosSalidaMap: Record<string, any> = {};
    const topSalidasMap: Record<string, any> = {};
    const topSolicitantesMap: Record<string, any> = {};

    movs.forEach(m => {
      // 1. Tendencia
      const fecha = m.created_at ? m.created_at.split('T')[0] : 'N/A';
      if (!tendenciaMap[fecha]) {
        tendenciaMap[fecha] = { fecha, ingresos: 0, salidas: 0, total_movimientos: 0 };
      }
      tendenciaMap[fecha].total_movimientos++;
      if (m.tipo === 'INGRESO') tendenciaMap[fecha].ingresos += Number(m.cantidad);
      if (m.tipo === 'SALIDA') {
        tendenciaMap[fecha].salidas += Number(m.cantidad);

        // 2. Motivos
        const motivo = m.motivo || 'Salida de Almacén';
        if (!motivosSalidaMap[motivo]) motivosSalidaMap[motivo] = { name: motivo, count: 0, value: 0 };
        motivosSalidaMap[motivo].count++;
        motivosSalidaMap[motivo].value += Number(m.cantidad);

        // 3. Top Salidas
        if (!topSalidasMap[m.producto]) topSalidasMap[m.producto] = { 
          producto: m.producto, glosa: m.descripcion || m.producto, unidad: m.unidad || 'UND', total_despachado: 0, frecuencia: 0 
        };
        topSalidasMap[m.producto].total_despachado += Number(m.cantidad);
        topSalidasMap[m.producto].frecuencia++;

        // 4. Solicitantes
        const solicitante = m.solicitante || 'Sin especificar';
        if (!topSolicitantesMap[solicitante]) topSolicitantesMap[solicitante] = { solicitante, despachos: 0, unidades: 0 };
        topSolicitantesMap[solicitante].despachos++;
        topSolicitantesMap[solicitante].unidades += Number(m.cantidad);
      }
    });

    const tendencia = Object.values(tendenciaMap).sort((a: any, b: any) => a.fecha.localeCompare(b.fecha));
    const motivosSalida = Object.values(motivosSalidaMap).sort((a: any, b: any) => b.value - a.value).slice(0, 8);
    const topSalidas = Object.values(topSalidasMap).sort((a: any, b: any) => b.total_despachado - a.total_despachado).slice(0, 10);
    const topSolicitantes = Object.values(topSolicitantesMap).sort((a: any, b: any) => b.despachos - a.despachos).slice(0, 8);

    return NextResponse.json({
      tendencia,
      motivos_salida: motivosSalida,
      top_salidas: topSalidas,
      top_solicitantes: topSolicitantes,
    });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
