import { NextRequest, NextResponse } from 'next/server';
import { getDB, getStockTeorico } from '@/lib/db';

export async function GET(req: NextRequest) {
  try {
    const db = getDB();
    const { searchParams } = new URL(req.url);

    const page = Math.max(1, parseInt(searchParams.get('page') || '1', 10));
    const limit = Math.max(1, Math.min(100, parseInt(searchParams.get('limit') || '50', 10)));
    const offset = (page - 1) * limit;

    const query = searchParams.get('q')?.trim() || '';
    const tipo = searchParams.get('tipo')?.trim().toUpperCase() || '';
    const producto = searchParams.get('producto')?.trim().toUpperCase() || '';
    const desde = searchParams.get('desde')?.trim() || '';
    const hasta = searchParams.get('hasta')?.trim() || '';

    const conditions: string[] = [];
    const params: (string | number)[] = [];

    if (query) {
      conditions.push('(m.producto LIKE ? OR p.glosa LIKE ? OR m.documento_referencia LIKE ? OR m.solicitante LIKE ?)');
      const likeQuery = `%${query}%`;
      params.push(likeQuery, likeQuery, likeQuery, likeQuery);
    }

    if (tipo) {
      conditions.push('m.tipo = ?');
      params.push(tipo);
    }

    if (producto) {
      conditions.push('m.producto = ?');
      params.push(producto);
    }

    if (desde) {
      conditions.push('date(m.created_at) >= date(?)');
      params.push(desde);
    }

    if (hasta) {
      conditions.push('date(m.created_at) <= date(?)');
      params.push(hasta);
    }

    const whereClause = conditions.length > 0 ? `WHERE ${conditions.join(' AND ')}` : '';

    const movimientos = db.prepare(`
      SELECT m.*,
             p.glosa as descripcion,
             p.unidad_codigo as unidad,
             COALESCE(g.nombre, 'GENERAL') as familia,
             u.nombre as usuario_nombre
      FROM movimientos m
      JOIN productos p ON m.producto = p.sku
      LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
      LEFT JOIN usuarios u ON m.usuario_id = u.id
      ${whereClause}
      ORDER BY m.created_at DESC, m.id DESC
      LIMIT ? OFFSET ?
    `).all(...params, limit, offset);

    const countRow = db.prepare(`
      SELECT COUNT(*) as total
      FROM movimientos m
      JOIN productos p ON m.producto = p.sku
      LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
      ${whereClause}
    `).get(...params) as { total: number };

    // Summary statistics for dashboard cards
    const statsRow = db.prepare(`
      SELECT 
        COALESCE(SUM(CASE WHEN tipo = 'INGRESO' THEN 1 ELSE 0 END), 0) as ingresos_count,
        COALESCE(SUM(CASE WHEN tipo = 'SALIDA' THEN 1 ELSE 0 END), 0) as salidas_count,
        COALESCE(SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END), 0) as total_unidades_ingresadas,
        COALESCE(SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END), 0) as total_unidades_salidas
      FROM movimientos
    `).get() as {
      ingresos_count: number;
      salidas_count: number;
      total_unidades_ingresadas: number;
      total_unidades_salidas: number;
    };

    return NextResponse.json({
      movimientos,
      total: countRow.total,
      page,
      limit,
      stats: statsRow,
    });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const body = await req.json();
    const {
      tipo,
      items, // Multi-item support: Array<{ producto, lote?, cantidad, rack? }>
      producto, // Single item fallback
      lote = '',
      cantidad,
      motivo,
      documento_referencia = '',
      solicitante = '',
      ubicacion_origen = '',
      ubicacion_destino = '',
      rack = '',
      foto_path = null,
      comentario = '',
      usuario_id,
      permitir_negativo = false,
    } = body;

    if (!tipo || !['INGRESO', 'SALIDA', 'AJUSTE'].includes(tipo)) {
      return NextResponse.json({ error: 'Tipo de movimiento inválido (INGRESO, SALIDA, AJUSTE)' }, { status: 400 });
    }

    if (!motivo) {
      return NextResponse.json({ error: 'El motivo del movimiento es obligatorio' }, { status: 400 });
    }

    if (!usuario_id) {
      return NextResponse.json({ error: 'El usuario responsable es obligatorio' }, { status: 400 });
    }

    // Determine normalized list of items to process
    interface ItemPayload {
      producto: string;
      lote?: string;
      cantidad: number;
      rack?: string;
    }

    const itemsToProcess: ItemPayload[] = [];

    if (Array.isArray(items) && items.length > 0) {
      for (const it of items) {
        const cleanSKU = (it.producto || '').trim().toUpperCase();
        const numCant = typeof it.cantidad === 'number' ? it.cantidad : parseFloat(it.cantidad);
        if (!cleanSKU) {
          return NextResponse.json({ error: 'Uno de los productos en el vale no tiene SKU válido' }, { status: 400 });
        }
        if (isNaN(numCant) || numCant <= 0) {
          return NextResponse.json({ error: `La cantidad para el producto ${cleanSKU} debe ser mayor a 0` }, { status: 400 });
        }
        itemsToProcess.push({
          producto: cleanSKU,
          lote: it.lote || '',
          cantidad: numCant,
          rack: it.rack || '',
        });
      }
    } else {
      const cleanSKU = (producto || '').trim().toUpperCase();
      if (!cleanSKU) {
        return NextResponse.json({ error: 'El código del producto (SKU) es requerido' }, { status: 400 });
      }
      const numCantidad = typeof cantidad === 'number' ? cantidad : parseFloat(cantidad);
      if (isNaN(numCantidad) || numCantidad <= 0) {
        return NextResponse.json({ error: 'La cantidad debe ser un número mayor a cero' }, { status: 400 });
      }
      itemsToProcess.push({
        producto: cleanSKU,
        lote: lote || '',
        cantidad: numCantidad,
        rack: rack || '',
      });
    }

    const db = getDB();
    const createdIds: number[] = [];

    // Run atomic transaction
    db.transaction(() => {
      for (const item of itemsToProcess) {
        // Verify product exists in master
        const prodExists = db.prepare('SELECT sku as producto, glosa, unidad_codigo as unidad FROM productos WHERE sku = ?').get(item.producto) as { producto: string; glosa: string; unidad: string } | undefined;
        if (!prodExists) {
          throw new Error(`El producto ${item.producto} no existe en el catálogo maestro`);
        }

        // Calculate current stock
        const stockAnterior = getStockTeorico(db, item.producto, item.lote || '');

        // 3. Validation for SALIDA
        if (tipo === 'SALIDA' && !permitir_negativo && item.cantidad > stockAnterior) {
          throw new Error(`Stock insuficiente para ${item.producto} (${prodExists.glosa}): Disponible (${stockAnterior} ${prodExists.unidad}), Intentando retirar (${item.cantidad} ${prodExists.unidad})`);
        }

        // 4. Calculate stock_resultante
        let stockResultante = 0;
        if (tipo === 'INGRESO') {
          stockResultante = stockAnterior + item.cantidad;
        } else if (tipo === 'SALIDA') {
          stockResultante = stockAnterior - item.cantidad;
        } else { // AJUSTE
          stockResultante = item.cantidad;
        }

        // 5. Insert movement record
        const insertStmt = db.prepare(`
          INSERT INTO movimientos (
            tipo, producto, lote, cantidad, stock_anterior, stock_resultante,
            motivo, documento_referencia, solicitante, ubicacion_origen,
            ubicacion_destino, rack, foto_path, comentario, usuario_id
          ) VALUES (
            ?, ?, ?, ?, ?, ?,
            ?, ?, ?, ?,
            ?, ?, ?, ?, ?
          )
        `);

        const result = insertStmt.run(
          tipo,
          item.producto,
          item.lote || '',
          item.cantidad,
          stockAnterior,
          stockResultante,
          motivo,
          documento_referencia || '',
          solicitante || '',
          ubicacion_origen || '',
          ubicacion_destino || item.rack || '',
          item.rack || '',
          foto_path || null,
          comentario || '',
          usuario_id
        );

        createdIds.push(result.lastInsertRowid as number);
      }
    })();

    const createdMovements = db.prepare(`
      SELECT m.*, p.glosa as descripcion, p.unidad_codigo as unidad, u.nombre as usuario_nombre
      FROM movimientos m
      JOIN productos p ON m.producto = p.sku
      LEFT JOIN usuarios u ON m.usuario_id = u.id
      WHERE m.id IN (${createdIds.map(() => '?').join(',')})
      ORDER BY m.id ASC
    `).all(...createdIds);

    const count = createdIds.length;
    const actionLabel = tipo === 'INGRESO' ? 'Ingreso' : 'Salida';

    return NextResponse.json({
      success: true,
      count,
      movimientos: createdMovements,
      message: count === 1
        ? `${actionLabel} registrado(a) con éxito.`
        : `${actionLabel} de ${count} repuestos registrado(a) con éxito bajo ${documento_referencia || 'vale'}.`,
    }, { status: 201 });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 400 });
  }
}
