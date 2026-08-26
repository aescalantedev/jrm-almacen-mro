const Database = require('better-sqlite3');
const bcrypt = require('bcryptjs');

const db = new Database('data/app.db');
const hash = bcrypt.hashSync('admin123', 10);

db.exec(`
  INSERT INTO usuarios (nombre, usuario, password_hash, rol, activo) 
  VALUES ('Administrador MRO', 'admin1', '${hash}', 'admin', 1)
  ON CONFLICT(usuario) DO UPDATE SET password_hash = '${hash}', rol = 'admin', activo = 1;
`);

console.log("Admin user reset successfully!");
