-- ─────────────────────────────────────────────────────────────
-- MRO_APP SUPABASE SCHEMA (CON RLS, AUTH Y MUCHOS-A-MUCHOS)
-- ─────────────────────────────────────────────────────────────

-- NOTA: Supabase Auth gestiona los correos y contraseñas en la tabla 'auth.users'
-- Nuestra tabla 'usuarios' funcionará como un "Perfil Público" asociado a 'auth.users'

CREATE TABLE IF NOT EXISTS usuarios (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  nombre TEXT NOT NULL,
  rol TEXT NOT NULL CHECK(rol IN ('superadmin', 'admin', 'almacenero', 'auditor', 'contador')),
  activo INTEGER DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima')
);

-- 4. BODEGAS / ALMACENES PRINCIPALES (Movido arriba para poder referenciarlo)
CREATE TABLE IF NOT EXISTS bodegas (
  id SERIAL PRIMARY KEY,
  codigo TEXT UNIQUE NOT NULL,
  nombre TEXT NOT NULL,
  empresa_codigo TEXT DEFAULT '001',
  direccion TEXT DEFAULT 'Planta Chilca, Cañete',
  activo INTEGER DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_by UUID REFERENCES usuarios(id),
  is_deleted INTEGER DEFAULT 0
);

-- TABLA INTERMEDIA: MUCHOS A MUCHOS (Usuarios <-> Bodegas)
CREATE TABLE IF NOT EXISTS usuarios_bodegas (
  usuario_id UUID REFERENCES usuarios(id) ON DELETE CASCADE,
  bodega_id INTEGER REFERENCES bodegas(id) ON DELETE CASCADE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  PRIMARY KEY (usuario_id, bodega_id)
);

-- 1. UNIDADES DE MEDIDA
CREATE TABLE IF NOT EXISTS unidades_medida (
  codigo_unidad TEXT PRIMARY KEY,
  codigo_sap TEXT DEFAULT '',
  nombre TEXT NOT NULL,
  simbolo TEXT DEFAULT '',
  permite_decimales INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_by UUID REFERENCES usuarios(id),
  is_deleted INTEGER DEFAULT 0
);

-- 2. GRUPO DE ARTÍCULOS / FAMILIAS
CREATE TABLE IF NOT EXISTS grupos_articulos (
  id SERIAL PRIMARY KEY,
  codigo TEXT UNIQUE NOT NULL,
  nombre TEXT NOT NULL,
  descripcion TEXT DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_by UUID REFERENCES usuarios(id),
  is_deleted INTEGER DEFAULT 0
);

-- 3. SUBFAMILIAS
CREATE TABLE IF NOT EXISTS subfamilias (
  id SERIAL PRIMARY KEY,
  grupo_articulo_id INTEGER NOT NULL REFERENCES grupos_articulos(id),
  codigo TEXT NOT NULL,
  nombre TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_by UUID REFERENCES usuarios(id),
  is_deleted INTEGER DEFAULT 0
);

-- 5. CONTENEDORES Y TIPOS DE ALMACÉN
CREATE TABLE IF NOT EXISTS contenedores (
  id SERIAL PRIMARY KEY,
  bodega_id INTEGER DEFAULT 1 REFERENCES bodegas(id),
  codigo_contenedor TEXT UNIQUE NOT NULL,
  nombre TEXT NOT NULL,
  zona TEXT DEFAULT '',
  descripcion TEXT DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_by UUID REFERENCES usuarios(id),
  is_deleted INTEGER DEFAULT 0
);

-- 6. TIPOS DE ALMACENAMIENTO FÍSICO
CREATE TABLE IF NOT EXISTS tipos_almacenamiento (
  id SERIAL PRIMARY KEY,
  codigo TEXT UNIQUE NOT NULL,
  nombre TEXT NOT NULL,
  descripcion TEXT DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_by UUID REFERENCES usuarios(id),
  is_deleted INTEGER DEFAULT 0
);

-- 7. PRODUCTOS (Con bodega_id para agilizar RLS)
CREATE TABLE IF NOT EXISTS productos (
  sku TEXT PRIMARY KEY,
  glosa TEXT NOT NULL,
  bodega_id INTEGER REFERENCES bodegas(id), -- Añadido para RLS rápido
  unidad_codigo TEXT NOT NULL DEFAULT 'UND' REFERENCES unidades_medida(codigo_unidad),
  grupo_articulo_id INTEGER REFERENCES grupos_articulos(id),
  subfamilia_id INTEGER REFERENCES subfamilias(id),
  tipo_almacenamiento_id INTEGER REFERENCES tipos_almacenamiento(id),
  contenedor_id INTEGER REFERENCES contenedores(id),
  rack TEXT DEFAULT '',
  nivel_rack TEXT DEFAULT '',
  posicion_detalle TEXT DEFAULT '',
  almacenamiento_codigo TEXT DEFAULT 'C.C.01',
  costo_unitario_actual NUMERIC DEFAULT 0,
  moneda TEXT NOT NULL DEFAULT 'PEN',
  foto_url TEXT,
  peso_neto NUMERIC DEFAULT 0,
  stock_seguridad_min NUMERIC DEFAULT 0,
  stock_maximo NUMERIC DEFAULT 0,
  tipo_acero TEXT DEFAULT '',
  grado_acero TEXT DEFAULT '',
  espesor_acero TEXT DEFAULT '',
  activo INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_by UUID REFERENCES usuarios(id),
  is_deleted INTEGER NOT NULL DEFAULT 0,
  deleted_at TIMESTAMP WITH TIME ZONE,
  deleted_by UUID REFERENCES usuarios(id)
);

