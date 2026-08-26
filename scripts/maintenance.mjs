import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const flagPath = path.join(__dirname, '..', 'data', 'maintenance.flag');

const action = process.argv[2]?.toLowerCase();

if (action === 'on') {
  const dataDir = path.dirname(flagPath);
  if (!fs.existsSync(dataDir)) {
    fs.mkdirSync(dataDir, { recursive: true });
  }
  const payload = {
    active: true,
    startedAt: new Date().toISOString(),
    message: 'Estamos aplicando mejoras y actualizando el sistema de inventario MRO — ALM MRO CHILCA.',
  };
  fs.writeFileSync(flagPath, JSON.stringify(payload, null, 2), 'utf-8');
  console.log('\x1b[33m%s\x1b[0m', '🚧 Modo Mantenimiento ACTIVADO. Los usuarios verán la pantalla de actualización.');
} else if (action === 'off') {
  if (fs.existsSync(flagPath)) {
    fs.unlinkSync(flagPath);
  }
  console.log('\x1b[32m%s\x1b[0m', '✅ Modo Mantenimiento DESACTIVADO. El sistema está 100% operativo.');
} else {
  const isActive = fs.existsSync(flagPath);
  console.log(`Estado actual de Mantenimiento: ${isActive ? 'ACTIVO 🚧' : 'INACTIVO ✅'}`);
  console.log('Uso: node scripts/maintenance.mjs [on|off|status]');
}
