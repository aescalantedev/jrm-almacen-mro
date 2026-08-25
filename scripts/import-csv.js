const fs = require('fs');
const path = require('path');
const Database = require('better-sqlite3');

const DB_PATH = path.join(process.cwd(), 'data', 'app.db');
const CSV_PATH = path.join(process.cwd(), 'public', 'tets.csv');

const db = new Database(DB_PATH);
db.pragma('journal_mode = WAL');
db.pragma('foreign_keys = OFF');

// Create schema if not exists
db.exec(`
  CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL, usuario TEXT UNIQUE NOT NULL, password_hash TEXT NOT NULL,
    rol TEXT NOT NULL CHECK(rol IN ('contador', 'admin')), activo INTEGER DEFAULT 1,
    created_at TEXT DEFAULT (datetime('now', '-5 hours'))
  );
  CREATE TABLE IF NOT EXISTS productos_master (
    producto TEXT PRIMARY KEY, glosa TEXT DEFAULT '', unidad TEXT DEFAULT '',
    familia TEXT DEFAULT '', subfamilia TEXT DEFAULT '', tipo TEXT DEFAULT '',
    peso REAL DEFAULT 0, costo_unitario REAL DEFAULT 0,
    tipo_acero TEXT DEFAULT '', grado_acero TEXT DEFAULT '', espesor_acero TEXT DEFAULT '',
    peso_producto REAL DEFAULT 0,
    created_at TEXT DEFAULT (datetime('now', '-5 hours')),
    updated_at TEXT DEFAULT (datetime('now', '-5 hours'))
  );
  CREATE TABLE IF NOT EXISTS stock_cache (
    id INTEGER PRIMARY KEY AUTOINCREMENT, empresa TEXT DEFAULT '', bodega TEXT DEFAULT '',
    ubicacion TEXT DEFAULT '', lote TEXT DEFAULT '', producto TEXT NOT NULL,
    stock REAL DEFAULT 0, ultimo_ingreso TEXT,
    fecha_sync TEXT DEFAULT (datetime('now', '-5 hours')),
    UNIQUE(lote, producto)
  );
  CREATE TABLE IF NOT EXISTS inventario (
    id INTEGER PRIMARY KEY AUTOINCREMENT, producto TEXT NOT NULL, lote TEXT DEFAULT '',
    familia2 TEXT DEFAULT '', cantidad_fisica REAL DEFAULT 0, dif REAL DEFAULT 0,
    um TEXT DEFAULT '', presentacion TEXT DEFAULT '', n_cajas_bultos TEXT DEFAULT '',
    largo REAL DEFAULT 0, ancho REAL DEFAULT 0, alto REAL DEFAULT 0,
    peso_total_cant_fisica REAL DEFAULT 0, observacion TEXT DEFAULT 'PENDIENTE',
    comentario TEXT DEFAULT '', rack TEXT DEFAULT '', ubicacion_actual TEXT DEFAULT '',
    almacenamiento TEXT DEFAULT '', contenedor TEXT DEFAULT '', responsable TEXT DEFAULT '',
    fecha_conteo TEXT DEFAULT '', total_costo REAL DEFAULT 0, s_dif REAL DEFAULT 0,
    rotacion TEXT DEFAULT '', linea TEXT DEFAULT '', prioridad TEXT DEFAULT '',
    vida_util_ssoma TEXT DEFAULT '', compatibilidad_segregacion TEXT DEFAULT '',
    condiciones_almacenamiento TEXT DEFAULT '', foto_path TEXT,
    usuario_id INTEGER, synced INTEGER DEFAULT 0,
    created_at TEXT DEFAULT (datetime('now', '-5 hours')),
    updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
    UNIQUE(producto, lote)
  );
  CREATE TABLE IF NOT EXISTS sync_log (
    id INTEGER PRIMARY KEY AUTOINCREMENT, tipo TEXT, registros_sync INTEGER DEFAULT 0,
    fecha TEXT DEFAULT (datetime('now', '-5 hours')), estado TEXT DEFAULT 'ok', detalle TEXT
  );
  CREATE INDEX IF NOT EXISTS idx_stock_producto ON stock_cache(producto);
  CREATE INDEX IF NOT EXISTS idx_inventario_producto ON inventario(producto);
  CREATE INDEX IF NOT EXISTS idx_inventario_usuario ON inventario(usuario_id);
`);

