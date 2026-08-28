import { NextResponse } from 'next/server';
import ExcelJS from 'exceljs';
import { getDB } from '@/lib/db';

export async function GET() {
  try {
    const db = getDB();
    const rows = db.prepare(`
      SELECT i.*, p.glosa as descripcion, p.unidad_codigo as unidad, COALESCE(g.nombre, 'GENERAL') as familia, p.peso_neto as peso_aprox_unitario,
             p.costo_unitario_actual as costo_unitario,
             (COALESCE(i.cantidad_fisica, 0) + COALESCE(m.total_ingresos, 0) - COALESCE(m.total_salidas, 0)) as stock_sistema,
             COALESCE(m.total_ingresos, 0) as total_ingresos,
             COALESCE(m.total_salidas, 0) as total_salidas
      FROM inventario i
      JOIN productos p ON i.producto = p.sku
      LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
      LEFT JOIN (
        SELECT producto, IFNULL(lote, '') as m_lote,
               SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as total_ingresos,
               SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as total_salidas
        FROM movimientos
        GROUP BY producto, IFNULL(lote, '')
      ) m ON i.producto = m.producto AND IFNULL(i.lote, '') = m.m_lote
      ORDER BY i.id ASC
    `).all() as Record<string, unknown>[];

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

    const headerRow = worksheet.getRow(1);
    headerRow.height = 28;
    headerRow.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 10, name: 'Segoe UI' };
    headerRow.fill = {
      type: 'pattern',
      pattern: 'solid',
      fgColor: { argb: 'FF1E293B' },
    };
    headerRow.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };

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

    // ──────────────────────────────────────────────────────────────────
    // HOJA 2: IRA - INFORME EJECUTIVO
    // ──────────────────────────────────────────────────────────────────

    // Queries para IRA
    const auditadosRow = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number };
    const auditados = auditadosRow.c;

    const conformesRow = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'OK' AND dif = 0
        AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number };
    const conformes = conformesRow.c;

    const totalSKURow = db.prepare('SELECT COUNT(*) as c FROM inventario').get() as { c: number };
    const totalSKU = totalSKURow.c;

    const iraSKU = auditados > 0 ? (conformes / auditados) * 100 : 0;

    const valorFisicoRow = db.prepare(`
      SELECT COALESCE(SUM(i.cantidad_fisica * p.costo_unitario_actual), 0) as v
      FROM inventario i JOIN productos p ON i.producto = p.sku
    `).get() as { v: number };

    const valorSistemaRow = { v: valorFisicoRow.v };

    const valorFisico = valorFisicoRow.v;
    const valorSistema = valorSistemaRow.v;
    const iraFinanciera = valorSistema > 0
      ? (1 - Math.abs(valorFisico - valorSistema) / valorSistema) * 100
      : 100;

    const descalceNeto = valorFisico - valorSistema;

    const descalceBrutoRow = db.prepare(`
      SELECT COALESCE(SUM(ABS(i.dif)), 0) as v FROM inventario i
    `).get() as { v: number };
    const descalceBruto = descalceBrutoRow.v;

    const totalFaltantesRow = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'FALTANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number };
    const totalSobrantesRow = db.prepare(`
      SELECT COUNT(*) as c FROM inventario
      WHERE observacion = 'SOBRANTE' AND cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
    `).get() as { c: number };

    // ABC: Clasificar por valor de sistema (stock × costo)
    const inventarioRows = db.prepare(`
      SELECT i.producto, p.glosa as descripcion, COALESCE(g.nombre, 'GENERAL') as familia,
             COALESCE(i.cantidad_fisica, 0) as stock_sistema,
             i.cantidad_fisica,
             i.dif,
             p.costo_unitario_actual as costo_unitario,
             (COALESCE(i.cantidad_fisica, 0) * p.costo_unitario_actual) as valor_sistema
      FROM inventario i
      JOIN productos p ON i.producto = p.sku
      LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
      LEFT JOIN (
        SELECT producto, IFNULL(lote, '') as m_lote,
               SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as total_ingresos,
               SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as total_salidas
        FROM movimientos
        GROUP BY producto, IFNULL(lote, '')
      ) m ON i.producto = m.producto AND IFNULL(i.lote, '') = m.m_lote
    `).all() as Record<string, unknown>[];

    // Calcular valor total para umbrales ABC
    const valorTotal = inventarioRows.reduce((acc, r) => acc + Number(r.valor_sistema || 0), 0);
    const umbralA = valorTotal * 0.80;
    const umbralB = valorTotal * 0.95;

    // Asignar clase ABC por valor acumulado (ordenar descendente)
    const sorted = [...inventarioRows].sort((a, b) => Number(b.valor_sistema) - Number(a.valor_sistema));
    const clasificacionMap = new Map<string, string>();
    let acumulado = 0;
    for (const r of sorted) {
      acumulado += Number(r.valor_sistema || 0);
      if (acumulado <= umbralA) clasificacionMap.set(String(r.producto), 'A');
      else if (acumulado <= umbralB) clasificacionMap.set(String(r.producto), 'B');
      else clasificacionMap.set(String(r.producto), 'C');
    }

    // Tabla ABC: aggregate
    const abcData: { clase: string; total: number; conformes: number; conError: number }[] = [];
    for (const clase of ['A', 'B', 'C']) {
      const items = inventarioRows.filter(r => clasificacionMap.get(String(r.producto)) === clase);
      const total = items.length;
      const conErr = items.filter(r => {
        const dif = Number(r.dif || 0);
        const fisico = Number(r.cantidad_fisica || 0);
        return dif !== 0 && fisico !== 0;
      }).length;
      const conf = items.filter(r => {
        const dif = Number(r.dif || 0);
        const fisico = Number(r.cantidad_fisica || 0);
        return dif === 0 && fisico !== 0;
      }).length;
      abcData.push({ clase, total, conformes: conf, conError: conErr });
    }

    // Top impacto monetario
    const topImpacto = db.prepare(`
      SELECT i.producto, p.glosa as descripcion, COALESCE(g.nombre, 'GENERAL') as familia,
             COALESCE(i.cantidad_fisica, 0) as stock_sistema,
             i.cantidad_fisica, i.dif,
             p.costo_unitario_actual as costo_unitario,
             i.dif * p.costo_unitario_actual as impacto_monetario
      FROM inventario i
      JOIN productos p ON i.producto = p.sku
      LEFT JOIN grupos_articulos g ON p.grupo_articulo_id = g.id
      LEFT JOIN (
        SELECT producto, IFNULL(lote, '') as m_lote,
               SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END) as total_ingresos,
               SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END) as total_salidas
        FROM movimientos
        GROUP BY producto, IFNULL(lote, '')
      ) m ON i.producto = m.producto AND IFNULL(i.lote, '') = m.m_lote
      WHERE i.dif != 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0
      ORDER BY ABS(i.dif * p.costo_unitario_actual) DESC
      LIMIT 10
    `).all() as Record<string, unknown>[];

    // Causa raíz
    const causaRaiz = db.prepare(`
      SELECT
        observacion,
        COUNT(*) as cantidad,
        ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM inventario WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0), 1) as porcentaje
      FROM inventario
      WHERE cantidad_fisica IS NOT NULL AND cantidad_fisica != 0
      GROUP BY observacion
      ORDER BY cantidad DESC
    `).all() as Record<string, unknown>[];

    // Crear hoja IRA
    const wsIRA = workbook.addWorksheet('IRA - Informe', {
      views: [{ state: 'frozen', ySplit: 1 }]
    });

    // Configurar anchos de columna
    wsIRA.getColumn(1).width = 22;
    wsIRA.getColumn(2).width = 18;
    wsIRA.getColumn(3).width = 38;
    wsIRA.getColumn(4).width = 14;
    wsIRA.getColumn(5).width = 14;
    wsIRA.getColumn(6).width = 16;
    wsIRA.getColumn(7).width = 18;
    wsIRA.getColumn(8).width = 16;

    // ── Helper functions ──
    const TITLE_FILL: ExcelJS.Fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FF0F172A' } };
    const HEADER_FILL: ExcelJS.Fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FF1E293B' } };
    const ACCENT_FILL: ExcelJS.Fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FF3B82F6' } };
    const LIGHT_FILL: ExcelJS.Fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF8FAFC' } };
    const GREEN_FILL: ExcelJS.Fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFDCFCE7' } };
    const RED_FILL: ExcelJS.Fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFFEE2E2' } };
    const AMBER_FILL: ExcelJS.Fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFFEF3C7' } };
    const BORDER_THIN: Partial<ExcelJS.Borders> = {
      top: { style: 'thin', color: { argb: 'FFE2E8F0' } },
      left: { style: 'thin', color: { argb: 'FFE2E8F0' } },
      bottom: { style: 'thin', color: { argb: 'FFE2E8F0' } },
      right: { style: 'thin', color: { argb: 'FFE2E8F0' } },
    };

    function styleCell(cell: ExcelJS.Cell, opts: {
      bold?: boolean; color?: string; size?: number; fill?: ExcelJS.Fill;
      align?: 'left' | 'center' | 'right'; numFmt?: string; border?: boolean;
    } = {}) {
      cell.font = { bold: opts.bold, color: opts.color ? { argb: opts.color } : undefined, size: opts.size || 10, name: 'Segoe UI' };
      cell.alignment = { vertical: 'middle', horizontal: opts.align || 'left' };
      if (opts.fill) cell.fill = opts.fill;
      if (opts.numFmt) cell.numFmt = opts.numFmt;
      if (opts.border !== false) cell.border = BORDER_THIN;
    }

    let currentRow = 1;

    // ── HEADER: Title Block ──
    wsIRA.mergeCells(currentRow, 1, currentRow, 8);
    const titleCell = wsIRA.getCell(currentRow, 1);
    titleCell.value = 'EXACTITUD DE REGISTRO DE INVENTARIO (IRA) — INFORME EJECUTIVO';
    titleCell.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 14, name: 'Segoe UI' };
    titleCell.fill = TITLE_FILL;
    titleCell.alignment = { vertical: 'middle', horizontal: 'left' };
    wsIRA.getRow(currentRow).height = 36;
    currentRow++;

    // Subtitle row
    wsIRA.mergeCells(currentRow, 1, currentRow, 8);
    const subCell = wsIRA.getCell(currentRow, 1);
    const today = new Date();
    const periodo = `Q${Math.ceil((today.getMonth() + 1) / 3)} - Inventario General`;
    const fechaEmision = today.toLocaleDateString('es-PE', { year: 'numeric', month: 'long', day: 'numeric' });
    subCell.value = `Periodo: ${periodo}  |  Universo: ${totalSKU.toLocaleString()} SKUs  |  Fecha de Emisión: ${fechaEmision}`;
    subCell.font = { italic: true, color: { argb: 'FF94A3B8' }, size: 10, name: 'Segoe UI' };
    subCell.fill = TITLE_FILL;
    subCell.alignment = { vertical: 'middle', horizontal: 'left' };
    wsIRA.getRow(currentRow).height = 22;
    currentRow += 2;

    // ── KPI CARDS (2 rows) ──
    // Row 1: Labels
    const kpiLabels = [
      { col: 1, label: 'EXACTITUD SKU (IRA)', value: `${iraSKU.toFixed(1)}%`, meta: `Meta: 95.0%`, status: iraSKU >= 95 ? '✓' : '▼', color: iraSKU >= 95 ? 'FF059669' : 'FFE11D48' },
      { col: 3, label: 'EXACTITUD FINANCIERA', value: `${iraFinanciera.toFixed(1)}%`, meta: `Meta: 98.0%`, status: iraFinanciera >= 98 ? '✓' : '▼', color: iraFinanciera >= 98 ? 'FF059669' : 'FFE11D48' },
      { col: 5, label: 'DESCALCE NETO TOTAL', value: `S/ ${Math.abs(descalceNeto).toLocaleString('es-PE', { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`, meta: descalceNeto >= 0 ? 'Sobrante' : 'Faltante', status: '', color: descalceNeto >= 0 ? 'FFD97706' : 'FFE11D48' },
      { col: 7, label: 'DESCALCE BRUTO (ABS)', value: `${descalceBruto.toLocaleString('es-PE', { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`, meta: 'Impacto Operativo', status: '', color: 'FFD97706' },
    ];

    for (const kpi of kpiLabels) {
      wsIRA.mergeCells(currentRow, kpi.col, currentRow, kpi.col + 1);
      const lblCell = wsIRA.getCell(currentRow, kpi.col);
      lblCell.value = kpi.label;
      lblCell.font = { bold: true, color: { argb: 'FF94A3B8' }, size: 8, name: 'Segoe UI' };
      lblCell.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF1F5F9' } };
      lblCell.alignment = { vertical: 'middle', horizontal: 'left' };
      lblCell.border = BORDER_THIN;

      wsIRA.mergeCells(currentRow + 1, kpi.col, currentRow + 1, kpi.col + 1);
      const valCell = wsIRA.getCell(currentRow + 1, kpi.col);
      valCell.value = `${kpi.value} ${kpi.status}`;
      valCell.font = { bold: true, color: { argb: kpi.color }, size: 13, name: 'Segoe UI' };
      valCell.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF1F5F9' } };
      valCell.alignment = { vertical: 'middle', horizontal: 'left' };
      valCell.border = BORDER_THIN;

      wsIRA.mergeCells(currentRow + 2, kpi.col, currentRow + 2, kpi.col + 1);
      const metaCell = wsIRA.getCell(currentRow + 2, kpi.col);
      metaCell.value = kpi.meta;
      metaCell.font = { color: { argb: 'FF64748B' }, size: 9, name: 'Segoe UI' };
      metaCell.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF1F5F9' } };
      metaCell.alignment = { vertical: 'middle', horizontal: 'left' };
      metaCell.border = BORDER_THIN;
    }
    wsIRA.getRow(currentRow).height = 18;
    wsIRA.getRow(currentRow + 1).height = 28;
    wsIRA.getRow(currentRow + 2).height = 18;
    currentRow += 4;

    // ── TABLA 1: Exactitud por Clasificación ABC ──
    wsIRA.mergeCells(currentRow, 1, currentRow, 8);
    const secTitle1 = wsIRA.getCell(currentRow, 1);
    secTitle1.value = '1. Resumen de Exactitud por Clasificación ABC';
    secTitle1.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11, name: 'Segoe UI' };
    secTitle1.fill = HEADER_FILL;
    secTitle1.alignment = { vertical: 'middle', horizontal: 'left' };
    wsIRA.getRow(currentRow).height = 26;
    currentRow++;

    // ABC Headers
    const abcHeaders = ['CLASE', 'TOTAL SKUs', 'SKUs CONFORMES', 'SKUs CON ERROR', 'IRA %', 'META %', 'ESTADO'];
    const abcColStart = 1;
    abcHeaders.forEach((h, i) => {
      const cell = wsIRA.getCell(currentRow, abcColStart + i);
      cell.value = h;
      cell.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 9, name: 'Segoe UI' };
      cell.fill = ACCENT_FILL;
      cell.alignment = { vertical: 'middle', horizontal: 'center' };
      cell.border = BORDER_THIN;
    });
    wsIRA.getRow(currentRow).height = 22;
    currentRow++;

    // ABC Data
    const metaIRA = 95;
    for (const abc of abcData) {
      const ira = abc.total > 0 ? (abc.conformes / abc.total) * 100 : 0;
      const iraPct = `${ira.toFixed(1)}%`;
      const estado = ira >= metaIRA ? 'OK' : ira >= metaIRA - 5 ? 'Revisar' : 'Crítico';
      const estadoColor = ira >= metaIRA ? 'FF059669' : ira >= metaIRA - 5 ? 'FFD97706' : 'FFE11D48';
      const estadoFill = ira >= metaIRA ? GREEN_FILL : ira >= metaIRA - 5 ? AMBER_FILL : RED_FILL;

      const vals = [abc.clase, abc.total, abc.conformes, abc.conError, iraPct, `${metaIRA}%`, estado];
      vals.forEach((v, i) => {
        const cell = wsIRA.getCell(currentRow, abcColStart + i);
        cell.value = v;
        cell.font = { bold: i === 0 || i === 6, color: i === 6 ? { argb: estadoColor } : undefined, size: 10, name: 'Segoe UI' };
        cell.alignment = { vertical: 'middle', horizontal: 'center' };
        cell.border = BORDER_THIN;
        if (i === 6) cell.fill = estadoFill;
      });
      wsIRA.getRow(currentRow).height = 22;
      currentRow++;
    }

    // Fila Total
    const totalConformesABC = abcData.reduce((s, a) => s + a.conformes, 0);
    const totalErrorABC = abcData.reduce((s, a) => s + a.conError, 0);
    const totalABC = abcData.reduce((s, a) => s + a.total, 0);
    const iraTotalABC = totalABC > 0 ? (totalConformesABC / totalABC) * 100 : 0;
    const totalVals = ['TOTAL', totalABC, totalConformesABC, totalErrorABC, `${iraTotalABC.toFixed(1)}%`, `${metaIRA}%`, iraTotalABC >= metaIRA ? 'OK' : 'Revisar'];
    totalVals.forEach((v, i) => {
      const cell = wsIRA.getCell(currentRow, abcColStart + i);
      cell.value = v;
      cell.font = { bold: true, size: 10, name: 'Segoe UI' };
      cell.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFE2E8F0' } };
      cell.alignment = { vertical: 'middle', horizontal: 'center' };
      cell.border = BORDER_THIN;
    });
    wsIRA.getRow(currentRow).height = 22;
    currentRow += 2;

    // ── TABLA 2: Top SKUs con Mayor Impacto Monetario ──
    wsIRA.mergeCells(currentRow, 1, currentRow, 8);
    const secTitle2 = wsIRA.getCell(currentRow, 1);
    secTitle2.value = '2. Top SKUs con Mayor Impacto Monetario';
    secTitle2.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11, name: 'Segoe UI' };
    secTitle2.fill = HEADER_FILL;
    secTitle2.alignment = { vertical: 'middle', horizontal: 'left' };
    wsIRA.getRow(currentRow).height = 26;
    currentRow++;

    // Headers
    const impactHeaders = ['SKU', 'DESCRIPCIÓN', 'CLASE', 'SISTEMA', 'CONTEO', 'DIFERENCIA', 'COSTO UNIT.', 'IMPACTO TOTAL ($)'];
    impactHeaders.forEach((h, i) => {
      const cell = wsIRA.getCell(currentRow, i + 1);
      cell.value = h;
      cell.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 9, name: 'Segoe UI' };
      cell.fill = ACCENT_FILL;
      cell.alignment = { vertical: 'middle', horizontal: 'center', wrapText: true };
      cell.border = BORDER_THIN;
    });
    wsIRA.getRow(currentRow).height = 22;
    currentRow++;

    // Data
    for (const item of topImpacto) {
      const clase = clasificacionMap.get(String(item.producto)) || '-';
      const dif = Number(item.dif || 0);
      const impacto = Number(item.impacto_monetario || 0);
      const difColor = dif > 0 ? 'FFD97706' : dif < 0 ? 'FFE11D48' : undefined;
      const impactoColor = impacto > 0 ? 'FF059669' : impacto < 0 ? 'FFE11D48' : undefined;

      const vals = [
        item.producto,
        item.descripcion,
        clase,
        Number(item.stock_sistema || 0),
        Number(item.cantidad_fisica || 0),
        dif,
        Number(item.costo_unitario || 0),
        impacto,
      ];
      vals.forEach((v, i) => {
        const cell = wsIRA.getCell(currentRow, i + 1);
        cell.value = v as any;
        cell.alignment = { vertical: 'middle', horizontal: i <= 2 ? 'left' : 'center' };
        cell.border = BORDER_THIN;

        if (i === 0 || i === 1 || i === 2) {
          cell.font = { bold: i === 0, size: 10, name: 'Segoe UI' };
        } else if (i === 5) {
          cell.font = { bold: true, color: difColor ? { argb: difColor } : undefined, size: 10, name: 'Segoe UI' };
          cell.numFmt = '#,##0';
        } else if (i === 6) {
          cell.font = { size: 10, name: 'Segoe UI' };
          cell.numFmt = '#,##0.00';
        } else if (i === 7) {
          cell.font = { bold: true, color: impactoColor ? { argb: impactoColor } : undefined, size: 10, name: 'Segoe UI' };
          cell.numFmt = '#,##0.00';
        } else {
          cell.font = { size: 10, name: 'Segoe UI' };
          cell.numFmt = '#,##0';
        }
      });
      wsIRA.getRow(currentRow).height = 20;
      currentRow++;
    }
    currentRow++;

    // ── TABLA 3: Clasificación de Causa Raíz ──
    wsIRA.mergeCells(currentRow, 1, currentRow, 4);
    const secTitle3 = wsIRA.getCell(currentRow, 1);
    secTitle3.value = '3. Clasificación de Causa Raíz';
    secTitle3.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11, name: 'Segoe UI' };
    secTitle3.fill = HEADER_FILL;
    secTitle3.alignment = { vertical: 'middle', horizontal: 'left' };
    wsIRA.getRow(currentRow).height = 26;
    currentRow++;

    const crHeaders = ['CAUSA', 'CANTIDAD', '% INCIDENCIA'];
    crHeaders.forEach((h, i) => {
      const cell = wsIRA.getCell(currentRow, i + 1);
      cell.value = h;
      cell.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 9, name: 'Segoe UI' };
      cell.fill = ACCENT_FILL;
      cell.alignment = { vertical: 'middle', horizontal: 'center' };
      cell.border = BORDER_THIN;
    });
    wsIRA.getRow(currentRow).height = 22;
    currentRow++;

    const crLabels: Record<string, string> = {
      OK: 'Conforme (Sin Error)',
      FALTANTE: 'Faltante de Stock',
      SOBRANTE: 'Sobrante de Stock',
    };
    const crColors: Record<string, string> = {
      OK: 'FF059669',
      FALTANTE: 'FFE11D48',
      SOBRANTE: 'FFD97706',
    };

    for (const cr of causaRaiz) {
      const obs = String(cr.observacion || '');
      const vals = [crLabels[obs] || obs, Number(cr.cantidad || 0), `${Number(cr.porcentaje || 0)}%`];
      vals.forEach((v, i) => {
        const cell = wsIRA.getCell(currentRow, i + 1);
        cell.value = v;
        cell.font = { bold: i === 0, color: i === 0 && crColors[obs] ? { argb: crColors[obs] } : undefined, size: 10, name: 'Segoe UI' };
        cell.alignment = { vertical: 'middle', horizontal: i === 0 ? 'left' : 'center' };
        cell.border = BORDER_THIN;
      });
      wsIRA.getRow(currentRow).height = 20;
      currentRow++;
    }
    currentRow++;

    // ── TABLA 4: Plan de Acción Inmediato (placeholder) ──
    wsIRA.mergeCells(currentRow, 1, currentRow, 8);
    const secTitle4 = wsIRA.getCell(currentRow, 1);
    secTitle4.value = '4. Plan de Acción Inmediato';
    secTitle4.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11, name: 'Segoe UI' };
    secTitle4.fill = HEADER_FILL;
    secTitle4.alignment = { vertical: 'middle', horizontal: 'left' };
    wsIRA.getRow(currentRow).height = 26;
    currentRow++;

    // Acciones dinámicas basadas en datos reales
    const acciones: string[] = [];
    if (totalFaltantesRow.c > 0) {
      acciones.push(`Revisión de Faltantes: Auditar los ${totalFaltantesRow.c} productos con faltante para confirmar ubicación.`);
    }
    if (totalSobrantesRow.c > 0) {
      acciones.push(`Investigación de Sobrantes: Verificar ${totalSobrantesRow.c} productos con sobrante para descartar errores de despacho.`);
    }
    if (descalceNeto < 0) {
      acciones.push(`Ajuste de Inventario: El descalce neto negativo (S/ ${Math.abs(descalceNeto).toLocaleString('es-PE', { maximumFractionDigits: 0 })}) requiere ajuste en el WMS/ERP.`);
    }
    acciones.push('Programa de Conteos Cíclicos: Iniciar conteos diarios de 20 SKUs Clase A a partir del lunes.');
    acciones.push('Capacitación Operativa: Re-entrenamiento en escaneo de salidas al personal del turno noche.');

    acciones.forEach((acc, i) => {
      wsIRA.mergeCells(currentRow, 1, currentRow, 8);
      const cell = wsIRA.getCell(currentRow, 1);
      cell.value = `• ${acc}`;
      cell.font = { size: 10, name: 'Segoe UI' };
      cell.alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };
      cell.border = BORDER_THIN;
      wsIRA.getRow(currentRow).height = 28;
      currentRow++;
    });
    currentRow++;

    // ── FOOTER: Fórmula de cálculo ──
    wsIRA.mergeCells(currentRow, 1, currentRow, 8);
    const footerCell = wsIRA.getCell(currentRow, 1);
    footerCell.value = `Fórmula: Exactitud Registral (IRA) = (SKUs Conformes / Total SKUs Contados) × 100  |  Exactitud Financiera = 1 - (|Valor Físico - Valor Sistema| / Valor Sistema) × 100`;
    footerCell.font = { italic: true, color: { argb: 'FF94A3B8' }, size: 9, name: 'Segoe UI' };
    footerCell.alignment = { vertical: 'middle', horizontal: 'left', wrapText: true };
    wsIRA.getRow(currentRow).height = 20;

    // =========================================================================
    // ── HOJA 3: RESUMEN DE MOVIMIENTOS Y ROTACIÓN (DASHBOARD EJECUTIVO) ──
    // =========================================================================
    const wsResumen = workbook.addWorksheet('Resumen Movimientos', {
      views: [{ showGridLines: true }],
    });

    wsResumen.columns = [
      { width: 5 },   // A
      { width: 32 },  // B
      { width: 38 },  // C
      { width: 14 },  // D
      { width: 18 },  // E
      { width: 16 },  // F
      { width: 18 },  // G
    ];

    let rowM = 1;

    // Header Institucional
    wsResumen.mergeCells(`B${rowM}:G${rowM}`);
    const rTitle = wsResumen.getCell(`B${rowM}`);
    rTitle.value = 'ALM MRO CHILCA — RESUMEN EJECUTIVO DE MOVIMIENTOS Y ROTACIÓN';
    rTitle.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 13, name: 'Segoe UI' };
    rTitle.fill = HEADER_FILL;
    rTitle.alignment = { vertical: 'middle', horizontal: 'center' };
    wsResumen.getRow(rowM).height = 36;
    rowM++;

    // Subtitle
    wsResumen.mergeCells(`B${rowM}:G${rowM}`);
    const rSub = wsResumen.getCell(`B${rowM}`);
    rSub.value = `Generado el: ${new Date().toLocaleString('es-PE', { timeZone: 'America/Lima' })}  |  Control de Entradas, Salidas y Rotación de Repuestos`;
    rSub.font = { italic: true, color: { argb: 'FF475569' }, size: 9, name: 'Segoe UI' };
    rSub.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF1F5F9' } };
    rSub.alignment = { vertical: 'middle', horizontal: 'left', indent: 1 };
    wsResumen.getRow(rowM).height = 20;
    rowM += 2;

    // Consultas de movimientos
    const movStats = db.prepare(`
      SELECT 
        COALESCE(SUM(CASE WHEN tipo = 'INGRESO' THEN 1 ELSE 0 END), 0) as ingresos_count,
        COALESCE(SUM(CASE WHEN tipo = 'SALIDA' THEN 1 ELSE 0 END), 0) as salidas_count,
        COALESCE(SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END), 0) as total_unidades_ingresadas,
        COALESCE(SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END), 0) as total_unidades_salidas,
        COUNT(*) as total_movimientos
      FROM movimientos
    `).get() as {
      ingresos_count: number;
      salidas_count: number;
      total_unidades_ingresadas: number;
      total_unidades_salidas: number;
      total_movimientos: number;
    };

    const motivosData = db.prepare(`
      SELECT motivo, COUNT(*) as count, COALESCE(SUM(cantidad), 0) as total_unidades
      FROM movimientos
      WHERE tipo = 'SALIDA'
      GROUP BY motivo
      ORDER BY total_unidades DESC
    `).all() as { motivo: string; count: number; total_unidades: number }[];

    const topRotacion = db.prepare(`
      SELECT m.producto, p.glosa as descripcion, p.unidad_codigo as unidad, COALESCE(SUM(m.cantidad), 0) as total_despachado, COUNT(*) as despachos
      FROM movimientos m
      JOIN productos p ON m.producto = p.sku
      WHERE m.tipo = 'SALIDA'
      GROUP BY m.producto
      ORDER BY total_despachado DESC
      LIMIT 15
    `).all() as { producto: string; descripcion: string; unidad: string; total_despachado: number; despachos: number }[];

    const topSolicitantes = db.prepare(`
      SELECT CASE WHEN solicitante = '' THEN 'Sin especificar' ELSE solicitante END as solicitante,
             COUNT(*) as despachos, COALESCE(SUM(cantidad), 0) as total_unidades
      FROM movimientos
      WHERE tipo = 'SALIDA'
      GROUP BY solicitante
      ORDER BY despachos DESC
      LIMIT 10
    `).all() as { solicitante: string; despachos: number; total_unidades: number }[];

    // ── SECCIÓN 1: KPIs GENERALES DE MOVIMIENTOS ──
    wsResumen.mergeCells(`B${rowM}:G${rowM}`);
    const secMov1 = wsResumen.getCell(`B${rowM}`);
    secMov1.value = '1. Indicadores Generales de Movimientos';
    secMov1.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11, name: 'Segoe UI' };
    secMov1.fill = HEADER_FILL;
    secMov1.alignment = { vertical: 'middle', horizontal: 'left' };
    wsResumen.getRow(rowM).height = 26;
    rowM++;

    const kpiMovHeaders = ['INDICADOR', 'VALOR', 'UNIDADES', 'ESTADO / NOTA'];
    wsResumen.mergeCells(`B${rowM}:C${rowM}`);
    wsResumen.getCell(`B${rowM}`).value = 'INDICADOR';
    wsResumen.getCell(`D${rowM}`).value = 'TRANSACCIONES';
    wsResumen.getCell(`E${rowM}`).value = 'CANTIDAD TOTAL';
    wsResumen.mergeCells(`F${rowM}:G${rowM}`);
    wsResumen.getCell(`F${rowM}`).value = 'BALANCE / IMPACTO';

    ['B', 'C', 'D', 'E', 'F', 'G'].forEach(col => {
      const c = wsResumen.getCell(`${col}${rowM}`);
      c.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 9, name: 'Segoe UI' };
      c.fill = ACCENT_FILL;
      c.alignment = { vertical: 'middle', horizontal: 'center' };
      c.border = BORDER_THIN;
    });
    wsResumen.getRow(rowM).height = 22;
    rowM++;

    const kpiMovRows = [
      {
        nombre: 'Total Ingresos a Almacén (+)',
        trans: movStats.ingresos_count,
        unidades: movStats.total_unidades_ingresadas,
        nota: 'Compras y devoluciones recepcionadas',
        color: 'FF059669',
      },
      {
        nombre: 'Total Despachos / Salidas (-)',
        trans: movStats.salidas_count,
        unidades: movStats.total_unidades_salidas,
        nota: 'Órdenes de trabajo y consumo de planta',
        color: 'FFE11D48',
      },
      {
        nombre: 'Balance Neto de Movimientos',
        trans: movStats.total_movimientos,
        unidades: movStats.total_unidades_ingresadas - movStats.total_unidades_salidas,
        nota: movStats.total_unidades_ingresadas - movStats.total_unidades_salidas >= 0 ? 'Flujo Positivo (+)' : 'Consumo Mayor a Ingresos (-)',
        color: movStats.total_unidades_ingresadas - movStats.total_unidades_salidas >= 0 ? 'FF059669' : 'FFE11D48',
      },
    ];

    kpiMovRows.forEach(kpi => {
      wsResumen.mergeCells(`B${rowM}:C${rowM}`);
      wsResumen.getCell(`B${rowM}`).value = kpi.nombre;
      wsResumen.getCell(`B${rowM}`).font = { bold: true, size: 10, name: 'Segoe UI' };
      wsResumen.getCell(`B${rowM}`).alignment = { vertical: 'middle', horizontal: 'left' };

      wsResumen.getCell(`D${rowM}`).value = kpi.trans;
      wsResumen.getCell(`D${rowM}`).numFmt = '#,##0';
      wsResumen.getCell(`D${rowM}`).alignment = { vertical: 'middle', horizontal: 'center' };

      wsResumen.getCell(`E${rowM}`).value = kpi.unidades;
      wsResumen.getCell(`E${rowM}`).numFmt = '#,##0.00';
      wsResumen.getCell(`E${rowM}`).font = { bold: true, color: { argb: kpi.color }, size: 10, name: 'Segoe UI' };
      wsResumen.getCell(`E${rowM}`).alignment = { vertical: 'middle', horizontal: 'right' };

      wsResumen.mergeCells(`F${rowM}:G${rowM}`);
      wsResumen.getCell(`F${rowM}`).value = kpi.nota;
      wsResumen.getCell(`F${rowM}`).alignment = { vertical: 'middle', horizontal: 'left' };

      ['B', 'C', 'D', 'E', 'F', 'G'].forEach(col => {
        wsResumen.getCell(`${col}${rowM}`).border = BORDER_THIN;
      });
      wsResumen.getRow(rowM).height = 22;
      rowM++;
    });
    rowM += 2;

    // ── SECCIÓN 2: MOTIVOS DE SALIDA ──
    wsResumen.mergeCells(`B${rowM}:G${rowM}`);
    const secMov2 = wsResumen.getCell(`B${rowM}`);
    secMov2.value = '2. Distribución de Salidas por Motivo';
    secMov2.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11, name: 'Segoe UI' };
    secMov2.fill = HEADER_FILL;
    secMov2.alignment = { vertical: 'middle', horizontal: 'left' };
    wsResumen.getRow(rowM).height = 26;
    rowM++;

    wsResumen.mergeCells(`B${rowM}:D${rowM}`);
    wsResumen.getCell(`B${rowM}`).value = 'MOTIVO DE SALIDA';
    wsResumen.getCell(`E${rowM}`).value = 'N° DESPACHOS';
    wsResumen.getCell(`F${rowM}`).value = 'CANTIDAD TOTAL';
    wsResumen.getCell(`G${rowM}`).value = '% PARTICIPACIÓN';

    ['B', 'C', 'D', 'E', 'F', 'G'].forEach(col => {
      const c = wsResumen.getCell(`${col}${rowM}`);
      c.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 9, name: 'Segoe UI' };
      c.fill = ACCENT_FILL;
      c.alignment = { vertical: 'middle', horizontal: 'center' };
      c.border = BORDER_THIN;
    });
    wsResumen.getRow(rowM).height = 22;
    rowM++;

    const totalSalidasCant = movStats.total_unidades_salidas || 1;

    if (motivosData.length === 0) {
      wsResumen.mergeCells(`B${rowM}:G${rowM}`);
      wsResumen.getCell(`B${rowM}`).value = 'Aún no se registran movimientos de salida.';
      wsResumen.getCell(`B${rowM}`).alignment = { vertical: 'middle', horizontal: 'center' };
      wsResumen.getCell(`B${rowM}`).font = { italic: true, size: 9.5, color: { argb: 'FF94A3B8' } };
      wsResumen.getRow(rowM).height = 22;
      rowM++;
    } else {
      motivosData.forEach(mot => {
        wsResumen.mergeCells(`B${rowM}:D${rowM}`);
        wsResumen.getCell(`B${rowM}`).value = mot.motivo;
        wsResumen.getCell(`B${rowM}`).font = { size: 9.5, name: 'Segoe UI' };
        wsResumen.getCell(`B${rowM}`).alignment = { vertical: 'middle', horizontal: 'left' };

        wsResumen.getCell(`E${rowM}`).value = mot.count;
        wsResumen.getCell(`E${rowM}`).numFmt = '#,##0';
        wsResumen.getCell(`E${rowM}`).alignment = { vertical: 'middle', horizontal: 'center' };

        wsResumen.getCell(`F${rowM}`).value = mot.total_unidades;
        wsResumen.getCell(`F${rowM}`).numFmt = '#,##0.00';
        wsResumen.getCell(`F${rowM}`).alignment = { vertical: 'middle', horizontal: 'right' };

        const pct = ((mot.total_unidades / totalSalidasCant) * 100).toFixed(1);
        wsResumen.getCell(`G${rowM}`).value = `${pct}%`;
        wsResumen.getCell(`G${rowM}`).alignment = { vertical: 'middle', horizontal: 'center' };

        ['B', 'C', 'D', 'E', 'F', 'G'].forEach(col => {
          wsResumen.getCell(`${col}${rowM}`).border = BORDER_THIN;
        });
        wsResumen.getRow(rowM).height = 20;
        rowM++;
      });
    }
    rowM += 2;

    // ── SECCIÓN 3: TOP 15 REPUESTOS CON MAYOR ROTACIÓN ──
    wsResumen.mergeCells(`B${rowM}:G${rowM}`);
    const secMov3 = wsResumen.getCell(`B${rowM}`);
    secMov3.value = '3. Top 15 Repuestos con Mayor Rotación (Salidas)';
    secMov3.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 11, name: 'Segoe UI' };
    secMov3.fill = HEADER_FILL;
    secMov3.alignment = { vertical: 'middle', horizontal: 'left' };
    wsResumen.getRow(rowM).height = 26;
    rowM++;

    wsResumen.getCell(`B${rowM}`).value = 'CÓDIGO SKU';
    wsResumen.getCell(`C${rowM}`).value = 'DESCRIPCIÓN DEL MATERIAL';
    wsResumen.getCell(`D${rowM}`).value = 'UM';
    wsResumen.getCell(`E${rowM}`).value = 'DESPACHOS';
    wsResumen.mergeCells(`F${rowM}:G${rowM}`);
    wsResumen.getCell(`F${rowM}`).value = 'TOTAL DESPACHADO';

    ['B', 'C', 'D', 'E', 'F', 'G'].forEach(col => {
      const c = wsResumen.getCell(`${col}${rowM}`);
      c.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 9, name: 'Segoe UI' };
      c.fill = ACCENT_FILL;
      c.alignment = { vertical: 'middle', horizontal: 'center' };
      c.border = BORDER_THIN;
    });
    wsResumen.getRow(rowM).height = 22;
    rowM++;

    if (topRotacion.length === 0) {
      wsResumen.mergeCells(`B${rowM}:G${rowM}`);
      wsResumen.getCell(`B${rowM}`).value = 'Sin datos de rotación.';
      wsResumen.getCell(`B${rowM}`).alignment = { vertical: 'middle', horizontal: 'center' };
      wsResumen.getRow(rowM).height = 22;
      rowM++;
    } else {
      topRotacion.forEach(item => {
        wsResumen.getCell(`B${rowM}`).value = item.producto;
        wsResumen.getCell(`B${rowM}`).font = { name: 'Consolas', size: 9.5, bold: true };

        wsResumen.getCell(`C${rowM}`).value = item.descripcion;
        wsResumen.getCell(`C${rowM}`).font = { size: 9.5, name: 'Segoe UI' };

        wsResumen.getCell(`D${rowM}`).value = item.unidad;
        wsResumen.getCell(`D${rowM}`).alignment = { vertical: 'middle', horizontal: 'center' };

        wsResumen.getCell(`E${rowM}`).value = item.despachos;
        wsResumen.getCell(`E${rowM}`).numFmt = '#,##0';
        wsResumen.getCell(`E${rowM}`).alignment = { vertical: 'middle', horizontal: 'center' };

        wsResumen.mergeCells(`F${rowM}:G${rowM}`);
        wsResumen.getCell(`F${rowM}`).value = item.total_despachado;
        wsResumen.getCell(`F${rowM}`).numFmt = '#,##0.00';
        wsResumen.getCell(`F${rowM}`).font = { bold: true, color: { argb: 'FFE11D48' } };
        wsResumen.getCell(`F${rowM}`).alignment = { vertical: 'middle', horizontal: 'right' };

        ['B', 'C', 'D', 'E', 'F', 'G'].forEach(col => {
          wsResumen.getCell(`${col}${rowM}`).border = BORDER_THIN;
        });
        wsResumen.getRow(rowM).height = 20;
        rowM++;
      });
    }

    // =========================================================================
    // ── HOJA 4: KARDEX DETALLADO (LÍNEA POR LÍNEA) ──
    // =========================================================================
    const wsKardex = workbook.addWorksheet('Kardex Detallado', {
      views: [{ state: 'frozen', ySplit: 3, showGridLines: true }],
    });

    // 1. Título
    wsKardex.mergeCells('A1:O1');
    const kTitle = wsKardex.getCell('A1');
    kTitle.value = 'MRO INVENTARIO — KARDEX DE MOVIMIENTOS DETALLADO';
    kTitle.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 13, name: 'Segoe UI' };
    kTitle.fill = HEADER_FILL;
    kTitle.alignment = { vertical: 'middle', horizontal: 'center' };
    wsKardex.getRow(1).height = 34;

    wsKardex.mergeCells('A2:O2');
    const kMeta = wsKardex.getCell('A2');
    kMeta.value = `Generado el: ${new Date().toLocaleString('es-PE', { timeZone: 'America/Lima' })}  |  Auditoría y Trazabilidad de Entradas y Salidas`;
    kMeta.font = { italic: true, color: { argb: 'FF475569' }, size: 9, name: 'Segoe UI' };
    kMeta.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF1F5F9' } };
    kMeta.alignment = { vertical: 'middle', horizontal: 'left', indent: 1 };
    wsKardex.getRow(2).height = 20;

    // 2. Cabeceras
    const kardexHeaders = [
      { header: 'ID', width: 8 },
      { header: 'FECHA / HORA', width: 19 },
      { header: 'TIPO', width: 14 },
      { header: 'SKU / CÓDIGO', width: 16 },
      { header: 'DESCRIPCIÓN DEL MATERIAL', width: 38 },
      { header: 'UM', width: 8 },
      { header: 'LOTE', width: 12 },
      { header: 'CANTIDAD', width: 14 },
      { header: 'STOCK ANTERIOR', width: 16 },
      { header: 'STOCK RESULTANTE', width: 18 },
      { header: 'MOTIVO DEL MOVIMIENTO', width: 30 },
      { header: 'N° DOC / GUÍA / OT', width: 22 },
      { header: 'SOLICITANTE / PROVEEDOR', width: 25 },
      { header: 'RACK / UBICACIÓN', width: 16 },
      { header: 'REGISTRADO POR', width: 18 },
    ];

    const kHeadRow = wsKardex.getRow(3);
    kHeadRow.height = 26;
    kardexHeaders.forEach((kh, i) => {
      const cell = kHeadRow.getCell(i + 1);
      cell.value = kh.header;
      cell.font = { bold: true, color: { argb: 'FFFFFFFF' }, size: 9.5, name: 'Segoe UI' };
      cell.fill = ACCENT_FILL;
      cell.alignment = { vertical: 'middle', horizontal: 'center' };
      cell.border = BORDER_THIN;
      wsKardex.getColumn(i + 1).width = kh.width;
    });

    const kardexRows = db.prepare(`
      SELECT m.id, m.created_at, m.tipo, m.producto, p.glosa as descripcion, p.unidad_codigo as unidad, m.lote,
             m.cantidad, m.stock_anterior, m.stock_resultante, m.motivo, m.documento_referencia,
             m.solicitante, m.rack, u.nombre as usuario_nombre
      FROM movimientos m
      JOIN productos p ON m.producto = p.sku
      LEFT JOIN usuarios u ON m.usuario_id = u.id
      ORDER BY m.created_at DESC, m.id DESC
    `).all() as {
      id: number;
      created_at: string;
      tipo: string;
      producto: string;
      descripcion: string;
      unidad: string;
      lote: string;
      cantidad: number;
      stock_anterior: number;
      stock_resultante: number;
      motivo: string;
      documento_referencia: string;
      solicitante: string;
      rack: string;
      usuario_nombre: string;
    }[];

    kardexRows.forEach((kr, idx) => {
      const rNum = 4 + idx;
      const r = wsKardex.getRow(rNum);
      r.height = 22;
      const isEven = idx % 2 === 0;

      r.values = [
        kr.id,
        kr.created_at,
        kr.tipo,
        kr.producto,
        kr.descripcion,
        kr.unidad || 'UND',
        kr.lote || '-',
        kr.cantidad,
        kr.stock_anterior,
        kr.stock_resultante,
        kr.motivo,
        kr.documento_referencia || '-',
        kr.solicitante || '-',
        kr.rack || '-',
        kr.usuario_nombre || 'Sistema',
      ];

      for (let c = 1; c <= 15; c++) {
        const cell = r.getCell(c);
        cell.border = BORDER_THIN;
        cell.font = { size: 9.5, name: 'Segoe UI' };
        cell.alignment = { vertical: 'middle' };

        if (!isEven) {
          cell.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFF8FAFC' } };
        }

        if (c === 1 || c === 2 || c === 6 || c === 7) {
          cell.alignment = { vertical: 'middle', horizontal: 'center' };
        } else if (c === 3) {
          cell.alignment = { vertical: 'middle', horizontal: 'center' };
          if (kr.tipo === 'INGRESO') {
            cell.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFDCFCE7' } };
            cell.font = { bold: true, color: { argb: 'FF166534' }, size: 9.5 };
          } else if (kr.tipo === 'SALIDA') {
            cell.fill = { type: 'pattern', pattern: 'solid', fgColor: { argb: 'FFFEE2E2' } };
            cell.font = { bold: true, color: { argb: 'FF991B1B' }, size: 9.5 };
          }
        } else if (c === 4) {
          cell.font = { name: 'Consolas', size: 9.5, bold: true };
        } else if (c === 8) {
          cell.numFmt = '#,##0.00';
          cell.alignment = { vertical: 'middle', horizontal: 'right' };
          cell.font = { bold: true, size: 10 };
        } else if (c === 9 || c === 10) {
          cell.numFmt = '#,##0.00';
          cell.alignment = { vertical: 'middle', horizontal: 'right' };
        }
      }
    });

    const buffer = await workbook.xlsx.writeBuffer();
    const filename = `Inventario_MRO_CHILCA_${new Date().toLocaleDateString("sv-SE")}.xlsx`;

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
