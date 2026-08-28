-- Corrección de la vista v_inventario para no duplicar el stock
CREATE OR REPLACE VIEW v_inventario WITH (security_invoker = true) AS
SELECT i.*, 
       p.glosa as descripcion, 
       p.unidad_codigo as unidad, 
       COALESCE(g.nombre, 'GENERAL') as familia, 
       p.peso_neto as peso_aprox_unitario,
       p.costo_unitario_actual as costo_unitario, 
       -- El stock del sistema es estrictamente ingresos menos salidas (la carga inicial ya es un ingreso)
       (COALESCE(m.total_ingresos, 0) - COALESCE(m.total_salidas, 0)) as stock_sistema, 
       u.nombre as usuario_nombre
FROM inventario i
JOIN productos p ON i.producto = p.sku
LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
LEFT JOIN (
  SELECT producto,
         SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as total_ingresos,
         SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as total_salidas
  FROM movimientos
  GROUP BY producto
) m ON i.producto = m.producto
LEFT JOIN usuarios u ON i.usuario_id = u.id;
