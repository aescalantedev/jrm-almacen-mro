const Database = require('better-sqlite3');
const path = require('path');

const dbPath = path.join(__dirname, '..', 'data', 'app.db');
const db = new Database(dbPath);

console.log('Starting migration for usuarios table...');

db.pragma('foreign_keys = OFF');
db.transaction(() => {
  const tableInfo = db.prepare("SELECT sql FROM sqlite_master WHERE name = 'usuarios'").get();
  console.log('Current SQL:', tableInfo ? tableInfo.sql : 'None');

  if (tableInfo && (!tableInfo.sql.includes('almacenero') || !tableInfo.sql.includes('auditor'))) {
    db.exec(`
      CREATE TABLE usuarios_new (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        usuario TEXT UNIQUE NOT NULL,
        password_hash TEXT NOT NULL,
        rol TEXT NOT NULL CHECK(rol IN ('contador', 'admin', 'almacenero', 'auditor')),
        activo INTEGER DEFAULT 1,
        created_at TEXT DEFAULT (datetime('now', '-5 hours'))
      );
      INSERT INTO usuarios_new (id, nombre, usuario, password_hash, rol, activo, created_at)
      SELECT id, nombre, usuario, password_hash, rol, activo, created_at FROM usuarios;
      DROP TABLE usuarios;
      ALTER TABLE usuarios_new RENAME TO usuarios;
    `);
    console.log('Migration completed successfully!');
  } else {
    console.log('Table already up to date or does not exist.');
  }
})();
db.pragma('foreign_keys = ON');

const updated = db.prepare("SELECT sql FROM sqlite_master WHERE name = 'usuarios'").get();
console.log('Updated SQL:', updated.sql);
const users = db.prepare("SELECT id, nombre, usuario, rol, activo FROM usuarios").all();
console.log('Current users:', users);
