-- Actualizacion de Conteo Fisico

BEGIN;

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 15.5,
    ancho = 17.5,
    alto = 10,
    peso_total_cant_fisica = 8.998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.04.002';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, Cajas',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0.5,
    ancho = 16,
    alto = 0.55,
    peso_total_cant_fisica = 0.126,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.08.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10,
    ancho = 10,
    alto = 6.5,
    peso_total_cant_fisica = 7.738,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.21.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = 'CAJA #12',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 21,
    ancho = 10,
    alto = 0.5,
    peso_total_cant_fisica = 0.124,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.022';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = 'CAJA #12',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 25,
    ancho = 10,
    alto = 0.5,
    peso_total_cant_fisica = 0.086,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.024';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = 'CAJA #12',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 39,
    ancho = 12,
    alto = 0.5,
    peso_total_cant_fisica = 0.137,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.030';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA #12',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 59,
    ancho = 12,
    alto = 0.5,
    peso_total_cant_fisica = 0.692,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.093';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 8,
    ancho = 0.5,
    alto = 0,
    peso_total_cant_fisica = 0.126,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.02.704.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 8.5,
    ancho = 4.5,
    alto = 0,
    peso_total_cant_fisica = 4.394,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.984';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.5,
    ancho = 1,
    alto = 0,
    peso_total_cant_fisica = 0.07,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.426';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5,
    ancho = 0.5,
    alto = 0,
    peso_total_cant_fisica = 0.01,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.163';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 16,
    ancho = 15,
    alto = 0.5,
    peso_total_cant_fisica = 0.032,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1290.011';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 2,
    ancho = 1.5,
    alto = 12,
    peso_total_cant_fisica = 0.082,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.06.174.2';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5.8,
    ancho = 5,
    alto = 0.3,
    peso_total_cant_fisica = 0.794,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.03.20.0330.341';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 1.8,
    alto = 0,
    peso_total_cant_fisica = 0.11,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.23.01.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 38.5,
    ancho = 7.5,
    alto = 2,
    peso_total_cant_fisica = 0.228,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.431.03';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 36,
    ancho = 10,
    alto = 1.5,
    peso_total_cant_fisica = 0.131,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.431.02';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 23,
    ancho = 12,
    alto = 1.5,
    peso_total_cant_fisica = 0.234,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.04.358';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 7,
    ancho = 4,
    alto = 0.5,
    peso_total_cant_fisica = 0.032,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4717';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 32,
    ancho = 3,
    alto = 1.5,
    peso_total_cant_fisica = 0.071,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.06.005';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 40.5,
    ancho = 3,
    alto = 0,
    peso_total_cant_fisica = 0.54,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.919.21';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 70,
    ancho = 1.5,
    alto = 0,
    peso_total_cant_fisica = 0.69,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.919.20';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5,
    ancho = 1.5,
    alto = 0,
    peso_total_cant_fisica = 0.295,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.944';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 4.5,
    ancho = 4.5,
    alto = 5,
    peso_total_cant_fisica = 0.037,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.54.01.017';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 23.5,
    ancho = 5,
    alto = 0,
    peso_total_cant_fisica = 1.224,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.05.94';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 26.5,
    ancho = 5,
    alto = 2.5,
    peso_total_cant_fisica = 0.075,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.13.009';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 4,
    ancho = 3.5,
    alto = 1.5,
    peso_total_cant_fisica = 0.047,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.950';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 11',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 31,
    ancho = 11.5,
    alto = 1.5,
    peso_total_cant_fisica = 0.662,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.204';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 34,
    ancho = 33,
    alto = 1.5,
    peso_total_cant_fisica = 12,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2144';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6,
    ancho = 7,
    alto = 0.1,
    peso_total_cant_fisica = 0.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.369';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 8,
    ancho = 7,
    alto = 0.5,
    peso_total_cant_fisica = 0.3,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.389';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.1,
    peso_total_cant_fisica = 0.021,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.350.01';

UPDATE inventario 
SET cantidad_fisica = 84,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10,
    ancho = 9.5,
    alto = 0.5,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.307';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 12,
    alto = 0.1,
    peso_total_cant_fisica = 0.016,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.246';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 10,
    alto = 0.5,
    peso_total_cant_fisica = 0.039,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.352';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 13,
    ancho = 9,
    alto = 0.5,
    peso_total_cant_fisica = 0.01464,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.447';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 13,
    ancho = 9,
    alto = 0.5,
    peso_total_cant_fisica = 0.01464,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.446';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 13,
    ancho = 9,
    alto = 0.5,
    peso_total_cant_fisica = 0.01464,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.445';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.1,
    peso_total_cant_fisica = 0.012,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.390.03';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 11,
    ancho = 10,
    alto = 0.1,
    peso_total_cant_fisica = 0.105,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.055.6';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10,
    ancho = 9,
    alto = 0,
    peso_total_cant_fisica = 0.42,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.055.5';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 11,
    ancho = 10,
    alto = 1,
    peso_total_cant_fisica = 0.285,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.055.4';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10,
    ancho = 9,
    alto = 0.1,
    peso_total_cant_fisica = 0.14,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.437.11';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.1,
    peso_total_cant_fisica = 0.06,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.437.10';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 8,
    ancho = 5.5,
    alto = 0.3,
    peso_total_cant_fisica = 0.018000000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.437.12';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 15,
    ancho = 12,
    alto = 0.1,
    peso_total_cant_fisica = 0.026,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.385';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.1,
    peso_total_cant_fisica = 0.007,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.350';

UPDATE inventario 
SET cantidad_fisica = 37,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.1,
    peso_total_cant_fisica = 3.256,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.382';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9.5,
    ancho = 12,
    alto = 0.5,
    peso_total_cant_fisica = 0.011,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.615.500';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 18,
    ancho = 16,
    alto = 0.1,
    peso_total_cant_fisica = 0.005,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.246.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 18,
    ancho = 16,
    alto = 0.1,
    peso_total_cant_fisica = 0.004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.115.561';

UPDATE inventario 
SET cantidad_fisica = 9,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.1,
    peso_total_cant_fisica = 0.036000000000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.439.2';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 20,
    alto = 1,
    peso_total_cant_fisica = 0.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.045.352';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 20,
    alto = 1,
    peso_total_cant_fisica = 0.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.045.351';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 5,
    peso_total_cant_fisica = 0.014,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.615.501';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2,
    alto = 0.1,
    peso_total_cant_fisica = 0.002996,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1445';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10,
    ancho = 8,
    alto = 0.2,
    peso_total_cant_fisica = 0.12,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1444';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 5,
    alto = 0.1,
    peso_total_cant_fisica = 0.018,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.038.300';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 12,
    alto = 0.3,
    peso_total_cant_fisica = 0.16,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.038.350';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 1,
    alto = 0.01,
    peso_total_cant_fisica = 0.000014,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1443';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 20,
    ancho = 19,
    alto = 1,
    peso_total_cant_fisica = 0.024959999999999996,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.354.03';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.1,
    peso_total_cant_fisica = 0.014,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.295';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 14.5,
    alto = 1.5,
    peso_total_cant_fisica = 0.069,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.54.01.008';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 10,
    alto = 1.5,
    peso_total_cant_fisica = 0.032,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '54.01.006';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 18,
    ancho = 12,
    alto = 2,
    peso_total_cant_fisica = 0.66,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '54.01.007';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 14,
    alto = 0.5,
    peso_total_cant_fisica = 0.166,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.54.01.005';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 11,
    alto = 1,
    peso_total_cant_fisica = 0.02,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.54.01.006';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 6,
    alto = 1,
    peso_total_cant_fisica = 0.018000000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.54.01.011';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 10',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 11.5,
    ancho = 9,
    alto = 0.5,
    peso_total_cant_fisica = 0.009,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.294.03';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 13,
    alto = 1,
    peso_total_cant_fisica = 0.066,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.02.02.098';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10.5,
    ancho = 10.5,
    alto = 2,
    peso_total_cant_fisica = 0.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.24';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 13.8,
    alto = 1.3,
    peso_total_cant_fisica = 0.45,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '904.18.752';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 22,
    ancho = 18,
    alto = 2,
    peso_total_cant_fisica = 0.405,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.272';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10.5,
    ancho = 10.5,
    alto = 2,
    peso_total_cant_fisica = 0.326,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.23';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 11,
    ancho = 7,
    alto = 0.5,
    peso_total_cant_fisica = 0.11099999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.386';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 6,
    alto = 0.5,
    peso_total_cant_fisica = 0.037,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.523.01';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 1.2,
    peso_total_cant_fisica = 0.331,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.05.003';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 6,
    alto = 0.3,
    peso_total_cant_fisica = 0.027,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.06.007';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 5.5,
    alto = 0.3,
    peso_total_cant_fisica = 0.021,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.05.004';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 6.2,
    alto = 0.7,
    peso_total_cant_fisica = 0.027,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.981';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.5,
    peso_total_cant_fisica = 0.014,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.405';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 7,
    ancho = 7,
    alto = 1,
    peso_total_cant_fisica = 0.014,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.04.008';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 6,
    alto = 1,
    peso_total_cant_fisica = 0.026,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.04.009';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 12,
    ancho = 10,
    alto = 0.5,
    peso_total_cant_fisica = 0.0018,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.15.05.009.03';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.5,
    ancho = 6.5,
    alto = 1.5,
    peso_total_cant_fisica = 0.029,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.523.02';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 1,
    peso_total_cant_fisica = 0.216,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.04.003';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 20,
    alto = 1.5,
    peso_total_cant_fisica = 0.17550000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.01.005';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 33,
    ancho = 19,
    alto = 3,
    peso_total_cant_fisica = 0.242,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1641';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 17,
    alto = 0.5,
    peso_total_cant_fisica = 0.066,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.02.003.1';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 12.8,
    alto = 1,
    peso_total_cant_fisica = 0.234,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.01.007';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 15.5,
    alto = 2,
    peso_total_cant_fisica = 1.25,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1465';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 39,
    alto = 1.8,
    peso_total_cant_fisica = 0.487,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1464';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 8.3,
    alto = 1,
    peso_total_cant_fisica = 0.0192,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.753.2';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 14,
    alto = 1.1,
    peso_total_cant_fisica = 0.232,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1460';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 5.5,
    alto = 0.5,
    peso_total_cant_fisica = 0.013,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.400';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 1.5,
    peso_total_cant_fisica = 0.049,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.420';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 8,
    ancho = 8,
    alto = 1.5,
    peso_total_cant_fisica = 0.109,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.06.009';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 09',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3.5,
    alto = 0.5,
    peso_total_cant_fisica = 0.046,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.239';

UPDATE inventario 
SET cantidad_fisica = 40,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5,
    ancho = 5,
    alto = 0.3,
    peso_total_cant_fisica = 4.92,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1690';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 11,
    ancho = 11,
    alto = 10,
    peso_total_cant_fisica = 6.374,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.958.07';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 2.7,
    ancho = 2.7,
    alto = 1,
    peso_total_cant_fisica = 0.14400000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.955';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 0.5,
    peso_total_cant_fisica = 0.165,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.953';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2,
    alto = 1,
    peso_total_cant_fisica = 0.072,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.092|';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5,
    ancho = 1.8,
    alto = 0.03,
    peso_total_cant_fisica = 0.16799999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1054';

UPDATE inventario 
SET cantidad_fisica = 25,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 1.5,
    peso_total_cant_fisica = 0.169,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.765';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 3.7,
    ancho = 2.5,
    alto = 1,
    peso_total_cant_fisica = 0.144,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.20.060';

UPDATE inventario 
SET cantidad_fisica = 35,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 4,
    ancho = 3.5,
    alto = 2,
    peso_total_cant_fisica = 1.225,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.071';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 3,
    ancho = 3,
    alto = 1.3,
    peso_total_cant_fisica = 0.19,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.021';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 1.5,
    ancho = 4,
    alto = 4,
    peso_total_cant_fisica = 1.1280000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.630';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5.5,
    ancho = 5.5,
    alto = 6,
    peso_total_cant_fisica = 0.063,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.01.043';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 4.2,
    ancho = 4,
    alto = 1.7,
    peso_total_cant_fisica = 0.64,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.240';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 15,
    ancho = 9,
    alto = 11,
    peso_total_cant_fisica = 0.982,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.076.01';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 08',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 11,
    alto = 0.3,
    peso_total_cant_fisica = 0.12,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.424';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 5.2,
    alto = 3.2,
    peso_total_cant_fisica = 0.95,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1452';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 8,
    alto = 9,
    peso_total_cant_fisica = 2.706,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.958.06';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9.5,
    ancho = 4.5,
    alto = 2.8,
    peso_total_cant_fisica = 0.07,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.129';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 7,
    ancho = 7,
    alto = 10,
    peso_total_cant_fisica = 0.42599999999999993,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.049.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 8,
    ancho = 8,
    alto = 3,
    peso_total_cant_fisica = 0.099,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.01.6.004';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5.5,
    ancho = 7.5,
    alto = 3.3,
    peso_total_cant_fisica = 0.148,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.15.01.10.452';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6,
    ancho = 9,
    alto = 3.8,
    peso_total_cant_fisica = 1.53,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.15.01.10.451';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.5,
    ancho = 8.5,
    alto = 8.5,
    peso_total_cant_fisica = 0.576,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.463.01';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3,
    alto = 1,
    peso_total_cant_fisica = 0.15,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.072.1';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 5,
    alto = 11,
    peso_total_cant_fisica = 2.576,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '0113.14.2.06.051';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 10,
    ancho = 9,
    alto = 5,
    peso_total_cant_fisica = 0.852,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.30.04.220.01';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 13,
    ancho = 15,
    alto = 6,
    peso_total_cant_fisica = 0.85,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.30.01.038.221';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 6.5,
    alto = 1.8,
    peso_total_cant_fisica = 0.098,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.021';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 0.65,
    alto = 0.27,
    peso_total_cant_fisica = 0.01,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.076.4008';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 7,
    ancho = 14,
    alto = 9,
    peso_total_cant_fisica = 0.257,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.342.01';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3.8,
    alto = 0.2,
    peso_total_cant_fisica = 0.05,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.06.003';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 15,
    alto = 2.7,
    peso_total_cant_fisica = 1.023,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.403';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 20,
    ancho = 5,
    alto = 5,
    peso_total_cant_fisica = 3.546,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.45.02';

UPDATE inventario 
SET cantidad_fisica = 17,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 12,
    ancho = 7,
    alto = 1.3,
    peso_total_cant_fisica = 0.23800000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.05.001';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 20,
    alto = 3,
    peso_total_cant_fisica = 2.38,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.206.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5.2,
    ancho = 8.5,
    alto = 4.3,
    peso_total_cant_fisica = 0.268,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.393';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 2.5,
    ancho = 2,
    alto = 4.6,
    peso_total_cant_fisica = 0.14,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.253';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3,
    alto = 0.5,
    peso_total_cant_fisica = 0.06,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.45.01.004';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2,
    alto = 1,
    peso_total_cant_fisica = 0.025,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.45.01.005';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 16,
    ancho = 10,
    alto = 2.5,
    peso_total_cant_fisica = 0.109,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.06.14.002';

