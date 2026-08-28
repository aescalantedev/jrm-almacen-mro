import { NextRequest, NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET(req: NextRequest) {
  try {
    const supabase = await createClient();
    const { data, error } = await supabase.from('unidades_medida').select('*');
    return NextResponse.json({ data, error });
  } catch (error: any) {
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
