import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';

export async function GET(req: NextRequest) {
  try {
    const db = getDB();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    const baseSelect = `
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
        COUNT(DISTINCT i.id) as inventario_count,
        COALESCE(SUM(i.cantidad_fisica), 0) + COALESCE(
          (SELECT SUM(CASE WHEN m.tipo = 'INGRESO' THEN m.cantidad ELSE -m.cantidad END) FROM movimientos m WHERE m.producto = pr.sku),
          0
        ) as stock_total
      FROM productos pr
      LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
      LEFT JOIN contenedores c ON pr.contenedor_id = c.id
      LEFT JOIN bodegas b ON c.bodega_id = b.id
      LEFT JOIN tipos_almacenamiento ta ON pr.tipo_almacenamiento_id = ta.id
      LEFT JOIN inventario i ON pr.sku = i.producto
    `;

    let items, total;
    if (query) {
      const p = `%${query.trim()}%`;
      items = db.prepare(`
        ${baseSelect}
        WHERE UPPER(pr.sku) LIKE UPPER(?) 
           OR UPPER(pr.glosa) LIKE UPPER(?) 
           OR UPPER(COALESCE(g.nombre, '')) LIKE UPPER(?)
           OR UPPER(pr.rack) LIKE UPPER(?)
           OR UPPER(COALESCE(c.nombre, '')) LIKE UPPER(?)
        GROUP BY pr.sku
        ORDER BY pr.glosa LIMIT ? OFFSET ?
      `).all(p, p, p, p, p, limit, offset);

      const c = db.prepare(`
        SELECT COUNT(*) as total 
        FROM productos pr
        LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
        LEFT JOIN contenedores c ON pr.contenedor_id = c.id
        WHERE UPPER(pr.sku) LIKE UPPER(?) 
           OR UPPER(pr.glosa) LIKE UPPER(?) 
           OR UPPER(COALESCE(g.nombre, '')) LIKE UPPER(?)
           OR UPPER(pr.rack) LIKE UPPER(?)
           OR UPPER(COALESCE(c.nombre, '')) LIKE UPPER(?)
      `).get(p, p, p, p, p) as { total: number };
      total = c.total;
    } else {
      items = db.prepare(`
        ${baseSelect}
        GROUP BY pr.sku
        ORDER BY pr.glosa LIMIT ? OFFSET ?
      `).all(limit, offset);

      const c = db.prepare('SELECT COUNT(*) as total FROM productos').get() as { total: number };
      total = c.total;
    }

    return NextResponse.json({ items, total, page, limit });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function PUT(req: NextRequest) {
  try {
    const db = getDB();
    const body = await req.json();
    const { producto, ...fields } = body;
    if (!producto) return NextResponse.json({ error: 'El campo producto es requerido' }, { status: 400 });

    const cleanSKU = String(producto).trim().toUpperCase();

    // Actualizar tabla productos normalizada
    const updateClauses: string[] = [];
    const values: (string | number)[] = [];

    if (fields.glosa !== undefined) {
      updateClauses.push('glosa = ?');
      values.push(String(fields.glosa).trim());
    }
    if (fields.unidad !== undefined) {
      updateClauses.push('unidad_codigo = ?');
      values.push(String(fields.unidad).trim().toUpperCase());
    }
    if (fields.unidad_codigo !== undefined) {
      updateClauses.push('unidad_codigo = ?');
      values.push(String(fields.unidad_codigo).trim().toUpperCase());
    }
    if (fields.grupo_articulo_id !== undefined) {
      updateClauses.push('grupo_articulo_id = ?');
      values.push(Number(fields.grupo_articulo_id) || 1);
    }
    if (fields.contenedor_id !== undefined) {
      updateClauses.push('contenedor_id = ?');
      values.push(Number(fields.contenedor_id) || 1);
    }
    if (fields.tipo_almacenamiento_id !== undefined) {
      updateClauses.push('tipo_almacenamiento_id = ?');
      values.push(Number(fields.tipo_almacenamiento_id) || 1);
    }
    if (fields.peso !== undefined || fields.peso_neto !== undefined) {
      updateClauses.push('peso_neto = ?');
      values.push(Number(fields.peso_neto ?? fields.peso) || 0);
    }
    if (fields.stock_seguridad_min !== undefined) {
      updateClauses.push('stock_seguridad_min = ?');
      values.push(Number(fields.stock_seguridad_min) || 0);
    }
    if (fields.stock_maximo !== undefined) {
      updateClauses.push('stock_maximo = ?');
      values.push(Number(fields.stock_maximo) || 0);
    }
    if (fields.rack !== undefined) {
      updateClauses.push('rack = ?');
      values.push(String(fields.rack).trim());
    }
    if (fields.nivel_rack !== undefined) {
      updateClauses.push('nivel_rack = ?');
      values.push(String(fields.nivel_rack).trim());
    }
    if (fields.posicion_detalle !== undefined) {
      updateClauses.push('posicion_detalle = ?');
      values.push(String(fields.posicion_detalle).trim());
    }
    if (fields.costo_unitario !== undefined || fields.costo_unitario_actual !== undefined) {
      const nuevoCosto = Number(fields.costo_unitario_actual ?? fields.costo_unitario) || 0;
      updateClauses.push('costo_unitario_actual = ?');
      values.push(nuevoCosto);

      // Registrar en el historial de costos
      const today = new Date().toISOString().split('T')[0];
      db.prepare(`
        UPDATE producto_costos_historial
        SET fecha_validez_hasta = ?
        WHERE producto_sku = ? AND fecha_validez_hasta IS NULL
      `).run(today, cleanSKU);

      db.prepare(`
        INSERT INTO producto_costos_historial (
          producto_sku, costo_unitario, moneda, fecha_validez_desde, motivo_modificacion
        ) VALUES (?, ?, 'PEN', ?, 'Modificación desde ficha técnica')
      `).run(cleanSKU, nuevoCosto, today);
    }
    if (fields.tipo_acero !== undefined) {
      updateClauses.push('tipo_acero = ?');
      values.push(String(fields.tipo_acero));
    }
    if (fields.grado_acero !== undefined) {
      updateClauses.push('grado_acero = ?');
      values.push(String(fields.grado_acero));
    }
    if (fields.espesor_acero !== undefined) {
      updateClauses.push('espesor_acero = ?');
      values.push(String(fields.espesor_acero));
    }

    if (updateClauses.length > 0) {
      updateClauses.push("updated_at = datetime('now', '-5 hours')");
      values.push(cleanSKU);
      db.prepare(`UPDATE productos SET ${updateClauses.join(', ')} WHERE sku = ?`).run(...values);
    }

    return NextResponse.json({ success: true });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const db = getDB();
    const body = await req.json();
    const {
      sku,
      glosa,
      unidad = 'UND',
      unidad_codigo,
      grupo_articulo_id = 1,
      contenedor_id = 1,
      tipo_almacenamiento_id = 1,
      rack = '',
      nivel_rack = '',
      posicion_detalle = '',
      costo_unitario = 0,
      peso = 0,
      peso_neto,
      stock_seguridad_min = 0,
      stock_maximo = 0,
      tipo_acero = '',
      grado_acero = '',
      espesor_acero = '',
    } = body;

    if (!sku || !glosa) {
      return NextResponse.json({ error: 'El SKU y la Descripción (Glosa) son obligatorios' }, { status: 400 });
    }

    const cleanSKU = String(sku).trim().toUpperCase();
    const cleanGlosa = String(glosa).trim();
    const cleanUnidad = String(unidad_codigo || unidad).trim().toUpperCase();

    // Validar duplicado
    const existing = db.prepare('SELECT sku FROM productos WHERE UPPER(sku) = ?').get(cleanSKU);
    if (existing) {
      return NextResponse.json({ error: `El producto con SKU ${cleanSKU} ya existe en el sistema` }, { status: 409 });
    }

    db.prepare(`
      INSERT INTO productos (
        sku, glosa, unidad_codigo, grupo_articulo_id, contenedor_id, tipo_almacenamiento_id,
        rack, nivel_rack, posicion_detalle, costo_unitario_actual, moneda,
        peso_neto, stock_seguridad_min, stock_maximo, tipo_acero, grado_acero, espesor_acero,
        created_at, updated_at
      ) VALUES (
        ?, ?, ?, ?, ?, ?,
        ?, ?, ?, ?, 'PEN',
        ?, ?, ?, ?, ?, ?,
        datetime('now', '-5 hours'), datetime('now', '-5 hours')
      )
    `).run(
      cleanSKU,
      cleanGlosa,
      cleanUnidad,
      Number(grupo_articulo_id) || 1,
      Number(contenedor_id) || 1,
      Number(tipo_almacenamiento_id) || 1,
      String(rack).trim(),
      String(nivel_rack).trim(),
      String(posicion_detalle).trim(),
      Number(costo_unitario) || 0,
      Number(peso_neto ?? peso) || 0,
      Number(stock_seguridad_min) || 0,
      Number(stock_maximo) || 0,
      String(tipo_acero),
      String(grado_acero),
      String(espesor_acero)
    );

    // Si tiene costo, agregar al historial inicial
    if (Number(costo_unitario) > 0) {
      const today = new Date().toISOString().split('T')[0];
      db.prepare(`
        INSERT INTO producto_costos_historial (
          producto_sku, costo_unitario, moneda, fecha_validez_desde, motivo_modificacion
        ) VALUES (?, ?, 'PEN', ?, 'Alta de nuevo producto')
      `).run(cleanSKU, Number(costo_unitario), today);
    }

    return NextResponse.json({ success: true, sku: cleanSKU });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function DELETE(req: NextRequest) {
  try {
    const db = getDB();
    const { searchParams } = new URL(req.url);
    const skuParam = searchParams.get('sku');

    let skusToDelete: string[] = [];

    if (skuParam) {
      skusToDelete = [skuParam.trim().toUpperCase()];
    } else {
      const body = await req.json().catch(() => ({}));
      if (Array.isArray(body.skus) && body.skus.length > 0) {
        skusToDelete = body.skus.map((s: string) => String(s).trim().toUpperCase());
      } else if (body.sku) {
        skusToDelete = [String(body.sku).trim().toUpperCase()];
      }
    }

    if (skusToDelete.length === 0) {
      return NextResponse.json({ error: 'No se especificaron SKUs para eliminar' }, { status: 400 });
    }

    const placeholders = skusToDelete.map(() => '?').join(',');
    
    // Eliminar de productos y tablas relacionadas
    const deleteTx = db.transaction(() => {
      db.prepare(`UPDATE productos SET is_deleted = 1, deleted_at = datetime('now', '-5 hours') WHERE sku IN (${placeholders})`).run(...skusToDelete);
      db.prepare(`DELETE FROM producto_costos_historial WHERE producto_sku IN (${placeholders})`).run(...skusToDelete);
      const res = db.prepare(`DELETE FROM productos WHERE sku IN (${placeholders})`).run(...skusToDelete);
      return res.changes;
    });

    const deletedCount = deleteTx();

    return NextResponse.json({ success: true, deleted: deletedCount });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