UPDATE inventario 
SET cantidad_fisica = 28,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9.5,
    ancho = 2,
    alto = 7,
    peso_total_cant_fisica = 1.736,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.009.01';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 07',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3,
    alto = 0.5,
    peso_total_cant_fisica = 0.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.007.01';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 28',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 12,
    alto = 8.3,
    peso_total_cant_fisica = 0.237,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3879';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 28',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 22,
    alto = 8,
    peso_total_cant_fisica = 0.456,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3881';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 28',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 8,
    ancho = 8,
    alto = 6,
    peso_total_cant_fisica = 2.436,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.33.004.10';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 28',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 25,
    ancho = 15,
    alto = 9,
    peso_total_cant_fisica = 6.676,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1722';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 28',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 18,
    ancho = 3,
    alto = 3.9,
    peso_total_cant_fisica = 0.304,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.33.004.06';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 28',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 5,
    alto = 5.5,
    peso_total_cant_fisica = 0.066,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.314';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, Bolsa',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.6,
    ancho = 0.6,
    alto = 0.2,
    peso_total_cant_fisica = 0.426,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1486';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 5,
    alto = 2,
    peso_total_cant_fisica = 0.242,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.023';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 5.2,
    ancho = 4,
    alto = 1.9,
    peso_total_cant_fisica = 0.392,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.20.120';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 5.5,
    ancho = 4,
    alto = 1.5,
    peso_total_cant_fisica = 0.21999999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1789';

UPDATE inventario 
SET cantidad_fisica = 9,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 2,
    alto = 3.2,
    peso_total_cant_fisica = 0.351,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.04.012';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 8,
    ancho = 6,
    alto = 2,
    peso_total_cant_fisica = 0.138,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.07.014';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 2,
    ancho = 2.3,
    alto = 1,
    peso_total_cant_fisica = 0.06,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.22.060';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 2.5,
    alto = 1.2,
    peso_total_cant_fisica = 0.34,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.04.010';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 4,
    ancho = 5,
    alto = 1.2,
    peso_total_cant_fisica = 0.8,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.02.04.034';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 5,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9,
    ancho = 11,
    alto = 0.5,
    peso_total_cant_fisica = 0.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.550';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 10,
    alto = 0.5,
    peso_total_cant_fisica = 0.025,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.516';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 55,
    ancho = 1,
    alto = 0,
    peso_total_cant_fisica = 0.11,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.233';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 5,
    alto = 1.5,
    peso_total_cant_fisica = 0.3,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.024';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 4,
    ancho = 4,
    alto = 1,
    peso_total_cant_fisica = 0.74,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.15.05.140.008';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 3,
    alto = 0.3,
    peso_total_cant_fisica = 0.004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.01.006';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 2.3,
    peso_total_cant_fisica = 0.308,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6823';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 26',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 1.8,
    peso_total_cant_fisica = 0.429,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1750';

UPDATE inventario 
SET cantidad_fisica = 21,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 11,
    ancho = 9,
    alto = 2,
    peso_total_cant_fisica = 7.223999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.274';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 3,
    ancho = 1,
    alto = 0,
    peso_total_cant_fisica = 0.004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.078';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 39,
    ancho = 32,
    alto = 3,
    peso_total_cant_fisica = 2.07,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.14.01.001';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 34,
    ancho = 16,
    alto = 5,
    peso_total_cant_fisica = 0.926,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.108';

UPDATE inventario 
SET cantidad_fisica = 116,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 12,
    ancho = 7,
    alto = 1,
    peso_total_cant_fisica = 1.9720000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.514';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 3,
    ancho = 1,
    alto = 0,
    peso_total_cant_fisica = 0.177,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.063';

UPDATE inventario 
SET cantidad_fisica = 62,
    dif = -40,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 3.2,
    ancho = 0.5,
    alto = 0,
    peso_total_cant_fisica = 0.8742,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.197';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 32,
    ancho = 11,
    alto = 1.5,
    peso_total_cant_fisica = 1.436,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.051';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 7,
    peso_total_cant_fisica = 0.30000000000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.066';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 24.5,
    ancho = 2.5,
    alto = 3,
    peso_total_cant_fisica = 3467,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.023.2';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 4,
    alto = 8,
    peso_total_cant_fisica = 0.043,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.49.01.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 12,
    ancho = 5.5,
    alto = 3,
    peso_total_cant_fisica = 0.25,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.111';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 13,
    ancho = 6.5,
    alto = 4.5,
    peso_total_cant_fisica = 1.806,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.861';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 13,
    alto = 13,
    peso_total_cant_fisica = 0.201,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.222';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 17,
    ancho = 6.5,
    alto = 6.5,
    peso_total_cant_fisica = 0.069,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.07.08.001';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 5,
    ancho = 5,
    alto = 2,
    peso_total_cant_fisica = 0.10200000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.080';

UPDATE inventario 
SET cantidad_fisica = 104,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 5,
    ancho = 5,
    alto = 2,
    peso_total_cant_fisica = 3.5360000000000005,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.515';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 15,
    ancho = 8.5,
    alto = 5,
    peso_total_cant_fisica = 0.265,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.09.050';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'Nivel 2, Caja',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 14,
    ancho = 0.4,
    alto = 0.4,
    peso_total_cant_fisica = 1.45,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.212';

UPDATE inventario 
SET cantidad_fisica = 9,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 25',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 15.5,
    ancho = 9,
    alto = 0,
    peso_total_cant_fisica = 1.6019999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.126';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 25',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 21,
    ancho = 11,
    alto = 0,
    peso_total_cant_fisica = 2.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.127';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 18,
    ancho = 14,
    alto = 0,
    peso_total_cant_fisica = 0.303,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4902';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 14,
    ancho = 7.03,
    alto = 4.5,
    peso_total_cant_fisica = 4.438,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.30.5.300';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 15,
    ancho = 9,
    alto = 5,
    peso_total_cant_fisica = 3.6,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4379';

UPDATE inventario 
SET cantidad_fisica = 50,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 24',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 195.6,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.01.04.006';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 24',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 34.1,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.01.18.001';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 24',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0.964,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.411';

UPDATE inventario 
SET cantidad_fisica = 13,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 10,
    ancho = 3.5,
    alto = 1.5,
    peso_total_cant_fisica = 2.015,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.116';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 12,
    ancho = 6.5,
    alto = 6.5,
    peso_total_cant_fisica = 0.42,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.301';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 7,
    ancho = 5,
    alto = 7,
    peso_total_cant_fisica = 2.31,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.03.021';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2,
    alto = 2,
    peso_total_cant_fisica = 0.03696,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.378';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 13,
    ancho = 8,
    alto = 3,
    peso_total_cant_fisica = 0.12,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.299';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 11,
    alto = 0.4,
    peso_total_cant_fisica = 0.235,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '53.6.10.016.1';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 12.5,
    alto = 0.3,
    peso_total_cant_fisica = 0.195,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '53.6.10.018.1';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 2.5,
    peso_total_cant_fisica = 0.29700000000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.400.0203';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 14,
    ancho = 14,
    alto = 6,
    peso_total_cant_fisica = 1.059,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.941';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 7,
    alto = 4,
    peso_total_cant_fisica = 0.149,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.06.30.036.1';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 2.5,
    alto = 2.7,
    peso_total_cant_fisica = 0.26,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.06.30.035.1';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 6.5,
    alto = 2.5,
    peso_total_cant_fisica = 0.576,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.68.05.007';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 5,
    ancho = 5,
    alto = 10,
    peso_total_cant_fisica = 0.858,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.001.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 10,
    alto = 21,
    peso_total_cant_fisica = 0.731,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.586.2';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 11,
    alto = 0.5,
    peso_total_cant_fisica = 0.13,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1767';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 7.5,
    ancho = 6,
    alto = 0.2,
    peso_total_cant_fisica = 0.06,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.551';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 1,
    alto = 0.5,
    peso_total_cant_fisica = 0.015,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '16.1.760.LS';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9.7,
    ancho = 4,
    alto = 0.7,
    peso_total_cant_fisica = 0.007,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.34.01.010';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9,
    ancho = 5,
    alto = 1.5,
    peso_total_cant_fisica = 0.076,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.12.009';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9,
    ancho = 5,
    alto = 1.5,
    peso_total_cant_fisica = 0.023,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.46.03.516.180';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 4,
    alto = 4.5,
    peso_total_cant_fisica = 0.054,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.36.11.651.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 0.3,
    peso_total_cant_fisica = 0.39,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.48.004';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 8.5,
    ancho = 5.5,
    alto = 7.5,
    peso_total_cant_fisica = 0.361,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.610';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 7,
    ancho = 9,
    alto = 3.5,
    peso_total_cant_fisica = 0.143,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.361.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 7.5,
    ancho = 10,
    alto = 4,
    peso_total_cant_fisica = 0.217,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.15.05.010';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 26,
    ancho = 26,
    alto = 10.5,
    peso_total_cant_fisica = 1.93,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1766';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 6,
    alto = 0.7,
    peso_total_cant_fisica = 0.094,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.29.02.002';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9.7,
    ancho = 4,
    alto = 0.7,
    peso_total_cant_fisica = 0.031,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.341';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9.7,
    ancho = 4,
    alto = 0.7,
    peso_total_cant_fisica = 0.10300000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1080';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '',
    largo = 9.7,
    ancho = 4,
    alto = 0.7,
    peso_total_cant_fisica = 0.031,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.044';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9.5,
    ancho = 10,
    alto = 12,
    peso_total_cant_fisica = 0.065,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.08.04.002';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 2.5,
    alto = 0.3,
    peso_total_cant_fisica = 0.048,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.340.1';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 2.5,
    alto = 0.1,
    peso_total_cant_fisica = 0.01095,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.340.2';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 7.5,
    alto = 4.5,
    peso_total_cant_fisica = 0.502,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.02.0300.01';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 15,
    ancho = 4,
    alto = 1,
    peso_total_cant_fisica = 0.108,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.93.01.032';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 7,
    alto = 2,
    peso_total_cant_fisica = 0.075,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.357.01';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1 C, Bolsa',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.4,
    ancho = 0.9,
    alto = 0.9,
    peso_total_cant_fisica = 1.072,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.01.045';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 2,
    peso_total_cant_fisica = 0.158,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.71.02.038';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 2.5,
    alto = 3,
    peso_total_cant_fisica = 0.09,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.043.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 2,
    alto = 2,
    peso_total_cant_fisica = 0.086,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.320';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 9,
    alto = 15.5,
    peso_total_cant_fisica = 2.273,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.0300.0450.01';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 12,
    alto = 1.6,
    peso_total_cant_fisica = 1.6949999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.02.702.1';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 10,
    alto = 1.2,
    peso_total_cant_fisica = 2,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.02.702';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 6.5,
    alto = 1,
    peso_total_cant_fisica = 0.26,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.01.045';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 9,
    ancho = 4,
    alto = 2,
    peso_total_cant_fisica = 0.229,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.45.04.005';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 6.5,
    alto = 1.7,
    peso_total_cant_fisica = 0.544,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.728';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 23,
    ancho = 14,
    alto = 8.5,
    peso_total_cant_fisica = 1.204,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.96.02.028';

UPDATE inventario 
SET cantidad_fisica = 100,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 0.8,
    alto = 0.8,
    peso_total_cant_fisica = 0.073,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.39';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 6.5,
    alto = 7,
    peso_total_cant_fisica = 0.238,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.81.03.001';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 41,
    ancho = 4.5,
    alto = 4.5,
    peso_total_cant_fisica = 1.156,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.380';

UPDATE inventario 
SET cantidad_fisica = 210,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 5.5,
    ancho = 2.5,
    alto = 0,
    peso_total_cant_fisica = 3.9899999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '199.ENG.40.0028.0064';

UPDATE inventario 
SET cantidad_fisica = 352,
    dif = 79,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 4,
    alto = 1,
    peso_total_cant_fisica = 2.112,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.949';

UPDATE inventario 
SET cantidad_fisica = 158,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 4.4,
    ancho = 1.5,
    alto = 0.024,
    peso_total_cant_fisica = 3.7920000000000003,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.362';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 7,
    ancho = 3,
    alto = 0,
    peso_total_cant_fisica = 0.432,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.9002';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 17,
    ancho = 13,
    alto = 11,
    peso_total_cant_fisica = 0.224,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.155.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 18,
    ancho = 12,
    alto = 6.5,
    peso_total_cant_fisica = 0.464,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.66.001';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 7.5,
    ancho = 7.5,
    alto = 1,
    peso_total_cant_fisica = 0.14,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.07.017';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 7.5,
    ancho = 7.5,
    alto = 1,
    peso_total_cant_fisica = 0.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.07.018';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 7.5,
    ancho = 7.5,
    alto = 1,
    peso_total_cant_fisica = 0.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.07.015';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 7.5,
    ancho = 7.5,
    alto = 1,
    peso_total_cant_fisica = 0.09,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.07.016';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Caja',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 28,
    ancho = 10,
    alto = 21.05,
    peso_total_cant_fisica = 1.48,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.1159';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 13,
    ancho = 6.5,
    alto = 4.5,
    peso_total_cant_fisica = 0.05,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '625.01.50.1140.102';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 20,
    ancho = 17,
    alto = 1,
    peso_total_cant_fisica = 0.189,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.113';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 14,
    ancho = 12,
    alto = 12,
    peso_total_cant_fisica = 1.456,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1626';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 7.7,
    alto = 3.5,
    peso_total_cant_fisica = 0.186,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.44.07.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 19',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 24,
    ancho = 8,
    alto = 3.7,
    peso_total_cant_fisica = 1.438,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.96.02.003';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 38',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 12,
    ancho = 12,
    alto = 14,
    peso_total_cant_fisica = 0.124,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3997';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 38',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 25,
    alto = 10,
    peso_total_cant_fisica = 1.37,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3998';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 38',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 19,
    ancho = 14,
    alto = 1,
    peso_total_cant_fisica = 0.014,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3999';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 19.5,
    ancho = 6,
    alto = 3,
    peso_total_cant_fisica = 0.79,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6344';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 20,
    ancho = 7,
    alto = 4,
    peso_total_cant_fisica = 2.19,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6343';

UPDATE inventario 
SET cantidad_fisica = 34,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3.5,
    alto = 5,
    peso_total_cant_fisica = 3.3320000000000003,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.90.004';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 7,
    alto = 7,
    peso_total_cant_fisica = 1.113,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.100.8511';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3,
    alto = 5,
    peso_total_cant_fisica = 0.068,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.340.37700.01';

UPDATE inventario 
SET cantidad_fisica = 27,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3.5,
    alto = 4,
    peso_total_cant_fisica = 1.782,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.340.37700.02';

