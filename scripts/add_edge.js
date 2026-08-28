const fs = require('fs');
const path = require('path');

function processDir(dir) {
  const files = fs.readdirSync(dir);
  for (const file of files) {
    const fullPath = path.join(dir, file);
    const stat = fs.statSync(fullPath);
    if (stat.isDirectory()) {
      processDir(fullPath);
    } else if (file === 'page.tsx' || file === 'route.ts') {
      let content = fs.readFileSync(fullPath, 'utf-8');
      if (!content.includes('export const runtime')) {
        content += '\n\nexport const runtime = "edge";\n';
        fs.writeFileSync(fullPath, content);
      }
    }
  }
}

processDir(path.join(__dirname, '../app'));
console.log("Added edge runtime to all routes");
