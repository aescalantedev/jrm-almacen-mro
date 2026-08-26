export interface StockItem {
  id: number;
  producto: string;
  lote: string;
  glosa: string;
  unidad: string;
  stock: number;
  familia: string;
  peso: number;
  ubicacion?: string;
  inventario_id?: number;
  cantidad_fisica?: number;
  dif?: number;
  inventario_um?: string;
  presentacion?: string;
  n_cajas_bultos?: string;
  largo?: number;
  ancho?: number;
  alto?: number;
  peso_total_cant_fisica?: number;
  inventario_observacion?: string;
  comentario?: string;
  rack?: string;
  ubicacion_actual?: string;
  almacenamiento?: string;
  contenedor?: string;
  responsable?: string;
  fecha_conteo?: string;
  familia2?: string;
  foto_path?: string;
  usuario_id?: number;
  inventario_updated_at?: string;
  ya_contado?: number;
  total_ingresos?: number;
  total_salidas?: number;
  stock_disponible?: number;
}

export interface InventarioItem {
  id: number;
  producto: string;
  lote: string;
  descripcion: string;
  stock_sistema: number;
  unidad: string;
  familia: string;
  familia2: string;
  cantidad_fisica: number;
  dif: number;
  um: string;
  presentacion: string;
  n_cajas_bultos: string;
  largo: number;
  ancho: number;
  alto: number;
  peso_aprox_unitario: number;
  peso_total_cant_fisica: number;
  observacion: string;
  comentario: string;
  rack: string;
  ubicacion_actual: string;
  almacenamiento: string;
  contenedor: string;
  responsable: string;
  fecha_conteo: string;
  costo_unitario: number;
  total_costo: number;
  s_dif: number;
  rotacion: string;
  linea: string;
  prioridad: string;
  usuario_nombre: string;
  updated_at: string;
  foto_path?: string;
}

export interface User {
  id: number;
  nombre: string;
  usuario?: string;
  rol?: string;
}

export interface ConteoForm {
  producto: string;
  lote: string;
  descripcion: string;
  stock_sistema: number;
  unidad: string;
  familia: string;
  familia2: string;
  cantidad_fisica: number | string;
  um: string;
  presentacion: string;
  n_cajas_bultos: string;
  largo: number | string;
  ancho: number | string;
  alto: number | string;
  peso_aprox_unitario: number | string;
  observacion: string;
  comentario: string;
  rack: string;
  ubicacion_actual: string;
  almacenamiento: string;
  contenedor: string;
  foto_path?: string;
}