UPDATE inventario 
SET cantidad_fisica = 118,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2,
    alto = 5.5,
    peso_total_cant_fisica = 4.838,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.07.80.002';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 7,
    ancho = 3,
    alto = 5,
    peso_total_cant_fisica = 1.1880000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.25.01.10.002';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 32',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 11,
    ancho = 6,
    alto = 19,
    peso_total_cant_fisica = 4.576,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.30.5.006';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 32',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 9,
    ancho = 5,
    alto = 1.5,
    peso_total_cant_fisica = 0.207,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.016.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 32',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 25,
    ancho = 4.5,
    alto = 0,
    peso_total_cant_fisica = 2.009,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4177';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 32',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 21,
    ancho = 10,
    alto = 5.5,
    peso_total_cant_fisica = 1.882,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.53.02.121.220';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 32',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 5,
    alto = 10,
    peso_total_cant_fisica = 3.95,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.942.01';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 32',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 7,
    alto = 8,
    peso_total_cant_fisica = 10.51,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.14.005';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 1.248,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.17';

UPDATE inventario 
SET cantidad_fisica = 59,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 7,
    alto = 10,
    peso_total_cant_fisica = 13.511000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '85.01.400.001';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 30',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 18,
    ancho = 5,
    alto = 9,
    peso_total_cant_fisica = 1.332,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.15.241019';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 30',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 16,
    alto = 9.5,
    peso_total_cant_fisica = 5.28,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.24.006';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 30',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 3.5,
    peso_total_cant_fisica = 1.7399999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.24.007';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 30',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 3.5,
    alto = 21,
    peso_total_cant_fisica = 5.466,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.34.001';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 26,
    ancho = 11,
    alto = 3,
    peso_total_cant_fisica = 0.74,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.014';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 2.19,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.865';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = -65,
    observacion = 'FALTANTE',
    comentario = 'ROLLO X 10 UND  PESO 0.763',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 7.5,
    alto = 2,
    peso_total_cant_fisica = 0.9156000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.056';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = 'ROLLO X 10 UND  PESO 0.105',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 6,
    alto = 2,
    peso_total_cant_fisica = 0.21000000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.304';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 30,
    ancho = 22,
    alto = 2,
    peso_total_cant_fisica = 1.764,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.285';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 37,
    ancho = 24,
    alto = 2,
    peso_total_cant_fisica = 0.47,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.059';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 5,
    ancho = 4,
    alto = 4,
    peso_total_cant_fisica = 0.051,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1533';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 12,
    ancho = 7,
    alto = 7,
    peso_total_cant_fisica = 0.267,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1534';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1 C, cajas',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0.33,
    ancho = 0.43,
    alto = 0.35,
    peso_total_cant_fisica = 0.78,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3224';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 23,
    ancho = 10,
    alto = 4.5,
    peso_total_cant_fisica = 0.09,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '607.07.096';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 15,
    ancho = 14.5,
    alto = 6,
    peso_total_cant_fisica = 1.54,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2147';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 26,
    ancho = 7,
    alto = 7,
    peso_total_cant_fisica = 1.095,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.50.01.50.0011.02';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 17,
    alto = 1,
    peso_total_cant_fisica = 0.136,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.549';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 5,
    ancho = 5,
    alto = 3,
    peso_total_cant_fisica = 0.43499999999999994,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2111';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 13,
    ancho = 12,
    alto = 0.5,
    peso_total_cant_fisica = 0.007,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3055';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 10,
    ancho = 7,
    alto = 1.5,
    peso_total_cant_fisica = 0.34,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2146';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 29',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 3.5,
    ancho = 3.5,
    alto = 6.5,
    peso_total_cant_fisica = 0.14,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.23.05.002';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = -85,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 2.5,
    ancho = 2.5,
    alto = 0.2,
    peso_total_cant_fisica = 0.005,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.915';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = -45,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 3.5,
    ancho = 0.6,
    alto = 0,
    peso_total_cant_fisica = 0.19499999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.065.01';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 17,
    ancho = 9,
    alto = 2,
    peso_total_cant_fisica = 3.96,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.300.001';

UPDATE inventario 
SET cantidad_fisica = 89,
    dif = 55,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 12,
    ancho = 9,
    alto = 2,
    peso_total_cant_fisica = 3.8269999999999995,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.022';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 19,
    ancho = 7,
    alto = 2,
    peso_total_cant_fisica = 1.9600000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.243';

UPDATE inventario 
SET cantidad_fisica = 93,
    dif = 35,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 18,
    ancho = 13,
    alto = 2.5,
    peso_total_cant_fisica = 28.923,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.020';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -55,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 3.3,
    ancho = 0.5,
    alto = 0,
    peso_total_cant_fisica = 0.01,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.937';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 13,
    ancho = 7,
    alto = 3,
    peso_total_cant_fisica = 1.127,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.227';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 4.5,
    ancho = 4.5,
    alto = 2.7,
    peso_total_cant_fisica = 0.407,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '24.38.01.112';

UPDATE inventario 
SET cantidad_fisica = 36,
    dif = 9,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 15,
    ancho = 13,
    alto = 3,
    peso_total_cant_fisica = 35.316,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.023';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 27',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 12,
    alto = 29,
    peso_total_cant_fisica = 1.452,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.016';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 25,
    ancho = 13,
    alto = 3.5,
    peso_total_cant_fisica = 1.056,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.901';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = -22,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 3.5,
    ancho = 0.8,
    alto = 0,
    peso_total_cant_fisica = 0.28,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.021';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 4.8,
    peso_total_cant_fisica = 0.462,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.02.001';

UPDATE inventario 
SET cantidad_fisica = 21,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 4.7,
    peso_total_cant_fisica = 6.930000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.02.002';

UPDATE inventario 
SET cantidad_fisica = 22,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 5,
    alto = 5,
    peso_total_cant_fisica = 0.418,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.04.001';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2.5,
    peso_total_cant_fisica = 0.224,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.03.004';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1.2,
    alto = 2,
    peso_total_cant_fisica = 0.12,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.03.002';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1.7,
    alto = 2.3,
    peso_total_cant_fisica = 0.12,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.03.003';

UPDATE inventario 
SET cantidad_fisica = 19,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 0.228,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.03.001';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2.5,
    peso_total_cant_fisica = 0.38,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.05.001';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2.5,
    peso_total_cant_fisica = 0.29000000000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.05.002';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1.8,
    alto = 3.3,
    peso_total_cant_fisica = 0.0224,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.01.001';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1.5,
    alto = 3.5,
    peso_total_cant_fisica = 0.0448,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.97.01.002';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '',
    largo = 0,
    ancho = 9,
    alto = 1,
    peso_total_cant_fisica = 0.488,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.06.001';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '',
    largo = 15,
    ancho = 3,
    alto = 5,
    peso_total_cant_fisica = 0.528,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.33.004.03';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '',
    largo = 30,
    ancho = 22,
    alto = 11,
    peso_total_cant_fisica = 2.416,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.33.004.08';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0.03,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 0.06,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.852';

UPDATE inventario 
SET cantidad_fisica = 92,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 3,
    ancho = 0.05,
    alto = 0,
    peso_total_cant_fisica = 0.828,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.065';

UPDATE inventario 
SET cantidad_fisica = 52,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 1.5,
    alto = 2,
    peso_total_cant_fisica = 0.20800000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.903';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 7,
    ancho = 2.5,
    alto = 0,
    peso_total_cant_fisica = 0.446,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.939';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0.5,
    alto = 7,
    peso_total_cant_fisica = 0.018000000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.490';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2,
    alto = 2,
    peso_total_cant_fisica = 0.007,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.003';

UPDATE inventario 
SET cantidad_fisica = 33,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1.6,
    alto = 2.5,
    peso_total_cant_fisica = 0.019799999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.073';

UPDATE inventario 
SET cantidad_fisica = 31,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2.5,
    peso_total_cant_fisica = 0.064976,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.074';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3.3,
    alto = 3.3,
    peso_total_cant_fisica = 0.03792,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.075';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1.5,
    alto = 3,
    peso_total_cant_fisica = 0.0138,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.913';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 7.5,
    ancho = 3,
    alto = 1.5,
    peso_total_cant_fisica = 0.10500000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.006';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 0.009000000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.51.003';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 4,
    alto = 10,
    peso_total_cant_fisica = 0.216,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.90.09.001';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2,
    alto = 5.5,
    peso_total_cant_fisica = 0.015,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.010';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0.7,
    alto = 22.5,
    peso_total_cant_fisica = 0.02,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.061';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0.7,
    alto = 21,
    peso_total_cant_fisica = 0.033999999999999996,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.060';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3,
    alto = 10,
    peso_total_cant_fisica = 0.108,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.461';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3.5,
    alto = 7,
    peso_total_cant_fisica = 0.055,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.909';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3.5,
    alto = 7.5,
    peso_total_cant_fisica = 0.112,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.524';

UPDATE inventario 
SET cantidad_fisica = 43,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0.5,
    alto = 5,
    peso_total_cant_fisica = 0.17200000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.911';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 20',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 0,
    ancho = 6.5,
    alto = 18,
    peso_total_cant_fisica = 2.648,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.1450';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 20',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 34,
    ancho = 14,
    alto = 8.5,
    peso_total_cant_fisica = 0.217,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.03.20.411';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 28,
    ancho = 8.5,
    alto = 4,
    peso_total_cant_fisica = 0.10500000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6532';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 16,
    ancho = 9.5,
    alto = 3,
    peso_total_cant_fisica = 0.064,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6531';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1,
    alto = 11,
    peso_total_cant_fisica = 0.12,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6530';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 13,
    ancho = 9,
    alto = 4.5,
    peso_total_cant_fisica = 0.132,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6533';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 16.5,
    ancho = 17,
    alto = 3,
    peso_total_cant_fisica = 6.656,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.77.01.002';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 10,
    ancho = 10,
    alto = 2.5,
    peso_total_cant_fisica = 5.688,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.525';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 7.5,
    ancho = 7.5,
    alto = 2,
    peso_total_cant_fisica = 0.578,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '01603.01.524';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 9.5,
    ancho = 9.5,
    alto = 2,
    peso_total_cant_fisica = 4.763,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.01.037';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 0,
    ancho = 7,
    alto = 2.5,
    peso_total_cant_fisica = 0.066,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.029';

UPDATE inventario 
SET cantidad_fisica = 24,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 1.5,
    ancho = 1.5,
    alto = 1.9,
    peso_total_cant_fisica = 1.296,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.030';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 9.5,
    ancho = 9.5,
    alto = 2,
    peso_total_cant_fisica = 1.306,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.030.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 14.5,
    ancho = 14,
    alto = 3.2,
    peso_total_cant_fisica = 4.192,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.77.01.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 7,
    ancho = 7,
    alto = 4.5,
    peso_total_cant_fisica = 0.69,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.5.07';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 4,
    ancho = 4,
    alto = 6,
    peso_total_cant_fisica = 0.092,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.70.02';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 1.5,
    ancho = 1.5,
    alto = 1.9,
    peso_total_cant_fisica = 0.256,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.703';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 0.68,
    ancho = 0.11,
    alto = 0.45,
    peso_total_cant_fisica = 2.09,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.711';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 7.5,
    ancho = 7.5,
    alto = 2,
    peso_total_cant_fisica = 1.736,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.802';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 11,
    ancho = 12,
    alto = 2.5,
    peso_total_cant_fisica = 3.46,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.905.04';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 5.7,
    ancho = 5.5,
    alto = 1.9,
    peso_total_cant_fisica = 0.68,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.513.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 25,
    ancho = 24,
    alto = 10,
    peso_total_cant_fisica = 7.436,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.144.01';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 0.43,
    ancho = 0.45,
    alto = 0.16,
    peso_total_cant_fisica = 0.136,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.519';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 0.54,
    ancho = 0.56,
    alto = 0.18,
    peso_total_cant_fisica = 1.05,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.019';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 6.5,
    ancho = 6.5,
    alto = 1.9,
    peso_total_cant_fisica = 0.984,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.021';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 6.4,
    ancho = 6.4,
    alto = 2,
    peso_total_cant_fisica = 2.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.517';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 21,
    ancho = 21,
    alto = 6.5,
    peso_total_cant_fisica = 5.767,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.03.024';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'CAJA # 04',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 4.5,
    ancho = 4,
    alto = 1.5,
    peso_total_cant_fisica = 0.28,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.050';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 23,
    ancho = 15,
    alto = 1,
    peso_total_cant_fisica = 0.192,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1671';

UPDATE inventario 
SET cantidad_fisica = 27,
    dif = 18,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 15,
    alto = 1,
    peso_total_cant_fisica = 1.1340000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '85.04.600.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 12,
    alto = 1.2,
    peso_total_cant_fisica = 0.23,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.03.026';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 33,
    alto = 2,
    peso_total_cant_fisica = 3.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.248';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 20,
    alto = 1.8,
    peso_total_cant_fisica = 1.268,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.998';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 23,
    alto = 2,
    peso_total_cant_fisica = 1.0499999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.90';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 26,
    ancho = 20,
    alto = 1.5,
    peso_total_cant_fisica = 0.42,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.581';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 26,
    ancho = 16,
    alto = 2,
    peso_total_cant_fisica = 0.312,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.391';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 17,
    ancho = 18,
    alto = 2,
    peso_total_cant_fisica = 1.2149999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.25.01.003';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 13,
    ancho = 16,
    alto = 3,
    peso_total_cant_fisica = 1.368,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.390';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 29,
    alto = 1.4,
    peso_total_cant_fisica = 1.9,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.03.016';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 30,
    alto = 1.9,
    peso_total_cant_fisica = 2.064,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.249';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 15,
    alto = 1.8,
    peso_total_cant_fisica = 0.222,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1703';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 40,
    alto = 2.3,
    peso_total_cant_fisica = 1.123,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.03.020';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 32,
    alto = 1.3,
    peso_total_cant_fisica = 0.662,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.103.1';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 35,
    alto = 2,
    peso_total_cant_fisica = 6.876,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1576';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 16,
    ancho = 25,
    alto = 1,
    peso_total_cant_fisica = 0.34,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.052';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 18,
    ancho = 9,
    alto = 21,
    peso_total_cant_fisica = 1.568,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.063';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 18,
    ancho = 9,
    alto = 21,
    peso_total_cant_fisica = 0.98,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.0801';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 2,
    ancho = 2.5,
    alto = 1,
    peso_total_cant_fisica = 0.022,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5549';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 15,
    alto = 5.5,
    peso_total_cant_fisica = 1.266,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5084';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 9,
    alto = 29,
    peso_total_cant_fisica = 0.287,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4956';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 9,
    alto = 29,
    peso_total_cant_fisica = 0.324,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4958';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 9,
    ancho = 9,
    alto = 29,
    peso_total_cant_fisica = 0.299,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4957';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3,
    alto = 0.5,
    peso_total_cant_fisica = 0.00002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5076';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3.8,
    alto = 0.2,
    peso_total_cant_fisica = 0.00001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5080';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3.2,
    alto = 0.15,
    peso_total_cant_fisica = 0.00002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5078';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2.5,
    alto = 0.3,
    peso_total_cant_fisica = 0.000030000000000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5073';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2.8,
    alto = 0.3,
    peso_total_cant_fisica = 0.000030000000000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5075';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 20,
    alto = 3.5,
    peso_total_cant_fisica = 1.185,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '51.4.10.370.7000.0.3';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 15,
    alto = 4.5,
    peso_total_cant_fisica = 6.86,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.15.4.18.117';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 18,
    ancho = 15,
    alto = 6,
    peso_total_cant_fisica = 0.169,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4991';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 12,
    ancho = 8,
    alto = 0.3,
    peso_total_cant_fisica = 0.05,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.03.003.01';

