const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/api/inventario/export/route.ts');
let content = fs.readFileSync(filePath, 'utf-8');

const sIdx = content.indexOf('    const kardexRows = db.prepare(`');
const eIdx = content.indexOf(')[];', sIdx);

if (sIdx !== -1 && eIdx !== -1) {
  content = content.substring(0, sIdx) + content.substring(eIdx + 4);
  fs.writeFileSync(filePath, content);
  console.log("Removed kardexRows db.prepare");
} else {
  console.log("Not found");
}
