-- Script para asegurar que TODOS los productos tengan al menos un registro en inventario.
-- Esto soluciona el problema de los productos nuevos que no aparecían en las búsquedas.
BEGIN;

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id)
SELECT p.sku, '', p.rack, 'PENDIENTE', NULL, COALESCE(p.bodega_id, 1)
FROM productos p
WHERE NOT EXISTS (
    SELECT 1 FROM inventario i WHERE i.producto = p.sku AND i.lote = ''
)
ON CONFLICT (producto, lote) DO NOTHING;

COMMIT;
