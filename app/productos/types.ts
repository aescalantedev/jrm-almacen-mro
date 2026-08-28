import { ComboboxOption } from "@/components/ui/combobox";

export const PAGE_SIZE = 50;

export interface BodegaOption {
  id: number;
  codigo: string;
  nombre: string;
}

export interface ContenedorOption {
  id: number;
  bodega_id?: number;
  codigo_contenedor: string;
  nombre: string;
}

export interface MasterCatalogOptions {
  bodegas: BodegaOption[];
  grupos: ComboboxOption[];
  unidades: ComboboxOption[];
  contenedores: ContenedorOption[];
  tiposAlmacenamiento: ComboboxOption[];
}
