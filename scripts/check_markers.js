const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/api/inventario/export/route.ts');
let content = fs.readFileSync(filePath, 'utf-8');

const sIdx = content.indexOf('    // Consultas de movimientos');
const eIdx = content.indexOf('    // --- DIBUJAR RESUMEN EJECUTIVO ---');

if (sIdx !== -1 && eIdx !== -1) {
  console.log("Found both markers!");
} else {
  console.log("Not found. sIdx:", sIdx, "eIdx:", eIdx);
}
