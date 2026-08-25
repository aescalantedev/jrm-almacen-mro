import { NextResponse } from 'next/server';
import { syncStock, getSyncLog, getLastSync } from '@/lib/sync';

export async function POST() {
  try {
    const result = await syncStock();
    return NextResponse.json(result);
  } catch (error: unknown) {
    return NextResponse.json({ success: false, error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function GET() {
  try {
    const log = getSyncLog(10);
    const lastSync = getLastSync();
    return NextResponse.json({ log, lastSync });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
