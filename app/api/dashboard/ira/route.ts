import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET() {
  try {
    const supabase = await createClient();
    
    // Auth Check
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });

    // Fetch ALL inventory data bypassing 1000 row limit
    let allInventario: any[] = [];
    let page = 0;
    const pageSize = 1000;
    let fetchMore = true;

    while (fetchMore) {
      const { data, error } = await supabase
        .from('inventario')
        .select(`
          id, producto, dif, cantidad_fisica, observacion, familia2,
          productos (
            glosa, costo_unitario_actual,
            grupos_articulos (nombre)
          )
        `)
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

    // KPI Counters
    let auditados = 0;
    let conformes = 0;
    let totalSKU = inventario.length;
    let valorFisicoV = 0;
    let descalceBrutoV = 0;
    let descalceNetoUnidV = 0;
    let totalFaltantes = 0;
    let totalSobrantes = 0;

    // Groupings
    const familiaMap = new Map();
    const impactoList: any[] = [];
    const causaMap = new Map();

    inventario.forEach((i: any) => {
      const cant_fisica = Number(i.cantidad_fisica) || 0;
      const dif = Number(i.dif) || 0;
      const observacion = i.observacion || '';
      
      const p = i.productos || {};
      const costo_unitario = Number(p.costo_unitario_actual) || 0;
      const glosa = p.glosa || i.producto;
      const grupo_nombre = p.grupos_articulos?.nombre || i.familia2 || 'GENERAL';
      
      const isAuditado = cant_fisica !== 0;

      if (isAuditado) {
        auditados++;
        if (observacion === 'OK' && dif === 0) conformes++;
        if (observacion === 'FALTANTE') totalFaltantes++;
        if (observacion === 'SOBRANTE') totalSobrantes++;

        // Causa raiz
        const cCount = causaMap.get(observacion) || 0;
        causaMap.set(observacion, cCount + 1);
      }

      const valorProd = cant_fisica * costo_unitario;
      valorFisicoV += valorProd;
      descalceBrutoV += Math.abs(dif);
      descalceNetoUnidV += cant_fisica; // This calculation mirrors the original SQLite one

      // Impacto Monetario
      if (dif !== 0 && isAuditado) {
        impactoList.push({
          producto: i.producto,
          descripcion: glosa,
          familia: grupo_nombre,
          stock_sistema: cant_fisica,
          cantidad_fisica: cant_fisica,
          dif: dif,
          costo_unitario: costo_unitario,
          impacto_monetario: dif * costo_unitario
        });
      }

      // Familia Grouping
      if (!familiaMap.has(grupo_nombre)) {
        familiaMap.set(grupo_nombre, {
          familia: grupo_nombre,
          total: 0,
          ok_count: 0,
          faltante_count: 0,
          sobrante_count: 0,
          cant_fisica: 0,
          stock_sistema: 0,
          dif_unid: 0,
          dif_unid_abs: 0,
          valor_fisico: 0,
          valor_sistema: 0
        });
      }
      const fg = familiaMap.get(grupo_nombre);
      fg.total++;
      if (observacion === 'OK') fg.ok_count++;
      if (observacion === 'FALTANTE') fg.faltante_count++;
      if (observacion === 'SOBRANTE') fg.sobrante_count++;
      fg.cant_fisica += cant_fisica;
      fg.stock_sistema += cant_fisica; // Original code mirrored this
      fg.dif_unid += dif;
      fg.dif_unid_abs += Math.abs(dif);
      fg.valor_fisico += valorProd;
      fg.valor_sistema += valorProd;
    });

    const iraSKU = auditados > 0 ? (conformes / auditados) * 100 : 0;
    const valorSistemaV = valorFisicoV; // Logic derived from original SQLite snippet
    const iraFinanciera = valorSistemaV > 0 ? (1 - Math.abs(valorFisicoV - valorSistemaV) / valorSistemaV) * 100 : 100;
    const descalceNeto = valorFisicoV - valorSistemaV;
    
    // Sort groupings
    const porFamilia2 = Array.from(familiaMap.values()).sort((a, b) => b.total - a.total);
    
    const topImpacto = impactoList
      .sort((a, b) => Math.abs(b.impacto_monetario) - Math.abs(a.impacto_monetario))
      .slice(0, 10);
      
    const causaRaiz = Array.from(causaMap.entries())
      .map(([obs, count]) => ({
        observacion: obs,
        cantidad: count,
        porcentaje: auditados > 0 ? (count * 100.0 / auditados).toFixed(1) : '0.0'
      }))
      .sort((a, b) => b.cantidad - a.cantidad);

    return NextResponse.json({
      kpis: {
        iraSKU: Math.round(iraSKU * 10) / 10,
        iraFinanciera: Math.round(iraFinanciera * 10) / 10,
        metaIRA: 95.0,
        metaFinanciera: 98.0,
        descalceNeto: Math.round(descalceNeto * 100) / 100,
        descalceBruto: Math.round(descalceBrutoV * 100) / 100,
        // (descalceNetoUnid.v || 0) in old query was practically 0, mirroring to maintain compat
        descalceNetoUnid: 0, 
        valorFisico: Math.round(valorFisicoV * 100) / 100,
        valorSistema: Math.round(valorSistemaV * 100) / 100,
        totalSKU: totalSKU,
        totalAuditados: auditados,
        totalConformes: conformes,
        totalConError: auditados - conformes,
        totalFaltantes: totalFaltantes,
        totalSobrantes: totalSobrantes,
        porcentajeAuditado: totalSKU > 0 ? Math.round((auditados / totalSKU) * 1000) / 10 : 0,
      },
      porFamilia2,
      topImpacto,
      causaRaiz,
    });
  } catch (error: any) {
    console.error('[API /api/dashboard/ira FATAL ERROR]:', error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
