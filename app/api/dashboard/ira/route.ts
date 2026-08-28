import { NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

interface Row {
  [key: string]: string | number | null;
}

export async function GET() {
  try {
    const db = getDB();

    const auditados = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number } || { c: 0 };

    const conformes = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'OK' AND dif = 0
        AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number } || { c: 0 };

    const totalSKU = db.prepare('SELECT COUNT(*) as c FROM inventario').get() as { c: number } || { c: 0 };

    const iraSKU = auditados.c > 0 ? (conformes.c / auditados.c) * 100 : 0;

    const valorFisico = db.prepare(`
      SELECT COALESCE(SUM(i.cantidad_fisica * COALESCE(p.costo_unitario_actual, 0)), 0) as v
      FROM inventario i 
      LEFT JOIN productos p ON i.producto = p.sku
    `).get() as { v: number } || { v: 0 };

    const valorSistema = { v: valorFisico.v };

    const iraFinanciera = valorSistema.v > 0
      ? (1 - Math.abs(valorFisico.v - valorSistema.v) / valorSistema.v) * 100
      : 100;

    const descalceNeto = valorFisico.v - valorSistema.v;

    const descalceBruto = db.prepare(`
      SELECT COALESCE(SUM(ABS(i.dif)), 0) as v FROM inventario i
    `).get() as { v: number } || { v: 0 };

    const descalceNetoUnid = db.prepare(`
      SELECT COALESCE(SUM(i.cantidad_fisica), 0) - (
        SELECT COALESCE(SUM(cantidad_fisica), 0) FROM inventario
      ) as v FROM inventario i
    `).get() as { v: number } || { v: 0 };

    let porFamilia2: Row[] = [];
    try {
      porFamilia2 = db.prepare(`
        SELECT
          COALESCE(g.nombre, NULLIF(i.familia2, ''), 'GENERAL') as familia,
          COUNT(*) as total,
          SUM(CASE WHEN i.observacion = 'OK' THEN 1 ELSE 0 END) as ok_count,
          SUM(CASE WHEN i.observacion = 'FALTANTE' THEN 1 ELSE 0 END) as faltante_count,
          SUM(CASE WHEN i.observacion = 'SOBRANTE' THEN 1 ELSE 0 END) as sobrante_count,
          ROUND(COALESCE(SUM(i.cantidad_fisica), 0), 2) as cant_fisica,
          ROUND(COALESCE(SUM(i.cantidad_fisica), 0), 2) as stock_sistema,
          ROUND(COALESCE(SUM(i.dif), 0), 2) as dif_unid,
          ROUND(COALESCE(SUM(ABS(i.dif)), 0), 2) as dif_unid_abs,
          ROUND(COALESCE(SUM(i.cantidad_fisica * COALESCE(p.costo_unitario_actual, 0)), 0), 2) as valor_fisico,
          ROUND(COALESCE(SUM(i.cantidad_fisica * COALESCE(p.costo_unitario_actual, 0)), 0), 2) as valor_sistema
        FROM inventario i
        LEFT JOIN productos p ON i.producto = p.sku
        LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
        GROUP BY familia
        ORDER BY total DESC
      `).all() as Row[];
    } catch (e) {
      console.warn('[IRA API] Error en query porFamilia2:', e);
    }

    let topImpacto: Row[] = [];
    try {
      topImpacto = db.prepare(`
        SELECT i.producto, 
               COALESCE(p.glosa, i.producto) as descripcion, 
               COALESCE(g.nombre, 'GENERAL') as familia,
               i.cantidad_fisica as stock_sistema, 
               i.cantidad_fisica, 
               i.dif,
               COALESCE(p.costo_unitario_actual, 0) as costo_unitario,
               (i.dif * COALESCE(p.costo_unitario_actual, 0)) as impacto_monetario
        FROM inventario i
        LEFT JOIN productos p ON i.producto = p.sku
        LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
        WHERE i.dif != 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0
        ORDER BY ABS(i.dif * COALESCE(p.costo_unitario_actual, 0)) DESC
        LIMIT 10
      `).all() as Row[];
    } catch (err) {
      console.warn('[API /api/dashboard/ira] topImpacto warning:', err);
    }

    let causaRaiz: Row[] = [];
    try {
      causaRaiz = db.prepare(`
        SELECT
          observacion,
          COUNT(*) as cantidad,
          ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM inventario WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0), 1) as porcentaje
        FROM inventario
        WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
        GROUP BY observacion
        ORDER BY cantidad DESC
      `).all() as Row[];
    } catch (err) {
      console.warn('[API /api/dashboard/ira] causaRaiz warning:', err);
    }

    const totalContados = auditados.c;
    const totalFaltantes = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'FALTANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number } || { c: 0 };

    const totalSobrantes = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'SOBRANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number } || { c: 0 };

    return NextResponse.json({
      kpis: {
        iraSKU: Math.round(iraSKU * 10) / 10,
        iraFinanciera: Math.round(iraFinanciera * 10) / 10,
        metaIRA: 95.0,
        metaFinanciera: 98.0,
        descalceNeto: Math.round(descalceNeto * 100) / 100,
        descalceBruto: Math.round((descalceBruto.v || 0) * 100) / 100,
        descalceNetoUnid: Math.round((descalceNetoUnid.v || 0) * 100) / 100,
        valorFisico: Math.round((valorFisico.v || 0) * 100) / 100,
        valorSistema: Math.round((valorSistema.v || 0) * 100) / 100,
        totalSKU: totalSKU.c,
        totalAuditados: totalContados,
        totalConformes: conformes.c,
        totalConError: totalContados - conformes.c,
        totalFaltantes: totalFaltantes.c,
        totalSobrantes: totalSobrantes.c,
        porcentajeAuditado: totalSKU.c > 0 ? Math.round((totalContados / totalSKU.c) * 1000) / 10 : 0,
      },
      porFamilia2,
      topImpacto,
      causaRaiz,
    });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    console.error('[API /api/dashboard/ira FATAL ERROR]:', error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
