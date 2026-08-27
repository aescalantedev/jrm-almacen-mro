import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

export async function GET(req: NextRequest) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || user.rol !== 'admin') {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden ver costos' }, { status: 403 });
    }

    const db = getDB();
    const { searchParams } = new URL(req.url);
    const query = searchParams.get('q') || '';
    const familia = searchParams.get('familia') || '';
    const page = parseInt(searchParams.get('page') || '1');
    const limit = parseInt(searchParams.get('limit') || '50');
    const offset = (page - 1) * limit;

    const conditions: string[] = [];
    const params: unknown[] = [];

    if (query) {
      conditions.push('(UPPER(pr.sku) LIKE UPPER(?) OR UPPER(pr.glosa) LIKE UPPER(?))');
      const p = `%${query.trim()}%`;
      params.push(p, p);
    }

    if (familia) {
      conditions.push('UPPER(g.nombre) = UPPER(?)');
      params.push(familia.trim());
    }

    const whereClause = conditions.length > 0 ? `WHERE ${conditions.join(' AND ')}` : '';

    // Query de items con costo actual y fecha de vigencia
    const items = db.prepare(`
      SELECT 
        pr.sku,
        pr.glosa,
        pr.unidad_codigo as unidad,
        COALESCE(g.nombre, 'GENERAL') as familia,
        pr.costo_unitario_actual as costo_unitario,
        pr.moneda,
        (
          SELECT h.fecha_validez_desde 
          FROM producto_costos_historial h 
          WHERE h.producto_sku = pr.sku 
          ORDER BY h.id DESC LIMIT 1
        ) as ultima_actualizacion,
        (
          SELECT COUNT(*) 
          FROM producto_costos_historial h 
          WHERE h.producto_sku = pr.sku
        ) as total_cambios,
        (
          SELECT h.costo_unitario 
          FROM producto_costos_historial h 
          WHERE h.producto_sku = pr.sku 
          ORDER BY h.id DESC LIMIT 1 OFFSET 1
        ) as costo_anterior
      FROM productos pr
      LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
      ${whereClause}
      ORDER BY pr.costo_unitario_actual DESC, pr.glosa ASC
      LIMIT ? OFFSET ?
    `).all(...params, limit, offset);

    const countRow = db.prepare(`
      SELECT COUNT(*) as total
      FROM productos pr
      LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
      ${whereClause}
    `).get(...params) as { total: number };

    // Métricas globales
    const statsRow = db.prepare(`
      SELECT 
        COUNT(*) as total_productos,
        COALESCE(SUM(CASE WHEN costo_unitario_actual > 0 THEN 1 ELSE 0 END), 0) as con_costo,
        COALESCE(SUM(CASE WHEN costo_unitario_actual = 0 OR costo_unitario_actual IS NULL THEN 1 ELSE 0 END), 0) as sin_costo,
        COALESCE(AVG(CASE WHEN costo_unitario_actual > 0 THEN costo_unitario_actual END), 0) as costo_promedio,
        COALESCE(MAX(costo_unitario_actual), 0) as costo_maximo
      FROM productos
    `).get() as {
      total_productos: number;
      con_costo: number;
      sin_costo: number;
      costo_promedio: number;
      costo_maximo: number;
    };

    // Lista de familias para el filtro
    const familias = db.prepare('SELECT DISTINCT nombre FROM grupos_articulos ORDER BY nombre').all() as { nombre: string }[];

    return NextResponse.json({
      items,
      total: countRow.total,
      stats: statsRow,
      familias: familias.map(f => f.nombre),
      page,
      limit
    });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}

export async function POST(req: NextRequest) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || user.rol !== 'admin') {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden actualizar costos' }, { status: 403 });
    }

    const db = getDB();
    const body = await req.json();
    const { sku, nuevo_costo, motivo, documento_referencia, moneda } = body;

    if (!sku || nuevo_costo === undefined) {
      return NextResponse.json({ error: 'SKU y nuevo costo son obligatorios' }, { status: 400 });
    }

    const cleanSKU = String(sku).trim().toUpperCase();
    const costNum = Number(nuevo_costo);
    if (isNaN(costNum) || costNum < 0) {
      return NextResponse.json({ error: 'El costo debe ser un número mayor o igual a 0' }, { status: 400 });
    }

    const prod = db.prepare('SELECT sku, costo_unitario_actual, moneda FROM productos WHERE sku = ?').get(cleanSKU) as {
      sku: string;
      costo_unitario_actual: number;
      moneda: string;
    } | undefined;

    if (!prod) {
      return NextResponse.json({ error: `El producto con SKU ${cleanSKU} no existe` }, { status: 404 });
    }

    const today = new Date().toISOString().split('T')[0];

    db.transaction(() => {
      // 1. Cerrar vigencia del costo anterior
      db.prepare(`
        UPDATE producto_costos_historial
        SET fecha_validez_hasta = ?
        WHERE producto_sku = ? AND fecha_validez_hasta IS NULL
      `).run(today, cleanSKU);

      // 2. Insertar nuevo costo en historial
      db.prepare(`
        INSERT INTO producto_costos_historial (
          producto_sku, costo_unitario, moneda, fecha_validez_desde,
          motivo_modificacion, documento_referencia, created_by
        ) VALUES (?, ?, ?, ?, ?, ?, ?)
      `).run(
        cleanSKU,
        costNum,
        moneda || prod.moneda || 'PEN',
        today,
        motivo || 'Actualización administrativa',
        documento_referencia || '',
        user.id
      );

      // 3. Actualizar costo actual en maestro de productos
      db.prepare(`
        UPDATE productos 
        SET costo_unitario_actual = ?,
            moneda = ?,
            updated_at = datetime('now', '-5 hours')
        WHERE sku = ?
      `).run(costNum, moneda || prod.moneda || 'PEN', cleanSKU);
    })();

    return NextResponse.json({ success: true, sku: cleanSKU, nuevo_costo: costNum });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
