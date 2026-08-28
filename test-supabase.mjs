import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config({ path: '.env.local' });

const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
const key = process.env.SUPABASE_SERVICE_ROLE_KEY || process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;
const supabase = createClient(url, key);

async function test() {
  const { data, error } = await supabase
    .from('producto_costos_historial')
    .select('*, usuarios!producto_costos_historial_created_by_fkey(nombre)')
    .limit(1);
  console.log("With FKEY:", { data, error });

  const { data: data2, error: err2 } = await supabase
    .from('producto_costos_historial')
    .select('*, usuarios(nombre)')
    .limit(1);
  console.log("Without FKEY:", { data: data2, error: err2 });
}
test();
