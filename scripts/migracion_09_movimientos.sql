-- TABLA: movimientos
INSERT INTO movimientos (id, tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, solicitante, rack, usuario_id, created_at, bodega_id) VALUES (3, 'INGRESO', '604.01.070', '', 6.0, 80.0, 86.0, 'COMPRA DIRECTA', 'demo', 'RACK 2', NULL, '2026-08-27 11:59:38', 1) ON CONFLICT DO NOTHING;
INSERT INTO movimientos (id, tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, solicitante, rack, usuario_id, created_at, bodega_id) VALUES (4, 'INGRESO', '21.30.3.209.001', '', 12.0, 0.0, 12.0, 'MANTENIMIENTO / OT', 'demo', '', NULL, '2026-08-27 15:52:13', 1) ON CONFLICT DO NOTHING;
INSERT INTO movimientos (id, tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, solicitante, rack, usuario_id, created_at, bodega_id) VALUES (5, 'SALIDA', '21.30.3.209.001', '', 2.0, 12.0, 10.0, 'MANTENIMIENTO / OT', 'CONSUMO', '', NULL, '2026-08-27 15:53:01', 1) ON CONFLICT DO NOTHING;
SELECT setval('movimientos_id_seq', (SELECT MAX(id) FROM movimientos));

