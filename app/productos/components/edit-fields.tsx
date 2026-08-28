import { useMemo } from "react";
import { Input } from "@/components/ui/input";
import { Combobox, ComboboxOption } from "@/components/ui/combobox";
import { Building2, Boxes } from "lucide-react";
import { MasterProduct } from "@/components/products/product-detail-sheet";
import { MasterCatalogOptions } from "../types";

export function EditFields({
  form,
  onChange,
  catalogs,
}: {
  form: Partial<MasterProduct>;
  onChange: (field: string, value: string | number) => void;
  catalogs: MasterCatalogOptions;
}) {
  // Encontrar la bodega activa a partir del contenedor o de form.bodega_id
  const selectedBodegaId = useMemo(() => {
    if (form.bodega_id) return Number(form.bodega_id);
    if (form.contenedor_id) {
      const cont = catalogs.contenedores.find((c) => c.id === Number(form.contenedor_id));
      if (cont?.bodega_id) return cont.bodega_id;
    }
    return catalogs.bodegas[0]?.id || 1;
  }, [form.bodega_id, form.contenedor_id, catalogs.contenedores, catalogs.bodegas]);

  // Filtrar contenedores pertenecientes a la bodega seleccionada
  const filteredContenedoresOptions: ComboboxOption[] = useMemo(() => {
    return catalogs.contenedores
      .filter((c) => !c.bodega_id || c.bodega_id === selectedBodegaId)
      .map((c) => ({
        value: String(c.id),
        label: `${c.codigo_contenedor} - ${c.nombre}`,
      }));
  }, [catalogs.contenedores, selectedBodegaId]);

  return (
    <div className="space-y-4 text-xs">
      {/* 1. DATOS GENERALES Y CLASIFICACIÓN SAP MM */}
      <div className="p-3.5 rounded-xl bg-secondary/15 border border-border/50 space-y-3">
        <div className="font-bold text-[11px] uppercase tracking-wider text-primary">
          1. Identificación & Clasificación SAP MM
        </div>

        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-bold">
            Descripción / Glosa (MAKTX)
          </label>
          <Input
            value={form.glosa || ""}
            onChange={(e) => onChange("glosa", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1 font-semibold"
          />
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">
              Grupo de Artículos (MATKL)
            </label>
            <div className="mt-1">
              <Combobox
                options={catalogs.grupos}
                value={form.grupo_articulo_id ? String(form.grupo_articulo_id) : ""}
                onChange={(val) => {
                  const num = parseInt(val, 10);
                  onChange("grupo_articulo_id", isNaN(num) ? 1 : num);
                  const found = catalogs.grupos.find((g) => g.value === val);
                  if (found) onChange("familia", found.label);
                }}
                placeholder="Seleccionar Grupo..."
                className="h-9 text-xs"
              />
            </div>
          </div>

          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">
              Unidad de Medida (MEINS)
            </label>
            <div className="mt-1">
              <Combobox
                options={catalogs.unidades}
                value={form.unidad || "UND"}
                onChange={(val) => onChange("unidad", val.toUpperCase())}
                placeholder="Seleccionar Unidad..."
                className="h-9 text-xs"
              />
            </div>
          </div>
        </div>
      </div>

      {/* 2. JERARQUÍA DE ALMACENAMIENTO: BODEGA -> CONTENEDOR -> RACK -> POSICIÓN */}
      <div className="p-3.5 rounded-xl bg-secondary/15 border border-border/50 space-y-3">
        <div className="font-bold text-[11px] uppercase tracking-wider text-primary">
          2. Jerarquía de Almacenamiento (Bodega ➔ Contenedor ➔ Ubicación)
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
          {/* PASO 1: BODEGA */}
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold flex items-center gap-1">
              <Building2 className="h-3 w-3 text-primary" /> Bodega / Centro (LGORT)
            </label>
            <select
              value={selectedBodegaId}
              onChange={(e) => {
                const newBodegaId = parseInt(e.target.value, 10);
                onChange("bodega_id", newBodegaId);
                // Si el contenedor actual no pertenece a la nueva bodega, seleccionar el primero disponible
                const matchingCont = catalogs.contenedores.find((c) => c.bodega_id === newBodegaId);
                if (matchingCont) {
                  onChange("contenedor_id", matchingCont.id);
                  onChange("contenedor_nombre", matchingCont.nombre);
                }
              }}
              className="w-full h-9 px-3 mt-1 rounded-lg border border-border bg-background text-xs font-semibold focus:outline-none focus:ring-1 focus:ring-primary"
            >
              {catalogs.bodegas.map((b) => (
                <option key={b.id} value={b.id}>
                  {b.nombre}
                </option>
              ))}
            </select>
          </div>

          {/* PASO 2: CONTENEDOR / ZONA */}
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold flex items-center gap-1">
              <Boxes className="h-3 w-3 text-primary" /> Contenedor / Zona (LGTYP)
            </label>
            <div className="mt-1">
              <Combobox
                options={filteredContenedoresOptions}
                value={form.contenedor_id ? String(form.contenedor_id) : ""}
                onChange={(val) => {
                  const contId = parseInt(val, 10) || 1;
                  onChange("contenedor_id", contId);
                  const found = catalogs.contenedores.find((c) => c.id === contId);
                  if (found) {
                    onChange("contenedor_nombre", found.nombre);
                    if (found.bodega_id) onChange("bodega_id", found.bodega_id);
                  }
                }}
                placeholder="Seleccionar Contenedor..."
                className="h-9 text-xs"
              />
            </div>
          </div>
        </div>

        {/* PASO 3: TIPO DE ALMACENAMIENTO */}
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-bold">
            Formato de Almacenamiento / Estiba (LETYP)
          </label>
          <div className="mt-1">
            <Combobox
              options={catalogs.tiposAlmacenamiento}
              value={form.tipo_almacenamiento_id ? String(form.tipo_almacenamiento_id) : "1"}
              onChange={(val) => onChange("tipo_almacenamiento_id", parseInt(val, 10) || 1)}
              placeholder="Tipo de Almacenamiento..."
              className="h-9 text-xs"
            />
          </div>
        </div>

        {/* PASO 4: RACK, NIVEL Y POSICIÓN DETALLE */}
        <div className="grid grid-cols-3 gap-2 pt-1">
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">Rack / Estante</label>
            <Input
              value={form.rack || ""}
              onChange={(e) => onChange("rack", e.target.value.toUpperCase())}
              placeholder="RACK 01"
              className="h-9 text-xs rounded-lg mt-1 font-semibold"
            />
          </div>
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">Nivel</label>
            <Input
              value={form.nivel_rack || ""}
              onChange={(e) => onChange("nivel_rack", e.target.value.toUpperCase())}
              placeholder="NIVEL 2"
              className="h-9 text-xs rounded-lg mt-1 font-semibold"
            />
          </div>
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">Posición / Gaveta</label>
            <Input
              value={form.posicion_detalle || ""}
              onChange={(e) => onChange("posicion_detalle", e.target.value.toUpperCase())}
              placeholder="GAVETA 14"
              className="h-9 text-xs rounded-lg mt-1 font-semibold"
            />
          </div>
        </div>
      </div>

      {/* 3. COSTOS, DIMENSIONES & METALMECÁNICA */}
      <div className="p-3.5 rounded-xl bg-secondary/15 border border-border/50 space-y-3">
        <div className="font-bold text-[11px] uppercase tracking-wider text-primary">
          3. Valorización & Ficha Metalmecánica
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">
              Costo Unitario (S/.)
            </label>
            <Input
              type="number"
              step="0.01"
              value={form.costo_unitario ?? ""}
              onChange={(e) => onChange("costo_unitario", parseFloat(e.target.value) || 0)}
              className="h-9 text-xs rounded-lg mt-1 font-mono font-bold"
            />
          </div>
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">
              Peso Neto (kg)
            </label>
            <Input
              type="number"
              step="0.01"
              value={form.peso ?? ""}
              onChange={(e) => onChange("peso", parseFloat(e.target.value) || 0)}
              className="h-9 text-xs rounded-lg mt-1 font-mono font-semibold"
            />
          </div>
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">
              Stock Mínimo (Seguridad)
            </label>
            <Input
              type="number"
              step="1"
              value={form.stock_seguridad_min ?? ""}
              onChange={(e) => onChange("stock_seguridad_min", parseFloat(e.target.value) || 0)}
              className="h-9 text-xs rounded-lg mt-1 font-mono"
            />
          </div>
        </div>

        <div className="grid grid-cols-3 gap-2">
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">Tipo Acero</label>
            <Input
              value={form.tipo_acero || ""}
              onChange={(e) => onChange("tipo_acero", e.target.value)}
              className="h-9 text-xs rounded-lg mt-1"
            />
          </div>
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">Grado Acero</label>
            <Input
              value={form.grado_acero || ""}
              onChange={(e) => onChange("grado_acero", e.target.value)}
              className="h-9 text-xs rounded-lg mt-1"
            />
          </div>
          <div>
            <label className="text-[10px] text-muted-foreground uppercase font-bold">Espesor Acero</label>
            <Input
              value={form.espesor_acero || ""}
              onChange={(e) => onChange("espesor_acero", e.target.value)}
              className="h-9 text-xs rounded-lg mt-1"
            />
          </div>
        </div>
      </div>
    </div>
  );
}