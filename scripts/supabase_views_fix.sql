-- 1. Asegurar que no haya valores NULL en is_deleted que oculten los datos
UPDATE unidades_medida SET is_deleted = 0 WHERE is_deleted IS NULL;
UPDATE grupos_articulos SET is_deleted = 0 WHERE is_deleted IS NULL;
UPDATE contenedores SET is_deleted = 0 WHERE is_deleted IS NULL;
UPDATE tipos_almacenamiento SET is_deleted = 0 WHERE is_deleted IS NULL;

-- 2. Asegurar que las vistas tengan permisos para ser leídas por la API
GRANT SELECT ON v_maestro_bodegas TO anon, authenticated;
GRANT SELECT ON v_maestro_grupos TO anon, authenticated;
GRANT SELECT ON v_maestro_unidades TO anon, authenticated;
GRANT SELECT ON v_maestro_contenedores TO anon, authenticated;
GRANT SELECT ON v_maestro_tipos TO anon, authenticated;

-- 3. Si por casualidad se activó RLS (Row Level Security) en estas tablas en Supabase, 
-- debemos asegurarnos de que tengan política de lectura (SELECT) permitida para poder mostrarlos.
-- (Si ya existe la política o no está activado RLS, esto no afectará negativamente)

DO $$
BEGIN
    BEGIN
        CREATE POLICY "Lectura publica unidades" ON unidades_medida FOR SELECT USING (true);
    EXCEPTION WHEN duplicate_object THEN NULL;
    END;
    
    BEGIN
        CREATE POLICY "Lectura publica grupos" ON grupos_articulos FOR SELECT USING (true);
    EXCEPTION WHEN duplicate_object THEN NULL;
    END;
    
    BEGIN
        CREATE POLICY "Lectura publica contenedores" ON contenedores FOR SELECT USING (true);
    EXCEPTION WHEN duplicate_object THEN NULL;
    END;
    
    BEGIN
        CREATE POLICY "Lectura publica tipos" ON tipos_almacenamiento FOR SELECT USING (true);
    EXCEPTION WHEN duplicate_object THEN NULL;
    END;
END $$;

-- 4. Recrear las vistas usando COALESCE por seguridad extra
CREATE OR REPLACE VIEW v_maestro_unidades WITH (security_invoker = true) AS
SELECT u.*, 
  (SELECT COUNT(p.sku) FROM productos p WHERE p.unidad_codigo = u.codigo_unidad AND COALESCE(p.is_deleted, 0) = 0) as total_materiales
FROM unidades_medida u WHERE COALESCE(u.is_deleted, 0) = 0;

CREATE OR REPLACE VIEW v_maestro_grupos WITH (security_invoker = true) AS
SELECT g.*, 
  (SELECT COUNT(p.sku) FROM productos p WHERE p.grupo_articulo_id = g.id AND COALESCE(p.is_deleted, 0) = 0) as total_materiales
FROM grupos_articulos g WHERE COALESCE(g.is_deleted, 0) = 0;

CREATE OR REPLACE VIEW v_maestro_contenedores WITH (security_invoker = true) AS
SELECT c.*, b.nombre as bodega_nombre, b.codigo as bodega_codigo,
  (SELECT COUNT(p.sku) FROM productos p WHERE p.contenedor_id = c.id AND COALESCE(p.is_deleted, 0) = 0) as total_materiales
FROM contenedores c
LEFT JOIN bodegas b ON c.bodega_id = b.id
WHERE COALESCE(c.is_deleted, 0) = 0;

CREATE OR REPLACE VIEW v_maestro_tipos WITH (security_invoker = true) AS
SELECT t.*, 
  (SELECT COUNT(p.sku) FROM productos p WHERE p.tipo_almacenamiento_id = t.id AND COALESCE(p.is_deleted, 0) = 0) as total_materiales
FROM tipos_almacenamiento t WHERE COALESCE(t.is_deleted, 0) = 0;
