-- Sincronizacion de Stock Inicial desde Flexline

BEGIN;

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.016', '', 196, 0, 196, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.005', '', 33, 0, 33, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.004', '', 147, 0, 147, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.120', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.120', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.001.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.001.1', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1097', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1097', '', 43, 0, 43, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.020', '', 40, 0, 40, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.070', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.070', '', 80, 0, 80, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.010', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.070', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.070', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.01.320', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.01.320', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.018', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.36.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.36.01.002', '', 760, 0, 760, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.025', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.025', '', 56, 0, 56, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.176', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.176', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.570', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.570', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.30.01.10.030', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.30.01.10.030', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.10.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.10.004', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0105000019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0105000019', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.03.011', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.03.011', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('27.1.05.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '27.1.05.002', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.767', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.767', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.769', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.769', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.196', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.196', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4027', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4027', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.1.9.03175.132.293', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.1.9.03175.132.293', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.1.81.058.090.0115', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.1.81.058.090.0115', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.1.40.010.2000.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.1.40.010.2000.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.1.20.78.105', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.1.20.78.105', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.1.40.050.0900', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.1.40.050.0900', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.07.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.07.014', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5549', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5549', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.015', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.958.07', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.958.07', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.958.06', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.958.06', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1532', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1532', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.81.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.81.03.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.208', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.208', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.1300', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.1300', '', 144, 0, 144, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.901', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.901', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.16.04.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.16.04.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.16.02.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.16.02.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.011', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.011', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.16.04.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.16.04.005', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.012', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.54.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.54.002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.54.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.54.001', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.54.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.54.003', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.05.16', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.05.16', '', 88, 0, 88, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.402.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.402.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.852', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.852', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6965', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6965', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.915', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.915', '', 90, 0, 90, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0105000104', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0105000104', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.94.01.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.94.01.006', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('800.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '800.01.004', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.50.02.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.50.02.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.50.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.50.03.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.50.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.50.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.53.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.53.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4902', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4902', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.33.004.11', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.33.004.11', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.015', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.510', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.510', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.26.01.0401', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.26.01.0401', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('29.20.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '29.20.01.004', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.254', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.254', '', 191, 0, 191, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5168', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5168', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0104000033', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0104000033', '', 319, 0, 319, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.832', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.832', '', 324, 0, 324, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.33.004.12', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.33.004.12', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.360', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.360', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.704.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.704.01', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.01.201', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.01.201', '0', 0.03, 0, 0.03, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.01.201', '44399', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.01.201', '44399', 0.47, 0, 0.47, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('53.1.20.016.8', '000', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '53.1.20.016.8', '000', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('53.140.160.192.2.16', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '53.140.160.192.2.16', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('53.6.10.016.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '53.6.10.016.1', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('53.6.10.018.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '53.6.10.018.1', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('53.6.10.016.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '53.6.10.016.2', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5547', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5547', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.02.204', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.02.204', '0', 0.03, 0, 0.03, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.02.204', '1677', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.02.204', '1677', 0.47, 0, 0.47, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.02.212.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.02.212.01', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.02.303', '40695', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.02.303', '40695', 1.48, 0, 1.48, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('53.1.10.005.3', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '53.1.10.005.3', '', 119, 0, 119, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.442', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.442', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.443', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.443', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.001', '', 32, 0, 32, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.002', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.004', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.445', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.445', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.440', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.440', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.052', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.052', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.55.01.575', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.55.01.575', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.928', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.928', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.53.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.53.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.53.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.53.01.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.15.349003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.15.349003', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.15.241019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.15.241019', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.15.349004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.15.349004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('ACCCMP101000306', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'ACCCMP101000306', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('ACCCMP101000305', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'ACCCMP101000305', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.51.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.51.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('502.01.014', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '502.01.014', '0', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.493', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.493', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.507', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.507', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.52.01.400', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.52.01.400', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.58.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.58.01.001', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.027', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.027', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.02.105', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.02.105', '', 27, 0, 27, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.02.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.02.017', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.02.303', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.02.303', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.02.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.02.004', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.36.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.36.01.003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.041', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.041', '', 102, 0, 102, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.103', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.103', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('405.02.025', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '405.02.025', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.954.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.954.2', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.809.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.809.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.984', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.984', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.387', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.387', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.23.05.002.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.23.05.002.02', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('210.1.06.001.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '210.1.06.001.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('202.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '202.01.003', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1251', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1251', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.681.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.681.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.08.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.08.006', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.36.02.127', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.36.02.127', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.43.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.43.001', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.77.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.77.01.002', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.77.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.77.01.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.17.340003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.17.340003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000404', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000404', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.03.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.03.015', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.080', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.03.123', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.03.123', '', 36, 0, 36, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.47.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.47.01.002', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.564', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.564', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.027', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.027', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.116', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.116', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.123', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.123', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.108', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.108', '', 191, 0, 191, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.129', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.129', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.010', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.009', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.04.309.19', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.04.309.19', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1690', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1690', '', 40, 0, 40, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000402', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000402', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000403', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000403', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.08.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.08.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.045.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.045.01', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.526', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.526', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.39.220.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.39.220.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.478', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.478', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.002', '', 1500, 0, 1500, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000618', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000618', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000619', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000619', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.170', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.170', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.133', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.133', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.29.1.01.75', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.29.1.01.75', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('800.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '800.01.001', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.016', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.04.019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.04.019', '', 86, 0, 86, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.490', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.490', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.010.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.010.016', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.010.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.010.015', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.010.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.010.013', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.010.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.010.017', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.071', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.071', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.35.03.616', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.35.03.616', '0', 58, 0, 58, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.35.02.025', '41769', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.35.02.025', '41769', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.35.10.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.35.10.100', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.112', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.112', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.164', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.164', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.163', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.163', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.154', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.154', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.155', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.155', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.157', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.157', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.158', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.158', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.159', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.159', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.160', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.160', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.161', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.161', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.162', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.162', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.165', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.165', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.70.01.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.70.01.008', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.70.01.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.70.01.006', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.70.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.70.01.003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.70.01.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.70.01.007', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.70.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.70.01.005', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.316', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.316', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.320', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.320', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.85.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.85.02.002', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.85.02.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.85.02.001', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1124', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1124', '', 44, 0, 44, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('402.02.0010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '402.02.0010', '', 125, 0, 125, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.02.07.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.02.07.060', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.426', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.426', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('HERRMEC01000126', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'HERRMEC01000126', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.163', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.163', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.086', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.086', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.132', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.132', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.02.02.077', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.02.02.077', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.02.02.098', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.02.02.098', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.124', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.124', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.021', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.014', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.1072', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.1072', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.2.05.110.0233', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.2.05.110.0233', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.2.05.155.110.0202', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.2.05.155.110.0202', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('29.27.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '29.27.01.005', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.07.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.07.004', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.07.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.07.006', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.07.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.07.007', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4022', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.350', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.350', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.349', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.349', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.365', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.365', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.400.0203', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.400.0203', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.01.04.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.01.04.006', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.119', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.119', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('607.07.095', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '607.07.095', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.01.18.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.01.18.001', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.02.18.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.02.18.007', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('607.07.096', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '607.07.096', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1290.011', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1290.011', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1290.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1290.010', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.117', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.117', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1000.3', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1000.3', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.411', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.411', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.008', '', 302, 0, 302, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.007', '', 206, 0, 206, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.009', '', 516, 0, 516, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('XS.08.100.068', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'XS.08.100.068', '', 540, 0, 540, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.002', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.003', '', 26, 0, 26, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.82.03.012.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.82.03.012.018', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.82.01.112.121', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.82.01.112.121', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.82.02.114.102', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.82.02.114.102', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.099.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.099.018', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.027', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.027', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1741', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1741', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.049.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.049.1', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.013', '', 119, 0, 119, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('23.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '23.01.004', '', 146, 0, 146, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.1044', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.1044', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.1013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.1013', '', 53, 0, 53, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.035', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.035', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.49.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.49.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.201', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.201', '', 965, 0, 965, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4903', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4903', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.016', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.01.4.2.100.100.10', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.01.4.2.100.100.10', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.01.6.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.01.6.004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.153.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.153.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('1CAHE.0001.0002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '1CAHE.0001.0002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.02.15.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.02.15.014', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.031.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.031.01', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.280', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.280', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.18.02.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.18.02.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.069.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.069.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.528', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.528', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.582', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.582', '', 22, 0, 22, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.581', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.581', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.1035', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.1035', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.574', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.574', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.68.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.68.03.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S01000070', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S01000070', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S01000071', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S01000071', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.055', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.055', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.056', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.056', '', 37, 0, 37, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.353', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.353', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2165', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2165', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.83.100.801', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.83.100.801', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.011.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.011.001', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.83.03.012.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.83.03.012.018', '', 26, 0, 26, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.83.01.112.121', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.83.01.112.121', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.83.02.114.102', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.83.02.114.102', '', 40, 0, 40, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.83.01.114.101', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.83.01.114.101', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2147', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2147', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.424', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.424', '', 38, 0, 38, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.016', '', 60, 0, 60, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1780', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1780', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.94.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.94.01.001', '', 90, 0, 90, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.512.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.512.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.015', '', 58, 0, 58, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.28.01.102', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.28.01.102', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.64', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.64', '', 28, 0, 28, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.999', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.999', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.925', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.925', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.102', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.102', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5542', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5542', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.181', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.181', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.520', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.520', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.005', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.006', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.007', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.008', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.09.057', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.09.057', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.22.022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.22.022', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.015', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.050', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.050', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.505', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.505', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.14.02.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.14.02.008', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.79', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.79', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.464', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.464', '', 23, 0, 23, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('ACCCMP101000168', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'ACCCMP101000168', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.08.878', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.08.878', '', 3626, 0, 3626, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.18.02.0003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.18.02.0003', '', 40188, 0, 40188, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.115', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.115', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.111', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.111', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5880', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5880', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.380', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.380', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.500', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.500', '', 32, 0, 32, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.56.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.56.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.14.349208', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.14.349208', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.56.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.56.001', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.048', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.048', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.288', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.288', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.287', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.287', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.201', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.201', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.861', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.861', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.037', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.037', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.865', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.865', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.36.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.36.02.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1623', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1623', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.484.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.484.03', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.152', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.152', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.099', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.099', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.231', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.231', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.916', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.916', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.30.3.209', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.30.3.209', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.921', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.921', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.30.5.300', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.30.5.300', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.651', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.651', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.30.5.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.30.5.006', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.30.5.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.30.5.003', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.941', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.941', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4379', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4379', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.30.3.209.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.30.3.209.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.148.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.148.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.148', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.148', '', 3625, 0, 3625, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.17.09.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.17.09.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5084', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5084', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('203.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '203.01.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.50.01.50.0011.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.50.01.50.0011.02', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.50.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.50.01.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.50.11.320.0200', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.50.11.320.0200', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.013', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000649', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000649', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.50.01.50.0011', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.50.01.50.0011', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.601', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.601', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.056', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.056', '', 77, 0, 77, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('19.04.02.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '19.04.02.015', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.899', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.899', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.222', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.222', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('19.04.04.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '19.04.04.001', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.301', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.301', '', 76, 0, 76, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('19.04.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '19.04.03.001', '', 37, 0, 37, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.923', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.923', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.101', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.101', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.302', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.302', '', 95, 0, 95, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.311', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.311', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.001', '', 53, 0, 53, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('19.03.090', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '19.03.090', '', 68, 0, 68, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.304', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.304', '', 34, 0, 34, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.083', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.083', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.022', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.024', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.024', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.030', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.030', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.093', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.093', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.581', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.581', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.753', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.753', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.088', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.088', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.35.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.35.006', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.199', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.199', '', 124, 0, 124, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.23.05.002.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.23.05.002.03', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.17.06.006628', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.17.06.006628', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.01.2.4.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.01.2.4.060', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.79.01.190.137', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.79.01.190.137', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.79.01.190.142', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.79.01.190.142', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.020', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.260.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.260.01', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.06.30.036.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.06.30.036.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.056', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.056', '', 23, 0, 23, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.714', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.714', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.04.151', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.04.151', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.06.30.035.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.06.30.035.1', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.261', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.261', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.703', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.703', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.04.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.04.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.953', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.953', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.15.01.10.452', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.15.01.10.452', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.15.01.10.451', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.15.01.10.451', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.130', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.130', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.976', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.976', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.966', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.966', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1694', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1694', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1693', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1693', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.465', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.465', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.955', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.955', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.07.10.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.07.10.014', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.437', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.437', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.35.001.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.35.001.1', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.463', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.463', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.461', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.461', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.462', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.462', '', 91, 0, 91, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.002', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.101', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.101', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.463.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.463.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.953', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.953', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.037', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.037', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.515', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.515', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.376', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.376', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.136', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.136', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.111', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.111', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.110', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.110', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.107', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.107', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.109', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.109', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.108', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.108', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.374', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.374', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.90.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.90.004', '', 34, 0, 34, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.023', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.20.120', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.20.120', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.098', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.098', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.077', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.077', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.50.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.50.060', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.048', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.048', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.377', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.377', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.378', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.378', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.376', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.376', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1750', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1750', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.025', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.025', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.092|', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.092|', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.23.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.23.010', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.23.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.23.060', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1054', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1054', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.762', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.762', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.765', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.765', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.099', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.099', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.22.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.22.060', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.20.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.20.060', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1789', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1789', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.071', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.071', '', 35, 0, 35, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.021', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('XS.07.100.11', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'XS.07.100.11', '', 1010, 0, 1010, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.68.05.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.68.05.007', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.02.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.02.008', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.04.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.04.010', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.04.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.04.012', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6823', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6823', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.12.05.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.12.05.012', '', 37, 0, 37, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.435', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.435', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.072.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.072.1', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.050.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.050.01', '', 58, 0, 58, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.020', '', 28, 0, 28, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.371', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.371', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.02.04.034', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.02.04.034', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.763', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.763', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.761', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.761', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.03.057.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.03.057.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4017', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4028', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4028', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5540', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5540', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.97.03.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.97.03.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4875', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4875', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.63.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.63.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.63.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.63.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.63.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.63.003', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.63.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.63.004', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.065', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.065', '', 92, 0, 92, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.065.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.065.01', '', 60, 0, 60, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.59.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.59.01.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('0113.14.2.06.051', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '0113.14.2.06.051', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.30.04.220.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.30.04.220.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.086', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.086', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.30.05.03.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.30.05.03.006', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.30.01.038.222', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.30.01.038.222', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.30.01.012.220', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.30.01.012.220', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.30.02.15.200', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.30.02.15.200', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('EPPSS0108000042', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'EPPSS0108000042', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.179', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.179', '0', 370, 0, 370, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.192', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.192', '0', 57, 0, 57, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.51.02.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.51.02.004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.322', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.322', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.155.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.155.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.066', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.066', '', 48, 0, 48, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4021', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.21.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.21.01.004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.103', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.103', '', 105, 0, 105, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.17.10.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.17.10.004', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.24.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.24.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.69.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.69.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.69.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.69.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5122', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5122', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.021', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.3000', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.3000', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.299', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.299', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.201', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.201', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.016', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1302', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1302', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4014', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4013', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.209', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.209', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.12.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.12.02.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.06.174.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.06.174.2', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6967', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6967', '', 26, 0, 26, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.048', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.048', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.101', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.101', '', 38, 0, 38, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.103', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.103', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.139', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.139', '', 26, 0, 26, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.118', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.118', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.102', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.102', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.1023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.1023', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.1036', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.1036', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.325', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.325', '', 33, 0, 33, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.03.20.0330.341', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.03.20.0330.341', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.381', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.381', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.036', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.036', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.009', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.47.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.47.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.47.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.47.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1533', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1533', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1534', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1534', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.54.04.416', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.54.04.416', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.073', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.073', '', 32, 0, 32, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.074', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.074', '', 31, 0, 31, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.075', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.075', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.56.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.56.01.001', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.03.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.03.012', '', 120, 0, 120, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.03.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.03.005', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.03.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.03.007', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.262', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.262', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.261', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.261', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.003', '', 27, 0, 27, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.549', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.549', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.23.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.23.01.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.300.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.300.001', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.903', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.903', '', 52, 0, 52, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.022', '', 34, 0, 34, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.076.4008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.076.4008', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.076.4007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.076.4007', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('81.05.0412.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '81.05.0412.01', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.401', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.401', '', 68, 0, 68, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('81.01.0412.116', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '81.01.0412.116', '', 72, 0, 72, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.402', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.402', '', 101, 0, 101, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.408', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.408', '', 120, 0, 120, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.416', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.416', '', 209, 0, 209, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('81.01.0900.230', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '81.01.0900.230', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.430', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.430', '', 64, 0, 64, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.425', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.425', '', 39, 0, 39, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.405', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.405', '', 320, 0, 320, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.406', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.406', '', 69, 0, 69, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.403', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.403', '', 67, 0, 67, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.404', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.404', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.03.20.204', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.03.20.204', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.03.20.404', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.03.20.404', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.03.20.402', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.03.20.402', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.155', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.155', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.156', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.156', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.66.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.66.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.019', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4016', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.57.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.57.004', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.57.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.57.001', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.128', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.128', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.76.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.76.01.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.531', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.531', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2149', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2149', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2151', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2151', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.12.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.12.007', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.54.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.54.006', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.58.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.58.001', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.001.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.001.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.040', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.040', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.04.02.118.400', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.04.02.118.400', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.008', '', 48, 0, 48, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.009', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.007', '', 45, 0, 45, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.12.2.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.12.2.001', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4881', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4881', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4879', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4879', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.65.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.65.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.65.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.65.002', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.48.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.48.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.48.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.48.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.75.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.75.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.431.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.431.03', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.431.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.431.02', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.431', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.431', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.243', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.243', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.69.100.401.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.69.100.401.02', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.274', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.274', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.86.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.86.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.016.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.016.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.017', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.53.02.120.220', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.53.02.120.220', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.53.02.121.220', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.53.02.121.220', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.96.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.96.01.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.586.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.586.2', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.586', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.586', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4956', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4956', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4958', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4958', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4957', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4957', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.41.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.41.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.12.200076', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.12.200076', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.013', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.108', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.108', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.014', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.890', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.890', '', 40, 0, 40, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.940', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.940', '', 80, 0, 80, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.01.02.100.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.01.02.100.01', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.018', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.07.083', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.07.083', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.209', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.209', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.210', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.210', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.212', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.212', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.68.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.68.003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.301', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.301', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.583', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.583', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('XS.07.100.08', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'XS.07.100.08', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('XS.07.100.09', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'XS.07.100.09', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('199.ENG.40.0028.0064', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '199.ENG.40.0028.0064', '', 209, 0, 209, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.792', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.792', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.015', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.153', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.153', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1745', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1745', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.75.02.100.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.75.02.100.2', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.005', '', 45, 0, 45, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.02.04.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.02.04.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.409', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.409', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1767', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1767', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.550', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.550', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.551', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.551', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.35.450.05', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.35.450.05', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.553', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.553', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.630', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.630', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.580', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.580', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.516', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.516', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.509', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.509', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1695', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1695', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.411', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.411', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.05.01.001', '', 'principal', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.05.01.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'principal', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.959', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.959', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.499', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.499', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.61.05.920.900', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.61.05.920.900', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1148.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1148.1', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('59.30.016.1000.8', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '59.30.016.1000.8', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.03.997', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.03.997', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('59.1.0.580.1000.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '59.1.0.580.1000.1', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.905', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.905', '', 246, 0, 246, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.03.995', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.03.995', '', 99, 0, 99, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.906', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.906', '', 179, 0, 179, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.21.120', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.21.120', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.031', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.031', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.570', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.570', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.319', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.319', '', 183, 0, 183, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.46.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.46.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.018', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.04.358', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.04.358', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.233', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.233', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.725', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.725', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.724', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.724', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.016', '39261', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.016', '39261', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.016', '51182', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.016', '51182', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.700', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.700', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.022', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.023', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.026', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.026', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.021', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.04.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.04.007', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.04.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.04.010', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.249', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.249', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.248', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.248', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.181', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.181', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.04.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.04.012', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1703', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1703', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.213', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.213', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.211', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.211', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.07.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.07.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.998', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.998', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.791', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.791', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.90', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.90', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.002', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.914', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.914', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.20.03.020', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.20.03.020', '0', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.103.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.103.1', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1576', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1576', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('01801.01.705', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '01801.01.705', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.1300', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.1300', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.024', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.024', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('16.1.760.LS', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '16.1.760.LS', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('405.01.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '405.01.013', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('405.01.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '405.01.017', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3997', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3997', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.402.4', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.402.4', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.14', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.14', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.932', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.932', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.14.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.14.01', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.3614.370.711', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.3614.370.711', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.402', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.402', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6532', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6532', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6800', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6800', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6531', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6531', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6530', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6530', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6533', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6533', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.17', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.17', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3879', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3879', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.01.043', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.01.043', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.078', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.078', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S10000072', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S10000072', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3881', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3881', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.070', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.070', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.36.13.370.710', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.36.13.370.710', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.36.12.370.710', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.36.12.370.710', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.29.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.29.01.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.913', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.913', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('31.10.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '31.10.03.001', '', 207.5, 0, 207.5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.100.8511', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.100.8511', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.301', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.301', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.1010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.1010', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5165', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5165', '', 450, 0, 450, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1937', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1937', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.115', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.115', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.33.01.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.33.01.012', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.33.01.040', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.33.01.040', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.33.01.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.33.01.060', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.33.01.080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.33.01.080', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.73.03.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.73.03.020', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.22.03.600', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.22.03.600', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.03.20.406', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.03.20.406', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.42.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.42.003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.42.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.42.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.42.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.42.002', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.07.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.07.014', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.07.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.07.013', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2134', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2134', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2135', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2135', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.06.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.06.006', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.06.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.06.001', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.06.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.06.002', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.06.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.06.004', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.06.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.06.003', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.07.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.07.017', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.07.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.07.018', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.07.019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.07.019', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.07.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.07.015', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.07.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.07.016', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.04.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.04.006', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.04.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.04.007', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.04.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.04.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1681', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1681', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5562', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5562', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.976.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.976.2', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.976.5', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.976.5', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.976.4', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.976.4', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.976.3', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.976.3', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.976.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.976.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.993', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.993', '', 103, 0, 103, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.023', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('505.06.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '505.06.002', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('505.06.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '505.06.005', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.03.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.03.021', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.02.106', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.02.106', '', 600, 0, 600, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.16.340038', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.16.340038', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.16.340039', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.16.340039', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.51.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.51.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.534.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.534.01', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.18.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.18.007', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.18.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.18.008', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.18.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.18.004', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5076', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5076', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.378', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.378', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.312', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.312', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.168', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.168', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.355', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.355', '', 4.6, 0, 4.6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('84.330.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '84.330.001', '', 999, 0, 999, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('19.02.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '19.02.01.001', '', 27, 0, 27, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.351', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.351', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.302', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.302', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3677', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3677', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('27.04.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '27.04.01.004', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.791', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.791', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.02.3804', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.02.3804', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0105000098', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0105000098', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.95.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.95.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.391', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.391', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.01.10.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.01.10.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.501', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.501', '', 202, 0, 202, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.020.16', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.020.16', '', 97, 0, 97, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.021', '', 175, 0, 175, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.023', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('EPPSS0104000017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'EPPSS0104000017', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.042', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.042', '', 58, 0, 58, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.32.02.20.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.32.02.20.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.33.004.10', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.33.004.10', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.16.04.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.16.04.006', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2111', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2111', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1671', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1671', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.14.02.09', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.14.02.09', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.14.02.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.14.02.005', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.461', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.461', '', 1149, 0, 1149, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.14.02.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.14.02.007', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.14.02.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.14.02.006', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.25.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.25.01.003', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.94.02.001', '29464', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.94.02.001', '29464', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.18.001.09.11', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.18.001.09.11', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.20.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.20.005', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.02.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.02.001', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.02.002', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.04.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.04.001', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.03.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.03.004', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.03.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.03.002', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.03.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.03.003', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.03.001', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.05.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.05.001', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.05.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.05.002', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.01.001', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.97.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.97.01.002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1722', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1722', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.32.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.32.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.51.01.401', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.51.01.401', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.21.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.21.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.34.01.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.34.01.010', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.33.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.33.01.001', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.33.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.33.02.002', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1333', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1333', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.03.09.201', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.03.09.201', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.03.10.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.03.10.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.807', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.807', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.03.15.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.03.15.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3055', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3055', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.01.048', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.01.048', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.07.092', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.07.092', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.03.05.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.03.05.018', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.161', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.161', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.024', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.024', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.006', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3866', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3866', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.190', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.190', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.02.134', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.02.134', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.147', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.147', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.06.163', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.06.163', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.12.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.12.009', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.12.029', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.12.029', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.46.01.120.175', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.46.01.120.175', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.46.01.140.200', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.46.01.140.200', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.46.01.160.200', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.46.01.160.200', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.46.01.040.070', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.46.01.040.070', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.46.03.516.180', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.46.03.516.180', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.46.03.580.110', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.46.03.580.110', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.46.03.140', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.46.03.140', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.997', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.997', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.36.11.651.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.36.11.651.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.317', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.317', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.298', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.298', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4020', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4023', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.236', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.236', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.234', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.234', '', 22, 0, 22, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4717', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4717', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('016.04.04.343', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '016.04.04.343', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.48.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.48.004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3998', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3998', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3999', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3999', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.325.222', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.325.222', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.325.221', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.325.221', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0104000055', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0104000055', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('805.04.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '805.04.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.354.04', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.354.04', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.01.005', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.01.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.01.100', '', 65, 0, 65, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.01.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.01.020', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.03.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.03.012', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.03.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.03.009', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.03.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.03.010', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.03.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.03.005', '', 45, 0, 45, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.03.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.03.003', '', 29, 0, 29, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.03.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.03.004', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.63.03.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.63.03.002', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.285', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.285', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.302', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.302', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.07.061', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.07.061', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.311', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.311', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.016', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.39.1.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.39.1.01', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.453', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.453', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.70.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.70.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.009', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.949', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.949', '', 273, 0, 273, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.04.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.04.017', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.04.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.04.018', '', 201, 0, 201, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.04.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.04.020', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.07.05.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.07.05.006', '', 71, 0, 71, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.07.10.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.07.10.002', '', 101, 0, 101, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.07.08.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.07.08.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000626', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000626', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.300', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.300', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('27.03.01.402', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '27.03.01.402', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.004', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.003', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.010', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.008', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.007', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.005', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1079', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1079', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.604', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.604', '', 240, 0, 240, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.605', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.605', '', 192, 0, 192, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1078', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1078', '', 99, 0, 99, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.603.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.603.1', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.149', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.149', '', 166, 0, 166, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.613', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.613', '', 165, 0, 165, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.606', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.606', '', 158, 0, 158, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.607', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.607', '', 128, 0, 128, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.06.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.06.005', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.06.151', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.06.151', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.067', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.067', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.006', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0105000099', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0105000099', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.1450', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.1450', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.025', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.025', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.098.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.098.02', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2144', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2144', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.098', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.098', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.098.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.098.01', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.603', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.603', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.22.07.30.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.22.07.30.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.22.03.30.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.22.03.30.004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.066', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.066', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.069', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.069', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.460', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.460', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.070', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.070', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.703', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.703', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.12.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.12.013', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.03.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.03.005', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.430', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.430', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.092', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.092', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.043', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.043', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.205', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.205', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.022', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.078', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.078', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.14.2.02.043', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.14.2.02.043', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.14.2.02.040', '37429', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.14.2.02.040', '37429', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.14.2.02.042', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.14.2.02.042', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.059', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.059', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.089', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.089', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.607', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.607', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.610', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.610', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.038', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.038', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.7016', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.7016', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.041', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.041', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.017', '', 27, 0, 27, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.018', '', 31, 0, 31, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.019', '', 65, 0, 65, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.316', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.316', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.12.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.12.020', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.12.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.12.004', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.12.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.12.005', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.12.024', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.12.024', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4983', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4983', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.895', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.895', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.22.018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.22.018', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.205', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.205', '', 33, 0, 33, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.207', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.207', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.25.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.25.01.001', '', 67, 0, 67, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.250.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.250.01', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.059', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.059', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.045', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.045', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.046', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.046', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.047', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.047', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.026', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.026', '', 116, 0, 116, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.231', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.231', '', 151, 0, 151, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.33.004.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.33.004.03', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.329', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.329', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.369', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.369', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.92.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.92.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.1052', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.1052', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.76.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.76.01.002', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.919.21', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.919.21', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.919.20', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.919.20', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.319', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.319', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.1004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.1004', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.310', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.310', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.90.09.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.90.09.002', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.51.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.51.003', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.90.09.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.90.09.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4080', '', 960, 0, 960, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('XS.06.100.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'XS.06.100.01', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('930.01.100.0002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '930.01.100.0002', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.360', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.360', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.361.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.361.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('501.01.317', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '501.01.317', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.15.05.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.15.05.005', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.15.05.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.15.05.010', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.14.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.14.01.001', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('A.33311.20.01.MAC-01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'A.33311.20.01.MAC-01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.045', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.045', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.217', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.217', '', 4445, 0, 4445, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.11.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.11.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.11.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.11.003', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.11.04.05.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.11.04.05.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.020', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.019', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.57.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.57.01.001', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.06.413', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.06.413', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.028', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.028', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.031', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.031', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.101', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.101', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.05.03.128', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.05.03.128', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.02.12.041', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.02.12.041', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.02.12.044', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.02.12.044', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.340.37700.01', '522', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.340.37700.01', '522', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.555', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.555', '', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.117', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.117', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.942.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.942.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.450', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.450', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.14.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.14.01.002', '', 35, 0, 35, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.504', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.504', '', 836, 0, 836, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.073', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.073', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.095.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.095.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.02.04.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.02.04.003', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.414', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.414', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.24.023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.24.023', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1766', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1766', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.24.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.24.006', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.24.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.24.007', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.104.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.104.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.470', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.470', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.997', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.997', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.450.25.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.450.25.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.450', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.450', '', 60, 0, 60, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.1065', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.1065', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.1066', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.1066', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.1067', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.1067', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.1075', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.1075', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.14.30.014.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.14.30.014.014', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.902', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.902', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.743', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.743', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.742', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.742', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.723.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.723.2', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.02.302', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.02.302', '', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.464', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.464', '', 53, 0, 53, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.465', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.465', '', 31, 0, 31, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.466', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.466', '', 68, 0, 68, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.467', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.467', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.468', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.468', '', 76, 0, 76, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.469', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.469', '', 51, 0, 51, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.470', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.470', '', 70, 0, 70, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.471', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.471', '', 70, 0, 70, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.485', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.485', '', 73, 0, 73, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.514', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.514', '', 113, 0, 113, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.492', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.492', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4024', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4024', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.010', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.015', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.369', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.369', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.389', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.389', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.350.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.350.01', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.307', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.307', '', 84, 0, 84, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5080', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.246', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.246', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.352', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.352', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.447', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.447', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.446', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.446', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.445', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.445', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.390.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.390.03', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.055.6', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.055.6', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.055.5', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.055.5', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.055.4', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.055.4', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.437.11', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.437.11', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.437.10', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.437.10', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.437.12', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.437.12', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.385', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.385', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.350', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.350', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.382', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.382', '', 37, 0, 37, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.615.500', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.615.500', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.246.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.246.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.115.561', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.115.561', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.439.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.439.2', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.045.352', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.045.352', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.045.351', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.045.351', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.615.501', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.615.501', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1445', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1445', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1444', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1444', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.038.300', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.038.300', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.038.350', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.038.350', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1443', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1443', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.354.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.354.03', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.19.1.031.354.03.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.19.1.031.354.03.1', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.295', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.295', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5078', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5078', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5073', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5073', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5075', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5075', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.53.05.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.53.05.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.33.004.08', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.33.004.08', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.07.038', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.07.038', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.296', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.296', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.080', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.170', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.170', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.171', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.171', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.172', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.172', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.173', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.173', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.174', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.174', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.032', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.032', '', 41, 0, 41, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.510', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.510', '', 0.3, 0, 0.3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.005', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.547', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.547', '', 79, 0, 79, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.525', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.525', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.521', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.521', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.116', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.116', '', 54, 0, 54, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.531', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.531', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.007', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.507', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.507', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.323', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.323', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.333', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.333', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.117', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.117', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.29.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.29.02.002', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.162', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.162', '', 963, 0, 963, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5172', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5172', '', 200, 0, 200, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.014', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.341', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.341', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.976', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.976', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1080', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.044', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.044', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.456', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.456', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.09.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.09.060', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.993', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.993', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.1041', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.1041', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.831', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.831', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.44.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.44.001', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('51.2.20.120.4000.2.1', '37696', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '51.2.20.120.4000.2.1', '37696', 180, 0, 180, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('51.2.22.012.0100.8.1', '40836', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '51.2.22.012.0100.8.1', '40836', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('51.2.22.016.0092.13', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '51.2.22.016.0092.13', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('51.2.22.016.0072.10', 'OT 1702', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '51.2.22.016.0072.10', 'OT 1702', 30, 0, 30, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('51.2.24.016.0090.8.1', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '51.2.24.016.0090.8.1', '0', 55, 0, 55, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.923', '55773', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.923', '55773', 0.2, 0, 0.2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.09.029', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.09.029', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('51.7.10.580.3120.2.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '51.7.10.580.3120.2.1', '', 34, 0, 34, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.227.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.227.1', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.01.254.08', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.01.254.08', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.01.254.07', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.01.254.07', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.003', '27247', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.003', '27247', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.03.204', '42188', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.03.204', '42188', 200, 0, 200, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.03.291', '42188', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.03.291', '42188', 280, 0, 280, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('51.4.10.370.7000.0.3', '43916', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '51.4.10.370.7000.0.3', '43916', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.04.409', '43867', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.04.409', '43867', 50, 0, 50, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.03.250', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.03.250', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.04.570', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.04.570', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.01.607.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.01.607.01', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.01.610.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.01.610.01', '', 80, 0, 80, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.01.308', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.01.308', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.01.279.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.01.279.014', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.362', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.362', '', 158, 0, 158, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6429', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6429', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.95.02.001', '56975', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.95.02.001', '56975', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.49.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.49.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.192', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.192', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.403', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.403', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.923', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.923', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('89.03.046.003.15', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '89.03.046.003.15', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1985', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1985', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.04.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.04.014', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.08.04.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.08.04.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.0006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.0006', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.08.03.150', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.08.03.150', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.08.03.151', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.08.03.151', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.0003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.0003', '', 23, 0, 23, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('01604.03.313', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '01604.03.313', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.340.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.340.1', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.340.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.340.2', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.061', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.061', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.060', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.060', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.58.02.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.58.02.003', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.58.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.58.02.002', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.05.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.05.020', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('201.03.103.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '201.03.103.01', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('P102DUXC107A000', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'P102DUXC107A000', '', 38, 0, 38, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('201.03.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '201.03.002', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('201.03.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '201.03.003', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('P101SPRC0816002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'P101SPRC0816002', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.13.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.13.020', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1486', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1486', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.944', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.944', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.004', '', 37, 0, 37, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.15.4.18.117', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.15.4.18.117', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.12.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.12.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.12.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.12.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.12.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.12.004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.12.04.05.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.12.04.05.001', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.937', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.937', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.376.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.376.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.33.004.06', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.33.004.06', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.45.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.45.02', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.45.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.45.01', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('.RAPL.60.0075.0085', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '.RAPL.60.0075.0085', '0', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('.RAPL.60.0075.0085', '13158-E18', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '.RAPL.60.0075.0085', '13158-E18', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.428', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.428', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.029', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.029', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.25.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.25.03.001', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.089', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.089', '', 26, 0, 26, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.03.340.100.095', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.03.340.100.095', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.1002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.1002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.337', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.337', '', 4700, 0, 4700, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.55.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.55.001', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.1159', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.1159', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.147', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.147', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.539', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.539', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.541', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.541', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.540', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.540', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.589', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.589', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.538', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.538', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.454', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.454', '', 31, 0, 31, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.912', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.912', '', 105, 0, 105, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.1018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.1018', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.02.0620', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.02.0620', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.02.0520', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.02.0520', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.02.0300.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.02.0300.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.1021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.1021', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.03.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.03.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.03.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.03.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.01.0312', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.01.0312', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.01.0400', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.01.0400', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.03.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.72.03.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.72.03.008', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5171', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5171', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.1006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.1006', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.04.12.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.04.12.005', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.04.12.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.04.12.002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.04.12.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.04.12.001', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.04.12.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.04.12.003', '', 70, 0, 70, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.04.12.011', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.04.12.011', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.151', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.151', '', 75, 0, 75, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.152', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.152', '', 91, 0, 91, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.153', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.153', '', 49, 0, 49, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.050', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.050', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.555', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.555', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6565', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6565', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.308', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.308', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.93.01.032', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.93.01.032', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.416', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.416', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.012', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.24.05.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.24.05.001', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.609', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.609', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.198', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.198', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.020', '', 58, 0, 58, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.063', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.063', '', 22, 0, 22, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.512', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.512', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.563', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.563', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.565', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.565', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.251.20', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.251.20', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.206.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.206.01', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.139', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.139', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.115', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.115', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.140', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.140', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.01.419', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.01.419', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.013.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.013.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.03.20.290', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.03.20.290', '', 19, 0, 19, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.009', '', 784, 0, 784, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.667', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.667', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.488', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.488', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.416.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.416.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.7017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.7017', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4163', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4163', '', 58, 0, 58, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.462', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.462', '', 33, 0, 33, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.935', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.935', '', 38, 0, 38, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.390', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.390', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.50.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.50.001', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000627', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000627', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.36.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.36.01.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.470', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.470', '', 265, 0, 265, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.06.07.223', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.06.07.223', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.058', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.058', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.057', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.057', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.393', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.393', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.622', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.622', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.394', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.394', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1452', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1452', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.398', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.398', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2146', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2146', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.021', '', 42, 0, 42, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.197', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.197', '', 102, 0, 102, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6966', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6966', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.937', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.937', '', 56, 0, 56, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.002', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.004', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S09000009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S09000009', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S09000008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S09000008', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('25.20.03.001.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '25.20.03.001.001', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.02.30.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.02.30.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.02.50.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.02.50.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.017', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.04.2.1160', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.04.2.1160', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.42.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.42.001', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1727', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1727', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1728', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1728', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1729', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1729', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.54.01.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.54.01.008', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('54.01.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '54.01.006', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('54.01.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '54.01.007', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.121', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.121', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.757', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.757', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.109', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.109', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.053', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.053', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.051', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.051', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.08.10.200.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.08.10.200.100', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.155', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.155', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.024', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.024', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.7128', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.7128', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.115', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.115', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.036', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.036', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.07.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.07.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.651', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.651', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.911', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.911', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.25.01.10.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.25.01.10.017', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.247', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.247', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.15.05.140.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.15.05.140.008', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.240', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.240', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.047', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.047', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.242', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.242', '', 40, 0, 40, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.245', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.245', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.253', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.253', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3224', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3224', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.386', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.386', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.357.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.357.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.60', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.60', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.53', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.53', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.23.05.002.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.23.05.002.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.23.05.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.23.05.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.23.03.14.220', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.23.03.14.220', '', 26, 0, 26, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.356', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.356', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.30.06.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.30.06.01.003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.500', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.500', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.09.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.09.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.73.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.73.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.67.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.67.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.51.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.51.02.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3520', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3520', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.063', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.063', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.0801', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.0801', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.073', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.073', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.650', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.650', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3521', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3521', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.457', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.457', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.458', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.458', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.459', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.459', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.45.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.45.01.004', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.45.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.45.01.005', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.995', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.995', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.31.8.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.31.8.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.31.7.030.080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.31.7.030.080', '', 62, 0, 62, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.38', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.38', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.942.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.942.01', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.504', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.504', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.264', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.264', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.31.1.050.05.121', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.31.1.050.05.121', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.187.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.187.003', '', 29, 0, 29, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1786', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1786', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.507.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.507.1', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.506', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.506', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.125', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.125', '', 51, 0, 51, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.24', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.24', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('904.18.752', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '904.18.752', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.272', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.272', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('904.18.754', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '904.18.754', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.23', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.23', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.386', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.386', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.523.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.523.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.05.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.05.003', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.06.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.06.007', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.05.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.05.004', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.06.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.06.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.981', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.981', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.397', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.397', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.405', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.405', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.04.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.04.008', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.04.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.04.009', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.15.05.009.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.15.05.009.03', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.523.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.523.02', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.04.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.04.003', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.02.002', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.01.005', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1641', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1641', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.02.003.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.02.003.1', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.02.003.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.02.003.2', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.01.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.01.007', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.01.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.01.006', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.02.390.364.13', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.02.390.364.13', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1465', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1465', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1464', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1464', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.753.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.753.2', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1460', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1460', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.400', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.400', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.420', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.420', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.47.06.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.47.06.009', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.239', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.239', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S03000628', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S03000628', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.02.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.02.007', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.080', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.080', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.01.041', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.01.041', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.028', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.028', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.052', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.052', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.045', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.045', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.722', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.722', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.711', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.711', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.502', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.502', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.519', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.519', '', 104, 0, 104, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.519', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.519', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.701.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.701.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.019', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.019', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.513.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.513.1', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.021', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.021', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.703', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.703', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.520', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.520', '', 180, 0, 180, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.503', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.503', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('01603.01.503', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '01603.01.503', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.050', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.050', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.050.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.050.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.043', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.043', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.517', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.517', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.735', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.735', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.1004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.1004', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.01.037', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.01.037', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.525', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.525', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.739', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.739', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.519', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.519', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.747', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.747', '', 76, 0, 76, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.515', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.515', '', 104, 0, 104, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.031', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.031', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.03.024', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.03.024', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.740', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.740', '', 87, 0, 87, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.01.040', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.01.040', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.802', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.802', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.905', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.905', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.905.04', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.905.04', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.905.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.905.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.905.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.905.03', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.905.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.905.02', '', 22, 0, 22, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.026.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.026.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.524.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.524.1', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.19.721', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.19.721', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('01603.01.524', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '01603.01.524', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.026', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.026', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.805', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.805', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.70.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.70.02', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.144.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.144.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.18.5.07', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.18.5.07', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.030.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.030.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.022', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.523', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.523', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.029', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.029', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.03.030', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.03.030', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.11.400', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.11.400', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.01.903', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.01.903', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.19.0015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.19.0015', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.19.0017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.19.0017', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.19.0018', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.19.0018', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.19.0022', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.19.0022', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.19.0023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.19.0023', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.19.0002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.19.0002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.271', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.271', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.227', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.227', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.461', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.461', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('85.04.600.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '85.04.600.001', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('85.05.100.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '85.05.100.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.19.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.19.013', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.19.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.19.014', '', 39, 0, 39, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.01.045', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.01.045', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.14.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.14.005', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('85.01.400.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '85.01.400.001', '', 59, 0, 59, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.305', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.305', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.076.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.076.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.494', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.494', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.52.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.52.012', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.98.01.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.98.01.012', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.470', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.470', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.37.3.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.37.3.02.002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0105000102', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0105000102', '', 40, 0, 40, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.54.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.54.01.005', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.54.01.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.54.01.006', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.54.01.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.54.01.017', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.54.01.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.54.01.010', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.54.01.012', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.54.01.012', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.54.01.011', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.54.01.011', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4025', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4025', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('625.01.50.1140.102', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '625.01.50.1140.102', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3776', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3776', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.44.12.1224', '41431', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.44.12.1224', '41431', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S05000250', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S05000250', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.01.23.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.01.23.006', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.01.23.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.01.23.004', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.44.12.1225', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.44.12.1225', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.113', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.113', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.44.01.1805', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.44.01.1805', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1626', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1626', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.612', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.612', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.67.01.052', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.67.01.052', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3054', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3054', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('607.07.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '607.07.100', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.44.07.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.44.07.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.44.04.002.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.44.04.002.1', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.624', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.624', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.44.08.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.44.08.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.025', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.025', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.379', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.379', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.554', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.554', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0105000103', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0105000103', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.09.059', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.09.059', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.958', '57294', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.958', '57294', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.71.02.038', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.71.02.038', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.596', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.596', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.40.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.40.02.002', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('10.40.02.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '10.40.02.001', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.05.94', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.05.94', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.6930', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.6930', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2167', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2167', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2166', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2166', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2168', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2168', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2169', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2169', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2171', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2171', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2150', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2150', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.057', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.057', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.97.01.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.97.01.007', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('11.08.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '11.08.001', '', 37, 0, 37, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4005', '', 117, 0, 117, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.559', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.559', '', 225, 0, 225, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.54.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.54.01.001', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.54', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.54', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.110', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.110', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('301.14.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '301.14.002', '', 250, 0, 250, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('301.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '301.01.002', '', 37.34, 0, 37.34, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('31.12.332', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '31.12.332', '', 211, 0, 211, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('301.03.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '301.03.001', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.03.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.03.008', '', 60, 0, 60, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.995.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.995.003', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4861', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4861', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.388', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.388', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.7048', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.7048', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.909', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.909', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.524', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.524', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('XS.07.100.07', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'XS.07.100.07', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3868', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3868', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.48.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.48.01.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.48.01.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.48.01.004', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.57.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.57.01.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.489', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.489', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.04.314', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.04.314', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.914', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.914', '', 78, 0, 78, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('26.58.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '26.58.01.001', '', 24, 0, 24, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.33.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.33.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.33.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.33.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.03.20.411', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.03.20.411', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.45.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.45.001', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.45.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.45.002', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.45.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.45.003', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.44.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.44.001', '', 16, 0, 16, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.06.006', '37931', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.06.006', '37931', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.69.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.69.01.003', '', 1272, 0, 1272, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.340.37700.02', '522', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.340.37700.02', '522', 27, 0, 27, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.13.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.13.009', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.5170', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.5170', '', 500, 0, 500, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4991', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4991', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.57.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.57.01.001', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.38.1.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.38.1.02', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.02.154', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.02.154', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.34.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.34.001', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.520', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.520', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.973', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.973', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.03.424', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.03.424', '', 22, 0, 22, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4026', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4026', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('24.38.01.112', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '24.38.01.112', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('.ESMTRB.25.001.001', '36863', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '.ESMTRB.25.001.001', '36863', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('.ESMTRB.25.001.001', '1413', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '.ESMTRB.25.001.001', '1413', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('.ESMTR.25.0001.0001', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '.ESMTR.25.0001.0001', '0', 255, 0, 255, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.03.0030', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.03.0030', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.02.124', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.02.124', '', 282, 0, 282, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.043.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.043.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.27.01.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.27.01.100', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.046', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.046', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.320', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.320', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.040', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.040', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.014', '', 73, 0, 73, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.11.02.951', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.11.02.951', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.11.03.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.11.03.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.11.03.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.11.03.003', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('505.03.006', '42180', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '505.03.006', '42180', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.115', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.115', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.69.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.69.01.002', '', 2848, 0, 2848, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.461', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.461', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.05.052.01.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.05.052.01.1', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.05.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.05.004', '', 9, 0, 9, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.741', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.741', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.06.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.06.020', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('28.43.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '28.43.01.003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('XS.07.100.05', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'XS.07.100.05', '', 158, 0, 158, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('OCONS0104000017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'OCONS0104000017', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.34.01.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.34.01.001', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.518', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.518', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.411.500', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.411.500', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.285', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.285', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.06.14.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.06.14.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.252', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.252', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.42.12.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.42.12.004', '', 150, 0, 150, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.244', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.244', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.2.103', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.2.103', '', 200, 0, 200, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.506', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.506', '', 200, 0, 200, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.960', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.960', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.950', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.950', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.906', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.906', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.204', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.204', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.01.051', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.01.051', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.09.050', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.09.050', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.777', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.777', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.778', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.778', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.775', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.775', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.776', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.776', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1711', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1711', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.1712', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.1712', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.888', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.888', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.348', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.348', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.41.2.11.18', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.41.2.11.18', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.41.2.11.11', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.41.2.11.11', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.41.2.11.08', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.41.2.11.08', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.895', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.895', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.403', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.403', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.020', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.020', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.74.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.74.001', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.429', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.429', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('505.02.008', '273', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '505.02.008', '273', 0.5, 0, 0.5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.903', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.903', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.009.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.009.01', '', 33, 0, 33, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.2145', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.2145', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.023', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.023', '', 27, 0, 27, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.01.02.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.01.02.003', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.066', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.066', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.366', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.366', '', 17, 0, 17, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.023.2', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.023.2', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.023.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.023.1', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.939', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.939', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.911', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.911', '', 43, 0, 43, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.07.082', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.07.082', '', 11, 0, 11, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.07.015.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.07.015.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.126', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.126', '', 29, 0, 29, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.04.127', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.04.127', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.299', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.299', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.03.135', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.03.135', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.015', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.015', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('601.01.017', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '601.01.017', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.915', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.915', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('606.01.014', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '606.01.014', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.99.9002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.99.9002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.02.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.02.100', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.05.02.101', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.05.02.101', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.24.101', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.24.101', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('29.27.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '29.27.01.002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.04.502.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.04.502.02', '', 200, 0, 200, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.04.309.18', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.04.309.18', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('57.01.400.1900.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '57.01.400.1900.1', '', 800, 0, 800, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('18.33.004.09', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '18.33.004.09', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.36.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.36.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.14.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.14.002', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.28.02.800.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.28.02.800.006', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.400', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.400', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.28.02.250.050', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.28.02.250.050', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.61.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.61.001', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.01.78', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.01.78', '', 31, 0, 31, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('602.02.916', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '602.02.916', '', 435, 0, 435, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.67.02.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.67.02.001', '', 700, 0, 700, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.093.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.093.01', '', 15, 0, 15, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.04.80.002.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.04.80.002.01', '', 90000, 0, 90000, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.04.80.003.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.04.80.003.01', '', 600, 0, 600, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.0300.0450.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.0300.0450.01', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.001', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.05.040', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.05.040', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.996', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.996', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.002', '', 646, 0, 646, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.03.003.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.03.003.01', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('404.02.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '404.02.008', '', 57, 0, 57, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.133', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.133', '', 167, 0, 167, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.702.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.702.1', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.705.1', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.705.1', '', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.702', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.702', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.19.01.045', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.19.01.045', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('52.1.20.005.2.1', '36364', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '52.1.20.005.2.1', '36364', 55, 0, 55, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('52.1.20.005.2.1', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '52.1.20.005.2.1', '0', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('52.1.20.005.2.1', '42188', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '52.1.20.005.2.1', '42188', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('52.1.20.005.2.1', '37931', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '52.1.20.005.2.1', '37931', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('52.1.20.014.2.1', '27848', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '52.1.20.014.2.1', '27848', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.331', '28047', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.331', '28047', 13, 0, 13, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.331', '31826', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.331', '31826', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.03.010', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.03.010', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.302', '37931', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.302', '37931', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.302', '44399', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.302', '44399', 0.5, 0, 0.5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('504.02.302', '0', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '504.02.302', '0', 0.2, 0, 0.2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('503.04.571', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '503.04.571', '', 14, 0, 14, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.436', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.436', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.45.04.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.45.04.005', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.10.04.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.10.04.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.01.700', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.01.700', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3550', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3550', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S10000530', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S10000530', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('RPTS01S10000532', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', 'RPTS01S10000532', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.105', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.105', '', 54, 0, 54, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.07.10.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.07.10.013', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.4705', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.4705', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.36.01.240.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.36.01.240.004', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.36.01.240.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.36.01.240.003', '', 25, 0, 25, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.07.21.300', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.07.21.300', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.107', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.107', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.07.10.112', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.07.10.112', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.006', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.006', '', 8, 0, 8, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.738', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.738', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.02.007.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.02.007.01', '', 10, 0, 10, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.07.80.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.07.80.002', '', 118, 0, 118, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1030', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1030', '', 18, 0, 18, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1031', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1031', '', 122, 0, 122, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('409.12.1029', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '409.12.1029', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.07.71.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.07.71.100', '', 20, 0, 20, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('404.02.150', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '404.02.150', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.317', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.317', '', 12, 0, 12, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.07.61.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.07.61.100', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('404.02.057', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '404.02.057', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('404.01.007', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '404.01.007', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.296', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.296', '', 38, 0, 38, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('404.01.151', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '404.01.151', '', 5, 0, 5, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.39.10.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.39.10.004', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('9.39.10.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '9.39.10.003', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.80.18.903223', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.80.18.903223', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.434', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.434', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.728', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.728', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.96.01.005', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.96.01.005', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.25.01.10.100', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.25.01.10.100', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.96.02.028', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.96.02.028', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.25.01.10.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.25.01.10.002', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.96.01.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.96.01.002', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.29.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.29.01.003', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.96.02.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.96.02.003', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.15.05.011', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.15.05.011', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.15.05.008', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.15.05.008', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.41.01.013', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.41.01.013', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('605.03.484', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '605.03.484', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.15.3062', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.15.3062', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.31.01.030.220', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.31.01.030.220', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('13.31.01.050.220.002', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '13.31.01.050.220.002', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('21.68.03.004', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '21.68.03.004', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('15.68.14.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '15.68.14.001', '', 3, 0, 3, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.21.01.009', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.21.01.009', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('604.05.39', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '604.05.39', '', 100, 0, 100, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.09.058', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.09.058', '', 6, 0, 6, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('607.01.059', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '607.01.059', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.294.03', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.294.03', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.294.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.294.01', '', 2, 0, 2, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('603.02.294.02', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '603.02.294.02', '', 4, 0, 4, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('801.05.635', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '801.05.635', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('31.12.180.01', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '31.12.180.01', '', 2520, 0, 2520, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('20.90.60.001', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '20.90.60.001', '', 7, 0, 7, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('12.01.01.003', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '12.01.01.003', '', 21, 0, 21, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('14.20.01.030.030', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '14.20.01.030.030', '', 1, 0, 1, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('608.01.353', '', 'PRINCIPAL', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;
INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '608.01.353', '', 677, 0, 677, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', 'PRINCIPAL', 1);

COMMIT;
