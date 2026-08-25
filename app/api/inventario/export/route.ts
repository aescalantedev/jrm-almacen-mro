import { NextResponse } from 'next/server';
import ExcelJS from 'exceljs';
import { getDB } from '@/lib/db';

export async function GET() {
  try {
    const db = getDB();
    const rows = db.prepare('SELECT * FROM inventario ORDER BY id ASC').all() as Record<string, unknown>[];

    const workbook = new ExcelJS.Workbook();
    workbook.creator = 'StrixUI Inventory System';
    workbook.lastModifiedBy = 'StrixUI Inventory System';
    workbook.created = new Date();
    workbook.modified = new Date();

    const worksheet = workbook.addWorksheet('Inventario MRO', {
      views: [{ state: 'frozen', ySplit: 1 }]
    });

    worksheet.columns = [
      { header: 'N°', key: 'id', width: 8 },
      { header: 'Producto', key: 'producto', width: 18 },
      { header: 'Descripcion', key: 'descripcion', width: 40 },
      { header: 'Unidad', key: 'unidad', width: 10 },
      { header: 'Stock Bodega', key: 'stock_sistema', width: 14 },
      { header: 'FAMILIA', key: 'familia', width: 16 },
      { header: 'Familia2', key: 'familia2', width: 16 },
      { header: 'Cantidad Física', key: 'cantidad_fisica', width: 16 },
      { header: 'DIF', key: 'dif', width: 12 },
      { header: 'UM', key: 'um', width: 10 },
      { header: 'Presentación', key: 'presentacion', width: 16 },
      { header: 'N° Cajas/Bultos', key: 'n_cajas_bultos', width: 16 },
      { header: 'Largo (cm)', key: 'largo', width: 12 },
      { header: 'Ancho (cm)', key: 'ancho', width: 12 },
      { header: 'Alto (cm)', key: 'alto', width: 12 },
      { header: 'Peso Aprox. (kg)-unitario', key: 'peso_aprox_unitario', width: 22 },
      { header: 'PESO TOTAL CANT FISICA', key: 'peso_total_cant_fisica', width: 22 },
      { header: 'Largo (cm)3', key: 'largo3', width: 12 },
      { header: 'Ancho (cm)4', key: 'ancho4', width: 12 },
      { header: 'Alto (cm)5', key: 'alto5', width: 12 },
      { header: 'PESO Nivel de Caja', key: 'peso_nivel_caja', width: 18 },
      { header: 'OBSERVACION', key: 'observacion', width: 16 },
      { header: 'comentario', key: 'comentario', width: 28 },
      { header: 'RACK', key: 'rack', width: 10 },
      { header: 'Ubicación actual', key: 'ubicacion_actual', width: 16 },
      { header: 'almacenamiento', key: 'almacenamiento', width: 16 },
      { header: 'contedor', key: 'contenedor', width: 12 },
      { header: 'Responsable', key: 'responsable', width: 20 },
      { header: 'FECHA', key: 'fecha_conteo', width: 14 },
      { header: 'COSTO UNITARIO', key: 'costo_unitario', width: 16 },
      { header: 'TOTAL', key: 'total_costo', width: 16 },
      { header: 'S/ DIF', key: 's_dif', width: 16 },
      { header: 'rotacion', key: 'rotacion', width: 12 },
      { header: 'LINEA', key: 'linea', width: 16 },
      { header: 'PRIORIDAD', key: 'prioridad', width: 14 },
      { header: 'Vida Util validado por SSOMA', key: 'vida_util_ssoma', width: 26 },
      { header: 'Compatibilidad / segregación obligatoria', key: 'compatibilidad_segregacion', width: 35 },
      { header: 'Condiciones de almacenamiento y medidas de seguridad', key: 'condiciones_almacenamiento', width: 45 },
    ];

    // Style header row
    const headerRow = worksheet.getRow(1);
    headerRow.height = 28;
    headerRow.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 10, name: 'Segoe UI' };
    headerRow.fill = {
      type: 'pattern',
      pattern: 'solid',
      fgColor: { argb: 'FF1E293B' },
    };
    headerRow.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };

    // Add data rows
    rows.forEach((r, idx) => {
      const row = worksheet.addRow({
        id: idx + 1,
        producto: r.producto || '',
        descripcion: r.descripcion || '',
        unidad: r.unidad || '',
        stock_sistema: Number(r.stock_sistema || 0),
        familia: r.familia || '',
        familia2: r.familia2 || '',
        cantidad_fisica: Number(r.cantidad_fisica || 0),
        dif: Number(r.dif || 0),
        um: r.um || r.unidad || '',
        presentacion: r.presentacion || '',
        n_cajas_bultos: r.n_cajas_bultos || '',
        largo: r.largo ? Number(r.largo) : '',
        ancho: r.ancho ? Number(r.ancho) : '',
        alto: r.alto ? Number(r.alto) : '',
        peso_aprox_unitario: r.peso_aprox_unitario ? Number(r.peso_aprox_unitario) : '',
        peso_total_cant_fisica: r.peso_total_cant_fisica ? Number(r.peso_total_cant_fisica) : '',
        largo3: '',
        ancho4: '',
        alto5: '',
        peso_nivel_caja: '',
        observacion: r.observacion || '',
        comentario: r.comentario || '',
        rack: r.rack || '',
        ubicacion_actual: r.ubicacion_actual || '',
        almacenamiento: r.almacenamiento || '',
        contenedor: r.contenedor || '',
        responsable: r.responsable || '',
        fecha_conteo: r.fecha_conteo || '',
        costo_unitario: Number(r.costo_unitario || 0),
        total_costo: Number(r.total_costo || 0),
        s_dif: Number(r.s_dif || 0),
        rotacion: r.rotacion || '',
        linea: r.linea || '',
        prioridad: r.prioridad || '',
        vida_util_ssoma: r.vida_util_ssoma || '',
        compatibilidad_segregacion: r.compatibilidad_segregacion || '',
        condiciones_almacenamiento: r.condiciones_almacenamiento || '',
      });

      row.height = 20;
      row.font = { size: 9, name: 'Segoe UI' };
      row.alignment = { vertical: 'middle' };

      if (idx % 2 === 1) {
        row.fill = {
          type: 'pattern',
          pattern: 'solid',
          fgColor: { argb: 'FFF8FAFC' },
        };
      }

      const obsCell = row.getCell('observacion');
      const obsVal = String(obsCell.value || '');
      if (obsVal === 'OK') {
        obsCell.font = { bold: true, color: { argb: 'FF059669' }, size: 9 };
      } else if (obsVal === 'SOBRANTE') {
        obsCell.font = { bold: true, color: { argb: 'FFD97706' }, size: 9 };
      } else if (obsVal === 'FALTANTE') {
        obsCell.font = { bold: true, color: { argb: 'FFE11D48' }, size: 9 };
      }

      row.eachCell({ includeEmpty: true }, (cell) => {
        cell.border = {
          top: { style: 'thin', color: { argb: 'FFE2E8F0' } },
          left: { style: 'thin', color: { argb: 'FFE2E8F0' } },
          bottom: { style: 'thin', color: { argb: 'FFE2E8F0' } },
          right: { style: 'thin', color: { argb: 'FFE2E8F0' } },
        };
      });
    });

    const buffer = await workbook.xlsx.writeBuffer();
    const filename = `Inventario_MRO_CHILCA_${new Date().toISOString().split('T')[0]}.xlsx`;

    return new NextResponse(buffer, {
      status: 200,
      headers: {
        'Content-Type': 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
        'Content-Disposition': `attachment; filename="${filename}"`,
        'Cache-Control': 'no-store, max-age=0',
      },
    });
  } catch (error: unknown) {
    const msg = error instanceof Error ? error.message : String(error);
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
