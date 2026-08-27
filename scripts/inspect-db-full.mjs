import Database from 'better-sqlite3';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const dbPath = path.join(__dirname, '..', 'data', 'app.db');

const db = new Database(dbPath);

console.log('=== APP.DB FULL AUDIT ===\n');

const tables = db.prepare("SELECT name, sql FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%' ORDER BY name").all();

for (const t of tables) {
  const count = db.prepare(`SELECT count(*) as c FROM "${t.name}"`).get().c;
  console.log(`\n======================================================`);
  console.log(`TABLA: ${t.name} (Registros: ${count})`);
  console.log(`======================================================`);
  
  const cols = db.prepare(`PRAGMA table_info("${t.name}")`).all();
  console.log('Columnas:');
  cols.forEach(c => {
    console.log(`  - ${c.name} (${c.type}) ${c.pk ? 'PK ' : ''}${c.notnull ? 'NOT NULL ' : ''}${c.dflt_value !== null ? 'DEFAULT ' + c.dflt_value : ''}`);
  });

  const fks = db.prepare(`PRAGMA foreign_key_list("${t.name}")`).all();
  if (fks.length > 0) {
    console.log('Foreign Keys:');
    fks.forEach(fk => {
      console.log(`  - [${fk.from}] -> ${fk.table}(${fk.to})`);
    });
  }

  const indexes = db.prepare(`PRAGMA index_list("${t.name}")`).all();
  if (indexes.length > 0) {
    console.log('Índices:');
    indexes.forEach(idx => {
      const idxCols = db.prepare(`PRAGMA index_info("${idx.name}")`).all();
      console.log(`  - ${idx.name} (unique: ${idx.unique}) en (${idxCols.map(ic => ic.name).join(', ')})`);
    });
  }
}
