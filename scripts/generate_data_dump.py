import sqlite3

def escape_sql_string(s):
    if s is None:
        return "NULL"
    if isinstance(s, (int, float)):
        return str(s)
    return "'" + str(s).replace("'", "''") + "'"

def generate_inserts():
    conn = sqlite3.connect('data/app.db')
    cursor = conn.cursor()
    
    with open('scripts/inserts_migracion.sql', 'w', encoding='utf-8') as f:
        f.write("-- MIGRACIÓN DE DATOS (SIN USUARIOS LEGACY)\n")
        f.write("-- Como se limpiaremos los usuarios, quitamos la restricción NOT NULL en movimientos\n")
        f.write("ALTER TABLE movimientos ALTER COLUMN usuario_id DROP NOT NULL;\n\n")
            
        # 2. BODEGAS
        cursor.execute("SELECT id, codigo, nombre, empresa_codigo, direccion, activo, created_at FROM bodegas")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: bodegas\n")
            for r in rows:
                f.write(f"INSERT INTO bodegas (id, codigo, nombre, empresa_codigo, direccion, activo, created_at, created_by) VALUES ({r[0]}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}, {escape_sql_string(r[4])}, {r[5]}, {escape_sql_string(r[6])}, NULL) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('bodegas_id_seq', (SELECT MAX(id) FROM bodegas));\n\n")

        # 3. UNIDADES_MEDIDA
        cursor.execute("SELECT codigo_unidad, codigo_sap, nombre, simbolo, permite_decimales FROM unidades_medida")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: unidades_medida\n")
            for r in rows:
                f.write(f"INSERT INTO unidades_medida (codigo_unidad, codigo_sap, nombre, simbolo, permite_decimales) VALUES ({escape_sql_string(r[0])}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}, {r[4]}) ON CONFLICT DO NOTHING;\n")
            f.write("\n")

        # 4. GRUPOS_ARTICULOS
        cursor.execute("SELECT id, codigo, nombre, descripcion FROM grupos_articulos")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: grupos_articulos\n")
            for r in rows:
                f.write(f"INSERT INTO grupos_articulos (id, codigo, nombre, descripcion) VALUES ({r[0]}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('grupos_articulos_id_seq', (SELECT MAX(id) FROM grupos_articulos));\n\n")

        # 5. SUBFAMILIAS
        cursor.execute("SELECT id, grupo_articulo_id, codigo, nombre FROM subfamilias")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: subfamilias\n")
            for r in rows:
                f.write(f"INSERT INTO subfamilias (id, grupo_articulo_id, codigo, nombre) VALUES ({r[0]}, {r[1]}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('subfamilias_id_seq', (SELECT MAX(id) FROM subfamilias));\n\n")

        # 6. CONTENEDORES
        cursor.execute("SELECT id, bodega_id, codigo_contenedor, nombre, zona, descripcion FROM contenedores")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: contenedores\n")
            for r in rows:
                f.write(f"INSERT INTO contenedores (id, bodega_id, codigo_contenedor, nombre, zona, descripcion) VALUES ({r[0]}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}, {escape_sql_string(r[4])}, {escape_sql_string(r[5])}) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('contenedores_id_seq', (SELECT MAX(id) FROM contenedores));\n\n")

        # 7. TIPOS_ALMACENAMIENTO
        cursor.execute("SELECT id, codigo, nombre, descripcion FROM tipos_almacenamiento")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: tipos_almacenamiento\n")
            for r in rows:
                f.write(f"INSERT INTO tipos_almacenamiento (id, codigo, nombre, descripcion) VALUES ({r[0]}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('tipos_almacenamiento_id_seq', (SELECT MAX(id) FROM tipos_almacenamiento));\n\n")

        # 8. PRODUCTOS
        cursor.execute("SELECT sku, glosa, unidad_codigo, grupo_articulo_id, subfamilia_id, tipo_almacenamiento_id, contenedor_id, rack, nivel_rack, posicion_detalle, costo_unitario_actual, moneda, foto_url FROM productos")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: productos\n")
            for r in rows:
                bodega_id = 1
                f.write(f"INSERT INTO productos (sku, glosa, unidad_codigo, grupo_articulo_id, subfamilia_id, tipo_almacenamiento_id, contenedor_id, rack, nivel_rack, posicion_detalle, costo_unitario_actual, moneda, foto_url, created_by, bodega_id) VALUES ({escape_sql_string(r[0])}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}, {escape_sql_string(r[4])}, {escape_sql_string(r[5])}, {escape_sql_string(r[6])}, {escape_sql_string(r[7])}, {escape_sql_string(r[8])}, {escape_sql_string(r[9])}, {escape_sql_string(r[10])}, {escape_sql_string(r[11])}, {escape_sql_string(r[12])}, NULL, {bodega_id}) ON CONFLICT DO NOTHING;\n")
            f.write("\n")
            
        # 8.5. PRODUCTO_COSTOS_HISTORIAL
        cursor.execute("SELECT id, producto_sku, costo_unitario, moneda, fecha_validez_desde, fecha_validez_hasta, motivo_modificacion, documento_referencia, created_at FROM producto_costos_historial")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: producto_costos_historial\n")
            for r in rows:
                f.write(f"INSERT INTO producto_costos_historial (id, producto_sku, costo_unitario, moneda, fecha_validez_desde, fecha_validez_hasta, motivo_modificacion, documento_referencia, created_at, created_by) VALUES ({r[0]}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}, {escape_sql_string(r[4])}, {escape_sql_string(r[5])}, {escape_sql_string(r[6])}, {escape_sql_string(r[7])}, {escape_sql_string(r[8])}, NULL) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('producto_costos_historial_id_seq', (SELECT MAX(id) FROM producto_costos_historial));\n\n")

        # 9. INVENTARIO
        cursor.execute("SELECT id, producto, lote, cantidad_fisica, um, rack, ubicacion_actual, created_at FROM inventario")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: inventario\n")
            for r in rows:
                f.write(f"INSERT INTO inventario (id, producto, lote, cantidad_fisica, um, rack, ubicacion_actual, usuario_id, created_at, bodega_id) VALUES ({r[0]}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}, {escape_sql_string(r[4])}, {escape_sql_string(r[5])}, {escape_sql_string(r[6])}, NULL, {escape_sql_string(r[7])}, 1) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('inventario_id_seq', (SELECT MAX(id) FROM inventario));\n\n")

        # 10. MOVIMIENTOS
        cursor.execute("SELECT id, tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, solicitante, rack, created_at FROM movimientos")
        rows = cursor.fetchall()
        if rows:
            f.write("-- TABLA: movimientos\n")
            for r in rows:
                f.write(f"INSERT INTO movimientos (id, tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, solicitante, rack, usuario_id, created_at, bodega_id) VALUES ({r[0]}, {escape_sql_string(r[1])}, {escape_sql_string(r[2])}, {escape_sql_string(r[3])}, {escape_sql_string(r[4])}, {escape_sql_string(r[5])}, {escape_sql_string(r[6])}, {escape_sql_string(r[7])}, {escape_sql_string(r[8])}, {escape_sql_string(r[9])}, NULL, {escape_sql_string(r[10])}, 1) ON CONFLICT DO NOTHING;\n")
            f.write(f"SELECT setval('movimientos_id_seq', (SELECT MAX(id) FROM movimientos));\n\n")

    conn.close()

generate_inserts()
