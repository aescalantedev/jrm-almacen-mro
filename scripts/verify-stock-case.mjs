import Database from 'better-sqlite3';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const dbPath = path.join(__dirname, '..', 'data', 'app.db');

const db = new Database(dbPath);

console.log('=== VERIFICACIÓN SKU 604.01.070 ===');

const sku = '604.01.070';
const prod = db.prepare(`
  SELECT pr.sku, pr.glosa, pr.unidad_codigo, pr.contenedor_id, c.nombre as contenedor_nombre,
         b.nombre as bodega_nombre, ta.nombre as almacenamiento_nombre, g.nombre as grupo_nombre
  FROM productos pr
  LEFT JOIN contenedores c ON pr.contenedor_id = c.id
  LEFT JOIN bodegas b ON c.bodega_id = b.id
  LEFT JOIN tipos_almacenamiento ta ON pr.tipo_almacenamiento_id = ta.id
  LEFT JOIN grupos_articulos g ON pr.grupo_articulo_id = g.id
  WHERE pr.sku = ?
`).get(sku);

console.log('Producto info:', prod);

const cache = db.prepare('SELECT stock FROM stock_cache WHERE producto = ?').get(sku);
const inv = db.prepare('SELECT cantidad_fisica, dif, observacion FROM inventario WHERE producto = ?').get(sku);
const movs = db.prepare(`
  SELECT tipo, cantidad, motivo, created_at 
  FROM movimientos 
  WHERE producto = ?
`).all(sku);

console.log('Stock Cache:', cache);
console.log('Inventario row:', inv);
console.log('Movimientos en Kárdex:', movs);

// Dynamic stock calculation
const totalIngresos = movs.filter(m => m.tipo === 'INGRESO').reduce((acc, m) => acc + m.cantidad, 0);
const totalSalidas = movs.filter(m => m.tipo === 'SALIDA').reduce((acc, m) => acc + m.cantidad, 0);
const baseStock = inv?.cantidad_fisica ?? cache?.stock ?? 0;
const stockTeorico = baseStock + totalIngresos - totalSalidas;

console.log(`\nCálculo Consolidado:`);
console.log(`Base (${baseStock}) + Ingresos (${totalIngresos}) - Salidas (${totalSalidas}) = ${stockTeorico} unidades.`);
