import { createBrowserClient } from '@supabase/ssr'

export function createClient() {
  return createBrowserClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL || 'https://eufifnxpovstaguhrgmb.supabase.co',
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV1Zmlmbnhwb3ZzdGFndWhyZ21iIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODc5MTkyODgsImV4cCI6MjEwMzQ5NTI4OH0.j_Gja1_d_X0M83LEeE4mmaJuV3xrCcGGJ__zVaQOh4M'
  )
}
