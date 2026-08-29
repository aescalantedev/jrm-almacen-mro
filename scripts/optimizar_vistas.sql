-- Optimización de Vistas usando LEFT JOIN LATERAL para evitar scans completos y subconsultas O(N^2)

-- 1. VISTA DE PRODUCTOS (Optimizada)
CREATE OR REPLACE VIEW v_productos WITH (security_invoker = true) AS
SELECT 
    pr.sku as producto,
    pr.glosa,
    pr.unidad_codigo as unidad,
    pr.grupo_articulo_id,
    COALESCE(g.nombre, 'GENERAL') as familia,
    pr.contenedor_id,
    COALESCE(c.nombre, 'Almacén Central MRO Chilca') as contenedor_nombre,
    COALESCE(c.codigo_contenedor, 'C.C.01') as contenedor_codigo,
    c.bodega_id,
    COALESCE(b.nombre, 'ALM MRO CHILCA') as bodega_nombre,
    pr.tipo_almacenamiento_id,
    COALESCE(ta.nombre, 'Almacenamiento Suelto') as tipo_almacenamiento_nombre,
    COALESCE(ta.codigo, 'SUELTO') as tipo_almacenamiento_codigo,
    pr.rack,
    pr.nivel_rack,
    pr.posicion_detalle,
    pr.almacenamiento_codigo,
    pr.costo_unitario_actual as costo_unitario,
    pr.moneda,
    pr.foto_url,
    pr.peso_neto as peso,
    pr.stock_seguridad_min,
    pr.stock_maximo,
    pr.tipo_acero,
    pr.grado_acero,
    pr.espesor_acero,
    pr.is_deleted,
    COALESCE(inv.inventario_count, 0) as inventario_count,
    COALESCE(inv.stock_inventario, 0) + COALESCE(mov.stock_movimientos, 0) as stock_total
FROM productos pr
LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
LEFT JOIN contenedores c ON pr.contenedor_id = c.id
LEFT JOIN bodegas b ON c.bodega_id = b.id
LEFT JOIN tipos_almacenamiento ta ON pr.tipo_almacenamiento_id = ta.id
LEFT JOIN LATERAL (
    SELECT COUNT(DISTINCT id) as inventario_count, SUM(cantidad_fisica) as stock_inventario 
    FROM inventario WHERE producto = pr.sku
) inv ON true
LEFT JOIN LATERAL (
    SELECT SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE -cantidad END) as stock_movimientos 
    FROM movimientos WHERE producto = pr.sku
) mov ON true
WHERE pr.is_deleted = 0;


-- 2. VISTA DE COSTOS (Optimizada)
CREATE OR REPLACE VIEW v_costos WITH (security_invoker = true) AS
SELECT 
    pr.sku,
    pr.glosa,
    pr.unidad_codigo as unidad,
    COALESCE(g.nombre, 'GENERAL') as familia,
    pr.costo_unitario_actual as costo_unitario,
    pr.moneda,
    ult.fecha_validez_desde as ultima_actualizacion,
    tot.total_cambios as total_cambios,
    ant.costo_unitario as costo_anterior,
    pr.bodega_id,
    pr.is_deleted
FROM productos pr
LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
LEFT JOIN LATERAL (
    SELECT fecha_validez_desde 
    FROM producto_costos_historial 
    WHERE producto_sku = pr.sku 
    ORDER BY id DESC LIMIT 1
) ult ON true
LEFT JOIN LATERAL (
    SELECT COUNT(*) as total_cambios 
    FROM producto_costos_historial 
    WHERE producto_sku = pr.sku
) tot ON true
LEFT JOIN LATERAL (
    SELECT costo_unitario 
    FROM producto_costos_historial 
    WHERE producto_sku = pr.sku 
    ORDER BY id DESC LIMIT 1 OFFSET 1
) ant ON true
WHERE pr.is_deleted = 0;


-- 3. VISTAS DE DATOS MAESTROS (Optimizadas)
CREATE OR REPLACE VIEW v_maestro_bodegas WITH (security_invoker = true) AS
SELECT b.*, 
  COALESCE(cnt.total_contenedores, 0) as total_contenedores,
  COALESCE(prod.total_materiales, 0) as total_materiales
FROM bodegas b 
LEFT JOIN LATERAL (SELECT COUNT(id) as total_contenedores FROM contenedores WHERE bodega_id = b.id AND is_deleted = 0) cnt ON true
LEFT JOIN LATERAL (SELECT COUNT(sku) as total_materiales FROM productos WHERE bodega_id = b.id AND is_deleted = 0) prod ON true
WHERE b.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_grupos WITH (security_invoker = true) AS
SELECT g.*, COALESCE(prod.total_materiales, 0) as total_materiales
FROM grupos_articulos g 
LEFT JOIN LATERAL (SELECT COUNT(sku) as total_materiales FROM productos WHERE grupo_articulo_id = g.id AND is_deleted = 0) prod ON true
WHERE g.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_unidades WITH (security_invoker = true) AS
SELECT u.*, COALESCE(prod.total_materiales, 0) as total_materiales
FROM unidades_medida u 
LEFT JOIN LATERAL (SELECT COUNT(sku) as total_materiales FROM productos WHERE unidad_codigo = u.codigo_unidad AND is_deleted = 0) prod ON true
WHERE u.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_contenedores WITH (security_invoker = true) AS
SELECT c.*, b.nombre as bodega_nombre, b.codigo as bodega_codigo,
  COALESCE(prod.total_materiales, 0) as total_materiales
FROM contenedores c
LEFT JOIN bodegas b ON c.bodega_id = b.id
LEFT JOIN LATERAL (SELECT COUNT(sku) as total_materiales FROM productos WHERE contenedor_id = c.id AND is_deleted = 0) prod ON true
WHERE c.is_deleted = 0;

CREATE OR REPLACE VIEW v_maestro_tipos WITH (security_invoker = true) AS
SELECT t.*, COALESCE(prod.total_materiales, 0) as total_materiales
FROM tipos_almacenamiento t 
LEFT JOIN LATERAL (SELECT COUNT(sku) as total_materiales FROM productos WHERE tipo_almacenamiento_id = t.id AND is_deleted = 0) prod ON true
WHERE t.is_deleted = 0;
