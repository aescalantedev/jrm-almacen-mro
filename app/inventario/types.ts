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
  cantidad_fisica: number;
  um: string;
  presentacion: string;
  n_cajas_bultos: string;
  largo: number;
  ancho: number;
  alto: number;
  peso_aprox_unitario: number;
  observacion: string;
  comentario: string;
  rack: string;
  ubicacion_actual: string;
  almacenamiento: string;
  contenedor: string;
  foto_path?: string;
}
