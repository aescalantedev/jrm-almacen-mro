import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function GET(req: NextRequest) {
  try {
    const db = getDB();

    // 1. Tendencia de los últimos 14 días con movimientos
    const tendencia = db.prepare(`
      SELECT 
        date(created_at) as fecha,
        SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as ingresos,
        SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as salidas,
        COUNT(*) as total_movimientos
      FROM movimientos
      WHERE created_at >= date('now', '-30 days')
      GROUP BY date(created_at)
      ORDER BY fecha ASC
    `).all();

    // 2. Distribución de motivos de salida
    const motivosSalida = db.prepare(`
      SELECT 
        motivo as name,
        COUNT(*) as count,
        SUM(cantidad) as value
      FROM movimientos
      WHERE tipo = 'SALIDA'
      GROUP BY motivo
      ORDER BY value DESC
      LIMIT 8
    `).all();

    // 3. Top 10 productos con mayor salida / rotación
    const topSalidas = db.prepare(`
      SELECT 
        m.producto,
        p.glosa,
        p.unidad,
        SUM(m.cantidad) as total_despachado,
        COUNT(*) as frecuencia
      FROM movimientos m
      JOIN productos_master p ON m.producto = p.producto
      WHERE m.tipo = 'SALIDA'
      GROUP BY m.producto
      ORDER BY total_despachado DESC
      LIMIT 10
    `).all();

    // 4. Top solicitantes / áreas
    const topSolicitantes = db.prepare(`
      SELECT 
        CASE WHEN solicitante = '' THEN 'Sin especificar' ELSE solicitante END as solicitante,
        COUNT(*) as despachos,
        SUM(cantidad) as unidades
      FROM movimientos
      WHERE tipo = 'SALIDA'
      GROUP BY solicitante
      ORDER BY despachos DESC
      LIMIT 8
    `).all();

    return NextResponse.json({
      tendencia,
      motivos_salida: motivosSalida,
      top_salidas: topSalidas,
      top_solicitantes: topSolicitantes,
    });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
