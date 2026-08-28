const fs = require('fs');
const path = require('path');
const sql = require('mssql');

const config = {
  user: 'flexline',
  password: 'f13x11n3',
  server: 'DATAFLEX\\FLEXLINE',
  database: 'BDFlexline',
  options: {
    encrypt: false,
    trustServerCertificate: true
  }
};

const flexlineQuery = `
SELECT
    p.PRODUCTO,
    s.Stock AS Stock_Pro
FROM flexline.PRODUCTO AS p
INNER JOIN (
    SELECT
        dt.Empresa,
        dt.Bodega,
        dt.Producto,
        SUM(dt.Cantidad * dt.FactorInventario) AS Stock
    FROM flexline.DocumentoD AS dt
    WHERE dt.Empresa = '001'
      AND dt.Bodega = 'ALM MRO CHILCA'
      AND dt.FactorInventario <> 0
      AND dt.Vigente NOT IN ('A', 'P')
      AND dt.Fecha < DATEADD(DAY, 1, CAST(GETDATE() AS date))
    GROUP BY dt.Empresa, dt.Bodega, dt.Producto
) AS s ON s.Empresa = p.EMPRESA AND s.Producto = p.PRODUCTO
WHERE p.EMPRESA = '001' AND p.VALIDASTOCK = 'S' AND p.VIGENTE = 'S';
`;

async function run() {
  console.log('Connecting to Flexline SQL Server...');
  await sql.connect(config);

  console.log('Fetching current stock_sistema from Flexline...');
  const res = await sql.query(flexlineQuery);
  const stockMap = {};
  for (const row of res.recordset) {
    stockMap[row.PRODUCTO] = Number(row.Stock_Pro) || 0;
  }

  const updates = {}; // sku -> data

  // 1. Parse CSV
  console.log('Parsing tets.csv...');
  const csvContent = fs.readFileSync(path.join(__dirname, '../public/tets.csv'), 'utf-8');
  const csvLines = csvContent.split('\n');
  const headers = csvLines[0].split(';').map(h => h.trim());
  
  for (let i = 1; i < csvLines.length; i++) {
    const line = csvLines[i].trim();
    if (!line) continue;
    const parts = line.split(';');
    const sku = parts[1]?.trim();
    if (!sku) continue;

    const cantidad_fisica = Number(parts[7]?.trim()) || 0;
    const comentario = parts[22]?.trim() || '';
    const rack = parts[23]?.trim() || '';
    const ubicacion = parts[24]?.trim() || '';
    const contedor = parts[26]?.trim() || '';
    const largo = Number(parts[12]?.trim()) || 0;
    const ancho = Number(parts[13]?.trim()) || 0;
    const alto = Number(parts[14]?.trim()) || 0;
    const peso_aprox = Number(parts[15]?.trim()) || 0;

    updates[sku] = {
      sku,
      cantidad_fisica,
      comentario,
      rack,
      ubicacion,
      contedor,
      largo, ancho, alto, peso_aprox
    };
  }

  // 2. Parse JSON
  console.log('Parsing inventario_estructurado_final.json...');
  const jsonContent = JSON.parse(fs.readFileSync(path.join(__dirname, '../public/inventario_estructurado_final.json'), 'utf-8'));
  for (const item of jsonContent.items || []) {
    const sku = item.codigo;
    if (!sku) continue;

    if (!updates[sku]) {
      updates[sku] = {
        sku,
        cantidad_fisica: item.cantidad || 0,
        comentario: item.ubicacion || '',
        largo: item.medidas?.largo || 0,
        alto: item.medidas?.alto || 0,
        ancho: item.medidas?.espesor || 0, // mapeando espesor a ancho
        rack: '',
        ubicacion: item.ubicacion || '',
        contedor: '',
        peso_aprox: item.peso_kg || 0
      };
    } else {
      // JSON overrides if already exists? Let's just update fields
      updates[sku].cantidad_fisica = item.cantidad || updates[sku].cantidad_fisica;
      if (item.ubicacion) updates[sku].comentario = item.ubicacion;
      if (item.medidas?.largo) updates[sku].largo = item.medidas.largo;
      if (item.medidas?.alto) updates[sku].alto = item.medidas.alto;
      if (item.medidas?.espesor) updates[sku].ancho = item.medidas.espesor;
      if (item.peso_kg) updates[sku].peso_aprox = item.peso_kg;
    }
  }

  // 3. Generate SQL
  console.log('Generating SQL...');
  let sqlOutput = `-- Actualizacion de Conteo Fisico\n\nBEGIN;\n\n`;

  for (const sku in updates) {
    const data = updates[sku];
    const systemStock = stockMap[sku] || 0;
    const dif = data.cantidad_fisica - systemStock;
    let observacion = 'OK';
    if (dif > 0) observacion = 'SOBRANTE';
    else if (dif < 0) observacion = 'FALTANTE';

    const safeComentario = String(data.comentario).replace(/'/g, "''");
    const safeRack = String(data.rack).replace(/'/g, "''");
    const safeUbic = String(data.ubicacion).replace(/'/g, "''");
    const safeCont = String(data.contedor).replace(/'/g, "''");

    sqlOutput += `UPDATE inventario 
SET cantidad_fisica = ${data.cantidad_fisica},
    dif = ${dif},
    observacion = '${observacion}',
    comentario = '${safeComentario}',
    rack = '${safeRack}',
    ubicacion_actual = '${safeUbic}',
    contenedor = '${safeCont}',
    largo = ${data.largo},
    ancho = ${data.ancho},
    alto = ${data.alto},
    peso_total_cant_fisica = ${data.peso_aprox * data.cantidad_fisica},
    fecha_conteo = (NOW() AT TIME ZONE 'America/Lima')::text
WHERE producto = '${sku.replace(/'/g, "''")}';\n\n`;
  }

  sqlOutput += `COMMIT;\n`;

  const outPath = path.join(__dirname, 'import_conteo_manual.sql');
  fs.writeFileSync(outPath, sqlOutput);

  console.log(`Successfully generated scripts/import_conteo_manual.sql with ${Object.keys(updates).length} products.`);
  await sql.close();
}

run().catch(console.error);
