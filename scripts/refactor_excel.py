import re

with open('app/api/inventario/export/route.ts', 'r', encoding='utf-8') as f:
    code = f.read()

# 1. Imports
code = code.replace("import { getDB } from '@/lib/db';", "import { createClient } from '@/lib/supabase/server';")

# 2. Main Fetch
db_fetch_pattern = re.compile(r'const db = getDB\(\);.*?const rows = db\.prepare\(.*?`.*?`\)\.all\(\) as Record<string, unknown>\[\];', re.DOTALL)
supabase_fetch = '''const supabase = createClient();
    const { data: rowsData, error } = await supabase.from('v_inventario_export').select('*').order('id', { ascending: true });
    if (error) throw error;
    const rows = rowsData || [];'''
code = re.sub(db_fetch_pattern, supabase_fetch, code)

# 3. IRA Fetch queries removal (from line 167 to 232)
# Replace all the individual queries with in-memory array operations
ira_queries_pattern = re.compile(r'// Queries para IRA.*?const inventarioRows = db\.prepare\(.*?`.*?`\)\.all\(\) as Record<string, unknown>\[\];', re.DOTALL)

ira_logic = '''// Queries para IRA
    const auditados = rows.filter(r => r.cantidad_fisica !== null && Number(r.cantidad_fisica) !== 0).length;
    const conformes = rows.filter(r => r.observacion === 'OK' && Number(r.dif) === 0 && r.cantidad_fisica !== null && Number(r.cantidad_fisica) !== 0).length;
    const totalSKU = rows.length;

    const iraSKU = auditados > 0 ? (conformes / auditados) * 100 : 0;

    const valorFisico = rows.reduce((acc, r) => acc + (Number(r.cantidad_fisica || 0) * Number(r.costo_unitario || 0)), 0);
    const valorSistema = valorFisico; // Preserving original logic
    const iraFinanciera = valorSistema > 0 ? (1 - Math.abs(valorFisico - valorSistema) / valorSistema) * 100 : 100;

    const descalceNeto = valorFisico - valorSistema;
    const descalceBruto = rows.reduce((acc, r) => acc + Math.abs(Number(r.dif || 0)), 0);

    const totalFaltantesRow = { c: rows.filter(r => r.observacion === 'FALTANTE' && r.cantidad_fisica !== null && Number(r.cantidad_fisica) !== 0).length };
    const totalSobrantesRow = { c: rows.filter(r => r.observacion === 'SOBRANTE' && r.cantidad_fisica !== null && Number(r.cantidad_fisica) !== 0).length };

    const inventarioRows = rows.map(r => ({ ...r, valor_sistema: Number(r.cantidad_fisica || 0) * Number(r.costo_unitario || 0) }));'''
code = re.sub(ira_queries_pattern, ira_logic, code)

# 4. Top Impacto
top_impacto_pattern = re.compile(r'// Top impacto monetario.*?const topImpacto = db\.prepare\(.*?`.*?`\)\.all\(\) as Record<string, unknown>\[\];', re.DOTALL)
top_impacto_logic = '''// Top impacto monetario
    const topImpacto = [...rows]
      .filter(r => Number(r.dif) !== 0 && r.cantidad_fisica !== null && Number(r.cantidad_fisica) !== 0)
      .map(r => ({
        producto: r.producto,
        descripcion: r.descripcion,
        familia: r.familia,
        stock_sistema: r.cantidad_fisica,
        cantidad_fisica: r.cantidad_fisica,
        dif: r.dif,
        costo_unitario: r.costo_unitario,
        impacto_monetario: Number(r.dif) * Number(r.costo_unitario || 0)
      }))
      .sort((a, b) => Math.abs(b.impacto_monetario) - Math.abs(a.impacto_monetario))
      .slice(0, 10);'''
code = re.sub(top_impacto_pattern, top_impacto_logic, code)

