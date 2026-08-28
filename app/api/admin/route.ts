import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET() {
  try {
    const supabase = await createClient();

    // Fetch ALL inventory data for aggregation bypassing 1000 row limit
    let allInventario: any[] = [];
    let page = 0;
    const pageSize = 1000;
    let fetchMore = true;

    while (fetchMore) {
      const { data, error } = await supabase
        .from('v_inventario')
        .select('id, producto, cantidad_fisica, observacion, dif, s_dif, rack, ubicacion_actual, familia, costo_unitario, descripcion, usuario_nombre, updated_at, duracion_segundos')
        .range(page * pageSize, (page + 1) * pageSize - 1);

      if (error) throw error;
      
      if (data && data.length > 0) {
        allInventario = [...allInventario, ...data];
        if (data.length < pageSize) {
          fetchMore = false;
        } else {
          page++;
        }
      } else {
        fetchMore = false;
      }
    }

    const inventario = allInventario;

    const { count: totalProductos } = await supabase.from('productos').select('*', { count: 'exact', head: true }).eq('is_deleted', 0);

    let totalAuditados = 0;
    let totalOk = 0;
    let totalFaltante = 0;
    let totalSobrante = 0;
    let totalPendiente = 0;
    let totalCantFisica = 0;
    let totalValor = 0;
    let totalDiferenciaValor = 0;

    const porFamiliaMap: Record<string, any> = {};
    const porRackMap: Record<string, any> = {};
    const porUsuarioMap: Record<string, any> = {};

    inventario.forEach(i => {
      const cant = Number(i.cantidad_fisica);
      const isAuditado = cant !== 0 || i.usuario_nombre !== null;

      if (isAuditado) totalAuditados++;
      else totalPendiente++;

      if (i.observacion === 'OK' && isAuditado) totalOk++;
      if (i.observacion === 'FALTANTE' && isAuditado) totalFaltante++;
      if (i.observacion === 'SOBRANTE' && isAuditado) totalSobrante++;

      totalCantFisica += cant || 0;
      totalValor += (cant || 0) * Number(i.costo_unitario || 0);
      totalDiferenciaValor += Number(i.s_dif || 0);

      // Familia
      const fam = i.familia || 'GENERAL';
      if (!porFamiliaMap[fam]) {
        porFamiliaMap[fam] = { name: fam, total_items: 0, ok_count: 0, faltante_count: 0, sobrante_count: 0, cant_fisica: 0, stock_sistema: 0, valor_total: 0 };
      }
      porFamiliaMap[fam].total_items++;
      if (i.observacion === 'OK' && isAuditado) porFamiliaMap[fam].ok_count++;
      if (i.observacion === 'FALTANTE' && isAuditado) porFamiliaMap[fam].faltante_count++;
      if (i.observacion === 'SOBRANTE' && isAuditado) porFamiliaMap[fam].sobrante_count++;
      porFamiliaMap[fam].cant_fisica += cant || 0;
      porFamiliaMap[fam].stock_sistema += (cant || 0) - Number(i.dif || 0); // Simplified stock sis
      porFamiliaMap[fam].valor_total += (cant || 0) * Number(i.costo_unitario || 0);

      // Rack
      const rk = i.rack || 'SIN RACK';
      if (!porRackMap[rk]) porRackMap[rk] = { rack: rk, count: 0, auditados: 0 };
      porRackMap[rk].count++;
      if (isAuditado) porRackMap[rk].auditados++;

      // Usuario
      if (i.usuario_nombre) {
        const un = i.usuario_nombre;
        if (!porUsuarioMap[un]) porUsuarioMap[un] = { nombre: un, usuario: un, registros: 0, auditados: 0 };
        porUsuarioMap[un].registros++;
        if (isAuditado) porUsuarioMap[un].auditados++;
      }
    });

    const porEstado = [
      { name: 'OK', value: totalOk, color: '#10B981' },
      { name: 'Faltante', value: totalFaltante, color: '#F43F5E' },
      { name: 'Sobrante', value: totalSobrante, color: '#F59E0B' },
      { name: 'Pendiente', value: totalPendiente, color: '#94A3B8' },
    ];

    const porFamilia = Object.values(porFamiliaMap).sort((a: any, b: any) => b.total_items - a.total_items).slice(0, 10);
    const porRack = Object.values(porRackMap).sort((a: any, b: any) => b.count - a.count).slice(0, 8);
    const porUsuario = Object.values(porUsuarioMap);

    const topDiferencias = inventario
      .filter(i => Number(i.dif) !== 0 && (Number(i.cantidad_fisica) !== 0 || i.usuario_nombre))
      .sort((a, b) => Math.abs(Number(b.dif)) - Math.abs(Number(a.dif)))
      .slice(0, 10)
      .map(i => ({
        id: i.id, producto: i.producto, descripcion: i.descripcion,
        stock_sistema: Number(i.cantidad_fisica) - Number(i.dif),
        cantidad_fisica: i.cantidad_fisica, dif: i.dif, s_dif: i.s_dif,
        observacion: i.observacion, rack: i.rack, ubicacion_actual: i.ubicacion_actual,
        familia2: i.familia
      }));

    const ultimosRegistros = inventario
      .sort((a, b) => new Date(b.updated_at).getTime() - new Date(a.updated_at).getTime())
      .slice(0, 15)
      .map(i => ({
        ...i,
        stock_sistema: Number(i.cantidad_fisica) - Number(i.dif)
      }));

    const totalRegistros = inventario.length;

    return NextResponse.json({
      stats: {
        totalRegistros,
        totalAuditados,
        totalOk,
        totalFaltante,
        totalSobrante,
        totalStockSistema: 0, // Ignored logic for simplicity
        totalCantFisica: Math.round(totalCantFisica * 100) / 100,
        totalValor: Math.round(totalValor * 100) / 100,
        totalValorSistema: 0,
        totalDiferenciaValor: Math.round(totalDiferenciaValor * 100) / 100,
        stockTotal: totalProductos || 0,
        porcentajeCompletado: totalProductos && totalProductos > 0 ? Math.round((totalAuditados / totalProductos) * 100) : 0,
      },
      porFamilia,
      porEstado,
      porRack,
      topDiferencias,
      porUsuario,
      ultimosRegistros,
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
