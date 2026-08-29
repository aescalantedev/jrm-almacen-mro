import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET() {
  try {
    const supabase = await createClient();

    // 1. Obtener todos los datos estadísticos desde la base de datos usando el nuevo RPC
    const { data: result, error } = await supabase.rpc('get_dashboard_stats');
    
    if (error) throw error;
    
    const dashData = result || {};
    const stats = dashData.stats || {};

    // 2. Formatear y calcular los porcentajes
    const totalPendiente = (stats.stockTotal || 0) - (stats.totalAuditados || 0);
    const porcentajeCompletado = stats.stockTotal > 0 
      ? Math.round((stats.totalAuditados / stats.stockTotal) * 100) 
      : 0;

    const porEstado = [
      { name: 'OK', value: stats.totalOk || 0, color: '#10B981' },
      { name: 'Faltante', value: stats.totalFaltante || 0, color: '#F43F5E' },
      { name: 'Sobrante', value: stats.totalSobrante || 0, color: '#F59E0B' },
      { name: 'Pendiente', value: totalPendiente, color: '#94A3B8' },
    ];

    return NextResponse.json({
      stats: {
        totalRegistros: stats.totalRegistros || 0,
        totalAuditados: stats.totalAuditados || 0,
        totalOk: stats.totalOk || 0,
        totalFaltante: stats.totalFaltante || 0,
        totalSobrante: stats.totalSobrante || 0,
        totalStockSistema: 0, 
        totalCantFisica: Math.round((stats.totalCantFisica || 0) * 100) / 100,
        totalValor: Math.round((stats.totalValor || 0) * 100) / 100,
        totalValorSistema: 0,
        totalDiferenciaValor: Math.round((stats.totalDiferenciaValor || 0) * 100) / 100,
        stockTotal: stats.stockTotal || 0,
        porcentajeCompletado: porcentajeCompletado,
      },
      porFamilia: dashData.porFamilia || [],
      porEstado,
      porRack: dashData.porRack || [],
      topDiferencias: dashData.topDiferencias || [],
      porUsuario: dashData.porUsuario || [],
      ultimosRegistros: dashData.ultimosRegistros || [],
    });

  } catch (error: any) {
    console.error('[API /api/admin FATAL ERROR]:', error);
    return NextResponse.json({ 
      error: error.message,
      stats: { totalRegistros: 0, totalAuditados: 0, totalOk: 0, totalFaltante: 0, totalSobrante: 0, totalStockSistema: 0, totalCantFisica: 0, totalValor: 0, totalValorSistema: 0, totalDiferenciaValor: 0, stockTotal: 0, porcentajeCompletado: 0 },
      porFamilia: [], porEstado: [], porRack: [], topDiferencias: [], porUsuario: [], ultimosRegistros: [],
    }, { status: 200 }); 
  }
}