UPDATE inventario 
SET cantidad_fisica = 82,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 15,
    ancho = 8,
    alto = 1,
    peso_total_cant_fisica = 0.246,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '52.1.20.005.2.1';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2.3,
    alto = 0.3,
    peso_total_cant_fisica = 0.43999999999999995,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '52.1.20.014.2.1';

UPDATE inventario 
SET cantidad_fisica = 17,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3.5,
    alto = 1.8,
    peso_total_cant_fisica = 1.564,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.02.331';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 5,
    alto = 1.5,
    peso_total_cant_fisica = 0.201,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.03.010';

UPDATE inventario 
SET cantidad_fisica = 40,
    dif = 40,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 12,
    ancho = 8,
    alto = 2,
    peso_total_cant_fisica = 0.28,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '.ESTC.503.04.555';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 4,
    alto = 1.5,
    peso_total_cant_fisica = 1.428,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.04.571';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3.5,
    alto = 0.03,
    peso_total_cant_fisica = 0.0036,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3520';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3.5,
    alto = 0.04,
    peso_total_cant_fisica = 0.0048,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3521';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 34,
    ancho = 34,
    alto = 6,
    peso_total_cant_fisica = 18.065,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.82.01.112.121';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 4.5,
    ancho = 4.5,
    alto = 1.2,
    peso_total_cant_fisica = 0.0208,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.01.041';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 4.3,
    ancho = 4.3,
    alto = 1.7,
    peso_total_cant_fisica = 0.061,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.701.01';

UPDATE inventario 
SET cantidad_fisica = 76,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 4.3,
    ancho = 4.3,
    alto = 1.7,
    peso_total_cant_fisica = 4.636,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.747';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.5,
    ancho = 6.5,
    alto = 2.3,
    peso_total_cant_fisica = 0.564,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.905.01';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 5.8,
    ancho = 5.8,
    alto = 2.3,
    peso_total_cant_fisica = 0.956,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.905.03';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.5,
    ancho = 6.5,
    alto = 2.3,
    peso_total_cant_fisica = 0.564,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.905.02';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.5,
    ancho = 6.8,
    alto = 5,
    peso_total_cant_fisica = 0.472,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.026.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 7.5,
    ancho = 7.3,
    alto = 3.5,
    peso_total_cant_fisica = 1.048,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.524.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 20,
    ancho = 20.5,
    alto = 6,
    peso_total_cant_fisica = 6.858,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.19.721';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.3,
    ancho = 6,
    alto = 4.4,
    peso_total_cant_fisica = 0.5700000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.805';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 6.5,
    ancho = 4.5,
    alto = 4.5,
    peso_total_cant_fisica = 0.408,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.022';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 19,
    ancho = 16,
    alto = 2,
    peso_total_cant_fisica = 0.48,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.932';

UPDATE inventario 
SET cantidad_fisica = 24,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 9,
    ancho = 13,
    alto = 2,
    peso_total_cant_fisica = 1.7759999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.14.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 12,
    ancho = 7.5,
    alto = 2,
    peso_total_cant_fisica = 0.108,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.029';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 11.9,
    alto = 3.7,
    peso_total_cant_fisica = 1.732,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.01.254.08';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 16,
    alto = 4.5,
    peso_total_cant_fisica = 1.136,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.01.254.07';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 15.3,
    alto = 1.8,
    peso_total_cant_fisica = 1.7999999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.01.607.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 40,
    ancho = 29,
    alto = 4,
    peso_total_cant_fisica = 0.206,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.055';

UPDATE inventario 
SET cantidad_fisica = 0.4,
    dif = -0.09999999999999998,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 0.7,
    alto = 0.05,
    peso_total_cant_fisica = 0.0064,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '501.01.201';

UPDATE inventario 
SET cantidad_fisica = 50,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2.5,
    alto = 0.3,
    peso_total_cant_fisica = 0.4,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '53.1.20.016.8';

UPDATE inventario 
SET cantidad_fisica = 0.47,
    dif = -0.030000000000000027,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 1.5,
    alto = 0.1,
    peso_total_cant_fisica = 0.0376,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '501.02.204';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 3.3,
    alto = 0.2,
    peso_total_cant_fisica = 0.14,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '501.02.212.01';

UPDATE inventario 
SET cantidad_fisica = 148,
    dif = 146.52,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 0,
    ancho = 2,
    alto = 0.2,
    peso_total_cant_fisica = 0.444,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '501.02.303';

UPDATE inventario 
SET cantidad_fisica = 13,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '2',
    largo = 3,
    ancho = 3,
    alto = 5.2,
    peso_total_cant_fisica = 2.5220000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.83.01.112.121';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 40,
    ancho = 29,
    alto = 4,
    peso_total_cant_fisica = 0.103,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.37.03.001';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 24.5,
    ancho = 16,
    alto = 4.5,
    peso_total_cant_fisica = 11.521,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.976.2';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 14.5,
    ancho = 16,
    alto = 2.5,
    peso_total_cant_fisica = 3.447,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.976.5';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 18,
    ancho = 16,
    alto = 2.5,
    peso_total_cant_fisica = 4.036,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.976.4';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 25,
    ancho = 16,
    alto = 2.5,
    peso_total_cant_fisica = 5.904,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.976.3';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 19,
    ancho = 16,
    alto = 2.5,
    peso_total_cant_fisica = 4.458,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.976.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 5.5,
    alto = 39,
    peso_total_cant_fisica = 2.967,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.095.01';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 22.5,
    ancho = 11,
    alto = 9,
    peso_total_cant_fisica = 5.46,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.104.01';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 25,
    ancho = 25,
    alto = 2.5,
    peso_total_cant_fisica = 12.732,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.82.03.012.018';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 3,
    ancho = 3,
    alto = 1.3,
    peso_total_cant_fisica = 0.026,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.011.001';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 2.5,
    ancho = 1.7,
    alto = 1,
    peso_total_cant_fisica = 6.66,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.83.03.012.018';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 25,
    ancho = 49,
    alto = 6,
    peso_total_cant_fisica = 1.477,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.07.061';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 40,
    ancho = 37,
    alto = 5,
    peso_total_cant_fisica = 4.542,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.17.10.004';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 32,
    ancho = 6,
    alto = 0,
    peso_total_cant_fisica = 4.448,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.023.1';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.1,
    ancho = 0.8,
    alto = 0,
    peso_total_cant_fisica = 0.025,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.01.02.100.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.75,
    ancho = 0.55,
    alto = 0,
    peso_total_cant_fisica = 0.24,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.15.05.011';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.8,
    ancho = 0.4,
    alto = 0,
    peso_total_cant_fisica = 0.484,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.41.01.013';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 0.03,
    alto = 0,
    peso_total_cant_fisica = 0.044,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.51.002';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 27,
    ancho = 27,
    alto = 0.2,
    peso_total_cant_fisica = 0.126,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.92.01.001';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 15,
    ancho = 14.5,
    alto = 0,
    peso_total_cant_fisica = 0.616,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.95.01.001';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 12,
    ancho = 12.07,
    alto = 0.03,
    peso_total_cant_fisica = 0.02,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.96.01.001';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.31,
    ancho = 0.22,
    alto = 0.21,
    peso_total_cant_fisica = 0.02,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '29.20.01.004';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.3,
    ancho = 0.2,
    alto = 0.12,
    peso_total_cant_fisica = 0.136,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.108';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 25,
    ancho = 0.4,
    alto = 0.45,
    peso_total_cant_fisica = 0.206,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.181';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.85,
    ancho = 0.2,
    alto = 0,
    peso_total_cant_fisica = 0.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.534.01';

UPDATE inventario 
SET cantidad_fisica = 22,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 0.08,
    alto = 0.03,
    peso_total_cant_fisica = 0.066,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.234';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 60,
    ancho = 0.5,
    alto = 0,
    peso_total_cant_fisica = 0.111,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.298';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 19,
    ancho = 12,
    alto = 0,
    peso_total_cant_fisica = 1.384,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.700';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.9,
    ancho = 0.15,
    alto = 0,
    peso_total_cant_fisica = 0.05399999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.996';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 11,
    alto = 0.1,
    peso_total_cant_fisica = 0.018000000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.997';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 29,
    ancho = 25,
    alto = 13.03,
    peso_total_cant_fisica = 1.218,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.119';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.72,
    ancho = 0.43,
    alto = 0.1,
    peso_total_cant_fisica = 0.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.428';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 55,
    ancho = 15,
    alto = 30,
    peso_total_cant_fisica = 1.09,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.8,
    ancho = 11,
    alto = 0.1,
    peso_total_cant_fisica = 0.068,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.013';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.8,
    ancho = 10,
    alto = 0.1,
    peso_total_cant_fisica = 0.10500000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.014';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.3,
    ancho = 0.2,
    alto = 0,
    peso_total_cant_fisica = 0.069,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.016';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 40,
    ancho = 40,
    alto = 10,
    peso_total_cant_fisica = 0.907,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.029';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 75,
    ancho = 35,
    alto = 30,
    peso_total_cant_fisica = 0.218,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.040';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.7,
    ancho = 0.55,
    alto = 0.2,
    peso_total_cant_fisica = 0.05,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.757';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 13',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0.5,
    ancho = 0.35,
    alto = 0.03,
    peso_total_cant_fisica = 0.028,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1302';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 14',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 0.7,
    ancho = 0.4,
    alto = 0.36,
    peso_total_cant_fisica = 0.27,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.51.01.401';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 14',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 28.05,
    ancho = 28.5,
    alto = 0.27,
    peso_total_cant_fisica = 1.44,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.07.038';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 14',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 34.05,
    ancho = 32,
    alto = 0.47,
    peso_total_cant_fisica = 0.61,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.500';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 39,
    ancho = 0.9,
    alto = 0.6,
    peso_total_cant_fisica = 4.99,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.69.100.401.02';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 0.8,
    ancho = 0.22,
    alto = 0.22,
    peso_total_cant_fisica = 0.63,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.01.279.014';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 16.5,
    ancho = 0.2,
    alto = 0.2,
    peso_total_cant_fisica = 0.805,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.01.308';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 0.55,
    ancho = 0.25,
    alto = 0.25,
    peso_total_cant_fisica = 0.96,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.03.250';

UPDATE inventario 
SET cantidad_fisica = 50,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 0.45,
    ancho = 0.2,
    alto = 0.2,
    peso_total_cant_fisica = 0.8999999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.04.409';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 16,
    ancho = 0.35,
    alto = 0.35,
    peso_total_cant_fisica = 3.6959999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.04.570';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 10,
    ancho = 0.24,
    alto = 0.24,
    peso_total_cant_fisica = 0.3,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '51.2.22.012.0100.8.1';

UPDATE inventario 
SET cantidad_fisica = 30,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 0.73,
    ancho = 0.3,
    alto = 0.3,
    peso_total_cant_fisica = 3.1799999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '51.2.22.016.0072.10';

UPDATE inventario 
SET cantidad_fisica = 55,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 0.71,
    ancho = 0.17,
    alto = 0.17,
    peso_total_cant_fisica = 4.895,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '51.2.24.016.0090.8.1';

UPDATE inventario 
SET cantidad_fisica = 34,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 10,
    ancho = 0.15,
    alto = 0.26,
    peso_total_cant_fisica = 4.454000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '51.7.10.580.3120.2.1';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 28,
    ancho = 0.25,
    alto = 0.25,
    peso_total_cant_fisica = 2.0580000000000003,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.45.01';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 16',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 15.08,
    ancho = 0.15,
    alto = 0.15,
    peso_total_cant_fisica = 0.8400000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.227.1';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 15',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 38,
    ancho = 10,
    alto = 10,
    peso_total_cant_fisica = 2.292,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.44.04.002.1';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'CAJA # 15',
    rack = '2',
    ubicacion_actual = 'NIVEL 2',
    contenedor = '2',
    largo = 22.05,
    ancho = 26,
    alto = 15,
    peso_total_cant_fisica = 2.328,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.31.01.030.220';

UPDATE inventario 
SET cantidad_fisica = 21,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 3,
    alto = 2,
    peso_total_cant_fisica = 0.252,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6965';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 17,
    ancho = 10,
    alto = 3,
    peso_total_cant_fisica = 0.554,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5880';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 5,
    ancho = 0.6,
    alto = 0,
    peso_total_cant_fisica = 0.2,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6966';

UPDATE inventario 
SET cantidad_fisica = 21,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 2.3,
    alto = 7.5,
    peso_total_cant_fisica = 1.3860000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.366';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = 'EN EL 02',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 9,
    ancho = 3,
    alto = 0,
    peso_total_cant_fisica = 1.755,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2145';

UPDATE inventario 
SET cantidad_fisica = 26,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 17,
    ancho = 4,
    alto = 3,
    peso_total_cant_fisica = 7.774,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6967';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 11,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 17,
    ancho = 4,
    alto = 1.5,
    peso_total_cant_fisica = 0.44,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.269.01';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 12,
    ancho = 3,
    alto = 3,
    peso_total_cant_fisica = 0.248,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '8015.15.58.10';

UPDATE inventario 
SET cantidad_fisica = 23,
    dif = 0,
    observacion = 'OK',
    comentario = 'TIENE UN PROTECTOR',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 3.5,
    alto = 3,
    peso_total_cant_fisica = 0.552,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.464';

UPDATE inventario 
SET cantidad_fisica = 56,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'PROTECTOR AZUL',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 1.568,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.464';

UPDATE inventario 
SET cantidad_fisica = 34,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'PROTECTOR AZUL',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 0.40800000000000003,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.465';

UPDATE inventario 
SET cantidad_fisica = 19,
    dif = 0,
    observacion = 'OK',
    comentario = 'PROTECTOR AZUL',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 0.361,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.467';

UPDATE inventario 
SET cantidad_fisica = 51,
    dif = 0,
    observacion = 'OK',
    comentario = 'PROTECTOR AZUL',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 1.428,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.469';

UPDATE inventario 
SET cantidad_fisica = 72,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.8,
    alto = 3,
    peso_total_cant_fisica = 2.088,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.471';

UPDATE inventario 
SET cantidad_fisica = 65,
    dif = 7,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 15,
    ancho = 12,
    alto = 1.5,
    peso_total_cant_fisica = 1.95,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4163';

UPDATE inventario 
SET cantidad_fisica = 71,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'PROTECTOR AZUL',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 2.059,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.466';

UPDATE inventario 
SET cantidad_fisica = 76,
    dif = 0,
    observacion = 'OK',
    comentario = 'PROTECTOR AZUL',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 2.128,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.468';

