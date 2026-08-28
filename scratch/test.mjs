import { createClient } from '@supabase/supabase-js';

const url = 'https://eufifnxpovstaguhrgmb.supabase.co';
const key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1Zmlmbnhwb3ZzdGFndWhyZ21iIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODc5MTkyODgsImV4cCI6MjEwMzQ5NTI4OH0.j_Gja1_d_X0M83LEeE4mmaJuV3xrCcGGJ__zVaQOh4M';

const supabase = createClient(url, key);

async function test() {
  const { data, error } = await supabase.from('unidades_medida').select('*');
  console.log('unidades_medida:', { data, error });
  
  const { data: b, error: be } = await supabase.from('bodegas').select('*');
  console.log('bodegas:', { data: b?.length, error: be });
}
test();
