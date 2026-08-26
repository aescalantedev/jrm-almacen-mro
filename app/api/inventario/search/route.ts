import { NextRequest, NextResponse } from 'next/server';
import { GET as stockGET } from '@/app/api/stock/route';

export async function GET(req: NextRequest) {
  try {
    const res = await stockGET(req);
    const data = await res.json();
    return NextResponse.json({
      items: data.stock || [],
      total: data.total || 0,
    });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
