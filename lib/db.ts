import Database from 'better-sqlite3';
import path from 'path';

const DB_PATH = path.join(process.cwd(), 'data', 'app.db');

let _db: Database.Database | null = null;

export function getDB(): Database.Database {
  if (!_db) {
    _db = new Database(DB_PATH);
    _db.pragma('journal_mode = WAL');
    _db.pragma('foreign_keys = ON');
    initSchema(_db);
  }
  return _db;
}

function initSchema(db: Database.Database) {
  try {
    const tableInfo = db.prepare("SELECT sql FROM sqlite_master WHERE name = 'usuarios'").get() as { sql: string } | undefined;
    if (tableInfo && tableInfo.sql && (!tableInfo.sql.includes("'almacenero'") || !tableInfo.sql.includes("'auditor'"))) {
      db.pragma('foreign_keys = OFF');
      db.exec(`
        CREATE TABLE IF NOT EXISTS usuarios_new (
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
      db.pragma('foreign_keys = ON');
    }
  } catch (err) {
    console.error('Error auto-migrating usuarios table:', err);
  }

  db.exec(`
    CREATE TABLE IF NOT EXISTS usuarios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nombre TEXT NOT NULL,
      usuario TEXT UNIQUE NOT NULL,
      password_hash TEXT NOT NULL,
      rol TEXT NOT NULL CHECK(rol IN ('contador', 'admin', 'almacenero', 'auditor')),
      activo INTEGER DEFAULT 1,
      created_at TEXT DEFAULT (datetime('now', '-5 hours'))
    );

    -- ─────────────────────────────────────────────────────────────
    -- NUEVA ARQUITECTURA NORMALIZADA SAP MM/WM & AUDITORÍA
    -- ─────────────────────────────────────────────────────────────

    -- 1. UNIDADES DE MEDIDA (SAP T006 / MEINS)
    CREATE TABLE IF NOT EXISTS unidades_medida (
      codigo_unidad TEXT PRIMARY KEY,        -- 'UND', 'PAR', 'CJA', 'CIEN', 'GL', 'MTR', 'KG'
      codigo_sap TEXT DEFAULT '',            -- 'ST', 'PA', 'BX', 'C1', 'GL', 'M', 'KG'
      nombre TEXT NOT NULL,                  -- 'Unidades', 'Pares', 'Cajas', etc.
      simbolo TEXT DEFAULT '',
      permite_decimales INTEGER DEFAULT 0,
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER DEFAULT 0
    );

    -- 2. GRUPO DE ARTÍCULOS / FAMILIAS (SAP T023 / MATKL)
    CREATE TABLE IF NOT EXISTS grupos_articulos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,           -- 'EPP', 'HERR', 'REP_MEC', 'REP_ELEC', 'CONS', 'ACC'
      nombre TEXT NOT NULL,                  -- 'EPP', 'HERRAMIENTAS', 'REPUESTOS', etc.
      descripcion TEXT DEFAULT '',
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER DEFAULT 0
    );

    -- 3. SUBFAMILIAS / LÍNEAS TÉCNICAS
    CREATE TABLE IF NOT EXISTS subfamilias (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      grupo_articulo_id INTEGER NOT NULL REFERENCES grupos_articulos(id),
      codigo TEXT NOT NULL,                  -- 'RODAM', 'ABRAZ', 'PERN', 'FILT'
      nombre TEXT NOT NULL,                  -- 'RODAMIENTOS', 'ABRAZADERAS', 'PERNERÍA'
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER DEFAULT 0
    );

    -- 4. BODEGAS / ALMACENES PRINCIPALES (SAP T001L / LGORT)
    CREATE TABLE IF NOT EXISTS bodegas (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,           -- 'MRO-CHILCA', 'ALM-CENTRAL', 'ALM-MATPRIMA'
      nombre TEXT NOT NULL,                  -- 'ALM MRO CHILCA'
      empresa_codigo TEXT DEFAULT '001',
      direccion TEXT DEFAULT 'Planta Chilca, Cañete',
      activo INTEGER DEFAULT 1,
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER DEFAULT 0
    );

    -- 5. CONTENEDORES Y TIPOS DE ALMACÉN (SAP T301 / LGTYP)
    CREATE TABLE IF NOT EXISTS contenedores (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      bodega_id INTEGER DEFAULT 1 REFERENCES bodegas(id),
      codigo_contenedor TEXT UNIQUE NOT NULL, -- 'CONT-01', 'CONT-02', 'C.C.01', 'ALM-CENTRAL'
      nombre TEXT NOT NULL,                   -- 'Contenedor 1 - EPPs y Herramientas'
      zona TEXT DEFAULT '',                   -- 'PATIO NORTE', 'NAVE PRINCIPAL'
      descripcion TEXT DEFAULT '',
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER DEFAULT 0
    );

    -- 6. TIPOS DE ALMACENAMIENTO FÍSICO
    CREATE TABLE IF NOT EXISTS tipos_almacenamiento (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      codigo TEXT UNIQUE NOT NULL,           -- 'SUELTO', 'GAVETA', 'EPP', 'CAJA', 'PALLET'
      nombre TEXT NOT NULL,
      descripcion TEXT DEFAULT '',
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER DEFAULT 0
    );

    -- 6. MAESTRO PRINCIPAL DE PRODUCTOS / MATERIALES (SAP MARA / MARD / MBEW)
    CREATE TABLE IF NOT EXISTS productos (
      sku TEXT PRIMARY KEY,                  -- SAP MATNR: Código Material (ej: '801.02.134')
      glosa TEXT NOT NULL,                   -- SAP MAKTX: Descripción del Material
      
      unidad_codigo TEXT NOT NULL DEFAULT 'UND' REFERENCES unidades_medida(codigo_unidad),
      grupo_articulo_id INTEGER REFERENCES grupos_articulos(id),
      subfamilia_id INTEGER REFERENCES subfamilias(id),
      tipo_almacenamiento_id INTEGER REFERENCES tipos_almacenamiento(id),
      contenedor_id INTEGER REFERENCES contenedores(id),

      -- Ubicación Física en Bodega (SAP LGPLA / LGPBE)
      rack TEXT DEFAULT '',                  -- 'RACK 1', 'RACK 2'
      nivel_rack TEXT DEFAULT '',            -- 'NIVEL 1', 'NIVEL 2', 'NIVEL 3', 'PISO'
      posicion_detalle TEXT DEFAULT '',      -- 'GAVETA 14', 'CAJA B-02'
      almacenamiento_codigo TEXT DEFAULT 'C.C.01', -- Centro de Costos / Almacén
      
      -- Valorización Actual (SAP MBEW)
      costo_unitario_actual REAL DEFAULT 0,  -- SAP VERPR: Costo Unitario en Soles
      moneda TEXT NOT NULL DEFAULT 'PEN',    -- SAP WAERS: 'PEN', 'USD'

      -- Ficha Técnica y Dimensiones
      foto_url TEXT,                         -- Fotografía oficial del repuesto
      peso_neto REAL DEFAULT 0,              -- SAP NTGEW: Peso unitario (kg)
      stock_seguridad_min REAL DEFAULT 0,    -- SAP EISBE: Punto de pedido / Stock mínimo
      stock_maximo REAL DEFAULT 0,           -- SAP MABST: Stock máximo permitido
      
      -- Atributos Metalmecánicos Especiales (MRO)
      tipo_acero TEXT DEFAULT '',
      grado_acero TEXT DEFAULT '',
      espesor_acero TEXT DEFAULT '',

      -- Auditoría Completa
      activo INTEGER NOT NULL DEFAULT 1,
      created_at TEXT NOT NULL DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id),
      updated_at TEXT NOT NULL DEFAULT (datetime('now', '-5 hours')),
      updated_by INTEGER REFERENCES usuarios(id),
      is_deleted INTEGER NOT NULL DEFAULT 0,
      deleted_at TEXT,
      deleted_by INTEGER REFERENCES usuarios(id)
    );

    -- 7. HISTORIAL DE PRECIOS / COSTOS POR PERIODO (SAP MBEW Historial)
    CREATE TABLE IF NOT EXISTS producto_costos_historial (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      producto_sku TEXT NOT NULL REFERENCES productos(sku),
      costo_unitario REAL NOT NULL,          -- SAP VERPR
      moneda TEXT NOT NULL DEFAULT 'PEN',    -- SAP WAERS
      
      fecha_validez_desde TEXT NOT NULL,     -- Fecha inicio vigencia (YYYY-MM-DD)
      fecha_validez_hasta TEXT,              -- NULL: Costo activo actualmente
      
      motivo_modificacion TEXT DEFAULT '',   -- 'Recepción OC #9812', 'Actualización Inicial'
      documento_referencia TEXT DEFAULT '',  -- Factura, Guía o Pedido de Compra
      
      created_at TEXT NOT NULL DEFAULT (datetime('now', '-5 hours')),
      created_by INTEGER REFERENCES usuarios(id)
    );

    -- ─────────────────────────────────────────────────────────────
    -- CLEANUP: ELIMINAR TABLAS LEGACY
    -- ─────────────────────────────────────────────────────────────
    DROP TABLE IF EXISTS productos_master;
    DROP TABLE IF EXISTS stock_cache;
    DROP TABLE IF EXISTS sync_log;

    CREATE TABLE IF NOT EXISTS inventario (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      producto TEXT NOT NULL,
      lote TEXT DEFAULT '',
      familia2 TEXT DEFAULT '',
      cantidad_fisica REAL DEFAULT 0,
      dif REAL DEFAULT 0,
      um TEXT DEFAULT '',
      presentacion TEXT DEFAULT '',
      n_cajas_bultos TEXT DEFAULT '',
      largo REAL DEFAULT 0,
      ancho REAL DEFAULT 0,
      alto REAL DEFAULT 0,
      peso_total_cant_fisica REAL DEFAULT 0,
      observacion TEXT DEFAULT 'PENDIENTE',
      comentario TEXT DEFAULT '',
      rack TEXT DEFAULT '',
      ubicacion_actual TEXT DEFAULT '',
      almacenamiento TEXT DEFAULT '',
      contenedor TEXT DEFAULT '',
      responsable TEXT DEFAULT '',
      fecha_conteo TEXT DEFAULT '',
      total_costo REAL DEFAULT 0,
      s_dif REAL DEFAULT 0,
      rotacion TEXT DEFAULT '',
      linea TEXT DEFAULT '',
      prioridad TEXT DEFAULT '',
      vida_util_ssoma TEXT DEFAULT '',
      compatibilidad_segregacion TEXT DEFAULT '',
      condiciones_almacenamiento TEXT DEFAULT '',
      foto_path TEXT,
      usuario_id INTEGER,
      fecha_inicio TEXT,
      fecha_fin TEXT,
      duracion_segundos INTEGER DEFAULT 0,
      estado_auditoria TEXT DEFAULT 'CONFORME',
      synced INTEGER DEFAULT 0,
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      UNIQUE(producto, lote),
      FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    );

    CREATE TABLE IF NOT EXISTS movimientos (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo TEXT NOT NULL CHECK(tipo IN ('INGRESO', 'SALIDA', 'AJUSTE')),
      producto TEXT NOT NULL,
      lote TEXT DEFAULT '',
      cantidad REAL NOT NULL,
      stock_anterior REAL DEFAULT 0,
      stock_resultante REAL DEFAULT 0,
      motivo TEXT NOT NULL,
      documento_referencia TEXT DEFAULT '',
      solicitante TEXT DEFAULT '',
      ubicacion_origen TEXT DEFAULT '',
      ubicacion_destino TEXT DEFAULT '',
      rack TEXT DEFAULT '',
      foto_path TEXT,
      comentario TEXT DEFAULT '',
      usuario_id INTEGER NOT NULL,
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      FOREIGN KEY (producto) REFERENCES productos(sku),
      FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    );
  `);

  ensureIndexes(db);
}

function ensureIndexes(db: Database.Database) {
  db.exec(`
    -- Índices nuevas tablas SAP MM
    CREATE INDEX IF NOT EXISTS idx_productos_sku ON productos(sku);
    CREATE INDEX IF NOT EXISTS idx_productos_glosa ON productos(glosa);
    CREATE INDEX IF NOT EXISTS idx_productos_grupo ON productos(grupo_articulo_id);
    CREATE INDEX IF NOT EXISTS idx_productos_contenedor ON productos(contenedor_id);
    CREATE INDEX IF NOT EXISTS idx_productos_rack ON productos(rack);
    CREATE INDEX IF NOT EXISTS idx_costos_hist_sku ON producto_costos_historial(producto_sku);
    CREATE INDEX IF NOT EXISTS idx_costos_hist_fechas ON producto_costos_historial(fecha_validez_desde, fecha_validez_hasta);

    -- Índices existentes
    CREATE INDEX IF NOT EXISTS idx_inventario_producto ON inventario(producto);
    CREATE INDEX IF NOT EXISTS idx_inventario_usuario ON inventario(usuario_id);
    CREATE INDEX IF NOT EXISTS idx_inventario_lote ON inventario(lote);
    CREATE INDEX IF NOT EXISTS idx_movimientos_producto ON movimientos(producto);
    CREATE INDEX IF NOT EXISTS idx_movimientos_tipo ON movimientos(tipo);
    CREATE INDEX IF NOT EXISTS idx_movimientos_created ON movimientos(created_at);
  `);
}

/**
 * Calcula el Stock Teórico Real de un repuesto consolidando conteo físico (inventario) y movimientos (Kárdex)
 */
export function getStockTeorico(db: Database.Database, sku: string, lote = ''): number {
  const cleanSKU = sku.trim().toUpperCase();
  const cleanLote = (lote || '').trim();

  // 1. Obtener la fecha y cantidad del último conteo físico
  const invRow = db.prepare(`
    SELECT cantidad_fisica, created_at 
    FROM inventario 
    WHERE producto = ? AND IFNULL(lote, '') = ?
    ORDER BY created_at DESC
    LIMIT 1
  `).get(cleanSKU, cleanLote) as { cantidad_fisica: number, created_at: string } | undefined;

  const baseStock = invRow?.cantidad_fisica ?? 0;
  const baseDate = invRow?.created_at ?? '1970-01-01 00:00:00';

  // 2. Sumar solo los movimientos que ocurrieron DESPUÉS del último conteo físico
  const movRow = db.prepare(`
    SELECT 
      COALESCE(SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END), 0) as ingresos,
      COALESCE(SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END), 0) as salidas,
      COALESCE(SUM(CASE WHEN tipo = 'AJUSTE' THEN cantidad ELSE 0 END), 0) as ajustes
    FROM movimientos
    WHERE producto = ? AND IFNULL(lote, '') = ? AND created_at > ?
  `).get(cleanSKU, cleanLote, baseDate) as { ingresos: number; salidas: number; ajustes: number };

  return baseStock + movRow.ingresos + movRow.ajustes - movRow.salidas;
}

