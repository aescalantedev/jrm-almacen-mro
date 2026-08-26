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

    CREATE TABLE IF NOT EXISTS productos_master (
      producto TEXT PRIMARY KEY,
      glosa TEXT DEFAULT '',
      unidad TEXT DEFAULT '',
      familia TEXT DEFAULT '',
      subfamilia TEXT DEFAULT '',
      tipo TEXT DEFAULT '',
      peso REAL DEFAULT 0,
      costo_unitario REAL DEFAULT 0,
      tipo_acero TEXT DEFAULT '',
      grado_acero TEXT DEFAULT '',
      espesor_acero TEXT DEFAULT '',
      peso_producto REAL DEFAULT 0,
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours'))
    );

    CREATE TABLE IF NOT EXISTS stock_cache (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      empresa TEXT DEFAULT '',
      bodega TEXT DEFAULT '',
      ubicacion TEXT DEFAULT '',
      lote TEXT DEFAULT '',
      producto TEXT NOT NULL,
      stock REAL DEFAULT 0,
      ultimo_ingreso TEXT,
      fecha_sync TEXT DEFAULT (datetime('now', '-5 hours')),
      UNIQUE(lote, producto)
    );

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
      synced INTEGER DEFAULT 0,
      created_at TEXT DEFAULT (datetime('now', '-5 hours')),
      updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
      UNIQUE(producto, lote),
      FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    );

    CREATE TABLE IF NOT EXISTS sync_log (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo TEXT,
      registros_sync INTEGER DEFAULT 0,
      fecha TEXT DEFAULT (datetime('now', '-5 hours')),
      estado TEXT DEFAULT 'ok',
      detalle TEXT
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
      FOREIGN KEY (producto) REFERENCES productos_master(producto),
      FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    );
  `);

  ensureIndexes(db);
  migrateOldSchema(db);
}

function ensureIndexes(db: Database.Database) {
  db.exec(`
    CREATE INDEX IF NOT EXISTS idx_stock_producto ON stock_cache(producto);
    CREATE INDEX IF NOT EXISTS idx_stock_lote ON stock_cache(lote);
    CREATE INDEX IF NOT EXISTS idx_inventario_producto ON inventario(producto);
    CREATE INDEX IF NOT EXISTS idx_inventario_usuario ON inventario(usuario_id);
    CREATE INDEX IF NOT EXISTS idx_inventario_lote ON inventario(lote);
    CREATE INDEX IF NOT EXISTS idx_movimientos_producto ON movimientos(producto);
    CREATE INDEX IF NOT EXISTS idx_movimientos_tipo ON movimientos(tipo);
    CREATE INDEX IF NOT EXISTS idx_movimientos_created ON movimientos(created_at);
  `);
}

function migrateOldSchema(db: Database.Database) {
  const tables = db.prepare("SELECT name FROM sqlite_master WHERE type='table'").all() as { name: string }[];
  const tableNames = tables.map(t => t.name);

  const stockCols = tableNames.includes('stock_cache')
    ? (db.prepare("PRAGMA table_info(stock_cache)").all() as { name: string }[]).map(c => c.name)
    : [];
  const invCols = tableNames.includes('inventario')
    ? (db.prepare("PRAGMA table_info(inventario)").all() as { name: string }[]).map(c => c.name)
    : [];

  const needsStockMigration = stockCols.includes('glosa') || stockCols.includes('subfamilia');
  const needsInvMigration = invCols.includes('descripcion') || invCols.includes('stock_sistema');

  if (!needsStockMigration && !needsInvMigration) return;

  db.pragma('foreign_keys = OFF');

  try {
    db.transaction(() => {
      if (needsStockMigration) {
        const colList = stockCols.filter(c =>
          ['producto', 'glosa', 'unidad', 'familia', 'subfamilia', 'tipo', 'peso', 'tipo_acero', 'grado_acero', 'espesor_acero', 'peso_producto'].includes(c)
        );
        if (colList.length > 0) {
          const sel = colList.join(', ');
          db.exec(`INSERT OR IGNORE INTO productos_master (producto, ${sel})
            SELECT ${sel} FROM stock_cache`);
        }

        db.exec(`CREATE TABLE stock_cache_new (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          empresa TEXT DEFAULT '', bodega TEXT DEFAULT '', ubicacion TEXT DEFAULT '',
          lote TEXT DEFAULT '', producto TEXT NOT NULL,
          stock REAL DEFAULT 0, ultimo_ingreso TEXT,
          fecha_sync TEXT DEFAULT (datetime('now', '-5 hours')),
          UNIQUE(lote, producto)
        )`);

        const migrateCols = ['id', 'empresa', 'bodega', 'ubicacion', 'lote', 'producto', 'stock', 'ultimo_ingreso', 'fecha_sync']
          .filter(c => stockCols.includes(c));
        db.exec(`INSERT INTO stock_cache_new (${migrateCols.join(', ')})
          SELECT ${migrateCols.join(', ')} FROM stock_cache`);
        db.exec(`DROP TABLE stock_cache`);
        db.exec(`ALTER TABLE stock_cache_new RENAME TO stock_cache`);
      }

      if (needsInvMigration) {
        db.exec(`CREATE TABLE inventario_new (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          producto TEXT NOT NULL, lote TEXT DEFAULT '', familia2 TEXT DEFAULT '',
          cantidad_fisica REAL DEFAULT 0, dif REAL DEFAULT 0, um TEXT DEFAULT '',
          presentacion TEXT DEFAULT '', n_cajas_bultos TEXT DEFAULT '',
          largo REAL DEFAULT 0, ancho REAL DEFAULT 0, alto REAL DEFAULT 0,
          peso_total_cant_fisica REAL DEFAULT 0,
          observacion TEXT DEFAULT 'PENDIENTE', comentario TEXT DEFAULT '',
          rack TEXT DEFAULT '', ubicacion_actual TEXT DEFAULT '',
          almacenamiento TEXT DEFAULT '', contenedor TEXT DEFAULT '',
          responsable TEXT DEFAULT '', fecha_conteo TEXT DEFAULT '',
          total_costo REAL DEFAULT 0, s_dif REAL DEFAULT 0,
          rotacion TEXT DEFAULT '', linea TEXT DEFAULT '', prioridad TEXT DEFAULT '',
          vida_util_ssoma TEXT DEFAULT '', compatibilidad_segregacion TEXT DEFAULT '',
          condiciones_almacenamiento TEXT DEFAULT '', foto_path TEXT,
          usuario_id INTEGER, synced INTEGER DEFAULT 0,
          created_at TEXT DEFAULT (datetime('now', '-5 hours')),
          updated_at TEXT DEFAULT (datetime('now', '-5 hours')),
          UNIQUE(producto, lote),
          FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
        )`);

        const migrateInvCols = ['id', 'producto', 'lote', 'familia2', 'cantidad_fisica', 'dif', 'um',
          'presentacion', 'n_cajas_bultos', 'largo', 'ancho', 'alto',
          'peso_total_cant_fisica', 'observacion', 'comentario',
          'rack', 'ubicacion_actual', 'almacenamiento', 'contenedor',
          'responsable', 'fecha_conteo', 'total_costo', 's_dif',
          'rotacion', 'linea', 'prioridad', 'vida_util_ssoma',
          'compatibilidad_segregacion', 'condiciones_almacenamiento', 'foto_path',
          'usuario_id', 'synced', 'created_at', 'updated_at'
        ].filter(c => invCols.includes(c));

        db.exec(`INSERT INTO inventario_new (${migrateInvCols.join(', ')})
          SELECT ${migrateInvCols.join(', ')} FROM inventario`);
        db.exec(`DROP TABLE inventario`);
        db.exec(`ALTER TABLE inventario_new RENAME TO inventario`);
      }

      // Migrate usuarios to include new roles
      const userCols = tableNames.includes('usuarios')
        ? (db.prepare("PRAGMA table_info(usuarios)").all() as { name: string }[]).map(c => c.name)
        : [];
      if (userCols.length > 0) {
        db.exec(`CREATE TABLE usuarios_new (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombre TEXT NOT NULL,
          usuario TEXT UNIQUE NOT NULL,
          password_hash TEXT NOT NULL,
          rol TEXT NOT NULL CHECK(rol IN ('contador', 'admin', 'almacenero', 'auditor')),
          activo INTEGER DEFAULT 1,
          created_at TEXT DEFAULT (datetime('now', '-5 hours'))
        )`);
        
        const migrateUserCols = ['id', 'nombre', 'usuario', 'password_hash', 'rol', 'activo', 'created_at'].filter(c => userCols.includes(c));
        db.exec(`INSERT INTO usuarios_new (${migrateUserCols.join(', ')})
          SELECT ${migrateUserCols.join(', ')} FROM usuarios`);
        db.exec(`UPDATE usuarios_new SET rol = 'almacenero' WHERE rol = 'contador'`);
        db.exec(`DROP TABLE usuarios`);
        db.exec(`ALTER TABLE usuarios_new RENAME TO usuarios`);
      }

      ensureIndexes(db);
    });
  } finally {
    db.pragma('foreign_keys = ON');
  }
}
