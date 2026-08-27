import { NextRequest, NextResponse } from 'next/server';
import { getDB } from '@/lib/db';
import { verifyToken } from '@/lib/auth';

export async function POST(req: NextRequest) {
  try {
    const authHeader = req.headers.get('Authorization') || '';
    const user = verifyToken(authHeader.replace('Bearer ', ''));
    if (!user || user.rol !== 'admin') {
      return NextResponse.json({ error: 'Acceso denegado: solo administradores pueden importar costos' }, { status: 403 });
    }

    const { items, motivo, documento_referencia } = await req.json();
    if (!Array.isArray(items) || items.length === 0) {
      return NextResponse.json({ error: 'Se requiere una lista de items con SKU y costo' }, { status: 400 });
    }

    const db = getDB();
    const today = new Date().toISOString().split('T')[0];
    let actualizados = 0;
    let noEncontrados = 0;

    db.transaction(() => {
      const updateProdStmt = db.prepare(`
        UPDATE productos 
        SET costo_unitario_actual = ?,
            updated_at = datetime('now', '-5 hours')
        WHERE sku = ?
      `);

      const closeHistStmt = db.prepare(`
        UPDATE producto_costos_historial
        SET fecha_validez_hasta = ?
        WHERE producto_sku = ? AND fecha_validez_hasta IS NULL
      `);

      const insertHistStmt = db.prepare(`
        INSERT INTO producto_costos_historial (
          producto_sku, costo_unitario, moneda, fecha_validez_desde,
          motivo_modificacion, documento_referencia, created_by
        ) VALUES (?, ?, 'PEN', ?, ?, ?, ?)
      `);

      const checkProdStmt = db.prepare('SELECT sku FROM productos WHERE sku = ?');

      for (const item of items) {
        const sku = String(item.sku || item.producto || '').trim().toUpperCase();
        const rawCost = item.costo || item.costo_unitario || item['C. UNIT'] || item['C. UNIT.2'];
        const costo = typeof rawCost === 'number' ? rawCost : parseFloat(String(rawCost || '0').replace(/,/g, ''));

        if (!sku || isNaN(costo) || costo < 0) continue;

        const exists = checkProdStmt.get(sku);
        if (!exists) {
          noEncontrados++;
          continue;
        }

        closeHistStmt.run(today, sku);
        insertHistStmt.run(
          sku,
          costo,
          today,
          motivo || 'Importación Masiva de Costos',
          documento_referencia || '',
          user.id
        );
        updateProdStmt.run(costo, sku);
        actualizados++;
      }
    })();

    return NextResponse.json({
      success: true,
      actualizados,
      noEncontrados,
      totalProcesados: items.length
    });
  } catch (error: unknown) {
    return NextResponse.json({ error: error instanceof Error ? error.message : String(error) }, { status: 500 });
  }
}