UPDATE inventario 
SET cantidad_fisica = 70,
    dif = 0,
    observacion = 'OK',
    comentario = 'PROTECTOR AZUL',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 2.5,
    alto = 2,
    peso_total_cant_fisica = 1.96,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.470';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 12,
    ancho = 4,
    alto = 1.5,
    peso_total_cant_fisica = 0.11,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.928';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 13,
    ancho = 7,
    alto = 2,
    peso_total_cant_fisica = 0.084,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.010.016';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 13,
    ancho = 7,
    alto = 2,
    peso_total_cant_fisica = 0.029,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.010.015';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 12,
    ancho = 7,
    alto = 2,
    peso_total_cant_fisica = 0.029,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.010.013';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 13,
    ancho = 7,
    alto = 2,
    peso_total_cant_fisica = 0.058,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.010.017';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 5,
    ancho = 5.5,
    alto = 0,
    peso_total_cant_fisica = 13.200000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.14.02.008';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 3,
    alto = 1,
    peso_total_cant_fisica = 0.032,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '85.05.100.001';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2,
    alto = 1.5,
    peso_total_cant_fisica = 1.2000000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.0030';

UPDATE inventario 
SET cantidad_fisica = 48,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2,
    alto = 6,
    peso_total_cant_fisica = 3.072,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.008';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1.3,
    alto = 8,
    peso_total_cant_fisica = 0.63,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.006';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1,
    alto = 4.5,
    peso_total_cant_fisica = 0.255,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.003';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 3.5,
    peso_total_cant_fisica = 0.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'XS.07.100.07';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 4,
    alto = 3.5,
    peso_total_cant_fisica = 2.1599999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '.ESMTRB.25.001.001';

UPDATE inventario 
SET cantidad_fisica = 1002,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 2.8056,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'XS.07.100.11';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1,
    alto = 4,
    peso_total_cant_fisica = 0.081,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.009';

UPDATE inventario 
SET cantidad_fisica = 45,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 2,
    alto = 11,
    peso_total_cant_fisica = 4.77,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.007';

UPDATE inventario 
SET cantidad_fisica = 50,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 1,
    alto = 7,
    peso_total_cant_fisica = 3.15,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.12.2.001';

UPDATE inventario 
SET cantidad_fisica = 37,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 5,
    alto = 6,
    peso_total_cant_fisica = 9.546,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.004';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL 1',
    contenedor = '2',
    largo = 15,
    ancho = 8.5,
    alto = 5,
    peso_total_cant_fisica = 10.018,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.90.05.002';

UPDATE inventario 
SET cantidad_fisica = 144,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 10,
    ancho = 23,
    alto = 11.5,
    peso_total_cant_fisica = 50.256,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.1300';

UPDATE inventario 
SET cantidad_fisica = 132,
    dif = 30,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 8,
    ancho = 3,
    alto = 3,
    peso_total_cant_fisica = 1.452,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.041';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 31,
    ancho = 20,
    alto = 12,
    peso_total_cant_fisica = 3.792,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.164';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 31,
    ancho = 20,
    alto = 12,
    peso_total_cant_fisica = 2.632,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.163';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 31,
    ancho = 20,
    alto = 12,
    peso_total_cant_fisica = 6.585,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.154';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 31,
    ancho = 20,
    alto = 12,
    peso_total_cant_fisica = 2.78,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.155';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 31,
    ancho = 20,
    alto = 12,
    peso_total_cant_fisica = 4.176,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.156';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 32,
    ancho = 20,
    alto = 11,
    peso_total_cant_fisica = 10.157,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.157';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 32,
    ancho = 20,
    alto = 11,
    peso_total_cant_fisica = 6.368,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.158';

UPDATE inventario 
SET cantidad_fisica = 13,
    dif = 9,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 32,
    ancho = 20,
    alto = 11,
    peso_total_cant_fisica = 20.189,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.159';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 32,
    ancho = 20,
    alto = 11,
    peso_total_cant_fisica = 25.632,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.160';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 32,
    ancho = 20,
    alto = 11,
    peso_total_cant_fisica = 18.392,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.161';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 32,
    ancho = 20,
    alto = 11,
    peso_total_cant_fisica = 10254,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.162';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 34,
    ancho = 24,
    alto = 12,
    peso_total_cant_fisica = 4.962,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.165';

UPDATE inventario 
SET cantidad_fisica = 38,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 25,
    ancho = 31,
    alto = 2,
    peso_total_cant_fisica = 38.038,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.424';

UPDATE inventario 
SET cantidad_fisica = 70,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 42,
    ancho = 18.5,
    alto = 1,
    peso_total_cant_fisica = 6.159999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.016';

UPDATE inventario 
SET cantidad_fisica = 67,
    dif = 9,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 32,
    ancho = 21,
    alto = 20,
    peso_total_cant_fisica = 19.631,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.015';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5542';

UPDATE inventario 
SET cantidad_fisica = 24,
    dif = 24,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 28,
    ancho = 22,
    alto = 20,
    peso_total_cant_fisica = 7.416,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.189';

UPDATE inventario 
SET cantidad_fisica = 38,
    dif = 32,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 28,
    ancho = 22,
    alto = 20,
    peso_total_cant_fisica = 15.39,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.520';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 35,
    ancho = 28,
    alto = 5,
    peso_total_cant_fisica = 8.88,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.099';

UPDATE inventario 
SET cantidad_fisica = 130,
    dif = 6,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 21,
    ancho = 26.5,
    alto = 2,
    peso_total_cant_fisica = 14.43,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.199';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 28,
    ancho = 20,
    alto = 3,
    peso_total_cant_fisica = 2.776,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5540';

UPDATE inventario 
SET cantidad_fisica = 46,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 11,
    ancho = 10,
    alto = 13,
    peso_total_cant_fisica = 1.9779999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.066';

UPDATE inventario 
SET cantidad_fisica = 116,
    dif = 11,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '5',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 29,
    ancho = 30,
    alto = 0.5,
    peso_total_cant_fisica = 5.800000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.103';

UPDATE inventario 
SET cantidad_fisica = 53,
    dif = 8,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 32,
    ancho = 33,
    alto = 3,
    peso_total_cant_fisica = 22.207,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.005';

UPDATE inventario 
SET cantidad_fisica = 58,
    dif = 41,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 16,
    ancho = 14,
    alto = 2.5,
    peso_total_cant_fisica = 1.6820000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.14';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 41,
    ancho = 17,
    alto = 2,
    peso_total_cant_fisica = 0.736,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.01.10.001';

UPDATE inventario 
SET cantidad_fisica = 51,
    dif = -151,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 31,
    ancho = 14,
    alto = 1.5,
    peso_total_cant_fisica = 7.803,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.501';

UPDATE inventario 
SET cantidad_fisica = 43,
    dif = -54,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 40,
    ancho = 18,
    alto = 3,
    peso_total_cant_fisica = 15.007,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.020.16';

UPDATE inventario 
SET cantidad_fisica = 137,
    dif = -38,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 24,
    ancho = 14,
    alto = 1,
    peso_total_cant_fisica = 26.715,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.021';

UPDATE inventario 
SET cantidad_fisica = 40,
    dif = 21,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 30,
    ancho = 13,
    alto = 1,
    peso_total_cant_fisica = 5.72,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.023';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = -47,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 27,
    ancho = 14,
    alto = 2.5,
    peso_total_cant_fisica = 2.057,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.042';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -71,
    observacion = 'FALTANTE',
    comentario = 'FALTANTE',
    rack = '',
    ubicacion_actual = '8',
    contenedor = 'C.I.',
    largo = 0,
    ancho = 14,
    alto = 5,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.07.05.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -101,
    observacion = 'FALTANTE',
    comentario = 'SOBRANTE',
    rack = '',
    ubicacion_actual = '8',
    contenedor = 'C.I.',
    largo = 0,
    ancho = 14,
    alto = 5,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.07.10.002';

UPDATE inventario 
SET cantidad_fisica = 82,
    dif = 49,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 40,
    ancho = 26,
    alto = 1,
    peso_total_cant_fisica = 13.366,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.205';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.207';

UPDATE inventario 
SET cantidad_fisica = 65,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 22,
    ancho = 30,
    alto = 3.5,
    peso_total_cant_fisica = 33.54,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.25.01.001';

UPDATE inventario 
SET cantidad_fisica = 124,
    dif = 8,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 54,
    ancho = 16,
    alto = 2,
    peso_total_cant_fisica = 49.476,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.026';

UPDATE inventario 
SET cantidad_fisica = 151,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 34,
    ancho = 17,
    alto = 1.5,
    peso_total_cant_fisica = 27.029,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.231';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 24,
    ancho = 21,
    alto = 14,
    peso_total_cant_fisica = 1.8599999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.045';

UPDATE inventario 
SET cantidad_fisica = 4320,
    dif = -125,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 5.5,
    ancho = 13,
    alto = 13.5,
    peso_total_cant_fisica = 371.52,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.217';

UPDATE inventario 
SET cantidad_fisica = 30,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '2',
    largo = 47,
    ancho = 37,
    alto = 5,
    peso_total_cant_fisica = 20.939999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.14.01.002';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 32,
    ancho = 22,
    alto = 5,
    peso_total_cant_fisica = 3.376,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.296';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 39,
    ancho = 26,
    alto = 3,
    peso_total_cant_fisica = 3.88,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.080';

UPDATE inventario 
SET cantidad_fisica = 17,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 31,
    ancho = 31,
    alto = 3,
    peso_total_cant_fisica = 14.433,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.170';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 33,
    ancho = 28,
    alto = 3,
    peso_total_cant_fisica = 2.577,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.171';

UPDATE inventario 
SET cantidad_fisica = 19,
    dif = 6,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 38,
    ancho = 26,
    alto = 3,
    peso_total_cant_fisica = 16.91,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.172';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 39,
    ancho = 33,
    alto = 3,
    peso_total_cant_fisica = 12.726,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.173';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 39,
    ancho = 30,
    alto = 3,
    peso_total_cant_fisica = 2.82,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.175';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 21,
    ancho = 23,
    alto = 1,
    peso_total_cant_fisica = 5.642,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.04.12.005';

UPDATE inventario 
SET cantidad_fisica = 45,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 30,
    ancho = 26,
    alto = 2,
    peso_total_cant_fisica = 18.135,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.04.12.003';

UPDATE inventario 
SET cantidad_fisica = 18,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 32,
    ancho = 26,
    alto = 1,
    peso_total_cant_fisica = 8.334,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.04.12.011';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -71,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 26,
    ancho = 26,
    alto = 2,
    peso_total_cant_fisica = 0.672,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.151';

UPDATE inventario 
SET cantidad_fisica = 23,
    dif = -68,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 28,
    ancho = 23,
    alto = 2,
    peso_total_cant_fisica = 6.808,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.152';

UPDATE inventario 
SET cantidad_fisica = 56,
    dif = 7,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 28,
    ancho = 24,
    alto = 1.5,
    peso_total_cant_fisica = 17.248,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.153';

UPDATE inventario 
SET cantidad_fisica = 13,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 28,
    ancho = 23,
    alto = 1.5,
    peso_total_cant_fisica = 4.173,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.050';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 29,
    ancho = 25,
    alto = 1.5,
    peso_total_cant_fisica = 1.392,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.555';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 28,
    ancho = 23,
    alto = 1,
    peso_total_cant_fisica = 1.112,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6565';

UPDATE inventario 
SET cantidad_fisica = 38,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 25,
    ancho = 15,
    alto = 9.5,
    peso_total_cant_fisica = 0.228,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.935';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 11,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 40,
    ancho = 20,
    alto = 0.03,
    peso_total_cant_fisica = 1.368,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.073';

UPDATE inventario 
SET cantidad_fisica = 72,
    dif = 21,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 33,
    ancho = 23,
    alto = 8.5,
    peso_total_cant_fisica = 13.248,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.125';

UPDATE inventario 
SET cantidad_fisica = 44,
    dif = 7,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 17,
    ancho = 6,
    alto = 6,
    peso_total_cant_fisica = 2.068,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '11.08.001';

UPDATE inventario 
SET cantidad_fisica = 122,
    dif = 5,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 16,
    ancho = 5,
    alto = 5,
    peso_total_cant_fisica = 5.49,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4005';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 39,
    ancho = 36,
    alto = 3,
    peso_total_cant_fisica = 0.452,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.388';

UPDATE inventario 
SET cantidad_fisica = 57,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '7',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 9,
    ancho = 8,
    alto = 0.05,
    peso_total_cant_fisica = 28.5,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.014';

UPDATE inventario 
SET cantidad_fisica = 760,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 14,
    ancho = 13,
    alto = 3,
    peso_total_cant_fisica = 98.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.36.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -191,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.254';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 41,
    ancho = 53,
    alto = 3.5,
    peso_total_cant_fisica = 5.736,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.36.01.003';

UPDATE inventario 
SET cantidad_fisica = 105,
    dif = 69,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.03.123';

UPDATE inventario 
SET cantidad_fisica = 100,
    dif = 100,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL4',
    contenedor = '2',
    largo = 0,
    ancho = 34,
    alto = 13,
    peso_total_cant_fisica = 1253.8,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.010';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 39.5,
    ancho = 29,
    alto = 9,
    peso_total_cant_fisica = 3.4979999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.316';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 22,
    ancho = 10,
    alto = 2,
    peso_total_cant_fisica = 0.755,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1393';

UPDATE inventario 
SET cantidad_fisica = 21.4,
    dif = -4.600000000000001,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 129.7482,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.003';

UPDATE inventario 
SET cantidad_fisica = 61,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 5,
    alto = 11,
    peso_total_cant_fisica = 12.139000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.301';

UPDATE inventario 
SET cantidad_fisica = 37,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 54,
    ancho = 37,
    alto = 30,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '19.04.03.001';

UPDATE inventario 
SET cantidad_fisica = 124,
    dif = 29,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 11,
    alto = 2.3,
    peso_total_cant_fisica = 11.036,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.302';

UPDATE inventario 
SET cantidad_fisica = 126,
    dif = 73,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.001';

UPDATE inventario 
SET cantidad_fisica = 46,
    dif = -22,
    observacion = 'FALTANTE',
    comentario = 'CAJA X 8 UND',
    rack = '4',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '19.03.090';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '5',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 21,
    ancho = 9,
    alto = 9.5,
    peso_total_cant_fisica = 21.924,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.714';

UPDATE inventario 
SET cantidad_fisica = 68,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 35,
    alto = 0.05,
    peso_total_cant_fisica = 43.996,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.401';

UPDATE inventario 
SET cantidad_fisica = 200,
    dif = 128,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 11,
    alto = 1,
    peso_total_cant_fisica = 8,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '81.01.0412.116';

UPDATE inventario 
SET cantidad_fisica = 113,
    dif = 12,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 11.5,
    ancho = 11.5,
    alto = 1,
    peso_total_cant_fisica = 7.910000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.402';

UPDATE inventario 
SET cantidad_fisica = 59,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 13,
    ancho = 13,
    alto = 0.1,
    peso_total_cant_fisica = 2.0650000000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.430';

