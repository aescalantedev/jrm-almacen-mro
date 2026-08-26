import ExcelJS from "exceljs";

export interface KardexExcelRow {
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
  comentario: string;
}

export async function generateKardexExcel(
  rows: KardexExcelRow[],
  filterInfo: { tipo?: string; desde?: string; hasta?: string; q?: string } = {}
): Promise<Buffer> {
  const workbook = new ExcelJS.Workbook();
  workbook.creator = "MRO Inventario — Sistema ALM MRO CHILCA";
  workbook.created = new Date();

  const worksheet = workbook.addWorksheet("Kardex Movimientos", {
    views: [{ showGridLines: true }],
  });

  // 1. HEADER INSTITUCIONAL
  worksheet.mergeCells("A1:N1");
  const titleCell = worksheet.getCell("A1");
  titleCell.value = "MRO INVENTARIO — REPORTE DE KARDEX Y MOVIMIENTOS";
  titleCell.font = { name: "Arial", size: 14, bold: true, color: { argb: "FFFFFFFF" } };
  titleCell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF0F172A" } }; // Slate 900
  titleCell.alignment = { vertical: "middle", horizontal: "center" };
  worksheet.getRow(1).height = 36;

  // 2. METADATOS DEL REPORTE
  worksheet.mergeCells("A2:N2");
  const metaCell = worksheet.getCell("A2");
  const nowStr = new Date().toLocaleString("es-PE", { timeZone: "America/Lima" });
  const filterParts = [];
  if (filterInfo.tipo) filterParts.push(`Tipo: ${filterInfo.tipo}`);
  if (filterInfo.desde) filterParts.push(`Desde: ${filterInfo.desde}`);
  if (filterInfo.hasta) filterParts.push(`Hasta: ${filterInfo.hasta}`);
  if (filterInfo.q) filterParts.push(`Búsqueda: "${filterInfo.q}"`);
  const filterText = filterParts.length > 0 ? ` | Filtros: ${filterParts.join(" - ")}` : " | Filtros: Todos los registros";

  metaCell.value = `Generado el: ${nowStr}${filterText} | Total Registros: ${rows.length}`;
  metaCell.font = { name: "Arial", size: 9, italic: true, color: { argb: "FF475569" } };
  metaCell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FFF1F5F9" } };
  metaCell.alignment = { vertical: "middle", horizontal: "left", indent: 1 };
  worksheet.getRow(2).height = 20;

  // 3. CABECERAS DE COLUMNAS
  const headers = [
    { header: "ID", key: "id", width: 8 },
    { header: "FECHA / HORA", key: "created_at", width: 19 },
    { header: "TIPO", key: "tipo", width: 14 },
    { header: "SKU / CÓDIGO", key: "producto", width: 16 },
    { header: "DESCRIPCIÓN DEL MATERIAL", key: "descripcion", width: 38 },
    { header: "UM", key: "unidad", width: 8 },
    { header: "LOTE", key: "lote", width: 12 },
    { header: "CANTIDAD", key: "cantidad", width: 14 },
    { header: "STOCK ANTERIOR", key: "stock_anterior", width: 16 },
    { header: "STOCK RESULTANTE", key: "stock_resultante", width: 18 },
    { header: "MOTIVO DEL MOVIMIENTO", key: "motivo", width: 30 },
    { header: "N° DOC / GUÍA / OT", key: "documento_referencia", width: 22 },
    { header: "SOLICITANTE / ÁREA", key: "solicitante", width: 25 },
    { header: "RACK / UBICACIÓN", key: "rack", width: 16 },
    { header: "REGISTRADO POR", key: "usuario_nombre", width: 18 },
    { header: "OBSERVACIONES", key: "comentario", width: 30 },
  ];

  const headerRowNumber = 4;
  const headerRow = worksheet.getRow(headerRowNumber);
  headerRow.height = 26;

  headers.forEach((col, idx) => {
    const cell = headerRow.getCell(idx + 1);
    cell.value = col.header;
    cell.font = { name: "Arial", size: 10, bold: true, color: { argb: "FFFFFFFF" } };
    cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FF1E293B" } }; // Slate 800
    cell.alignment = {
      vertical: "middle",
      horizontal: ["CANTIDAD", "STOCK ANTERIOR", "STOCK RESULTANTE", "ID", "UM", "TIPO"].includes(col.header) ? "center" : "left",
    };
    cell.border = {
      top: { style: "thin", color: { argb: "FF334155" } },
      bottom: { style: "medium", color: { argb: "FF0F172A" } },
      left: { style: "thin", color: { argb: "FF334155" } },
      right: { style: "thin", color: { argb: "FF334155" } },
    };
  });

  // 4. DATOS
  rows.forEach((row, rowIndex) => {
    const rowNum = headerRowNumber + 1 + rowIndex;
    const excelRow = worksheet.getRow(rowNum);
    excelRow.height = 22;

    const isEven = rowIndex % 2 === 0;
    const defaultBg = isEven ? "FFFFFFFF" : "FFF8FAFC";

    excelRow.values = [
      row.id,
      row.created_at,
      row.tipo,
      row.producto,
      row.descripcion,
      row.unidad || "UND",
      row.lote || "-",
      row.cantidad,
      row.stock_anterior,
      row.stock_resultante,
      row.motivo,
      row.documento_referencia || "-",
      row.solicitante || "-",
      row.rack || "-",
      row.usuario_nombre || "Sistema",
      row.comentario || "",
    ];

    // Estilos por celda
    for (let c = 1; c <= headers.length; c++) {
      const cell = excelRow.getCell(c);
      cell.font = { name: "Arial", size: 9.5, color: { argb: "FF1E293B" } };
      cell.border = {
        bottom: { style: "thin", color: { argb: "FFE2E8F0" } },
        right: { style: "thin", color: { argb: "FFE2E8F0" } },
        left: { style: "thin", color: { argb: "FFE2E8F0" } },
      };
      cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: defaultBg } };
      cell.alignment = { vertical: "middle" };

      // Formato y colores según columna
      if (c === 1) { // ID
        cell.alignment = { vertical: "middle", horizontal: "center" };
      } else if (c === 2) { // Fecha
        cell.alignment = { vertical: "middle", horizontal: "center" };
      } else if (c === 3) { // Tipo badge
        cell.alignment = { vertical: "middle", horizontal: "center" };
        cell.font = { name: "Arial", size: 9.5, bold: true };
        if (row.tipo === "INGRESO") {
          cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FFDCFCE7" } }; // Green 100
          cell.font = { name: "Arial", size: 9.5, bold: true, color: { argb: "FF166534" } }; // Green 800
        } else if (row.tipo === "SALIDA") {
          cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FFFEE2E2" } }; // Red 100
          cell.font = { name: "Arial", size: 9.5, bold: true, color: { argb: "FF991B1B" } }; // Red 800
        } else {
          cell.fill = { type: "pattern", pattern: "solid", fgColor: { argb: "FFE0E7FF" } }; // Indigo 100
          cell.font = { name: "Arial", size: 9.5, bold: true, color: { argb: "FF3730A3" } };
        }
      } else if (c === 4) { // SKU
        cell.font = { name: "Consolas", size: 9.5, bold: true, color: { argb: "FF0F172A" } };
      } else if (c === 6 || c === 7) { // UM, Lote
        cell.alignment = { vertical: "middle", horizontal: "center" };
      } else if (c === 8) { // Cantidad
        cell.numFmt = "#,##0.00";
        cell.alignment = { vertical: "middle", horizontal: "right" };
        cell.font = { name: "Arial", size: 10, bold: true };
      } else if (c === 9 || c === 10) { // Stock anterior / Resultante
        cell.numFmt = "#,##0.00";
        cell.alignment = { vertical: "middle", horizontal: "right" };
        if (c === 10) {
          cell.font = { name: "Arial", size: 9.5, bold: true, color: { argb: "FF0F172A" } };
        }
      }
    }
  });

  // Ajustar anchos automáticos con seguridad
  headers.forEach((col, idx) => {
    worksheet.getColumn(idx + 1).width = col.width;
  });

  const buffer = await workbook.xlsx.writeBuffer();
  return Buffer.from(buffer);
}
