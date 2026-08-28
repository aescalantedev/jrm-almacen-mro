-- TABLA: contenedores
INSERT INTO contenedores (id, bodega_id, codigo_contenedor, nombre, zona, descripcion) VALUES (1, 1, 'CONT-01', 'CONTENEDOR 1', 'PATIO AFUERA', '') ON CONFLICT DO NOTHING;
INSERT INTO contenedores (id, bodega_id, codigo_contenedor, nombre, zona, descripcion) VALUES (2, 1, 'CONT-02', 'Contenedor 2 - Repuestos Pesados', 'PATIO PRINCIPAL', '') ON CONFLICT DO NOTHING;
INSERT INTO contenedores (id, bodega_id, codigo_contenedor, nombre, zona, descripcion) VALUES (3, 1, 'C.C.01', 'CONTENEDOR 2', 'DENTRO ALMCEN 2DO PISO', '') ON CONFLICT DO NOTHING;
SELECT setval('contenedores_id_seq', (SELECT MAX(id) FROM contenedores));

