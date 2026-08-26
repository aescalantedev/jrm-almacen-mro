import type { MovimientoFormState } from "./types";

export const MOTIVOS_INGRESO = [
  "COMPRA / RECEPCION PROVEEDOR",
  "DEVOLUCION DE OBRA / TALLER",
  "TRASLADO ENTRE BODEGAS (ENTRADA)",
  "SOBRANTE DE CONTEO / HALLAZGO",
  "DONACION / INGRESO EXTRAORDINARIO",
  "OTRO INGRESO",
];

export const MOTIVOS_SALIDA = [
  "DESPACHO A MANTENIMIENTO / OT",
  "CONSUMO EN OPERACION / PLANTA",
  "MERMA / BAJA / DETERIORO",
  "DEVOLUCION A PROVEEDOR",
  "TRASLADO ENTRE BODEGAS (SALIDA)",
  "PRESTAMO DE HERRAMIENTA",
  "OTRO DESPACHO",
];

export const MOTIVOS_AJUSTE = [
  "AJUSTE POR RE-CONTEO",
  "CORRECCION ADMINISTRATIVA",
  "AUDITORIA",
];

export function getDefaultMovimientoForm(): MovimientoFormState {
  return {
    tipo: "SALIDA",
    producto: "",
    lote: "",
    descripcion: "",
    unidad: "UND",
    stock_actual_disponible: 0,
    cantidad: 1,
    motivo: "DESPACHO A MANTENIMIENTO / OT",
    documento_referencia: "",
    solicitante: "",
    ubicacion_destino: "",
    rack: "",
    foto_path: undefined,
    comentario: "",
  };
}
