import { NextResponse } from 'next/server';
import fs from 'fs';
import path from 'path';

export const dynamic = 'force-dynamic';

export async function GET() {
  try {
    const flagPath = path.join(process.cwd(), 'data', 'maintenance.flag');
    
    if (fs.existsSync(flagPath)) {
      try {
        const raw = fs.readFileSync(flagPath, 'utf-8');
        const data = JSON.parse(raw);
        return NextResponse.json({
          inMaintenance: true,
          message: data.message || 'Sistema en mantenimiento por actualización.',
          startedAt: data.startedAt,
        });
      } catch {
        return NextResponse.json({
          inMaintenance: true,
          message: 'Sistema en mantenimiento por actualización.',
        });
      }
    }

    return NextResponse.json({ inMaintenance: false });
  } catch (error: unknown) {
    return NextResponse.json({ inMaintenance: false });
  }
}
