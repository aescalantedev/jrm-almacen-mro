const Database = require('better-sqlite3');
const db = new Database('C:\\Users\\ncorahua\\Projects\\strixui_base\\data\\app.db');

console.log('unique products in stock_cache:', db.prepare('SELECT COUNT(DISTINCT producto) as c FROM stock_cache').get().c);
console.log('unique products in inventario:', db.prepare('SELECT COUNT(DISTINCT producto) as c FROM inventario').get().c);

console.log('\n---stock by lote:');
const byLote = db.prepare(`
  SELECT CASE WHEN lote = '' THEN 'empty' ELSE 'has_lote' END as tipo,
         COUNT(*) as c, COUNT(DISTINCT producto) as products
  FROM stock_cache GROUP BY tipo
`).all();
console.log(JSON.stringify(byLote, null, 2));

console.log('\n---inventario by lote:');
const invByLote = db.prepare(`
  SELECT CASE WHEN lote = '' THEN 'empty' ELSE 'has_lote' END as tipo,
         COUNT(*) as c, COUNT(DISTINCT producto) as products
  FROM inventario GROUP BY tipo
`).all();
console.log(JSON.stringify(invByLote, null, 2));

console.log('\n---products in stock with non-empty lote:');
const withLote = db.prepare("SELECT DISTINCT lote, producto FROM stock_cache WHERE lote != '' LIMIT 10").all();
console.log(JSON.stringify(withLote, null, 2));

console.log('\n---inventario observacion breakdown:');
const obs = db.prepare('SELECT observacion, COUNT(*) as c FROM inventario GROUP BY observacion ORDER BY c DESC').all();
console.log(JSON.stringify(obs, null, 2));

db.close();
