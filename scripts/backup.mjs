import Database from 'better-sqlite3';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const dbPath = path.join(__dirname, '..', 'data', 'app.db');
const backupsDir = path.join(__dirname, '..', 'data', 'backups');

if (!fs.existsSync(backupsDir)) {
  fs.mkdirSync(backupsDir, { recursive: true });
}

const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
const backupFileName = `app_backup_${timestamp}_pre_migration.db`;
const backupFilePath = path.join(backupsDir, backupFileName);

console.log('🔄 Iniciando respaldo completo de seguridad de la base de datos...');

const db = new Database(dbPath);

// Checkpoint WAL data to guarantee all uncommitted/in-memory WAL transactions are merged
db.pragma('wal_checkpoint(TRUNCATE)');

// Perform atomic safe backup
db.backup(backupFilePath)
  .then(() => {
    db.close();
    const stats = fs.statSync(backupFilePath);
    console.log('\x1b[32m%s\x1b[0m', `✅ Respaldo completado con éxito:`);
    console.log(`📁 Ubicación: ${backupFilePath}`);
    console.log(`📊 Tamaño: ${(stats.size / 1024).toFixed(2)} KB`);
  })
  .catch((err) => {
    db.close();
    console.error('❌ Error al realizar el respaldo:', err);
    process.exit(1);
  });