-- 8. HISTORIAL DE PRECIOS
CREATE TABLE IF NOT EXISTS producto_costos_historial (
  id SERIAL PRIMARY KEY,
  producto_sku TEXT NOT NULL REFERENCES productos(sku),
  costo_unitario NUMERIC NOT NULL,
  moneda TEXT NOT NULL DEFAULT 'PEN',
  fecha_validez_desde TEXT NOT NULL,
  fecha_validez_hasta TEXT,
  motivo_modificacion TEXT DEFAULT '',
  documento_referencia TEXT DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  created_by UUID REFERENCES usuarios(id)
);

-- 9. INVENTARIO (Con bodega_id para RLS)
CREATE TABLE IF NOT EXISTS inventario (
  id SERIAL PRIMARY KEY,
  bodega_id INTEGER REFERENCES bodegas(id), -- Añadido para RLS
  producto TEXT NOT NULL,
  lote TEXT DEFAULT '',
  familia2 TEXT DEFAULT '',
  cantidad_fisica NUMERIC DEFAULT 0,
  dif NUMERIC DEFAULT 0,
  um TEXT DEFAULT '',
  presentacion TEXT DEFAULT '',
  n_cajas_bultos TEXT DEFAULT '',
  largo NUMERIC DEFAULT 0,
  ancho NUMERIC DEFAULT 0,
  alto NUMERIC DEFAULT 0,
  peso_total_cant_fisica NUMERIC DEFAULT 0,
  observacion TEXT DEFAULT 'PENDIENTE',
  comentario TEXT DEFAULT '',
  rack TEXT DEFAULT '',
  ubicacion_actual TEXT DEFAULT '',
  almacenamiento TEXT DEFAULT '',
  contenedor TEXT DEFAULT '',
  responsable TEXT DEFAULT '',
  fecha_conteo TEXT DEFAULT '',
  total_costo NUMERIC DEFAULT 0,
  s_dif NUMERIC DEFAULT 0,
  rotacion TEXT DEFAULT '',
  linea TEXT DEFAULT '',
  prioridad TEXT DEFAULT '',
  vida_util_ssoma TEXT DEFAULT '',
  compatibilidad_segregacion TEXT DEFAULT '',
  condiciones_almacenamiento TEXT DEFAULT '',
  foto_path TEXT,
  usuario_id UUID REFERENCES usuarios(id),
  fecha_inicio TEXT,
  fecha_fin TEXT,
  duracion_segundos INTEGER DEFAULT 0,
  estado_auditoria TEXT DEFAULT 'CONFORME',
  synced INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima'),
  UNIQUE(producto, lote)
);

-- 10. MOVIMIENTOS (Con bodega_id para RLS)
CREATE TABLE IF NOT EXISTS movimientos (
  id SERIAL PRIMARY KEY,
  bodega_id INTEGER REFERENCES bodegas(id), -- Añadido para RLS
  tipo TEXT NOT NULL CHECK(tipo IN ('INGRESO', 'SALIDA', 'AJUSTE')),
  producto TEXT NOT NULL REFERENCES productos(sku),
  lote TEXT DEFAULT '',
  cantidad NUMERIC NOT NULL,
  stock_anterior NUMERIC DEFAULT 0,
  stock_resultante NUMERIC DEFAULT 0,
  motivo TEXT NOT NULL,
  documento_referencia TEXT DEFAULT '',
  solicitante TEXT DEFAULT '',
  ubicacion_origen TEXT DEFAULT '',
  ubicacion_destino TEXT DEFAULT '',
  rack TEXT DEFAULT '',
  foto_path TEXT,
  comentario TEXT DEFAULT '',
  usuario_id UUID NOT NULL REFERENCES usuarios(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT (NOW() AT TIME ZONE 'America/Lima')
);

-- ÍNDICES
CREATE INDEX IF NOT EXISTS idx_productos_sku ON productos(sku);
CREATE INDEX IF NOT EXISTS idx_productos_bodega ON productos(bodega_id);
CREATE INDEX IF NOT EXISTS idx_inventario_bodega ON inventario(bodega_id);
CREATE INDEX IF NOT EXISTS idx_movimientos_bodega ON movimientos(bodega_id);
CREATE INDEX IF NOT EXISTS idx_usrbod_usuario ON usuarios_bodegas(usuario_id);
CREATE INDEX IF NOT EXISTS idx_usrbod_bodega ON usuarios_bodegas(bodega_id);

-- HABILITAR RLS (Row Level Security) EN TABLAS CLAVE
ALTER TABLE productos ENABLE ROW LEVEL SECURITY;
ALTER TABLE movimientos ENABLE ROW LEVEL SECURITY;
ALTER TABLE inventario ENABLE ROW LEVEL SECURITY;
ALTER TABLE bodegas ENABLE ROW LEVEL SECURITY;

-- ─────────────────────────────────────────────────────────────
-- TRIGGER PARA CREAR PERFIL AUTOMÁTICAMENTE CUANDO ALGUIEN SE REGISTRA
-- ─────────────────────────────────────────────────────────────
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.usuarios (id, nombre, rol, activo)
  VALUES (
    new.id, 
    COALESCE(new.raw_user_meta_data->>'nombre', 'Usuario Nuevo'),
    COALESCE(new.raw_user_meta_data->>'rol', 'almacenero'), 
    1
  );
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();
