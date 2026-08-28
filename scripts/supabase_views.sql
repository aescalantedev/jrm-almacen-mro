-- ─────────────────────────────────────────────────────────────
-- VISTAS CON SEGURIDAD (RLS) PARA MRO_APP (PostgreSQL)
-- ─────────────────────────────────────────────────────────────
-- Usamos 'security_invoker = true' para que la vista respete 
-- las políticas RLS del usuario que hace la consulta.

-- 1. VISTA DE PRODUCTOS (Reemplaza la consulta compleja en GET /api/productos)
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
    (SELECT COUNT(DISTINCT i.id) FROM inventario i WHERE i.producto = pr.sku) as inventario_count,
    COALESCE((SELECT SUM(i.cantidad_fisica) FROM inventario i WHERE i.producto = pr.sku), 0) + 
    COALESCE((SELECT SUM(CASE WHEN m.tipo = 'INGRESO' THEN m.cantidad ELSE -m.cantidad END) FROM movimientos m WHERE m.producto = pr.sku), 0) as stock_total
FROM productos pr
LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
LEFT JOIN contenedores c ON pr.contenedor_id = c.id
LEFT JOIN bodegas b ON c.bodega_id = b.id
LEFT JOIN tipos_almacenamiento ta ON pr.tipo_almacenamiento_id = ta.id
WHERE pr.is_deleted = 0;


-- 2. VISTA DE MOVIMIENTOS Y EXPORTACIÓN KARDEX
CREATE OR REPLACE VIEW v_movimientos_export WITH (security_invoker = true) AS
SELECT 
    m.id,
    m.tipo,
    m.producto,
    p.glosa as producto_glosa,
    m.lote,
    m.cantidad,
    m.stock_anterior,
    m.stock_resultante,
    m.motivo,
    m.documento_referencia,
    m.solicitante,
    m.ubicacion_origen,
    m.ubicacion_destino,
    m.rack,
    m.foto_path,
    m.comentario,
    m.created_at as fecha,
    u.nombre as usuario_nombre,
    m.bodega_id,
    b.nombre as bodega_nombre
FROM movimientos m
LEFT JOIN productos p ON m.producto = p.sku
LEFT JOIN usuarios u ON m.usuario_id = u.id
LEFT JOIN bodegas b ON m.bodega_id = b.id;


-- 3. VISTA DE DASHBOARD IRA (Indicador de Registro de Almacén)
CREATE OR REPLACE VIEW v_dashboard_ira WITH (security_invoker = true) AS
SELECT 
    m.tipo,
    COUNT(*) as total_operaciones,
    SUM(m.cantidad) as volumen_total,
    DATE_TRUNC('month', m.created_at) as mes,
    m.bodega_id
FROM movimientos m
GROUP BY m.tipo, DATE_TRUNC('month', m.created_at), m.bodega_id;
