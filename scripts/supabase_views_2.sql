-- ─────────────────────────────────────────────────────────────
-- VISTAS CON SEGURIDAD (RLS) PARA COSTOS Y MAESTROS
-- ─────────────────────────────────────────────────────────────

-- 1. VISTA DE COSTOS
CREATE OR REPLACE VIEW v_costos WITH (security_invoker = true) AS
SELECT 
    pr.sku,
    pr.glosa,
    pr.unidad_codigo as unidad,
    COALESCE(g.nombre, 'GENERAL') as familia,
    pr.costo_unitario_actual as costo_unitario,
    pr.moneda,
    (
        SELECT h.fecha_validez_desde 
        FROM producto_costos_historial h 
        WHERE h.producto_sku = pr.sku 
        ORDER BY h.id DESC LIMIT 1
    ) as ultima_actualizacion,
    (
        SELECT COUNT(*) 
        FROM producto_costos_historial h 
        WHERE h.producto_sku = pr.sku
    ) as total_cambios,
    (
        SELECT h.costo_unitario 
        FROM producto_costos_historial h 
        WHERE h.producto_sku = pr.sku 
        ORDER BY h.id DESC LIMIT 1 OFFSET 1
    ) as costo_anterior,
    pr.bodega_id,
    pr.is_deleted
FROM productos pr
LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
WHERE pr.is_deleted = 0;


-- 2. VISTAS DE DATOS MAESTROS (Con Conteo de Materiales)
CREATE OR REPLACE VIEW v_maestro_bodegas WITH (security_invoker = true) AS
SELECT b.*, 
  (SELECT COUNT(c.id) FROM contenedores c WHERE c.bodega_id = b.id AND c.is_deleted = 0) as total_contenedores,
  (SELECT COUNT(p.sku) FROM productos p WHERE p.bodega_id = b.id AND p.is_deleted = 0) as total_materiales
FROM bodegas b WHERE b.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_grupos WITH (security_invoker = true) AS
SELECT g.*, 
  (SELECT COUNT(p.sku) FROM productos p WHERE p.grupo_articulo_id = g.id AND p.is_deleted = 0) as total_materiales
FROM grupos_articulos g WHERE g.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_unidades WITH (security_invoker = true) AS
SELECT u.*, 
  (SELECT COUNT(p.sku) FROM productos p WHERE p.unidad_codigo = u.codigo_unidad AND p.is_deleted = 0) as total_materiales
FROM unidades_medida u WHERE u.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_contenedores WITH (security_invoker = true) AS
SELECT c.*, b.nombre as bodega_nombre, b.codigo as bodega_codigo,
  (SELECT COUNT(p.sku) FROM productos p WHERE p.contenedor_id = c.id AND p.is_deleted = 0) as total_materiales
FROM contenedores c
LEFT JOIN bodegas b ON c.bodega_id = b.id
WHERE c.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_tipos WITH (security_invoker = true) AS
SELECT t.*, 
  (SELECT COUNT(p.sku) FROM productos p WHERE p.tipo_almacenamiento_id = t.id AND p.is_deleted = 0) as total_materiales
FROM tipos_almacenamiento t WHERE t.is_deleted = 0;