const csv = fs.readFileSync(CSV_PATH, 'utf-8');
const lines = csv.split('\n').filter((l) => l.trim());

function parseMoney(val) {
  if (!val) return 0;
  const cleaned = val.replace(/[^\d.,\-]/g, '').replace(/,/g, '');
  const num = parseFloat(cleaned);
  return isNaN(num) ? 0 : num;
}

function parseNum(val) {
  if (!val || val.trim() === '') return 0;
  const cleaned = val.replace(/[^\d.\-]/g, '');
  const num = parseFloat(cleaned);
  return isNaN(num) ? 0 : num;
}

function cleanStr(val) {
  if (!val) return '';
  return val.replace(/^"|"$/g, '').trim();
}

    const upsertMaster = db.prepare(`
  INSERT INTO productos_master (producto, glosa, unidad, familia, peso, costo_unitario, updated_at)
  VALUES (?, ?, ?, ?, ?, ?, datetime('now', '-5 hours'))
  ON CONFLICT(producto) DO UPDATE SET
    glosa = COALESCE(NULLIF(excluded.glosa, ''), productos_master.glosa),
    unidad = COALESCE(NULLIF(excluded.unidad, ''), productos_master.unidad),
    familia = COALESCE(NULLIF(excluded.familia, ''), productos_master.familia),
    peso = CASE WHEN excluded.peso > 0 THEN excluded.peso ELSE productos_master.peso END,
    costo_unitario = CASE WHEN excluded.costo_unitario > 0 THEN excluded.costo_unitario ELSE productos_master.costo_unitario END,
    updated_at = datetime('now', '-5 hours')
`);

const upsertStock = db.prepare(`
  INSERT INTO stock_cache (empresa, bodega, ubicacion, lote, producto, stock, ultimo_ingreso, fecha_sync)
  VALUES ('', '', '', '', ?, ?, NULL, datetime('now', '-5 hours'))
  ON CONFLICT(lote, producto) DO UPDATE SET
    stock = excluded.stock,
    fecha_sync = datetime('now', '-5 hours')
`);

const insertInventario = db.prepare(`
  INSERT OR IGNORE INTO inventario (
    producto, lote, familia2, cantidad_fisica, dif, um, presentacion,
    n_cajas_bultos, largo, ancho, alto, peso_total_cant_fisica,
    observacion, comentario, rack, ubicacion_actual, almacenamiento, contenedor,
    responsable, fecha_conteo, total_costo, s_dif, rotacion, linea, prioridad,
    vida_util_ssoma, compatibilidad_segregacion, condiciones_almacenamiento,
    usuario_id
  ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL)
`);

