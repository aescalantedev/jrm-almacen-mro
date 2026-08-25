import { NextResponse } from 'next/server';
import ExcelJS from 'exceljs';
import { getDB } from '@/lib/db';

export async function GET() {
  try {
    const db = getDB();
    const rows = db.prepare(`
      SELECT i.*, p.glosa as descripcion, p.unidad, p.familia, p.peso as peso_aprox_unitario,
             p.costo_unitario, s.stock as stock_sistema
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
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
      SELECT COALESCE(SUM(i.cantidad_fisica * p.costo_unitario), 0) as v
      FROM inventario i JOIN productos_master p ON i.producto = p.producto
    `).get() as { v: number };

    const valorSistemaRow = db.prepare(`
      SELECT COALESCE(SUM(s.stock * p.costo_unitario), 0) as v
      FROM stock_cache s JOIN productos_master p ON s.producto = p.producto
    `).get() as { v: number };

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
      SELECT i.producto, p.glosa as descripcion, p.familia,
             s.stock as stock_sistema, i.cantidad_fisica, i.dif,
             p.costo_unitario,
             (COALESCE(s.stock, 0) * p.costo_unitario) as valor_sistema
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
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
      SELECT i.producto, p.glosa as descripcion, p.familia,
             s.stock as stock_sistema, i.cantidad_fisica, i.dif,
             p.costo_unitario,
             i.dif * p.costo_unitario as impacto_monetario
      FROM inventario i
      JOIN productos_master p ON i.producto = p.producto
      LEFT JOIN stock_cache s ON i.producto = s.producto AND i.lote = s.lote
      WHERE i.dif != 0 AND i.cantidad_fisica IS NOT NULL AND i.cantidad_fisica != 0
      ORDER BY ABS(i.dif * p.costo_unitario) DESC
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
