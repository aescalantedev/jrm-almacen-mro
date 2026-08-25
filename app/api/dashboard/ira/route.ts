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
    `).get() as { c: number };

    const conformes = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'OK' AND dif = 0
        AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number };

    const totalSKU = db.prepare('SELECT COUNT(*) as c FROM inventario').get() as { c: number };

    const iraSKU = auditados.c > 0 ? (conformes.c / auditados.c) * 100 : 0;

    const valorFisico = db.prepare(`
      SELECT COALESCE(SUM(i.cantidad_fisica * p.costo_unitario), 0) as v
      FROM inventario i JOIN productos_master p ON i.producto = p.producto
    `).get() as { v: number };

    const valorSistema = db.prepare(`
      SELECT COALESCE(SUM(s.stock * p.costo_unitario), 0) as v
      FROM stock_cache s JOIN productos_master p ON s.producto = p.producto
    `).get() as { v: number };

    const iraFinanciera = valorSistema.v > 0
      ? (1 - Math.abs(valorFisico.v - valorSistema.v) / valorSistema.v) * 100
      : 100;

    const descalceNeto = valorFisico.v - valorSistema.v;

    const descalceBruto = db.prepare(`
      SELECT COALESCE(SUM(ABS(i.dif)), 0) as v FROM inventario i
    `).get() as { v: number };

    const descalceNetoUnid = db.prepare(`
      SELECT COALESCE(SUM(i.cantidad_fisica), 0) - (
        SELECT COALESCE(SUM(s.stock), 0) FROM stock_cache s
      ) as v FROM inventario i
    `).get() as { v: number };

    const porFamilia2 = db.prepare(`
      SELECT
        COALESCE(NULLIF(i.familia2, ''), 'OTROS') as familia,
        COUNT(*) as total,
        SUM(CASE WHEN i.dif = 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0 THEN 1 ELSE 0 END) as conformes,
        SUM(CASE WHEN i.dif != 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0 THEN 1 ELSE 0 END) as con_error,
        SUM(CASE WHEN i.cantidad_fisica IS NULL OR i.cantidad_fisica = 0 THEN 1 ELSE 0 END) as pendientes
      FROM inventario i
      GROUP BY i.familia2
      ORDER BY total DESC
    `).all() as Row[];

    const topImpacto = db.prepare(`
      SELECT i.producto, p.glosa as descripcion, p.familia,
             s.stock as stock_sistema, i.cantidad_fisica, i.dif,
             p.costo_unitario,
             i.dif * p.costo_unitario as impacto_monetario
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
      WHERE i.dif != 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0
      ORDER BY ABS(i.dif * p.costo_unitario) DESC
      LIMIT 10
    `).all() as Row[];

    const causaRaiz = db.prepare(`
      SELECT
        observacion,
        COUNT(*) as cantidad,
        ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM inventario WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0), 1) as porcentaje
      FROM inventario
      WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
      GROUP BY observacion
      ORDER BY cantidad DESC
    `).all() as Row[];

    const totalContados = auditados.c;
    const totalFaltantes = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'FALTANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number };
    const totalSobrantes = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'SOBRANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number };

    return NextResponse.json({
      kpis: {
        iraSKU: Math.round(iraSKU * 10) / 10,
        iraFinanciera: Math.round(iraFinanciera * 10) / 10,
        metaIRA: 95,
        metaFinanciera: 98,
        descalceNeto: Math.round(descalceNeto * 100) / 100,
        descalceBruto: descalceBruto.v,
        descalceNetoUnid: descalceNetoUnid.v,
        valorFisico: Math.round(valorFisico.v * 100) / 100,
        valorSistema: Math.round(valorSistema.v * 100) / 100,
        totalSKU: totalSKU.c,
        totalAuditados: totalContados,
        totalConformes: conformes.c,
        totalConError: totalContados - conformes.c,
        totalFaltantes: totalFaltantes.c,
        totalSobrantes: totalSobrantes.c,
        porcentajeAuditado: totalSKU.c > 0 ? Math.round((totalContados / totalSKU.c) * 100) : 0,
      },
      porFamilia2,
      topImpacto,
      causaRaiz,
    });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
