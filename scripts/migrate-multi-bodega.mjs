import Database from 'better-sqlite3';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const dbPath = path.join(__dirname, '..', 'data', 'app.db');

const db = new Database(dbPath);
db.pragma('journal_mode = WAL');
db.pragma('foreign_keys = ON');

console.log('=== INICIANDO MIGRACIÓN MULTI-BODEGA Y VINCULACIÓN SAP ===');

db.transaction(() => {
  // 1. Tabla BODEGAS
  db.exec(`
    CREATE TABLE IF NOT EXISTS bodegas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,
      nombre TEXT NOT NULL,
      empresa_codigo TEXT DEFAULT '001',
      direccion TEXT DEFAULT 'Chilca, Cañete',
      activo INTEGER DEFAULT 1,
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER DEFAULT 0
    );
  `);

  // Insertar bodega default MRO Chilca
  db.prepare(`
    INSERT OR IGNORE INTO bodegas (id, codigo, nombre, empresa_codigo, direccion)
    VALUES (1, 'MRO-CHILCA', 'ALM MRO CHILCA', '001', 'Planta Chilca, Cañete')
  `).run();

  // 2. Columna bodega_id en CONTENEDORES
  const contCols = db.prepare("PRAGMA table_info(contenedores)").all();
  if (!contCols.some(c => c.name === 'bodega_id')) {
    db.exec("ALTER TABLE contenedores ADD COLUMN bodega_id INTEGER REFERENCES bodegas(id)");
  }
  db.prepare("UPDATE contenedores SET bodega_id = 1 WHERE bodega_id IS NULL").run();

  // 3. Tipos de almacenamiento complementarios
  const tipos = [
    { codigo: 'SUELTO', nombre: 'Almacenamiento Suelto' },
    { codigo: 'GAVETA', nombre: 'Gaveta / Casillero' },
    { codigo: 'EPP', nombre: 'Zona de EPP' },
    { codigo: 'CAJA', nombre: 'Caja / Bulto' },
    { codigo: 'PALLET', nombre: 'Pallet / Estiba' },
    { codigo: 'PISO', nombre: 'Piso Bodega' },
    { codigo: 'BOLSA', nombre: 'Bolsa Plástica / Sellada' },
    { codigo: 'EMPAQUE', nombre: 'Empaque de Fábrica' },
    { codigo: 'PAQUETE', nombre: 'Paquete / Atado' },
    { codigo: 'ROLLO', nombre: 'Rollo / Bobina' },
    { codigo: 'BIDON', nombre: 'Bidón / Tambor' },
    { codigo: 'BALDE', nombre: 'Balde Industrial' },
    { codigo: 'SPRAY', nombre: 'Lata / Aerosol' },
    { codigo: 'SACO', nombre: 'Saco' }
  ];

  const insertTipo = db.prepare(`
    INSERT OR IGNORE INTO tipos_almacenamiento (codigo, nombre, descripcion)
    VALUES (?, ?, '')
  `);
  for (const t of tipos) {
    insertTipo.run(t.codigo, t.nombre);
  }

  // 4. Mapear contenedor_id en PRODUCTOS
  db.prepare(`
    UPDATE productos 
    SET contenedor_id = (SELECT id FROM contenedores WHERE codigo_contenedor = 'CONT-01' LIMIT 1)
    WHERE almacenamiento_codigo = '1' AND contenedor_id IS NULL
  `).run();

  db.prepare(`
    UPDATE productos 
    SET contenedor_id = (SELECT id FROM contenedores WHERE codigo_contenedor = 'CONT-02' LIMIT 1)
    WHERE almacenamiento_codigo = '2' AND contenedor_id IS NULL
  `).run();

  db.prepare(`
    UPDATE productos 
    SET contenedor_id = (SELECT id FROM contenedores WHERE codigo_contenedor = 'C.C.01' LIMIT 1)
    WHERE (almacenamiento_codigo = 'C.C.01' OR almacenamiento_codigo = '' OR almacenamiento_codigo IS NULL) AND contenedor_id IS NULL
  `).run();

  // 5. Mapear tipo_almacenamiento_id en PRODUCTOS desde inventario o default SUELTO
  db.prepare(`
    UPDATE productos
    SET tipo_almacenamiento_id = COALESCE(
      (
        SELECT ta.id 
        FROM inventario inv 
        JOIN tipos_almacenamiento ta ON UPPER(inv.presentacion) = ta.codigo
        WHERE inv.producto = productos.sku AND inv.presentacion != ''
        LIMIT 1
      ),
      (SELECT id FROM tipos_almacenamiento WHERE codigo = 'SUELTO' LIMIT 1)
    )
    WHERE tipo_almacenamiento_id IS NULL
  `).run();

  // 6. Columnas de auditoría de tiempos en INVENTARIO
  const invCols = db.prepare("PRAGMA table_info(inventario)").all();
  if (!invCols.some(c => c.name === 'fecha_inicio')) {
    db.exec("ALTER TABLE inventario ADD COLUMN fecha_inicio TEXT");
  }
  if (!invCols.some(c => c.name === 'fecha_fin')) {
    db.exec("ALTER TABLE inventario ADD COLUMN fecha_fin TEXT");
  }
  if (!invCols.some(c => c.name === 'duracion_segundos')) {
    db.exec("ALTER TABLE inventario ADD COLUMN duracion_segundos INTEGER DEFAULT 0");
  }
  if (!invCols.some(c => c.name === 'estado_auditoria')) {
    db.exec("ALTER TABLE inventario ADD COLUMN estado_auditoria TEXT DEFAULT 'CONFORME'");
  }
})();

console.log('✅ Migración completada con éxito.');

const bodegasCount = db.prepare('SELECT count(*) as c FROM bodegas').get().c;
const contCount = db.prepare('SELECT count(*) as c FROM contenedores').get().c;
const tiposCount = db.prepare('SELECT count(*) as c FROM tipos_almacenamiento').get().c;
const prodWithCont = db.prepare('SELECT count(*) as c FROM productos WHERE contenedor_id IS NOT NULL').get().c;
const prodWithTipo = db.prepare('SELECT count(*) as c FROM productos WHERE tipo_almacenamiento_id IS NOT NULL').get().c;

console.log(`- Bodegas: ${bodegasCount}`);
console.log(`- Contenedores: ${contCount}`);
console.log(`- Tipos Almacenamiento: ${tiposCount}`);
console.log(`- Productos con Contenedor asignado: ${prodWithCont} / 2755`);
console.log(`- Productos con Tipo Almacenamiento asignado: ${prodWithTipo} / 2755`);
