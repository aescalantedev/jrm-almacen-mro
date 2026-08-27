import Database from 'better-sqlite3';
import path from 'path';
import fs from 'fs';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const dbPath = path.join(__dirname, '..', 'data', 'app.db');
const mroProductosCsvPath = path.join(__dirname, '..', 'public', 'mro_productos.csv');
const costoMroCsvPath = path.join(__dirname, '..', 'public', 'costo_mro.csv');

console.log('🚀 Iniciando proceso de migración y consolidación de datos...');

const db = new Database(dbPath);
db.pragma('journal_mode = WAL');
db.pragma('foreign_keys = ON');

// 1. Crear las tablas si no existen
db.exec(`
  CREATE TABLE IF NOT EXISTS unidades_medida (
    codigo_unidad TEXT PRIMARY KEY,
    codigo_sap TEXT DEFAULT '',
    nombre TEXT NOT NULL,
    simbolo TEXT DEFAULT '',
    permite_decimales INTEGER DEFAULT 0,
    created_at TEXT DEFAULT (datetime('now', '-5 hours')),
    created_by INTEGER,
    updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
    updated_by INTEGER,
    is_deleted INTEGER DEFAULT 0
  );

  CREATE TABLE IF NOT EXISTS grupos_articulos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    descripcion TEXT DEFAULT '',
    created_at TEXT DEFAULT (datetime('now', '-5 hours')),
    created_by INTEGER,
    updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
    updated_by INTEGER,
    is_deleted INTEGER DEFAULT 0
  );

  CREATE TABLE IF NOT EXISTS subfamilias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    grupo_articulo_id INTEGER NOT NULL REFERENCES grupos_articulos(id),
    codigo TEXT NOT NULL,
    nombre TEXT NOT NULL,
    created_at TEXT DEFAULT (datetime('now', '-5 hours')),
    created_by INTEGER,
    updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
    updated_by INTEGER,
    is_deleted INTEGER DEFAULT 0
  );

  CREATE TABLE IF NOT EXISTS contenedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo_contenedor TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    zona TEXT DEFAULT '',
    descripcion TEXT DEFAULT '',
    created_at TEXT DEFAULT (datetime('now', '-5 hours')),
    created_by INTEGER,
    updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
    updated_by INTEGER,
    is_deleted INTEGER DEFAULT 0
  );

  CREATE TABLE IF NOT EXISTS tipos_almacenamiento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo TEXT UNIQUE NOT NULL,
    nombre TEXT NOT NULL,
    descripcion TEXT DEFAULT '',
    created_at TEXT DEFAULT (datetime('now', '-5 hours')),
    created_by INTEGER,
    updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
    updated_by INTEGER,
    is_deleted INTEGER DEFAULT 0
  );

  CREATE TABLE IF NOT EXISTS productos (
    sku TEXT PRIMARY KEY,
    glosa TEXT NOT NULL,
    unidad_codigo TEXT NOT NULL DEFAULT 'UND' REFERENCES unidades_medida(codigo_unidad),
    grupo_articulo_id INTEGER REFERENCES grupos_articulos(id),
    subfamilia_id INTEGER REFERENCES subfamilias(id),
    tipo_almacenamiento_id INTEGER REFERENCES tipos_almacenamiento(id),
    contenedor_id INTEGER REFERENCES contenedores(id),
    rack TEXT DEFAULT '',
    nivel_rack TEXT DEFAULT '',
    posicion_detalle TEXT DEFAULT '',
    almacenamiento_codigo TEXT DEFAULT 'C.C.01',
    costo_unitario_actual REAL DEFAULT 0,
    moneda TEXT NOT NULL DEFAULT 'PEN',
    foto_url TEXT,
    peso_neto REAL DEFAULT 0,
    stock_seguridad_min REAL DEFAULT 0,
    stock_maximo REAL DEFAULT 0,
    tipo_acero TEXT DEFAULT '',
    grado_acero TEXT DEFAULT '',
    espesor_acero TEXT DEFAULT '',
    activo INTEGER NOT NULL DEFAULT 1,
    created_at TEXT NOT NULL DEFAULT (datetime('now', '-5 hours')),
    created_by INTEGER,
    updated_at TEXT NOT NULL DEFAULT (datetime('now', '-5 hours')),
    updated_by INTEGER,
    is_deleted INTEGER NOT NULL DEFAULT 0,
    deleted_at TEXT,
    deleted_by INTEGER
  );

  CREATE TABLE IF NOT EXISTS producto_costos_historial (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    producto_sku TEXT NOT NULL REFERENCES productos(sku),
    costo_unitario REAL NOT NULL,
    moneda TEXT NOT NULL DEFAULT 'PEN',
    fecha_validez_desde TEXT NOT NULL,
    fecha_validez_hasta TEXT,
    motivo_modificacion TEXT DEFAULT '',
    documento_referencia TEXT DEFAULT '',
    created_at TEXT NOT NULL DEFAULT (datetime('now', '-5 hours')),
    created_by INTEGER
  );
`);

