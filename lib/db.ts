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
  db.exec(`
    CREATE TABLE IF NOT EXISTS usuarios (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nombre TEXT NOT NULL,
      usuario TEXT UNIQUE NOT NULL,
      password_hash TEXT NOT NULL,
      rol TEXT NOT NULL CHECK(rol IN ('contador', 'admin')),
      activo INTEGER DEFAULT 1,
      created_at TEXT DEFAULT (datetime('now'))
    );

    CREATE TABLE IF NOT EXISTS stock_cache (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      empresa TEXT,
      bodega TEXT,
      ubicacion TEXT,
      lote TEXT,
      producto TEXT,
      glosa TEXT,
      tipoproducto TEXT,
      unidad TEXT,
      stock REAL DEFAULT 0,
      familia TEXT,
      subfamilia TEXT,
      tipo TEXT,
      peso REAL,
      tipo_acero TEXT,
      grado_acero TEXT,
      espesor_acero TEXT,
      peso_producto REAL,
      ultimo_ingreso TEXT,
      fecha_sync TEXT DEFAULT (datetime('now')),
      UNIQUE(lote, producto)
    );

    CREATE TABLE IF NOT EXISTS inventario (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      producto TEXT NOT NULL,
      lote TEXT DEFAULT '',
      descripcion TEXT,
      stock_sistema REAL DEFAULT 0,
      unidad TEXT,
      familia TEXT,
      familia2 TEXT,
      cantidad_fisica REAL DEFAULT 0,
      dif REAL DEFAULT 0,
      um TEXT,
      presentacion TEXT,
      n_cajas_bultos TEXT,
      largo REAL DEFAULT 0,
      ancho REAL DEFAULT 0,
      alto REAL DEFAULT 0,
      peso_aprox_unitario REAL DEFAULT 0,
      peso_total_cant_fisica REAL DEFAULT 0,
      observacion TEXT DEFAULT 'PENDIENTE',
      comentario TEXT,
      rack TEXT,
      ubicacion_actual TEXT,
      almacenamiento TEXT,
      contenedor TEXT,
      responsable TEXT,
      fecha_conteo TEXT,
      costo_unitario REAL DEFAULT 0,
      total_costo REAL DEFAULT 0,
      s_dif REAL DEFAULT 0,
      rotacion TEXT,
      linea TEXT,
      prioridad TEXT,
      vida_util_ssoma TEXT,
      compatibilidad_segregacion TEXT,
      condiciones_almacenamiento TEXT,
      foto_path TEXT,
      usuario_id INTEGER,
      synced INTEGER DEFAULT 0,
      created_at TEXT DEFAULT (datetime('now')),
      updated_at TEXT DEFAULT (datetime('now')),
      FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
    );

    CREATE TABLE IF NOT EXISTS sync_log (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tipo TEXT,
      registros_sync INTEGER DEFAULT 0,
      fecha TEXT DEFAULT (datetime('now')),
      estado TEXT DEFAULT 'ok',
      detalle TEXT
    );

    CREATE INDEX IF NOT EXISTS idx_stock_producto ON stock_cache(producto);
    CREATE INDEX IF NOT EXISTS idx_stock_lote ON stock_cache(lote);
    CREATE INDEX IF NOT EXISTS idx_inventario_producto ON inventario(producto);
    CREATE INDEX IF NOT EXISTS idx_inventario_usuario ON inventario(usuario_id);
  `);
}
