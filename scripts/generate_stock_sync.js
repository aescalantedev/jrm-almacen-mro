const sql = require('mssql');
const fs = require('fs');
const path = require('path');

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

const query = `
SELECT
    p.EMPRESA,
    s.Bodega,
    s.Ubicacion,
    s.Lote,
    p.PRODUCTO,
    p.GLOSA,
    p.TIPOPRODUCTO,
    p.UNIDAD,
    s.Stock,
    ISNULL(p.FAMILIA, '') AS FAMILIA,
    ISNULL(p.SUBFAMILIA, '') AS SUBFAMILIA,
    ISNULL(p.TIPO, '') AS TIPO,
    p.PESO,
    ISNULL(p.AnalisisProducto13, '') AS [TIPO DE ACERO],
    ISNULL(p.AnalisisProducto14, '') AS [GRADO DE ACERO],
    REPLACE(p.AnalisisProducto8, ',', '.') AS [ESPESOR DE ACERO],
    COUNT(*) OVER (PARTITION BY s.Lote) AS Detalle,
    p.AnalisisProducto9 AS PesoProducto,
    s.Stock AS Stock_Pro,
    p.SUBFAMILIA AS SUB_FAMILIA,
    s.UltimoIngreso
FROM flexline.PRODUCTO AS p
INNER JOIN (
    SELECT
        dt.Empresa,
        dt.Bodega,
        dt.Ubicacion,
        dt.Producto,
        dt.Lote,
        SUM(dt.Cantidad * dt.FactorInventario) AS Stock,
        MAX(dt.Fecha) AS UltimoIngreso
    FROM flexline.DocumentoD AS dt
    WHERE dt.Empresa = '001'
      AND dt.Bodega = 'ALM MRO CHILCA'
      AND dt.FactorInventario <> 0
      AND dt.Vigente NOT IN ('A', 'P')
      AND dt.Fecha < DATEADD(DAY, 1, CAST(GETDATE() AS date))
    GROUP BY dt.Empresa, dt.Bodega, dt.Ubicacion, dt.Producto, dt.Lote
) AS s
    ON s.Empresa = p.EMPRESA
   AND s.Producto = p.PRODUCTO
WHERE p.EMPRESA = '001'
  AND p.VALIDASTOCK = 'S'
  AND p.VIGENTE = 'S'
  AND s.Stock <> 0
ORDER BY p.GLOSA;
`;

async function run() {
  try {
    console.log('Connecting to SQL Server...');
    await sql.connect(config);
    console.log('Executing query...');
    const result = await sql.query(query);
    console.log(`Found ${result.recordset.length} records.`);
    
    let sqlOutput = `-- Sincronizacion de Stock Inicial desde Flexline\n\n`;
    sqlOutput += `BEGIN;\n\n`;
    
    // Asumimos que los productos ya existen en maestro y solo queremos crear un INGRESO inicial
    // para fijar el stock de sistema.
    // También creamos el registro base en "inventario" por si no existe.
    
    for (const row of result.recordset) {
      const sku = String(row.PRODUCTO).replace(/'/g, "''");
      const stock = Number(row.Stock_Pro) || 0;
      const ubicacion = String(row.Ubicacion || '').replace(/'/g, "''");
      const lote = String(row.Lote || '').replace(/'/g, "''");
      
      // 1. Asegurar registro base en tabla inventario para que el app lo pueda auditar
      sqlOutput += `INSERT INTO inventario (producto, lote, ubicacion_actual, observacion, cantidad_fisica, bodega_id) 
VALUES ('${sku}', '${lote}', '${ubicacion}', 'PENDIENTE', NULL, 1) 
ON CONFLICT DO NOTHING;\n`;

      // 2. Insertar movimiento de AJUSTE/INGRESO INICIAL
      sqlOutput += `INSERT INTO movimientos (tipo, producto, lote, cantidad, stock_anterior, stock_resultante, motivo, comentario, ubicacion_destino, bodega_id) 
VALUES ('INGRESO', '${sku}', '${lote}', ${stock}, 0, ${stock}, 'CARGA INICIAL FLEXLINE', 'Carga masiva de stock inicial automatizado', '${ubicacion}', 1);\n\n`;
    }
    
    sqlOutput += `COMMIT;\n`;
    
    const outPath = path.join(__dirname, 'sync_stock_flexline.sql');
    fs.writeFileSync(outPath, sqlOutput);
    console.log(`\nGenerated SQL script successfully at: scripts/sync_stock_flexline.sql`);
    console.log(`Please run this script in your Supabase SQL Editor.`);
    
    process.exit(0);
  } catch (err) {
    console.error('Error:', err);
    process.exit(1);
  }
}

run();
