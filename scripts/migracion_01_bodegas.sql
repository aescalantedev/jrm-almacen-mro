-- MIGRACIÓN DE DATOS (SIN USUARIOS LEGACY)
-- Como se limpiaremos los usuarios, quitamos la restricción NOT NULL en movimientos
ALTER TABLE movimientos ALTER COLUMN usuario_id DROP NOT NULL;

-- TABLA: bodegas
INSERT INTO bodegas (id, codigo, nombre, empresa_codigo, direccion, activo, created_at, created_by) VALUES (1, 'MRO-CHILCA', 'ALM MRO CHILCA', '001', 'CHILCA', 1, '2026-08-27 13:16:30', NULL) ON CONFLICT DO NOTHING;
INSERT INTO bodegas (id, codigo, nombre, empresa_codigo, direccion, activo, created_at, created_by) VALUES (2, 'ALM-PERNERIA', 'ALM PERNERIA CHILCA', '001', 'CHILCA', 1, '2026-08-27 17:00:48', NULL) ON CONFLICT DO NOTHING;
INSERT INTO bodegas (id, codigo, nombre, empresa_codigo, direccion, activo, created_at, created_by) VALUES (3, 'PERN-CHILCA', 'ALM PERNERIA CHILCA', '001', 'CHILCA', 1, '2026-08-27 17:01:23', NULL) ON CONFLICT DO NOTHING;
SELECT setval('bodegas_id_seq', (SELECT MAX(id) FROM bodegas));