UPDATE inventario 
SET cantidad_fisica = 120,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 18,
    alto = 0.4,
    peso_total_cant_fisica = 21.72,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.408';

UPDATE inventario 
SET cantidad_fisica = 231,
    dif = 22,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 18,
    alto = 0.1,
    peso_total_cant_fisica = 23.793,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.416';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 23,
    alto = 0.1,
    peso_total_cant_fisica = 0.638,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '81.01.0900.230';

UPDATE inventario 
SET cantidad_fisica = 39,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 23,
    alto = 0.5,
    peso_total_cant_fisica = 27.494999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.425';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 18,
    alto = 0.1,
    peso_total_cant_fisica = 8.872,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.404';

UPDATE inventario 
SET cantidad_fisica = 278,
    dif = -42,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 12,
    alto = 1.5,
    peso_total_cant_fisica = 26.132,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.405';

UPDATE inventario 
SET cantidad_fisica = 89,
    dif = 20,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 18,
    alto = 0.5,
    peso_total_cant_fisica = 16.376,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.406';

UPDATE inventario 
SET cantidad_fisica = 43,
    dif = -24,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 11.5,
    alto = 0.1,
    peso_total_cant_fisica = 7.438999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.403';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 0,
    ancho = 12,
    alto = 1.5,
    peso_total_cant_fisica = 3.17,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.409';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 26,
    ancho = 8,
    alto = 4,
    peso_total_cant_fisica = 0.372,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.018';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'herramienta solicitada por produccin',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 58,
    ancho = 15,
    alto = 12,
    peso_total_cant_fisica = 5695,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.61.05.920.900';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 100,
    ancho = 1.59,
    alto = 0,
    peso_total_cant_fisica = 2.204,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '59.1.0.580.1000.1';

UPDATE inventario 
SET cantidad_fisica = 399,
    dif = 153,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 100,
    ancho = 1.27,
    alto = 0,
    peso_total_cant_fisica = 266.93100000000004,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.905';

UPDATE inventario 
SET cantidad_fisica = 102,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 100,
    ancho = 1.91,
    alto = 0,
    peso_total_cant_fisica = 186.15,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.03.995';

UPDATE inventario 
SET cantidad_fisica = 190,
    dif = 11,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 100,
    ancho = 0.95,
    alto = 0,
    peso_total_cant_fisica = 73.53,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.906';

UPDATE inventario 
SET cantidad_fisica = 12,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 15,
    ancho = 12,
    alto = 6,
    peso_total_cant_fisica = 18.024,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5562';

UPDATE inventario 
SET cantidad_fisica = 22,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'en el cont 02 se encontraron 03 juego no se ah agregado',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 11.5,
    ancho = 11.5,
    alto = 4,
    peso_total_cant_fisica = 24.772,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.06.002';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'producto descontinuado',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 10,
    alto = 12,
    peso_total_cant_fisica = 1.012,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.940';

UPDATE inventario 
SET cantidad_fisica = 18,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.351';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'ROLLO X 1 UND',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 4.27,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.14.02.09';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'ROLLO X 1 UND',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0.61,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.14.02.007';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'ROLLO X 1 UND',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0.61,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.14.02.006';

UPDATE inventario 
SET cantidad_fisica = 190,
    dif = -50,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 27,
    ancho = 22,
    alto = 0.05,
    peso_total_cant_fisica = 4.18,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.604';

UPDATE inventario 
SET cantidad_fisica = 191,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 29,
    ancho = 23,
    alto = 0.05,
    peso_total_cant_fisica = 3.8200000000000003,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.605';

UPDATE inventario 
SET cantidad_fisica = 99,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 28,
    ancho = 23,
    alto = 0.05,
    peso_total_cant_fisica = 1.98,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1078';

UPDATE inventario 
SET cantidad_fisica = 215,
    dif = 49,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 29,
    ancho = 23,
    alto = 0.05,
    peso_total_cant_fisica = 8.17,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.149';

UPDATE inventario 
SET cantidad_fisica = 175,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 29,
    ancho = 23,
    alto = 0.05,
    peso_total_cant_fisica = 7.175000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.613';

UPDATE inventario 
SET cantidad_fisica = 32,
    dif = -126,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 28,
    ancho = 23,
    alto = 0.05,
    peso_total_cant_fisica = 2.176,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.606';

UPDATE inventario 
SET cantidad_fisica = 35,
    dif = 14,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 6,
    alto = 23.5,
    peso_total_cant_fisica = 16.8,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.067';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = -120,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 28,
    ancho = 23,
    alto = 0.05,
    peso_total_cant_fisica = 0.376,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.607';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = -19,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 15,
    ancho = 11,
    alto = 0.1,
    peso_total_cant_fisica = 0.32,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.017';

UPDATE inventario 
SET cantidad_fisica = 578,
    dif = 513,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 15,
    ancho = 11,
    alto = 0.1,
    peso_total_cant_fisica = 13.872,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.019';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = 'sifap sin uso',
    rack = '1',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 49,
    alto = 0,
    peso_total_cant_fisica = 16.224,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.250.01';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.101';

UPDATE inventario 
SET cantidad_fisica = 25,
    dif = 11,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 0,
    ancho = 6.5,
    alto = 20,
    peso_total_cant_fisica = 10.375,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.831';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.58.02.003';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.58.02.002';

UPDATE inventario 
SET cantidad_fisica = 9,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.05.020';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'P101SPRC0816002';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 163.024,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.651';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 63,
    ancho = 12,
    alto = 5,
    peso_total_cant_fisica = 1.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.11.400';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '4 BARILLAS SOBRANTE',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 38,
    ancho = 16,
    alto = 5,
    peso_total_cant_fisica = 47.56,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '301.03.001';

UPDATE inventario 
SET cantidad_fisica = 49,
    dif = 11.659999999999997,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 35,
    ancho = 7.5,
    alto = 5.5,
    peso_total_cant_fisica = 245,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '301.01.002';

UPDATE inventario 
SET cantidad_fisica = 63,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 21,
    ancho = 6.5,
    alto = 0,
    peso_total_cant_fisica = 35.343,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.914';

UPDATE inventario 
SET cantidad_fisica = 30,
    dif = 6,
    observacion = 'SOBRANTE',
    comentario = 'ENTRAN 30 EN UNA CAJA REGULAR',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 20,
    ancho = 6.5,
    alto = 20,
    peso_total_cant_fisica = 12.81,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.58.01.001';

UPDATE inventario 
SET cantidad_fisica = 21.5,
    dif = 8.5,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 12,
    ancho = 8.5,
    alto = 5.5,
    peso_total_cant_fisica = 6.106,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.903';

UPDATE inventario 
SET cantidad_fisica = 185,
    dif = -250,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 9250,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.916';

UPDATE inventario 
SET cantidad_fisica = 2100,
    dif = -420,
    observacion = 'FALTANTE',
    comentario = 'CAJA PESA 15 KG',
    rack = '3',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '31.12.180.01';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = 'EN EL 02',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 12,
    alto = 10,
    peso_total_cant_fisica = 3.1710000000000003,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3677';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL4',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 11.5,
    peso_total_cant_fisica = 17.084,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.1.20.78.105';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 61,
    ancho = 22,
    alto = 39,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.33.004.11';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 11,
    peso_total_cant_fisica = 28.695,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.1072';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = 'SE CONSIDERA 20 DE ALTO PORQUE SON 2 PIEZAS CASO CONTRARIO SOLO CONSIDERA 10',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 23,
    ancho = 31.3,
    alto = 20,
    peso_total_cant_fisica = 130.83,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '29.27.01.005';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'NIVEL2',
    contenedor = '',
    largo = 0,
    ancho = 19,
    alto = 14,
    peso_total_cant_fisica = 64.26,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.79.01.190.137';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'NIVEL2',
    contenedor = '',
    largo = 0,
    ancho = 19,
    alto = 14,
    peso_total_cant_fisica = 59.80200000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.79.01.190.142';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'NIVEL4',
    contenedor = '2',
    largo = 65,
    ancho = 18,
    alto = 14,
    peso_total_cant_fisica = 8.132,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.04.2.1160';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'juego de 04 unidades',
    rack = '2',
    ubicacion_actual = 'NIVEL4',
    contenedor = '2',
    largo = 0,
    ancho = 20.5,
    alto = 9,
    peso_total_cant_fisica = 5.327,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1727';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'juego de 04 unidades',
    rack = '2',
    ubicacion_actual = 'NIVEL4',
    contenedor = '2',
    largo = 0,
    ancho = 20.5,
    alto = 9,
    peso_total_cant_fisica = 5.518,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1728';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'juego de 04 unidades',
    rack = '2',
    ubicacion_actual = 'NIVEL4',
    contenedor = '2',
    largo = 0,
    ancho = 20.5,
    alto = 9,
    peso_total_cant_fisica = 5.42,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1729';

UPDATE inventario 
SET cantidad_fisica = 70,
    dif = 8,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 3,
    peso_total_cant_fisica = 13.930000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.31.7.030.080';

UPDATE inventario 
SET cantidad_fisica = 24,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '2',
    largo = 0,
    ancho = 8,
    alto = 3,
    peso_total_cant_fisica = 6.432,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.507.1';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 6,
    alto = 20,
    peso_total_cant_fisica = 0.704,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.09.058';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '1',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 30,
    alto = 40,
    peso_total_cant_fisica = 20.63,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.09.060';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 6,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 14.6,
    alto = 1.7,
    peso_total_cant_fisica = 0.11399999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.455';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 28,
    ancho = 22.3,
    alto = 2,
    peso_total_cant_fisica = 4.525,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.3000';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 6,
    ancho = 13,
    alto = 4,
    peso_total_cant_fisica = 1.0050000000000001,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.301';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = 7,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 10,
    ancho = 4,
    alto = 2.7,
    peso_total_cant_fisica = 2.0700000000000003,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.302';

UPDATE inventario 
SET cantidad_fisica = 4200,
    dif = -500,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 30.2,
    ancho = 21,
    alto = 1.4,
    peso_total_cant_fisica = 2914.7999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.337';

UPDATE inventario 
SET cantidad_fisica = 19,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '2',
    largo = 0,
    ancho = 13,
    alto = 1.8,
    peso_total_cant_fisica = 0.399,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.454';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 6,
    observacion = 'SOBRANTE',
    comentario = 'ROLLO X 1 UND',
    rack = '1',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 6.1,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.14.02.005';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL3',
    contenedor = '1',
    largo = 16,
    ancho = 12,
    alto = 7,
    peso_total_cant_fisica = 3,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '81.05.0412.01';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '6',
    ubicacion_actual = 'NIVEL1',
    contenedor = '1',
    largo = 34,
    ancho = 31,
    alto = 3,
    peso_total_cant_fisica = 0.918,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.174';

UPDATE inventario 
SET cantidad_fisica = 15,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 18,
    ancho = 10,
    alto = 16,
    peso_total_cant_fisica = 5.25,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.01.01.003';

UPDATE inventario 
SET cantidad_fisica = 14,
    dif = 14,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL2',
    contenedor = '1',
    largo = 18,
    ancho = 10,
    alto = 16,
    peso_total_cant_fisica = 5.474,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.01.01.004';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1872';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 8,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 20,
    ancho = 11,
    alto = 10,
    peso_total_cant_fisica = 25.368,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.05.014';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 8,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 20,
    ancho = 16,
    alto = 10,
    peso_total_cant_fisica = 22.84,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.05.023';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 20,
    ancho = 14,
    alto = 11,
    peso_total_cant_fisica = 18.759999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.04.002';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '4',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 20,
    ancho = 14,
    alto = 11,
    peso_total_cant_fisica = 19.759999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.05.007';

UPDATE inventario 
SET cantidad_fisica = 480,
    dif = -197,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 25,
    alto = 7,
    peso_total_cant_fisica = 19200,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.353';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '8',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 17,
    alto = 19,
    peso_total_cant_fisica = 12.192,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '201.03.103.01';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '5',
    ubicacion_actual = 'NIVEL4',
    contenedor = '1',
    largo = 10,
    ancho = 14,
    alto = 20.5,
    peso_total_cant_fisica = 0.243,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.015';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL 4',
    contenedor = '2',
    largo = 74,
    ancho = 38,
    alto = 2,
    peso_total_cant_fisica = 3.075,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.22.018';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL 4',
    contenedor = '2',
    largo = 76,
    ancho = 37.5,
    alto = 2,
    peso_total_cant_fisica = 3.95,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.22.022';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL 4',
    contenedor = '2',
    largo = 15,
    ancho = 27.5,
    alto = 29,
    peso_total_cant_fisica = 10.46,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.155';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '2',
    ubicacion_actual = 'NIVEL 4',
    contenedor = '2',
    largo = 27,
    ancho = 29,
    alto = 36,
    peso_total_cant_fisica = 20.299999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.156';

UPDATE inventario 
SET cantidad_fisica = 211,
    dif = 0,
    observacion = 'OK',
    comentario = '42 PTES DE 5KG Y 1 PTE DE 1 KG',
    rack = '3',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 20,
    ancho = 3.5,
    alto = 1.5,
    peso_total_cant_fisica = 105.289,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '31.12.332';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 12,
    ancho = 8,
    alto = 1,
    peso_total_cant_fisica = 10.43,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.300';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'PISO',
    contenedor = '2',
    largo = 11,
    ancho = 10,
    alto = 4.5,
    peso_total_cant_fisica = 5.708,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.521';

UPDATE inventario 
SET cantidad_fisica = 80,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL 3',
    contenedor = '2',
    largo = 7.5,
    ancho = 1.8,
    alto = 1.8,
    peso_total_cant_fisica = 60,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.01.610.01';

UPDATE inventario 
SET cantidad_fisica = 179,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL 3',
    contenedor = '2',
    largo = 11,
    ancho = 1.5,
    alto = 1.5,
    peso_total_cant_fisica = 19.869,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '51.2.20.120.4000.2.1';

UPDATE inventario 
SET cantidad_fisica = 25,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '3',
    ubicacion_actual = 'NIVEL 3',
    contenedor = '2',
    largo = 9.9,
    ancho = 2.9,
    alto = 2.9,
    peso_total_cant_fisica = 3.8249999999999997,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '51.2.22.016.0092.13';

UPDATE inventario 
SET cantidad_fisica = 300,
    dif = -663,
    observacion = 'FALTANTE',
    comentario = 'CAJA # 20',
    rack = '',
    ubicacion_actual = '',
    contenedor = '2',
    largo = 9,
    ancho = 9,
    alto = 1,
    peso_total_cant_fisica = 10.500000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.162';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'TIENE 2 UNIDADES DISTINTA MEDIDA',
    rack = '',
    ubicacion_actual = '',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '904.18.754';

UPDATE inventario 
SET cantidad_fisica = 17,
    dif = 17,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 18.5,
    ancho = 12,
    alto = 4.5,
    peso_total_cant_fisica = 0.391,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.296';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 21,
    ancho = 21,
    alto = 1.5,
    peso_total_cant_fisica = 0.63,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '01606.01.790';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 13,
    ancho = 9,
    alto = 1.5,
    peso_total_cant_fisica = 0.148,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.554';

