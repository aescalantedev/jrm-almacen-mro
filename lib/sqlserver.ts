import { ConnectionPool, config as SqlConfig } from 'mssql';

const dbConfig: SqlConfig = {
  user: process.env.SQL_SERVER_USER || 'flexline',
  password: process.env.SQL_SERVER_PASSWORD || 'f13x11n3',
  server: process.env.SQL_SERVER_HOST || 'DATAFLEX\\FLEXLINE',
  database: process.env.SQL_SERVER_DATABASE || 'BDFlexline',
  options: {
    encrypt: false,
    trustServerCertificate: true,
    enableArithAbort: true,
  },
  connectionTimeout: 15000,
  requestTimeout: 30000,
};

let _pool: ConnectionPool | null = null;

async function getPool(): Promise<ConnectionPool> {
  if (!_pool || !_pool.connected) {
    _pool = await new ConnectionPool(dbConfig).connect();
  }
  return _pool;
}

export async function fetchStockFromSQLServer() {
  const pool = await getPool();
  const result = await pool.request().query(`
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
  `);
  return result.recordset;
}

export async function testConnection(): Promise<boolean> {
  try {
    const pool = await getPool();
    await pool.request().query('SELECT 1');
    return true;
  } catch {
    return false;
  }
}
