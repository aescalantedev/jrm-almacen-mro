import { NextResponse } from 'next/server';
import { createClient } from '@/lib/supabase/server';

export async function GET() {
  try {
    const supabase = await createClient();
    
    // Auth Check
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });

    // 1. Obtener todos los datos estadísticos desde la base de datos usando el nuevo RPC
    const { data: result, error } = await supabase.rpc('get_dashboard_ira_stats');
    if (error) throw error;
    
    return NextResponse.json(result || {});
  } catch (error: any) {
    console.error('[API /api/dashboard/ira FATAL ERROR]:', error);
    return NextResponse.json({ error: error.message }, { status: 500 });
  }
}
