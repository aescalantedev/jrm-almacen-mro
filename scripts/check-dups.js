const Database = require('better-sqlite3');
const db = new Database('C:\\Users\\ncorahua\\Projects\\strixui_base\\data\\app.db');

console.log('=== STOCK_CACHE DUPLICATES ===');
const stockDups = db.prepare(`
  SELECT producto, lote, COUNT(*) as c FROM stock_cache 
  GROUP BY producto, lote HAVING c > 1 ORDER BY c DESC LIMIT 10
`).all();
console.log(JSON.stringify(stockDups, null, 2));

console.log('\n=== empty lote count:', db.prepare("SELECT COUNT(*) as c FROM stock_cache WHERE lote = ''").get().c);
console.log('=== non-empty lote count:', db.prepare("SELECT COUNT(*) as c FROM stock_cache WHERE lote != ''").get().c);

console.log('\n=== INVENTARIO DUPLICATES (by producto+lote) ===');
const invDups = db.prepare(`
  SELECT producto, lote, COUNT(*) as c FROM inventario 
  GROUP BY producto, lote HAVING c > 1 ORDER BY c DESC LIMIT 10
`).all();
console.log(JSON.stringify(invDups, null, 2));

console.log('\n=== DUPLICATE DETAIL for most duplicated product ===');
if (invDups.length > 0) {
  const worst = invDups[0];
  const rows = db.prepare('SELECT * FROM inventario WHERE producto = ? AND lote = ?').all(worst.producto, worst.lote);
  rows.forEach((r, i) => {
    console.log(`  #${i+1} id=${r.id} obs=${r.observacion} fam2=${r.familia2} rack=${r.rack} cant=${r.cantidad_fisica} dif=${r.dif}`);
  });
}

db.close();
