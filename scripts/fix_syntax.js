const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, '../app/api/inventario/export/route.ts');
let lines = fs.readFileSync(filePath, 'utf-8').split('\n');

for (let i = 0; i < lines.length; i++) {
  if (lines[i].includes('SECCI') && !lines[i].includes('//')) {
    lines[i] = '    // ' + lines[i].trim();
  }
}

fs.writeFileSync(filePath, lines.join('\n'));
