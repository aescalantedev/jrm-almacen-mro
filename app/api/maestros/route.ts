import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

export async function GET(req: NextRequest) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || user.rol !== 'admin') {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden ver datos maestros' }, { status: 403 });
    }

    const db = getDB();

    // 1. Bodegas / Centros de Almacenamiento (SAP LGORT / WERKS)
    const bodegas = db.prepare(`
      SELECT b.*, COUNT(DISTINCT c.id) as total_contenedores, COUNT(DISTINCT p.sku) as total_materiales
      FROM bodegas b
      LEFT JOIN contenedores c ON b.id = c.bodega_id AND c.is_deleted = 0
      LEFT JOIN productos p ON c.id = p.contenedor_id AND p.is_deleted = 0
      WHERE b.is_deleted = 0
      GROUP BY b.id
      ORDER BY b.codigo ASC
    `).all();

    // 2. Grupos de Artículos (SAP MATKL) con conteo de materiales
    const grupos = db.prepare(`
      SELECT g.*, COUNT(p.sku) as total_materiales
      FROM grupos_articulos g
      LEFT JOIN productos p ON g.id = p.grupo_articulo_id AND p.is_deleted = 0
      WHERE g.is_deleted = 0
      GROUP BY g.id
      ORDER BY g.nombre ASC
    `).all();

    // 3. Unidades de Medida (SAP MEINS) con conteo de materiales
    const unidades = db.prepare(`
      SELECT u.*, COUNT(p.sku) as total_materiales
      FROM unidades_medida u
      LEFT JOIN productos p ON u.codigo_unidad = p.unidad_codigo AND p.is_deleted = 0
      WHERE u.is_deleted = 0
      GROUP BY u.codigo_unidad
      ORDER BY u.codigo_unidad ASC
    `).all();

    // 4. Almacenes y Contenedores (SAP LGORT / LGTYP) con info de bodega
    const contenedores = db.prepare(`
      SELECT c.*, b.nombre as bodega_nombre, b.codigo as bodega_codigo, COUNT(p.sku) as total_materiales
      FROM contenedores c
      LEFT JOIN bodegas b ON c.bodega_id = b.id
      LEFT JOIN productos p ON c.id = p.contenedor_id AND p.is_deleted = 0
      WHERE c.is_deleted = 0
      GROUP BY c.id
      ORDER BY c.codigo_contenedor ASC
    `).all();

    // 5. Tipos de Almacenamiento (SAP LETYP) con conteo de materiales
    const tiposAlmacenamiento = db.prepare(`
      SELECT t.*, COUNT(p.sku) as total_materiales
      FROM tipos_almacenamiento t
      LEFT JOIN productos p ON t.id = p.tipo_almacenamiento_id AND p.is_deleted = 0
      WHERE t.is_deleted = 0
      GROUP BY t.id
      ORDER BY t.codigo ASC
    `).all();

    return NextResponse.json({
      bodegas,
      grupos,
      unidades,
      contenedores,
      tiposAlmacenamiento,
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
      return NextResponse.json({ error: 'Acceso denegado' }, { status: 403 });
    }

    const db = getDB();
    const body = await req.json();
    const { entity, action, data } = body;

    if (!entity || !action || !data) {
      return NextResponse.json({ error: 'Entidad, acción y datos son requeridos' }, { status: 400 });
    }

    // ─────────────────────────────────────────────────────────────
    // 0. BODEGAS (SAP LGORT)
    // ─────────────────────────────────────────────────────────────
    if (entity === 'bodegas') {
      if (action === 'create') {
        const codigo = String(data.codigo || '').trim().toUpperCase();
        const nombre = String(data.nombre || '').trim();
        if (!codigo || !nombre) return NextResponse.json({ error: 'Código y Nombre son requeridos' }, { status: 400 });

        db.prepare(`
          INSERT INTO bodegas (codigo, nombre, empresa_codigo, direccion, created_by)
          VALUES (?, ?, ?, ?, ?)
        `).run(codigo, nombre, data.empresa_codigo || '001', data.direccion || '', user.id);
        return NextResponse.json({ success: true, message: 'Bodega creada correctamente' });
      }

      if (action === 'update') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE bodegas 
          SET codigo = COALESCE(?, codigo),
              nombre = COALESCE(?, nombre),
              empresa_codigo = COALESCE(?, empresa_codigo),
              direccion = COALESCE(?, direccion),
              updated_at = datetime('now', '-5 hours'),
              updated_by = ?
          WHERE id = ?
        `).run(
          data.codigo ? String(data.codigo).trim().toUpperCase() : null,
          data.nombre ? String(data.nombre).trim() : null,
          data.empresa_codigo ? String(data.empresa_codigo).trim() : null,
          data.direccion !== undefined ? String(data.direccion).trim() : null,
          user.id,
          data.id
        );
        return NextResponse.json({ success: true, message: 'Bodega modificada correctamente' });
      }

      if (action === 'delete') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE bodegas 
          SET is_deleted = 1, updated_at = datetime('now', '-5 hours'), updated_by = ?
          WHERE id = ?
        `).run(user.id, data.id);
        return NextResponse.json({ success: true, message: 'Bodega desactivada' });
      }
    }

    // ─────────────────────────────────────────────────────────────
    // 1. GRUPOS DE ARTÍCULOS (SAP MATKL)
    // ─────────────────────────────────────────────────────────────
    if (entity === 'grupos_articulos') {
      if (action === 'create') {
        const codigo = String(data.codigo || '').trim().toUpperCase();
        const nombre = String(data.nombre || '').trim().toUpperCase();
        if (!codigo || !nombre) return NextResponse.json({ error: 'Código y Nombre son requeridos' }, { status: 400 });

        db.prepare(`
          INSERT INTO grupos_articulos (codigo, nombre, descripcion, created_by)
          VALUES (?, ?, ?, ?)
        `).run(codigo, nombre, data.descripcion || '', user.id);

        return NextResponse.json({ success: true, message: 'Grupo de artículos creado correctamente' });
      }

      if (action === 'update') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE grupos_articulos 
          SET codigo = COALESCE(?, codigo),
              nombre = COALESCE(?, nombre),
              descripcion = COALESCE(?, descripcion),
              updated_at = datetime('now', '-5 hours'),
              updated_by = ?
          WHERE id = ?
        `).run(
          data.codigo ? String(data.codigo).trim().toUpperCase() : null,
          data.nombre ? String(data.nombre).trim().toUpperCase() : null,
          data.descripcion !== undefined ? String(data.descripcion).trim() : null,
          user.id,
          data.id
        );
        return NextResponse.json({ success: true, message: 'Grupo de artículos modificado correctamente' });
      }

      if (action === 'delete') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE grupos_articulos 
          SET is_deleted = 1, updated_at = datetime('now', '-5 hours'), updated_by = ?
          WHERE id = ?
        `).run(user.id, data.id);
        return NextResponse.json({ success: true, message: 'Grupo de artículos desactivado' });
      }
    }

    // ─────────────────────────────────────────────────────────────
    // 2. UNIDADES DE MEDIDA (SAP MEINS)
    // ─────────────────────────────────────────────────────────────
    if (entity === 'unidades_medida') {
      if (action === 'create') {
        const codigo = String(data.codigo_unidad || '').trim().toUpperCase();
        const nombre = String(data.nombre || '').trim();
        if (!codigo || !nombre) return NextResponse.json({ error: 'Código y Nombre son requeridos' }, { status: 400 });

        db.prepare(`
          INSERT INTO unidades_medida (codigo_unidad, codigo_sap, nombre, simbolo, permite_decimales, created_by)
          VALUES (?, ?, ?, ?, ?, ?)
        `).run(
          codigo,
          String(data.codigo_sap || codigo).trim().toUpperCase(),
          nombre,
          String(data.simbolo || codigo.toLowerCase()).trim(),
          data.permite_decimales ? 1 : 0,
          user.id
        );
        return NextResponse.json({ success: true, message: 'Unidad de medida creada correctamente' });
      }

      if (action === 'update') {
        if (!data.codigo_unidad) return NextResponse.json({ error: 'Código de unidad es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE unidades_medida 
          SET codigo_sap = COALESCE(?, codigo_sap),
              nombre = COALESCE(?, nombre),
              simbolo = COALESCE(?, simbolo),
              permite_decimales = COALESCE(?, permite_decimales),
              updated_at = datetime('now', '-5 hours'),
              updated_by = ?
          WHERE codigo_unidad = ?
        `).run(
          data.codigo_sap ? String(data.codigo_sap).trim().toUpperCase() : null,
          data.nombre ? String(data.nombre).trim() : null,
          data.simbolo ? String(data.simbolo).trim() : null,
          data.permite_decimales !== undefined ? (data.permite_decimales ? 1 : 0) : null,
          user.id,
          data.codigo_unidad
        );
        return NextResponse.json({ success: true, message: 'Unidad de medida modificada' });
      }
    }

    // ─────────────────────────────────────────────────────────────
    // 3. ALMACENES Y CONTENEDORES (SAP LGORT / LGTYP)
    // ─────────────────────────────────────────────────────────────
    if (entity === 'contenedores') {
      if (action === 'create') {
        const codigo = String(data.codigo_contenedor || '').trim().toUpperCase();
        const nombre = String(data.nombre || '').trim();
        if (!codigo || !nombre) return NextResponse.json({ error: 'Código y Nombre son requeridos' }, { status: 400 });

        db.prepare(`
          INSERT INTO contenedores (codigo_contenedor, nombre, bodega_id, zona, descripcion, created_by)
          VALUES (?, ?, ?, ?, ?, ?)
        `).run(
          codigo,
          nombre,
          Number(data.bodega_id) || 1,
          String(data.zona || 'PATIO PRINCIPAL').trim().toUpperCase(),
          data.descripcion || '',
          user.id
        );
        return NextResponse.json({ success: true, message: 'Almacén/Contenedor creado correctamente' });
      }

      if (action === 'update') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE contenedores 
          SET codigo_contenedor = COALESCE(?, codigo_contenedor),
              nombre = COALESCE(?, nombre),
              bodega_id = COALESCE(?, bodega_id),
              zona = COALESCE(?, zona),
              descripcion = COALESCE(?, descripcion),
              updated_at = datetime('now', '-5 hours'),
              updated_by = ?
          WHERE id = ?
        `).run(
          data.codigo_contenedor ? String(data.codigo_contenedor).trim().toUpperCase() : null,
          data.nombre ? String(data.nombre).trim() : null,
          data.bodega_id ? Number(data.bodega_id) : null,
          data.zona ? String(data.zona).trim().toUpperCase() : null,
          data.descripcion !== undefined ? String(data.descripcion).trim() : null,
          user.id,
          data.id
        );
        return NextResponse.json({ success: true, message: 'Almacén/Contenedor modificado' });
      }

      if (action === 'delete') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE contenedores 
          SET is_deleted = 1, updated_at = datetime('now', '-5 hours'), updated_by = ?
          WHERE id = ?
        `).run(user.id, data.id);
        return NextResponse.json({ success: true, message: 'Almacén/Contenedor desactivado' });
      }
    }

    // ─────────────────────────────────────────────────────────────
    // 4. TIPOS DE ALMACENAMIENTO (SAP LETYP)
    // ─────────────────────────────────────────────────────────────
    if (entity === 'tipos_almacenamiento') {
      if (action === 'create') {
        const codigo = String(data.codigo || '').trim().toUpperCase();
        const nombre = String(data.nombre || '').trim();
        if (!codigo || !nombre) return NextResponse.json({ error: 'Código y Nombre son requeridos' }, { status: 400 });

        db.prepare(`
          INSERT INTO tipos_almacenamiento (codigo, nombre, descripcion, created_by)
          VALUES (?, ?, ?, ?)
        `).run(codigo, nombre, data.descripcion || '', user.id);
        return NextResponse.json({ success: true, message: 'Tipo de almacenamiento creado' });
      }

      if (action === 'update') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE tipos_almacenamiento 
          SET codigo = COALESCE(?, codigo),
              nombre = COALESCE(?, nombre),
              descripcion = COALESCE(?, descripcion),
              updated_at = datetime('now', '-5 hours'),
              updated_by = ?
          WHERE id = ?
        `).run(
          data.codigo ? String(data.codigo).trim().toUpperCase() : null,
          data.nombre ? String(data.nombre).trim() : null,
          data.descripcion !== undefined ? String(data.descripcion).trim() : null,
          user.id,
          data.id
        );
        return NextResponse.json({ success: true, message: 'Tipo de almacenamiento modificado' });
      }

      if (action === 'delete') {
        if (!data.id) return NextResponse.json({ error: 'ID es requerido' }, { status: 400 });
        db.prepare(`
          UPDATE tipos_almacenamiento 
          SET is_deleted = 1, updated_at = datetime('now', '-5 hours'), updated_by = ?
          WHERE id = ?
        `).run(user.id, data.id);
        return NextResponse.json({ success: true, message: 'Tipo de almacenamiento desactivado' });
      }
    }

    return NextResponse.json({ error: 'Entidad no reconocida' }, { status: 400 });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
