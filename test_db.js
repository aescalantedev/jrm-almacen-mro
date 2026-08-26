const db = require('better-sqlite3')('data/app.db');

const stockCount = db.prepare('SELECT COUNT(*) as c FROM stock_cache').get().c;
console.log('Total stock:', stockCount);

const invCount = db.prepare('SELECT COUNT(*) as c FROM inventario').get().c;
console.log('Total inventario:', invCount);

const invDistinct = db.prepare('SELECT COUNT(DISTINCT producto) as c FROM inventario').get().c;
console.log('Distinct inventario:', invDistinct);

const noMatch = db.prepare(`
  SELECT COUNT(*) as c 
  FROM stock_cache s 
  LEFT JOIN inventario i ON s.producto = i.producto 
  WHERE i.id IS NULL
`).get().c;
console.log('No match simple join:', noMatch);

const noMatchWithLote = db.prepare(`
  SELECT COUNT(*) as c 
  FROM stock_cache s 
  LEFT JOIN inventario i ON s.producto = i.producto AND IFNULL(s.lote, '') = IFNULL(i.lote, '') 
  WHERE i.id IS NULL
`).get().c;
console.log('No match with lote:', noMatchWithLote);
