export type TipoMovimiento = 'INGRESO' | 'SALIDA' | 'AJUSTE';

export interface MovimientoItem {
  id: number;
  tipo: TipoMovimiento;
  producto: string;
  lote: string;
  cantidad: number;
  stock_anterior: number;
  stock_resultante: number;
  motivo: string;
  documento_referencia?: string;
  solicitante?: string;
  ubicacion_origen?: string;
  ubicacion_destino?: string;
  rack?: string;
  foto_path?: string;
  comentario?: string;
  usuario_id: number;
  created_at: string;
  descripcion?: string;
  unidad?: string;
  familia?: string;
  usuario_nombre?: string;
}

export interface MovimientoFormState {
  tipo: TipoMovimiento;
  producto: string;
  lote: string;
  descripcion: string;
  unidad: string;
  stock_actual_disponible: number;
  cantidad: number | string;
  motivo: string;
  documento_referencia: string;
  solicitante: string;
  ubicacion_destino: string;
  rack: string;
  foto_path?: string;
  comentario: string;
}

export interface MovimientosStats {
  ingresos_count: number;
  salidas_count: number;
  total_unidades_ingresadas: number;
  total_unidades_salidas: number;
}

export interface MovimientosFilter {
  q: string;
  tipo: string;
  motivo: string;
  desde: string;
  hasta: string;
  page: number;
  limit: number;
}
