const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/api/inventario/export/route.ts');
let content = fs.readFileSync(filePath, 'utf-8');

const sIdx = content.indexOf('    // Consultas de movimientos');
const eIdx = content.indexOf('wsResumen.mergeCells(`B${rowM}:G${rowM}`);', sIdx);

if (sIdx !== -1 && eIdx !== -1) {
  const newJSBlock = `    // Consultas de movimientos (Supabase JS Aggregation)
    const { data: allMovs } = await supabase
      .from('movimientos')
      .select('*, productos!inner(glosa, unidad_codigo), usuarios!left(nombre)')
      .order('created_at', { ascending: false });
      
    const movs = allMovs || [];

    const movStats = {
      ingresos_count: 0,
      salidas_count: 0,
      total_unidades_ingresadas: 0,
      total_unidades_salidas: 0,
      total_movimientos: movs.length
    };

    const motivosMap = new Map();
    const rotacionMap = new Map();
    const solicitantesMap = new Map();

    const kardexRows = [];

    for (const m of movs) {
      // 1. Stats
      if (m.tipo === 'INGRESO') {
        movStats.ingresos_count++;
        movStats.total_unidades_ingresadas += Number(m.cantidad) || 0;
      } else if (m.tipo === 'SALIDA') {
        movStats.salidas_count++;
        movStats.total_unidades_salidas += Number(m.cantidad) || 0;

        // Motivos (solo salidas)
        const mot = m.motivo || 'OTROS';
        const currentMot = motivosMap.get(mot) || { motivo: mot, count: 0, total_unidades: 0 };
        currentMot.count++;
        currentMot.total_unidades += Number(m.cantidad) || 0;
        motivosMap.set(mot, currentMot);

        // Top Rotacion (solo salidas)
        const prod = m.producto;
        const currentRot = rotacionMap.get(prod) || { 
          producto: prod, 
          descripcion: m.productos?.glosa || '', 
          unidad: m.productos?.unidad_codigo || '', 
          total_despachado: 0, 
          despachos: 0 
        };
        currentRot.total_despachado += Number(m.cantidad) || 0;
        currentRot.despachos++;
        rotacionMap.set(prod, currentRot);

        // Solicitantes (solo salidas)
        const sol = m.solicitante ? m.solicitante.trim() : 'Sin especificar';
        const finalSol = sol === '' ? 'Sin especificar' : sol;
        const currentSol = solicitantesMap.get(finalSol) || { solicitante: finalSol, despachos: 0, total_unidades: 0 };
        currentSol.despachos++;
        currentSol.total_unidades += Number(m.cantidad) || 0;
        solicitantesMap.set(finalSol, currentSol);
      }

      // Kardex Rows
      kardexRows.push({
        id: m.id,
        created_at: m.created_at,
        tipo: m.tipo,
        producto: m.producto,
        descripcion: m.productos?.glosa || '',
        unidad: m.productos?.unidad_codigo || '',
        lote: m.lote,
        cantidad: m.cantidad,
        stock_anterior: m.stock_anterior,
        stock_resultante: m.stock_resultante,
        motivo: m.motivo,
        documento_referencia: m.documento_referencia,
        solicitante: m.solicitante,
        rack: m.rack,
        usuario_nombre: m.usuarios?.nombre || 'Desconocido'
      });
    }

    const motivosData = Array.from(motivosMap.values()).sort((a, b) => b.total_unidades - a.total_unidades);
    const topRotacion = Array.from(rotacionMap.values()).sort((a, b) => b.total_despachado - a.total_despachado).slice(0, 15);
    const topSolicitantes = Array.from(solicitantesMap.values()).sort((a, b) => b.total_unidades - a.total_unidades).slice(0, 10);

    // Ensure we keep the original comment or merge cell
    // The eIdx points to the 'wsResumen.mergeCells...' so we don't need to add it, just concatenate
`;

  // Wait, `wsResumen.mergeCells` has a comment right above it.
  // Actually, I should just find the line with `wsResumen.mergeCells` and include it.
  // Actually, I can search for `const kardexRows = db.prepare(` and remove that too.
  
  let firstPart = content.substring(0, sIdx);
  // Find where the block of db queries ends by searching BACKWARDS from eIdx to the comment SECCIÓN 1
  let commentSec = content.lastIndexOf('SECCI', eIdx);
  if (commentSec === -1) commentSec = content.lastIndexOf('//', eIdx); // fallback
  
  let secondPart = content.substring(commentSec);

  let newContent = firstPart + newJSBlock + "    " + secondPart;

  const kStartMarker = `const kardexRows = db.prepare(`;
  const kEndMarker = `const wsKardex = workbook.addWorksheet`;
  const kStartIndex = newContent.indexOf(kStartMarker);
  const kEndIndex = newContent.indexOf(kEndMarker);
  if (kStartIndex !== -1 && kEndIndex !== -1) {
    // Find the end of the db.prepare block which is `)[];`
    const blockEnd = newContent.indexOf(')[];', kStartIndex);
    if (blockEnd !== -1) {
        newContent = newContent.substring(0, kStartIndex) + newContent.substring(blockEnd + 4);
    }
  }

  newContent = newContent.replace(/import \{ getDB \} from '@\/lib\/db';\r?\n/, '');

  fs.writeFileSync(filePath, newContent);
  console.log("Successfully replaced db.prepare with JS aggregation");
} else {
  console.log("Not found.");
}
