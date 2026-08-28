-- TABLA: tipos_almacenamiento
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (1, 'SUELTO', 'Almacenamiento Suelto', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (2, 'GAVETA', 'Gaveta / Casillero', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (3, 'EPP', 'Zona de EPP', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (4, 'CAJA', 'Caja / Bulto', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (5, 'PALLET', 'Pallet / Estiba', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (6, 'PISO', 'Piso Bodega', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (13, 'BOLSA', 'Bolsa Plástica / Sellada', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (14, 'EMPAQUE', 'Empaque de Fábrica', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (15, 'PAQUETE', 'Paquete / Atado', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (16, 'ROLLO', 'Rollo / Bobina', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (17, 'BIDON', 'Bidón / Tambor', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (18, 'BALDE', 'Balde Industrial', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (19, 'SPRAY', 'Lata / Aerosol', '') ON CONFLICT DO NOTHING;
INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES (20, 'SACO', 'Saco', '') ON CONFLICT DO NOTHING;
SELECT setval('tipos_almacenamiento_id_seq', (SELECT MAX(id) FROM tipos_almacenamiento));