UPDATE inventario 
SET cantidad_fisica = 11,
    dif = 11,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 3,
    alto = 0.7,
    peso_total_cant_fisica = 0.09899999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1270';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 13.3,
    alto = 0.3,
    peso_total_cant_fisica = 0.14700000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.437.5';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 19,
    alto = 7,
    peso_total_cant_fisica = 0.033,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1642';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 8.2,
    alto = 6,
    peso_total_cant_fisica = 0.388,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.45.04.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = 'DEBE REVISAR GABINO',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.048';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = 'DEBE REVISAR GABINO',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.288';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = 'DEBE REVISAR GABINO',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.287';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -17,
    observacion = 'FALTANTE',
    comentario = 'DEBE REVISAR GABINO',
    rack = '7',
    ubicacion_actual = 'PISO',
    contenedor = '1',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.201';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.624';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1.7,
    observacion = 'FALTANTE',
    comentario = 'OBSERVADO DISTINTAS MEDIDAS',
    rack = '',
    ubicacion_actual = '',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.02.302';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -37,
    observacion = 'FALTANTE',
    comentario = 'PRODUCTOS DE BAJA',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.056';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -41,
    observacion = 'FALTANTE',
    comentario = 'PRODUCTOS DE BAJA',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.032';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.510';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000618';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000619';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0.95,
    ancho = 0.17,
    alto = 0.17,
    peso_total_cant_fisica = 0.098,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'HERRMEC01000126';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.2.05.155.110.0202';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7051';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7050';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.353';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7049';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.30.3.210';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.50.01.50.0011';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 11.05,
    alto = 0.3,
    peso_total_cant_fisica = 0.18,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.23.010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.762';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7047';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.792';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.07.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.33.01.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.73.03.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.33.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.33.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.190';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.02.134';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.06.163';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.46.01.120.175';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.46.03.140';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0104000055';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.354.04';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000626';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 30,
    ancho = 16.05,
    alto = 12,
    peso_total_cant_fisica = 4.177,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0105000099';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.098.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.319';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.1004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.907';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.492';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.19.1.031.354.03.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.993';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.1041';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.95.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.937';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000627';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S09000009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S09000008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.20.03.001.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.115';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.047';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -26,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.23.03.14.220';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.397';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3776';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S05000250';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7048';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.33.004.09';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -646,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0.75,
    ancho = 0.75,
    alto = 0.75,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '504.02.705.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = 'ANDAMIO',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.96.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.570';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '800.01.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.50.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.50.03.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.50.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -17,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.015';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.46.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.58.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.080';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.170';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.133';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.29.1.01.75';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.79';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.56.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.02.04.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -27,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.76.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -19,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.580';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.509';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.411';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.05.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.02.04.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.115';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -17,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.57.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.76.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.117';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.121';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.147';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.42.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.554';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -31,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.78';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '800.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -207.5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '31.10.03.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -600,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.04.80.003.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -90000,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.04.80.002.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4082';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -960,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4080';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4081';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5168';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5166';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -450,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5165';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -200,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5172';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5171';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -500,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5170';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -50,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.94.01.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -319,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0104000033';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -27,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.02.105';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.03.015';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.02.017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.02.303';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.02.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '202.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.47.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.123';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -191,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.108';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1500,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -965,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.201';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -125,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '402.02.0010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -146,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '23.01.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4903';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -90,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.94.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3626,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.08.878';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -40188,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.18.02.0003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -32,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.500';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '203.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.923';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.953';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.04.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -120,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.03.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.03.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6991';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '85.04.600.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -600,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.02.106';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4.6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.355';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -999,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '84.330.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '800.01.039';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '27.03.01.402';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.603';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.22.07.30.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -31,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.018';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4983';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.02.302';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.53.02.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -17,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '201.03.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -19,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '201.03.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -105,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '.RAPL.60.0075.0085';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -26,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.089';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -105,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.912';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.271';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.19.013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -39,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.19.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6930';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -250,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '301.14.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -60,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.03.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.995.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -255,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '.ESMTR.25.0001.0001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '29.27.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'A.33611.01.12.LEN-04';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '19.04.04.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'MALLA101000011';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'MALLA101000013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'MALLA101000014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.03.011';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 18,
    ancho = 10,
    alto = 0.25,
    peso_total_cant_fisica = 0.042,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1532';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.008';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 2, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 36,
    ancho = 39,
    alto = 47,
    peso_total_cant_fisica = 63.04,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.015';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 16,
    ancho = 0.87,
    alto = 0.45,
    peso_total_cant_fisica = 0.38,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.99.115';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, caja suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.62,
    ancho = 12,
    alto = 20.03,
    peso_total_cant_fisica = 4.4,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.36.02.002';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -22,
    observacion = 'FALTANTE',
    comentario = 'Nivel 2, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 20,
    ancho = 14.05,
    alto = 14.05,
    peso_total_cant_fisica = 3.118,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '19.04.02.015';

UPDATE inventario 
SET cantidad_fisica = 9,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 15.03,
    ancho = 0.62,
    alto = 15.03,
    peso_total_cant_fisica = 2.5200000000000005,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1694';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1693';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.465';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 18,
    ancho = 13,
    alto = 28,
    peso_total_cant_fisica = 1.806,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.016';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = 'Rack 1, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.53,
    ancho = 0.1,
    alto = 0.5,
    peso_total_cant_fisica = 0.056,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1695';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.8,
    ancho = 0.55,
    alto = 0.11,
    peso_total_cant_fisica = 0.77,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.06.002';

UPDATE inventario 
SET cantidad_fisica = 10,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.8,
    ancho = 0.55,
    alto = 0.11,
    peso_total_cant_fisica = 0.79,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.06.004';

UPDATE inventario 
SET cantidad_fisica = 7,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.75,
    ancho = 0.1,
    alto = 0.75,
    peso_total_cant_fisica = 0.07,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.07.019';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1681';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '27.04.01.004';

UPDATE inventario 
SET cantidad_fisica = 20,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 2, Suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 28,
    ancho = 0.001,
    alto = 22.06,
    peso_total_cant_fisica = 0.36,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1079';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.53.05.001';

UPDATE inventario 
SET cantidad_fisica = 21,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Bolas',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 15,
    ancho = 15,
    alto = 11,
    peso_total_cant_fisica = 29.567999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.55.001';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, paquetes en caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.65,
    ancho = 0.35,
    alto = 0.35,
    peso_total_cant_fisica = 0.344,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.60';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 15.03,
    ancho = 0.4,
    alto = 0.83,
    peso_total_cant_fisica = 0.241,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.73.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.51.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.012';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.9,
    ancho = 0.5,
    alto = 0.25,
    peso_total_cant_fisica = 0.061,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.01.052';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.110';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 33,
    ancho = 12,
    alto = 31,
    peso_total_cant_fisica = 14.822,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.48.01.003';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, caja suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 41.05,
    ancho = 31,
    alto = 32.07,
    peso_total_cant_fisica = 0.292,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.48.01.004';

UPDATE inventario 
SET cantidad_fisica = 16,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 C, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 2.2,
    ancho = 0.63,
    alto = 11.05,
    peso_total_cant_fisica = 1.536,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.44.001';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 A, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.8,
    ancho = 0.2,
    alto = 0.45,
    peso_total_cant_fisica = 0.296,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.02.100';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'Rack 1',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.8,
    ancho = 0.5,
    alto = 0.3,
    peso_total_cant_fisica = 0.22199999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.02.101';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'ACCCMP101000168';

UPDATE inventario 
SET cantidad_fisica = 18,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja K',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.54,
    ancho = 0.45,
    alto = 0.45,
    peso_total_cant_fisica = 4.32,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S01000070';

UPDATE inventario 
SET cantidad_fisica = 18,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja K',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.6,
    ancho = 0.35,
    alto = 0.35,
    peso_total_cant_fisica = 2.79,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S01000071';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000402';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.196';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja J',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 43,
    ancho = 0.05,
    alto = 24,
    peso_total_cant_fisica = 0.206,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4027';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.1.9.03175.132.293';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.1.40.010.2000.1';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = 'Nivel 3, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 23,
    ancho = 10,
    alto = 28,
    peso_total_cant_fisica = 9,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '27.1.05.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.767';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.769';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.1.40.050.0900';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -86,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 31.05,
    ancho = 0.8,
    alto = 20,
    peso_total_cant_fisica = 8.278,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.05.16';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.402.1';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 35,
    ancho = 10.05,
    alto = 40,
    peso_total_cant_fisica = 2.141,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.33.004.12';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.360';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '53.1.20.012.8';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -119,
    observacion = 'FALTANTE',
    comentario = 'OBSERVADO DISTINTAS MEDIDAS',
    rack = '',
    ubicacion_actual = '',
    contenedor = '2',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '53.1.10.005.3';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.15.101166';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.52.01.400';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.103';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '405.02.025';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.954.2';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'Rack 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.9,
    ancho = 0,
    alto = 0.75,
    peso_total_cant_fisica = 0.324,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.387';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 16.07,
    ancho = 0.71,
    alto = 18,
    peso_total_cant_fisica = 11.978,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1251';

UPDATE inventario 
SET cantidad_fisica = 86,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 24,
    ancho = 0.2,
    alto = 25,
    peso_total_cant_fisica = 87.806,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.04.019';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.2.05.110.0233';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4022';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '607.07.095';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1290.010';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -29,
    observacion = 'FALTANTE',
    comentario = 'Nivel 2, Suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 49,
    ancho = 44,
    alto = 49,
    peso_total_cant_fisica = 72.578,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1000.3';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.04.016';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = 'Suelo, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 33,
    ancho = 1.95,
    alto = 33,
    peso_total_cant_fisica = 48.844,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.82.02.114.102';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.027';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1741';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = 'Suelo, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 50,
    ancho = 25,
    alto = 35,
    peso_total_cant_fisica = 6.733,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2165';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -40,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.83.02.114.102';

UPDATE inventario 
SET cantidad_fisica = 30,
    dif = 10,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 2, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 14.05,
    ancho = 0,
    alto = 21,
    peso_total_cant_fisica = 3.5100000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.83.01.114.101';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.763';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.050';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.036';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.03.005';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = 'Rack 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 37.08,
    ancho = 0.24,
    alto = 20,
    peso_total_cant_fisica = 11.752,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.56.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.921';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Baza',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.93,
    ancho = 0.05,
    alto = 10,
    peso_total_cant_fisica = 0.025,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1623';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.484.03';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.30.5.003';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 B, Cajas',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 11.05,
    ancho = 0.2,
    alto = 11.03,
    peso_total_cant_fisica = 0.5845,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.311';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.17.06.006628';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.374';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.210';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.376';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.04.010';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja J',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 20,
    ancho = 0,
    alto = 0.4,
    peso_total_cant_fisica = 0.852,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4028';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4875';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.63.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.63.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4021';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.69.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.69.002';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Piso 4 B, juego',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.68,
    ancho = 0.14,
    alto = 0.14,
    peso_total_cant_fisica = 0.029,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.33.01.080';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja J',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 47,
    ancho = 11,
    alto = 17,
    peso_total_cant_fisica = 1.198,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.048';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 18.05,
    ancho = 0,
    alto = 0.74,
    peso_total_cant_fisica = 0.224,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.47.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.36.12.370.710';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 2, Suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 22.04,
    ancho = 0.65,
    alto = 0.6,
    peso_total_cant_fisica = 2.586,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.261';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Caja J',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 39,
    ancho = 13.05,
    alto = 13.05,
    peso_total_cant_fisica = 1.049,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4016';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.531';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2149';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2151';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'UND';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 B, empacado',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 35,
    ancho = 0.7,
    alto = 0.8,
    peso_total_cant_fisica = 6.275,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.54.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.58.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.06.151';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.586';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 12.03,
    ancho = 0.83,
    alto = 10.05,
    peso_total_cant_fisica = 0.479,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.68.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1148.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '59.30.016.1000.8';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.03.997';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 50,
    ancho = 24,
    alto = 50,
    peso_total_cant_fisica = 33.168,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.1300';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.402.4';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.3614.370.711';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1937';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.04.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2134';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.723.2';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2135';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.06.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.18.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.01.503';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.791';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.02.3804';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.20.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.32.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3866';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4023';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.04.017';

UPDATE inventario 
SET cantidad_fisica = 194,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, Paquetes',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 19,
    ancho = 0.4,
    alto = 11,
    peso_total_cant_fisica = 89.822,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.04.018';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 20,
    ancho = 0.15,
    alto = 28.05,
    peso_total_cant_fisica = 0.10799999999999998,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.04.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.003';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 B, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 13,
    ancho = 0.15,
    alto = 0.8,
    peso_total_cant_fisica = 0.58,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.007';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 B, empacados',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 10,
    ancho = 0.48,
    alto = 10,
    peso_total_cant_fisica = 1.613,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.603.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.098';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.86,
    ancho = 0.145,
    alto = 0.53,
    peso_total_cant_fisica = 32.488,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.622';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.722';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.310';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.905';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -73,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.485';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.942.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.24.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.24.023';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.19.0002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4024';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.02.263';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -200,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.03.204';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -280,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.03.291';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '89.03.046.003.15';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 31,
    ancho = 51,
    alto = 31,
    peso_total_cant_fisica = 6.816,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1985';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.07,
    ancho = 0.8,
    alto = 11.05,
    peso_total_cant_fisica = 0.44999999999999996,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.04.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.216';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.07.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.1006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.416.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -33,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.462';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 2, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 17,
    ancho = 0.9,
    alto = 25,
    peso_total_cant_fisica = 5.648,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.06.07.223';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.386';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.83.100.801';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.390.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.050.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.530';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.02.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.98.01.200';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.579';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.411.500';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.19.0015';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.19.0017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.19.0018';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.19.0022';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.19.0023';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 14.05,
    ancho = 0.05,
    alto = 10.02,
    peso_total_cant_fisica = 0.018000000000000002,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.28.02.800.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4025';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 17,
    ancho = 0,
    alto = 0.2,
    peso_total_cant_fisica = 0.112,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.44.12.1225';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3054';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.958';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 12,
    ancho = 19.07,
    alto = 0.48,
    peso_total_cant_fisica = 0.354,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2167';

UPDATE inventario 
SET cantidad_fisica = 5,
    dif = 4,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 2, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.7,
    ancho = 0.7,
    alto = 0.95,
    peso_total_cant_fisica = 1.43,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2166';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 13,
    ancho = 0.75,
    alto = 0.75,
    peso_total_cant_fisica = 0.483,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2168';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.8,
    ancho = 11,
    alto = 0.8,
    peso_total_cant_fisica = 1.3,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2169';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Rack 1, suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.85,
    ancho = 0.53,
    alto = 10.05,
    peso_total_cant_fisica = 0.203,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2171';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.2150';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4861';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.33.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4026';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.05.635';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.019';

UPDATE inventario 
SET cantidad_fisica = 4,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1 C, Bolsa',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 23,
    ancho = 0.15,
    alto = 14.05,
    peso_total_cant_fisica = 0.16,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.24.101';