const migrate = db.transaction(() => {
  let masterCount = 0;
  let stockCount = 0;
  let invCount = 0;
  const seenProducts = new Set();
  const seenStock = new Set();

  for (let i = 1; i < lines.length; i++) {
    const line = lines[i].trim();
    if (!line) continue;

    // Simple CSV parse (handles quoted fields with semicolons inside)
    const fields = [];
    let current = '';
    let inQuotes = false;
    for (let j = 0; j < line.length; j++) {
      const ch = line[j];
      if (ch === '"') {
        inQuotes = !inQuotes;
      } else if (ch === ';' && !inQuotes) {
        fields.push(current);
        current = '';
      } else {
        current += ch;
      }
    }
    fields.push(current);

    if (fields.length < 20) continue;

    const producto = cleanStr(fields[1]);
    if (!producto) continue;

    const glosa = cleanStr(fields[2]);
    const unidad = cleanStr(fields[3]);
    const stockBodega = parseNum(fields[4]);
    const familia = cleanStr(fields[5]);
    const familia2 = cleanStr(fields[6]);
    const cantidadFisica = parseNum(fields[7]);
    const dif = parseNum(fields[8]);
    const um = cleanStr(fields[9]);
    const presentacion = cleanStr(fields[10]);
    const nCajasBultos = cleanStr(fields[11]);
    const largo = parseNum(fields[12]);
    const ancho = parseNum(fields[13]);
    const alto = parseNum(fields[14]);
    const pesoUnit = parseNum(fields[15]);
    const pesoTotal = parseNum(fields[16]);
    const observacion = cleanStr(fields[21]);
    const comentario = cleanStr(fields[22]);
    const rack = cleanStr(fields[23]);
    const ubicacionActual = cleanStr(fields[24]);
    const almacenamiento = cleanStr(fields[25]);
    const contenedor = cleanStr(fields[26]);
    const responsable = cleanStr(fields[27]);
    const fechaConteo = cleanStr(fields[28]);
    const costoUnitario = parseMoney(fields[29]);
    const totalCosto = parseMoney(fields[30]);
    const sDif = parseMoney(fields[31]);
    const rotacion = cleanStr(fields[32]);
    const linea = cleanStr(fields[33]);
    const prioridad = cleanStr(fields[34]);
    const vidaUtil = cleanStr(fields[35]);
    const compatSegreg = cleanStr(fields[36]);
    const condAlmacen = cleanStr(fields[37]);

    // 1. productos_master (deduplicated)
    if (!seenProducts.has(producto)) {
      seenProducts.add(producto);
      upsertMaster.run(producto, glosa, unidad, familia, pesoUnit, costoUnitario);
      masterCount++;
    }

    // 2. stock_cache (per product, lote empty)
    const stockKey = producto;
    if (!seenStock.has(stockKey)) {
      seenStock.add(stockKey);
      upsertStock.run(producto, stockBodega);
      stockCount++;
    }

    // 3. inventario (every row)
    insertInventario.run(
      producto,
      '', // lote
      familia2,
      cantidadFisica,
      dif,
      um,
      presentacion,
      nCajasBultos,
      largo,
      ancho,
      alto,
      pesoTotal,
      observacion,
      comentario,
      rack,
      ubicacionActual,
      almacenamiento,
      contenedor,
      responsable,
      fechaConteo,
      totalCosto,
      sDif,
      rotacion,
      linea,
      prioridad,
      vidaUtil,
      compatSegreg,
      condAlmacen
    );
    invCount++;
  }

  return { masterCount, stockCount, invCount };
});

try {
  const result = migrate();
  console.log(`Migration complete:`);
  console.log(`  productos_master: ${result.masterCount} products`);
  console.log(`  stock_cache: ${result.stockCount} stock entries`);
  console.log(`  inventario: ${result.invCount} inventory records`);

  // Recalculate total_costo and s_dif based on current costo_unitario
  db.exec(`
    UPDATE inventario SET
      total_costo = (
        SELECT COALESCE(s.stock, 0) * p.costo_unitario
        FROM stock_cache s
        JOIN productos_master p ON s.producto = p.producto
        WHERE s.producto = inventario.producto AND s.lote = inventario.lote
      ),
      s_dif = dif * (
        SELECT COALESCE(p.costo_unitario, 0)
        FROM productos_master p WHERE p.producto = inventario.producto
      )
    WHERE EXISTS (
      SELECT 1 FROM productos_master p WHERE p.producto = inventario.producto
    )
  `);
  console.log(`  Recalculated total_costo and s_dif`);
} catch (err) {
  console.error('Migration failed:', err.message);
  process.exit(1);
} finally {
  db.close();
}