// Helper para parsear CSV delimitado por punto y coma (;)
function parseSemicolonCsv(filePath) {
  if (!fs.existsSync(filePath)) {
    console.warn(`Archivo no encontrado: ${filePath}`);
    return [];
  }
  const content = fs.readFileSync(filePath, 'utf-8');
  const lines = content.split(/\r?\n/).filter(line => line.trim().length > 0);
  if (lines.length === 0) return [];

  // Parse header
  const header = parseCsvLine(lines[0]);
  const rows = [];

  for (let i = 1; i < lines.length; i++) {
    const rawLine = lines[i];
    const values = parseCsvLine(rawLine);
    if (values.length > 0) {
      const row = {};
      for (let j = 0; j < header.length; j++) {
        row[header[j].trim()] = (values[j] !== undefined ? values[j].trim() : '');
      }
      rows.push(row);
    }
  }
  return rows;
}

function parseCsvLine(line) {
  const result = [];
  let current = '';
  let inQuotes = false;
  for (let i = 0; i < line.length; i++) {
    const char = line[i];
    if (char === '"') {
      if (inQuotes && line[i + 1] === '"') {
        current += '"';
        i++;
      } else {
        inQuotes = !inQuotes;
      }
    } else if (char === ';' && !inQuotes) {
      result.push(current);
      current = '';
    } else {
      current += char;
    }
  }
  result.push(current);
  return result;
}

// 2. Cargar datos de los CSVs
console.log('📂 Leyendo CSVs maestros...');
const mroProductosRows = parseSemicolonCsv(mroProductosCsvPath);
const costoMroRows = parseSemicolonCsv(costoMroCsvPath);

console.log(`  - Registros en mro_productos.csv: ${mroProductosRows.length}`);
console.log(`  - Registros en costo_mro.csv: ${costoMroRows.length}`);

// Mapa de costos
const costosMap = new Map();
for (const row of costoMroRows) {
  const sku = (row['Producto'] || '').trim().toUpperCase();
  const rawCost = row['C. UNIT.2'] || row['C. UNIT'] || '0';
  const cleanCost = parseFloat(rawCost.replace(/,/g, '')) || 0;
  if (sku && cleanCost > 0) {
    costosMap.set(sku, cleanCost);
  }
}

