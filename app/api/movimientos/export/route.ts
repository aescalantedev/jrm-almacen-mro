import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { generateKardexExcel, KardexExcelRow } from '@/lib/reports/kardex-excel';

export async function GET(req: NextRequest) {
  try {
    const db = getDB();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const tipo = searchParams.get('tipo') || '';
    const desde = searchParams.get('desde') || '';
    const hasta = searchParams.get('hasta') || '';

    const conditions: string[] = [];
    const params: unknown[] = [];

    if (query) {
      conditions.push(`(
        UPPER(m.producto) LIKE UPPER(?) OR
        UPPER(p.glosa) LIKE UPPER(?) OR
        UPPER(m.documento_referencia) LIKE UPPER(?) OR
        UPPER(m.solicitante) LIKE UPPER(?)
      )`);
      const p = `%${query.trim()}%`;
      params.push(p, p, p, p);
    }

    if (tipo) {
      conditions.push('m.tipo = ?');
      params.push(tipo);
    }

    if (desde) {
      conditions.push('date(m.created_at) >= date(?)');
      params.push(desde);
    }

    if (hasta) {
      conditions.push('date(m.created_at) <= date(?)');
      params.push(hasta);
    }

    const whereClause = conditions.length > 0 ? `WHERE ${conditions.join(' AND ')}` : '';

    const rows = db.prepare(`
      SELECT 
        m.id,
        m.created_at,
        m.tipo,
        m.producto,
        p.glosa as descripcion,
        p.unidad_codigo as unidad,
        m.lote,
        m.cantidad,
        m.stock_anterior,
        m.stock_resultante,
        m.motivo,
        m.documento_referencia,
        m.solicitante,
        m.rack,
        u.nombre as usuario_nombre,
        m.comentario
      FROM movimientos m
      JOIN productos p ON m.producto = p.sku
      LEFT JOIN usuarios u ON m.usuario_id = u.id
      ${whereClause}
      ORDER BY m.created_at DESC, m.id DESC
    `).all(...params) as KardexExcelRow[];

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
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