# 5. Causa raiz
causa_raiz_pattern = re.compile(r'// Causa raíz.*?const causaRaiz = db\.prepare\(.*?`.*?`\)\.all\(\) as Record<string, unknown>\[\];', re.DOTALL)
causa_raiz_logic = '''// Causa raíz
    const causaMap = new Map<string, number>();
    rows.filter(r => r.cantidad_fisica !== null && Number(r.cantidad_fisica) !== 0).forEach(r => {
      const obs = String(r.observacion || '');
      causaMap.set(obs, (causaMap.get(obs) || 0) + 1);
    });
    const causaRaiz = Array.from(causaMap.entries()).map(([obs, count]) => ({
      observacion: obs,
      cantidad: count,
      porcentaje: auditados > 0 ? (count * 100.0 / auditados) : 0
    })).sort((a, b) => b.cantidad - a.cantidad);'''
code = re.sub(causa_raiz_pattern, causa_raiz_logic, code)

# 6. Resumen Movimientos Queries
mov_pattern = re.compile(r'const movStats = db\.prepare\(.*?`.*?`\)\.get\(\) as \{.*?total_movimientos: number;\s*\};'
                         r'.*?const motivosData = db\.prepare\(.*?`.*?`\)\.all\(\) as \{.*?total_unidades: number \}\[\];'
                         r'.*?const topRotacion = db\.prepare\(.*?`.*?`\)\.all\(\) as \{.*?despachos: number \}\[\];'
                         r'.*?const topSolicitantes = db\.prepare\(.*?`.*?`\)\.all\(\) as \{.*?total_unidades: number \}\]\];', re.DOTALL)

mov_logic = '''const { data: mData } = await supabase.from('movimientos').select('*');
    const movimientos = mData || [];
    
    let ingresos_count = 0, salidas_count = 0, total_unidades_ingresadas = 0, total_unidades_salidas = 0;
    const movMotivos = new Map<string, { count: number, total_unidades: number }>();
    const movRotacion = new Map<string, { producto: string, despachos: number, total_despachado: number }>();
    const movSolic = new Map<string, { solicitante: string, despachos: number, total_unidades: number }>();

    movimientos.forEach((m: any) => {
      const qty = Number(m.cantidad) || 0;
      if (m.tipo === 'INGRESO') {
        ingresos_count++;
        total_unidades_ingresadas += qty;
      } else if (m.tipo === 'SALIDA') {
        salidas_count++;
        total_unidades_salidas += qty;
        
        const mot = m.motivo || '';
        if (!movMotivos.has(mot)) movMotivos.set(mot, { count: 0, total_unidades: 0 });
        movMotivos.get(mot)!.count++;
        movMotivos.get(mot)!.total_unidades += qty;
        
        const pr = m.producto || '';
        if (!movRotacion.has(pr)) movRotacion.set(pr, { producto: pr, despachos: 0, total_despachado: 0 });
        movRotacion.get(pr)!.despachos++;
        movRotacion.get(pr)!.total_despachado += qty;
        
        const sol = m.solicitante || 'Sin especificar';
        if (!movSolic.has(sol)) movSolic.set(sol, { solicitante: sol, despachos: 0, total_unidades: 0 });
        movSolic.get(sol)!.despachos++;
        movSolic.get(sol)!.total_unidades += qty;
      }
    });

    const movStats = { ingresos_count, salidas_count, total_unidades_ingresadas, total_unidades_salidas, total_movimientos: movimientos.length };
    const motivosData = Array.from(movMotivos.entries()).map(([k, v]) => ({ motivo: k, ...v })).sort((a,b) => b.total_unidades - a.total_unidades);
    
    // Attach details from rows map
    const prodMap = new Map(rows.map(r => [r.producto, r]));
    const topRotacion = Array.from(movRotacion.values()).map(v => {
      const pr = prodMap.get(v.producto) as any;
      return { ...v, descripcion: pr?.descripcion || v.producto, unidad: pr?.unidad || '' };
    }).sort((a,b) => b.total_despachado - a.total_despachado).slice(0, 15);
    
    const topSolicitantes = Array.from(movSolic.values()).sort((a,b) => b.despachos - a.despachos).slice(0, 10);'''
    
code = re.sub(mov_pattern, mov_logic, code)


with open('app/api/inventario/export/route.ts', 'w', encoding='utf-8') as f:
    f.write(code)

print("Export route updated")