// 3. Ejecutar la migración atómica
db.transaction(() => {
  console.log('📦 Sembrando Unidades de Medida...');
  const baseUnits = [
    { codigo: 'UND', sap: 'ST', nombre: 'Unidades', simbolo: 'und', decimales: 0 },
    { codigo: 'PAR', sap: 'PA', nombre: 'Pares', simbolo: 'par', decimales: 0 },
    { codigo: 'JGO', sap: 'SET', nombre: 'Juegos / Sets', simbolo: 'jgo', decimales: 0 },
    { codigo: 'CJA', sap: 'BX', nombre: 'Cajas', simbolo: 'cja', decimales: 0 },
    { codigo: 'CIEN', sap: 'C1', nombre: 'Cientos', simbolo: 'cien', decimales: 0 },
    { codigo: 'GL', sap: 'GL', nombre: 'Galones', simbolo: 'gl', decimales: 1 },
    { codigo: 'GALON', sap: 'GL', nombre: 'Galones', simbolo: 'gal', decimales: 1 },
    { codigo: 'MTR', sap: 'M', nombre: 'Metros', simbolo: 'm', decimales: 2 },
    { codigo: 'KG', sap: 'KG', nombre: 'Kilogramos', simbolo: 'kg', decimales: 2 },
    { codigo: 'PZA', sap: 'PC', nombre: 'Piezas', simbolo: 'pza', decimales: 0 },
    { codigo: 'ROLLO', sap: 'ROL', nombre: 'Rollos', simbolo: 'rlo', decimales: 0 },
    { codigo: 'BLS', sap: 'BAG', nombre: 'Bolsas', simbolo: 'bls', decimales: 0 },
  ];

  const insertUnit = db.prepare(`
    INSERT OR IGNORE INTO unidades_medida (codigo_unidad, codigo_sap, nombre, simbolo, permite_decimales)
    VALUES (?, ?, ?, ?, ?)
  `);
  for (const u of baseUnits) {
    insertUnit.run(u.codigo, u.sap, u.nombre, u.simbolo, u.decimales);
  }

  console.log('📦 Sembrando Tipos de Almacenamiento...');
  const storageTypes = [
    { codigo: 'SUELTO', nombre: 'Almacenamiento Suelto' },
    { codigo: 'GAVETA', nombre: 'Gaveta / Casillero' },
    { codigo: 'EPP', nombre: 'Zona de EPP' },
    { codigo: 'CAJA', nombre: 'Caja / Bulto' },
    { codigo: 'PALLET', nombre: 'Pallet / Estiba' },
    { codigo: 'PISO', nombre: 'Piso Bodega' },
  ];
  const insertStorage = db.prepare(`
    INSERT OR IGNORE INTO tipos_almacenamiento (codigo, nombre) VALUES (?, ?)
  `);
  for (const st of storageTypes) {
    insertStorage.run(st.codigo, st.nombre);
  }

  console.log('📦 Sembrando Contenedores...');
  const baseContenedores = [
    { codigo: 'CONT-01', nombre: 'Contenedor 1 - EPPs y Herramientas', zona: 'PATIO PRINCIPAL' },
    { codigo: 'CONT-02', nombre: 'Contenedor 2 - Repuestos Pesados', zona: 'PATIO PRINCIPAL' },
    { codigo: 'C.C.01', nombre: 'Almacén Central MRO Chilca', zona: 'NAVE PRINCIPAL' },
  ];
  const insertContenedor = db.prepare(`
    INSERT OR IGNORE INTO contenedores (codigo_contenedor, nombre, zona) VALUES (?, ?, ?)
  `);
  for (const c of baseContenedores) {
    insertContenedor.run(c.codigo, c.nombre, c.zona);
  }

  // Obtener IDs de referencia
  const unidadesRows = db.prepare("SELECT codigo_unidad FROM unidades_medida").all();
  const unidadesSet = new Set(unidadesRows.map(u => u.codigo_unidad));

  const tiposAlmacenMap = new Map();
  const tRows = db.prepare("SELECT id, codigo FROM tipos_almacenamiento").all();
  for (const r of tRows) tiposAlmacenMap.set(r.codigo, r.id);

  const contenedoresMap = new Map();
  const cRows = db.prepare("SELECT id, codigo_contenedor FROM contenedores").all();
  for (const r of cRows) contenedoresMap.set(r.codigo_contenedor, r.id);

  const familiasMap = new Map();
  const getOrCreateFamilia = (nombre) => {
    const cleanNombre = (nombre || 'GENERAL').trim().toUpperCase();
    if (familiasMap.has(cleanNombre)) return familiasMap.get(cleanNombre);

    const existing = db.prepare("SELECT id FROM grupos_articulos WHERE nombre = ?").get(cleanNombre);
    if (existing) {
      familiasMap.set(cleanNombre, existing.id);
      return existing.id;
    }

    const code = cleanNombre.substring(0, 10).replace(/[^A-Z0-9]/g, '_');
    const res = db.prepare("INSERT INTO grupos_articulos (codigo, nombre) VALUES (?, ?)").run(code, cleanNombre);
    familiasMap.set(cleanNombre, res.lastInsertRowid);
    return res.lastInsertRowid;
  };

  // 4. Migrar productos existentes en productos_master / inventario
  console.log('🔄 Migrando productos existentes de la base de datos...');
  const existingMaster = db.prepare(`
    SELECT p.*,
           COALESCE(i.rack, '') as inv_rack,
           COALESCE(i.ubicacion_actual, '') as inv_ubicacion,
           COALESCE(i.contenedor, '') as inv_contenedor,
           COALESCE(i.foto_path, '') as inv_foto
    FROM productos_master p
    LEFT JOIN inventario i ON p.producto = i.producto
  `).all();

  const insertProducto = db.prepare(`
    INSERT INTO productos (
      sku, glosa, unidad_codigo, grupo_articulo_id,
      rack, nivel_rack, posicion_detalle, almacenamiento_codigo,
      costo_unitario_actual, peso_neto, foto_url,
      tipo_acero, grado_acero, espesor_acero
    ) VALUES (
      ?, ?, ?, ?,
      ?, ?, ?, ?,
      ?, ?, ?,
      ?, ?, ?
    )
    ON CONFLICT(sku) DO UPDATE SET
      glosa = excluded.glosa,
      unidad_codigo = excluded.unidad_codigo,
      grupo_articulo_id = excluded.grupo_articulo_id,
      rack = CASE WHEN excluded.rack != '' AND excluded.rack != 'Sin asignar' THEN excluded.rack ELSE productos.rack END,
      nivel_rack = CASE WHEN excluded.nivel_rack != '' THEN excluded.nivel_rack ELSE productos.nivel_rack END,
      posicion_detalle = CASE WHEN excluded.posicion_detalle != '' THEN excluded.posicion_detalle ELSE productos.posicion_detalle END,
      costo_unitario_actual = CASE WHEN excluded.costo_unitario_actual > 0 THEN excluded.costo_unitario_actual ELSE productos.costo_unitario_actual END,
      foto_url = CASE WHEN excluded.foto_url IS NOT NULL AND excluded.foto_url != '' THEN excluded.foto_url ELSE productos.foto_url END,
      updated_at = datetime('now', '-5 hours')
  `);

  const insertCostoHist = db.prepare(`
    INSERT INTO producto_costos_historial (
      producto_sku, costo_unitario, moneda, fecha_validez_desde, motivo_modificacion
    ) VALUES (?, ?, 'PEN', ?, 'Carga inicial consolidada')
  `);

  let countMigrated = 0;
  const processedSkus = new Set();

  for (const row of existingMaster) {
    const sku = row.producto.trim().toUpperCase();
    if (!sku) continue;

    let unit = (row.unidad || 'UND').trim().toUpperCase();
    if (!unidadesSet.has(unit)) {
      db.prepare("INSERT OR IGNORE INTO unidades_medida (codigo_unidad, nombre) VALUES (?, ?)").run(unit, unit);
      unidadesSet.add(unit);
    }

    const famId = getOrCreateFamilia(row.familia);
    const costo = costosMap.get(sku) || Number(row.costo_unitario || 0);

    const rackVal = row.inv_rack || '';
    const posDetalle = row.inv_ubicacion || '';
    const foto = row.inv_foto || null;

    insertProducto.run(
      sku,
      row.glosa || sku,
      unit,
      famId,
      rackVal,
      '',
      posDetalle,
      row.inv_contenedor || 'C.C.01',
      costo,
      Number(row.peso || 0),
      foto,
      row.tipo_acero || '',
      row.grado_acero || '',
      row.espesor_acero || ''
    );

    if (costo > 0) {
      insertCostoHist.run(sku, costo, '2026-01-01');
    }

    processedSkus.add(sku);
    countMigrated++;
  }
  console.log(`  ✓ ${countMigrated} productos existentes migrados a la nueva tabla.`);

  // 5. Incorporar productos nuevos desde mro_productos.csv
  console.log('🔄 Incorporando productos adicionales desde mro_productos.csv...');
  let countNew = 0;

  for (const row of mroProductosRows) {
    const sku = (row['Producto'] || '').trim().toUpperCase();
    if (!sku) continue;

    const glosa = row['Descripcion'] || sku;
    let unit = (row['Unidad'] || 'UND').trim().toUpperCase();
    if (!unidadesSet.has(unit)) {
      db.prepare("INSERT OR IGNORE INTO unidades_medida (codigo_unidad, nombre) VALUES (?, ?)").run(unit, unit);
      unidadesSet.add(unit);
    }

    const famId = getOrCreateFamilia(row['Familia']);
    const costo = costosMap.get(sku) || 0;
    const rackNivel = (row['NIVEL RACK'] || '').trim();
    const zonaUbicacion = (row['ZONA / UBICACION'] || '').trim();

    insertProducto.run(
      sku,
      glosa,
      unit,
      famId,
      rackNivel ? `RACK ${rackNivel}` : '',
      rackNivel,
      zonaUbicacion,
      'C.C.01',
      costo,
      0,
      null,
      '',
      '',
      ''
    );

    if (!processedSkus.has(sku) && costo > 0) {
      insertCostoHist.run(sku, costo, '2026-01-01');
    }

    if (!processedSkus.has(sku)) {
      countNew++;
      processedSkus.add(sku);
    }
  }

  console.log(`  ✓ ${countNew} productos nuevos agregados desde el CSV.`);
  console.log(`  🎯 Total de productos consolidados en la nueva tabla 'productos': ${processedSkus.size}`);
})();

db.close();
console.log('\x1b[32m%s\x1b[0m', '✅ Migración consolidada finalizada exitosamente.');