UPDATE inventario 
SET cantidad_fisica = 8,
    dif = 0,
    observacion = 'OK',
    comentario = 'Piso, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 20.636,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.14.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.093.01';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = 'Suelo, caja H',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 34.05,
    ancho = 12,
    alto = 22.05,
    peso_total_cant_fisica = 26.088,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3868';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3550';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.3062';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 19,
    ancho = 27,
    alto = 24.05,
    peso_total_cant_fisica = 2.658,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.31.01.050.220.002';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = 'Nivel 1 B, paquetes',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 15,
    ancho = 10,
    alto = 0.95,
    peso_total_cant_fisica = 3.81,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.60.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5547';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.18.001.09.11';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.5122';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.041';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -21,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7016';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7128';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.07.10.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.05.004';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Piso 4 B, suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.68,
    ancho = 0,
    alto = 0.14,
    peso_total_cant_fisica = 0.029,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.33.01.060';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'Piso 4 B, juego',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.93,
    ancho = 0.15,
    alto = 0.45,
    peso_total_cant_fisica = 0.3378,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.12.029';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.997';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.027';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.35.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6800';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000403';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000404';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0105000098';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000628';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000629';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000630';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S03000631';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -0.2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.923';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -33,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -147,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -43,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1097';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.070';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.086';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.260.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.976';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.261';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.463';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.807';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.070';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.703';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.12.013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.022';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.078';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.117';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.155';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.043';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.046';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.03.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -0.5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '505.02.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.107';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.108';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.109';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.110';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.111';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.23.060';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.35.001.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.50.060';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.07.21.300';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.107';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -122,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1031';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.025';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -19,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.048';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.077';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.098';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.099';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.037';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.136';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -91,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.462';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.515';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.115';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.376';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.377';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.378';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.741';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '404.01.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '01603.01.503';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '01604.03.313';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -200,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.103';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -150,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.42.12.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.23.05.002.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.23.05.002.03';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.26.01.0401';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.30.01.012.220';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.30.01.038.222';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.30.02.15.200';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.30.05.03.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.30.06.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.59.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.97.03.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.08.10.200.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.02.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -37,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.12.05.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.14.30.014.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.25.01.10.017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.01.040';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.026';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.028';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.031';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.045';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.03.052';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.02.003.2';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.47.02.390.364.13';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.50.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.50.11.320.0200';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.15.349003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.15.349004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.01.2.4.060';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.011';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.12.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.49.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.50.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.51.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.53.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.54.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.54.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.54.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.63.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.63.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.67.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.30.3.209';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.31.1.050.05.121';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.31.8.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.01.0312';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.01.0400';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.02.0520';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.02.0620';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.03.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.03.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.03.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.72.03.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.1.81.058.090.0115';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.08.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.17.09.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.36.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.966';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.735';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.739';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -87,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.740';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.761';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '502.01.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '53.140.160.192.2.16';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '53.6.10.016.2';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.109';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.1018';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.1021';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.923';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.960';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.03.1004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.1065';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.1066';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.1067';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.1075';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -40,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.242';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.245';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.247';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.371';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -60,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.450';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.450.25.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.502';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.503';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -104,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.519';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -180,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.520';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.902';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.244';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.251.20';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.429';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.436';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.488';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.493';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.494';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.651';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.916';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.03.057.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.086';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.435';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -28,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.057';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.058';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.088';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.322';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.356';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.394';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.398';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.995';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -58,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.050.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.176';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.252';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.285';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.38';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -200,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.506';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.53';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.051';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.053';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.07.015.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.519';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.523';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.703';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.742';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.743';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.264';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.504';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.506';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -29,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.187.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.376.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.753';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.09.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.13.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -196,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.016';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.001.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -40,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -80,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.070';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '501.01.320';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.018';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -56,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.025';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.30.01.10.030';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.10.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.1.20.032.0668';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.015';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.208';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.55.01.575';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.507';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.809.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.23.05.002.02';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '210.1.06.001.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.681.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.36.02.127';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.43.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.17.340003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.04.309.19';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.045.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = 'FALTANTE',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.526';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.39.220.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.478';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.071';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -58,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.35.03.616';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.35.02.025';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.35.10.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.112';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.320';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.85.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.85.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -44,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1124';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.02.07.060';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.132';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.02.02.077';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.124';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.07.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.07.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.07.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -50,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.02.18.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.117';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -302,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -206,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -516,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -540,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'XS.08.100.068';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.099.018';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -119,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.1044';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -53,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.1013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -30,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.035';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.016';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.01.4.2.100.100.10';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '1CAHE.0001.0002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.02.15.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.031.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.280';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.18.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.069.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.1035';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.68.03.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.512.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.505';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.56.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.14.349208';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.037';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.231';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.148.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3625,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.148';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -23,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.056';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.04.151';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.130';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.437';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.461';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -370,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.179';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -57,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.192';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.21.01.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.24.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.209';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.12.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -38,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.101';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.103';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -26,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.139';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.118';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.102';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -19,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.1023';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.1036';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.381';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.47.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.54.04.416';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.262';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.076.4007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.019';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.57.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.57.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.128';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.12.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.040';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.04.02.118.400';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.65.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.65.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.48.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.48.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.75.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.431';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.86.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.53.02.120.220';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.41.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.12.200076';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -40,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.890';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -80,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.940';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.07.083';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.209';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.208';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'XS.07.100.08';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'XS.07.100.09';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.015';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.75.02.100.2';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.35.450.05';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.553';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.959';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.499';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.21.120';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.46.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.018';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.725';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.724';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.700';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.03.022';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.03.023';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.03.021';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.04.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.181';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.04.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.213';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.211';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.791';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.20.03.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -24,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.914';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '01801.01.705';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '405.01.013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '405.01.017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.402';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.070';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.29.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.33.01.040';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.42.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.42.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.42.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.07.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.07.013';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.06.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.06.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.04.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.04.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.24.04.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -103,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.993';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.023';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, Suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 25.05,
    ancho = 0,
    alto = 26,
    peso_total_cant_fisica = 0.4,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.16.340038';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.16.340039';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.18.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.18.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.18.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.168';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -27,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '19.02.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.360.04';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.32.02.20.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.94.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.20.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.20.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.03.09.201';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.03.10.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.03.15.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.07.092';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.03.05.018';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.46.01.140.200';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.46.01.160.200';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.46.01.040.070';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.46.03.580.110';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.317';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.236';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '016.04.04.343';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.325.222';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.325.221';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '805.04.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.01.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -65,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.01.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.01.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.03.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -21,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.03.009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.03.010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -45,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.03.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -29,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.03.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -50,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.03.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.63.03.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.302';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.311';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.70.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.52.010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.19.025';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.098.02';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.22.03.30.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.066';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.069';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.460';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.03.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.430';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.092';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.043';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.14.2.02.043';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.14.2.02.040';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.14.2.02.042';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.059';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.089';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.607';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.038';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.03.316';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.12.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.12.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.12.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.12.024';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.895';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.045';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -19,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.046';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.047';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.369';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.1052';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -50,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.90.09.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'XS.06.100.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '930.01.100.0002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.360';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '501.01.317';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.15.05.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.11.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.11.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.11.04.05.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.019';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.06.413';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.028';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.031';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.04.450';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.073';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.09.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.976';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.456';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.192';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.12.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.12.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.12.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.12.04.05.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.25.03.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '25.03.340.100.095';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.416';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.198';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.139';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.05.2.115';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.140';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.01.419';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.013.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -19,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.03.20.290';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -784,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.667';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -265,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.470';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.02.30.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.02.50.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.036';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.470';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.37.3.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.54.01.010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.54.01.012';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.44.12.1224';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.01.23.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.01.23.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.44.01.1805';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.612';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.44.08.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.025';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.596';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.05.057';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.97.01.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.54.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.54';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.57.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.489';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.33.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.33.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.45.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.45.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.45.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.06.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.57.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.973';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -282,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.124';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.27.01.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.040';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.461';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.05.052.01.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -158,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'XS.07.100.05';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.34.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.04.518';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.74.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.07.082';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.04.309.18';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -800,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '57.01.400.1900.1';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.36.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.400';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.28.02.250.050';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.90.61.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -57,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '404.02.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -167,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.133';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.10.04.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -54,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.105';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.36.01.240.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -25,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.36.01.240.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.07.10.112';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.02.738';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1030';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1029';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.07.71.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '404.02.150';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.317';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.07.61.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '404.02.057';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -38,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.05.296';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '404.01.151';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.80.18.903223';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.434';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.96.01.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.25.01.10.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.29.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.15.05.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.484';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.68.03.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.21.01.009';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '607.01.059';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.294.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.02.294.02';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.16.04.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.16.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.16.04.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.442';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.443';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -32,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.445';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.440';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.53.01.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.53.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.564';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.027';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.70.01.008';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.70.01.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.70.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.70.01.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.70.01.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.350';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.349';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.365';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.528';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -22,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.582';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.581';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.574';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1780';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '12.28.01.102';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.999';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.925';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.102';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.152';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.601';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.899';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.101';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.02.101';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.299';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.201';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -33,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.325';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.03.20.204';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.03.20.404';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.03.20.402';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.583';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.153';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1745';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.031';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -50,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.570';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -183,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.319';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -7,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.024';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.22.03.600';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.03.20.406';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.312';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.16.04.006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1149,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.461';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.596';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.597';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.453';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.05.03.128';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.02.12.041';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.02.12.044';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -50,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.555';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -836,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.504';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.414';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.0006';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.470';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -0.3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.510';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.005';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -79,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.547';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.525';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.531';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -21,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.007';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.507';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -13,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.323';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.333';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.08.03.150';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '26.08.03.151';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -23,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.0003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.541';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.539';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.540';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.589';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.308';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.609';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.512';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.563';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.565';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.650';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.911';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.457';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -8,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.458';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.459';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.305';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '608.01.379';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -225,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.559';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.38.1.02';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.520';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.11.02.951';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.11.03.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.11.03.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '28.43.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.906';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.777';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.778';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.775';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.776';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1711';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1712';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.888';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.348';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.41.2.11.18';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.41.2.11.11';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.41.2.11.08';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.895';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.403';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.020';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.015';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '601.01.017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.915';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.014';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.39.10.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.39.10.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -324,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.832';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -54,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.116';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -24,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1786';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.154';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -16,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.44.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.024';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 C, Caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 19.05,
    ancho = 0.4,
    alto = 11.05,
    peso_total_cant_fisica = 0.342,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '607.07.100';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.40.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.68.14.001';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 1 C, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0.34,
    ancho = 0.55,
    alto = 0.89,
    peso_total_cant_fisica = 0.22,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.67.01.048';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.1002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.20.01.030.030';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 0,
    observacion = 'OK',
    comentario = 'Nivel 2, caja suelto',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 29,
    ancho = 0.8,
    alto = 3.05,
    peso_total_cant_fisica = 4.227,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S10000072';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -4,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.36.13.370.710';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '10.40.02.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -5,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '15.01.02.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '18.51.02.004';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '21.30.3.209.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2848,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.69.01.002';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1272,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '14.69.01.003';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -200,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '503.04.502.02';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -3,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.01.1010';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.01.903';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -6,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.161';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -18,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '603.03.135';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.120';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.205';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.09.059';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.02.021';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -20,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.1333';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -10,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.7017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -24,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '606.01.538';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4879';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -100,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.39.1.01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'A.33311.20.01.MAC-01';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.01.147';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -15,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.09.057';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'ACCCMP101000305';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -700,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '9.67.02.001';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -14,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.6429';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'ACCCMP101000306';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4881';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -9,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'EPPSS0104000017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -1,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'EPPSS0108000042';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -11,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0104000017';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -40,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0105000102';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -38,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'P102DUXC107A000';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 0,
    observacion = 'OK',
    comentario = 'Level 4, caja',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 22.07,
    ancho = 0.7,
    alto = 0.7,
    peso_total_cant_fisica = 0.776,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S10000530';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 0,
    observacion = 'OK',
    comentario = 'Rack 1',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 29.05,
    ancho = 0.92,
    alto = 16,
    peso_total_cant_fisica = 9.149999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S10000532';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -2,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0105000103';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = -12,
    observacion = 'FALTANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'OCONS0105000104';

UPDATE inventario 
SET cantidad_fisica = 0,
    dif = 0,
    observacion = 'OK',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 0,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 0,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = 'RPTS01S16000414';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Caja',
    rack = '',
    ubicacion_actual = 'Nivel 1, Caja',
    contenedor = '',
    largo = 0.85,
    ancho = 0.57,
    alto = 17,
    peso_total_cant_fisica = 0.224,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '602.02.616';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Caja',
    rack = '',
    ubicacion_actual = 'Nivel 1, Caja',
    contenedor = '',
    largo = 11.05,
    ancho = 0.43,
    alto = 0.43,
    peso_total_cant_fisica = 0.087,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '604.06.034';

UPDATE inventario 
SET cantidad_fisica = 2,
    dif = 2,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = 'Nivel 1, Bolsa',
    contenedor = '',
    largo = 15,
    ancho = 0,
    alto = 10,
    peso_total_cant_fisica = 0.08,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.12.1290';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, caja',
    rack = '',
    ubicacion_actual = 'Nivel 1, caja',
    contenedor = '',
    largo = 15.05,
    ancho = 0.65,
    alto = 15.05,
    peso_total_cant_fisica = 0.278,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.15.4693';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Bolza',
    rack = '',
    ubicacion_actual = 'Nivel 1, Bolza',
    contenedor = '',
    largo = 18,
    ancho = 15,
    alto = 0.25,
    peso_total_cant_fisica = 0.339,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '801.5.137';

UPDATE inventario 
SET cantidad_fisica = 3,
    dif = 3,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 1, Bolsa',
    rack = '',
    ubicacion_actual = 'Nivel 1, Bolsa',
    contenedor = '',
    largo = 0.08,
    ancho = 26.05,
    alto = 17,
    peso_total_cant_fisica = 0.11699999999999999,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '13.44.09.001';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = 'Nivel 2, caja',
    rack = '',
    ubicacion_actual = 'Nivel 2, caja',
    contenedor = '',
    largo = 28,
    ancho = 0.78,
    alto = 0.78,
    peso_total_cant_fisica = 0.532,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '605.03.402.24';

UPDATE inventario 
SET cantidad_fisica = 6,
    dif = 6,
    observacion = 'SOBRANTE',
    comentario = 'Level 4, caja',
    rack = '',
    ubicacion_actual = 'Level 4, caja',
    contenedor = '',
    largo = 24,
    ancho = 0,
    alto = 0,
    peso_total_cant_fisica = 2.538,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '409.18.771';

UPDATE inventario 
SET cantidad_fisica = 1,
    dif = 1,
    observacion = 'SOBRANTE',
    comentario = '',
    rack = '',
    ubicacion_actual = '',
    contenedor = '',
    largo = 46.05,
    ancho = 7,
    alto = 30,
    peso_total_cant_fisica = 1.47,
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '20.32.09.001';

COMMIT;
