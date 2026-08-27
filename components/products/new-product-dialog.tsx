"use client";

import React, { useState } from "react";
import { Plus, Package, Save, Loader2, Building2, Boxes, Layers } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogFooter,
} from "@/components/ui/dialog";
import { Combobox, ComboboxOption } from "@/components/ui/combobox";
import { toast } from "sonner";

interface NewProductDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  onProductCreated: () => void;
  catalogs: {
    bodegas: { id: number; codigo: string; nombre: string }[];
    grupos: ComboboxOption[];
    unidades: ComboboxOption[];
    contenedores: { id: number; bodega_id?: number; nombre: string; codigo_contenedor: string }[];
    tiposAlmacenamiento: ComboboxOption[];
  };
}

export function NewProductDialog({
  open,
  onOpenChange,
  onProductCreated,
  catalogs,
}: NewProductDialogProps) {
  const [saving, setSaving] = useState(false);

  const [form, setForm] = useState({
    sku: "",
    glosa: "",
    unidad_codigo: "UND",
    grupo_articulo_id: "1",
    bodega_id: 1,
    contenedor_id: "1",
    tipo_almacenamiento_id: "1",
    rack: "",
    nivel_rack: "",
    posicion_detalle: "",
    costo_unitario: 0,
    peso_neto: 0,
    stock_seguridad_min: 0,
    tipo_acero: "",
    grado_acero: "",
    espesor_acero: "",
  });

  const filteredContenedores = catalogs.contenedores.filter(
    (c) => !c.bodega_id || c.bodega_id === form.bodega_id
  );

  const contenedorOptions: ComboboxOption[] = filteredContenedores.map((c) => ({
    value: String(c.id),
    label: `${c.codigo_contenedor} - ${c.nombre}`,
  }));

  const handleFieldChange = (field: string, value: any) => {
    setForm((prev) => ({ ...prev, [field]: value }));
  };

  const handleBodegaChange = (newBodegaId: number) => {
    const matchingConts = catalogs.contenedores.filter(
      (c) => !c.bodega_id || c.bodega_id === newBodegaId
    );
    const firstContId = matchingConts.length > 0 ? String(matchingConts[0].id) : "1";
    setForm((prev) => ({
      ...prev,
      bodega_id: newBodegaId,
      contenedor_id: firstContId,
    }));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.sku.trim() || !form.glosa.trim()) {
      toast.error("El SKU y la Descripción son obligatorios");
      return;
    }

    setSaving(true);
    try {
      const res = await fetch("/api/productos", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form),
      });

      const data = await res.json();
      if (res.ok) {
        toast.success(`Producto ${data.sku} registrado exitosamente`);
        onOpenChange(false);
        // Reset form
        setForm({
          sku: "",
          glosa: "",
          unidad_codigo: "UND",
          grupo_articulo_id: "1",
          bodega_id: 1,
          contenedor_id: "1",
          tipo_almacenamiento_id: "1",
          rack: "",
          nivel_rack: "",
          posicion_detalle: "",
          costo_unitario: 0,
          peso_neto: 0,
          stock_seguridad_min: 0,
          tipo_acero: "",
          grado_acero: "",
          espesor_acero: "",
        });
        onProductCreated();
      } else {
        toast.error(data.error || "Error al crear producto");
      }
    } catch {
      toast.error("Error de conexión al servidor");
    } finally {
      setSaving(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto p-6 rounded-2xl">
        <DialogHeader className="pb-3 border-b border-border/50">
          <DialogTitle className="text-lg font-black flex items-center gap-2">
            <Plus className="h-5 w-5 text-primary" />
            Alta de Nuevo Producto (SAP MM)
          </DialogTitle>
          <DialogDescription className="text-xs">
            Ingresa los datos técnicos y de ubicación para registrar un nuevo SKU en el catálogo maestro.
          </DialogDescription>
        </DialogHeader>

        <form onSubmit={handleSubmit} className="space-y-5 pt-2">
          {/* SECCIÓN 1: IDENTIFICACIÓN */}
          <div className="space-y-3 bg-secondary/20 p-4 rounded-xl border border-border/40">
            <div className="flex items-center gap-2 text-xs font-bold text-primary uppercase tracking-wider">
              <Package className="h-4 w-4" />
              1. Identificación & Clasificación
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
              <div>
                <Label className="text-xs font-bold">SKU / Código Material *</Label>
                <Input
                  required
                  placeholder="Ej: 604.01.070"
                  value={form.sku}
                  onChange={(e) => handleFieldChange("sku", e.target.value.toUpperCase())}
                  className="h-9 font-mono font-bold text-xs mt-1 bg-background"
                />
              </div>

              <div className="sm:col-span-2">
                <Label className="text-xs font-bold">Descripción / Glosa (MAKTX) *</Label>
                <Input
                  required
                  placeholder="Ej: RODAMIENTO DE BOLAS 6205-2RS SKF"
                  value={form.glosa}
                  onChange={(e) => handleFieldChange("glosa", e.target.value)}
                  className="h-9 text-xs font-medium mt-1 bg-background"
                />
              </div>
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-1">
              <div>
                <Label className="text-xs font-bold">Grupo de Artículos (MATKL)</Label>
                <Combobox
                  options={catalogs.grupos}
                  value={form.grupo_articulo_id}
                  onChange={(val) => handleFieldChange("grupo_articulo_id", val)}
                  placeholder="Selecciona grupo..."
                  searchPlaceholder="Buscar grupo..."
                  className="h-9 text-xs mt-1 bg-background"
                  allowCustom={false}
                />
              </div>

              <div>
                <Label className="text-xs font-bold">Unidad de Medida (MEINS)</Label>
                <Combobox
                  options={catalogs.unidades}
                  value={form.unidad_codigo}
                  onChange={(val) => handleFieldChange("unidad_codigo", val)}
                  placeholder="Selecciona U.M..."
                  searchPlaceholder="Buscar U.M..."
                  className="h-9 text-xs mt-1 bg-background"
                  allowCustom={false}
                />
              </div>
            </div>
          </div>

          {/* SECCIÓN 2: JERARQUÍA DE ALMACENAMIENTO */}
          <div className="space-y-3 bg-secondary/20 p-4 rounded-xl border border-border/40">
            <div className="flex items-center gap-2 text-xs font-bold text-primary uppercase tracking-wider">
              <Building2 className="h-4 w-4" />
              2. Jerarquía de Almacenamiento (Bodega $\rightarrow$ Contenedor)
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <Label className="text-xs font-bold flex items-center gap-1.5">
                  <Building2 className="h-3.5 w-3.5 text-muted-foreground" />
                  Bodega / Centro (LGORT)
                </Label>
                <select
                  value={form.bodega_id}
                  onChange={(e) => handleBodegaChange(Number(e.target.value))}
                  className="w-full h-9 rounded-md border border-input bg-background px-3 py-1 text-xs font-semibold shadow-xs focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring mt-1"
                >
                  {catalogs.bodegas.map((b) => (
                    <option key={b.id} value={b.id}>
                      {b.codigo} - {b.nombre}
                    </option>
                  ))}
                </select>
              </div>

              <div>
                <Label className="text-xs font-bold flex items-center gap-1.5">
                  <Boxes className="h-3.5 w-3.5 text-muted-foreground" />
                  Contenedor / Zona (LGTYP)
                </Label>
                <Combobox
                  options={contenedorOptions}
                  value={form.contenedor_id}
                  onChange={(val) => handleFieldChange("contenedor_id", val)}
                  placeholder="Selecciona contenedor..."
                  searchPlaceholder="Buscar contenedor..."
                  className="h-9 text-xs mt-1 bg-background"
                  allowCustom={false}
                />
              </div>
            </div>

            <div className="pt-1">
              <Label className="text-xs font-bold flex items-center gap-1.5">
                <Layers className="h-3.5 w-3.5 text-muted-foreground" />
                Formato de Almacenamiento / Estiba (LETYP)
              </Label>
              <Combobox
                options={catalogs.tiposAlmacenamiento}
                value={form.tipo_almacenamiento_id}
                onChange={(val) => handleFieldChange("tipo_almacenamiento_id", val)}
                placeholder="Selecciona formato..."
                searchPlaceholder="Buscar formato de estiba..."
                className="h-9 text-xs mt-1 bg-background"
                allowCustom={false}
              />
            </div>

            <div className="grid grid-cols-3 gap-3 pt-1">
              <div>
                <Label className="text-xs font-bold">Rack / Estante</Label>
                <Input
                  placeholder="Ej: RACK 02"
                  value={form.rack}
                  onChange={(e) => handleFieldChange("rack", e.target.value)}
                  className="h-9 font-mono text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Nivel</Label>
                <Input
                  placeholder="Ej: NIVEL 3"
                  value={form.nivel_rack}
                  onChange={(e) => handleFieldChange("nivel_rack", e.target.value)}
                  className="h-9 font-mono text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Posición / Gaveta</Label>
                <Input
                  placeholder="Ej: GAVETA 14"
                  value={form.posicion_detalle}
                  onChange={(e) => handleFieldChange("posicion_detalle", e.target.value)}
                  className="h-9 font-mono text-xs mt-1 bg-background uppercase"
                />
              </div>
            </div>
          </div>

          {/* SECCIÓN 3: VALORIZACIÓN Y FICHA TÉCNICA */}
          <div className="space-y-3 bg-secondary/20 p-4 rounded-xl border border-border/40">
            <div className="flex items-center gap-2 text-xs font-bold text-primary uppercase tracking-wider">
              3. Valorización & Ficha Técnica
            </div>

            <div className="grid grid-cols-3 gap-3">
              <div>
                <Label className="text-xs font-bold">Costo Unitario (S/.)</Label>
                <Input
                  type="number"
                  step="0.01"
                  placeholder="0.00"
                  value={form.costo_unitario}
                  onChange={(e) => handleFieldChange("costo_unitario", Number(e.target.value))}
                  className="h-9 font-mono font-bold text-xs mt-1 bg-background"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Peso Neto (KG)</Label>
                <Input
                  type="number"
                  step="0.01"
                  placeholder="0.00"
                  value={form.peso_neto}
                  onChange={(e) => handleFieldChange("peso_neto", Number(e.target.value))}
                  className="h-9 font-mono text-xs mt-1 bg-background"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Stock Mínimo (Seguridad)</Label>
                <Input
                  type="number"
                  placeholder="0"
                  value={form.stock_seguridad_min}
                  onChange={(e) => handleFieldChange("stock_seguridad_min", Number(e.target.value))}
                  className="h-9 font-mono text-xs mt-1 bg-background"
                />
              </div>
            </div>

            <div className="grid grid-cols-3 gap-3 pt-1">
              <div>
                <Label className="text-xs font-bold">Tipo Acero</Label>
                <Input
                  placeholder="Ej: INOX, SAE"
                  value={form.tipo_acero}
                  onChange={(e) => handleFieldChange("tipo_acero", e.target.value)}
                  className="h-9 text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Grado Acero</Label>
                <Input
                  placeholder="Ej: 304, 316, 1045"
                  value={form.grado_acero}
                  onChange={(e) => handleFieldChange("grado_acero", e.target.value)}
                  className="h-9 text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Espesor Acero</Label>
                <Input
                  placeholder="Ej: 1/4 pulg"
                  value={form.espesor_acero}
                  onChange={(e) => handleFieldChange("espesor_acero", e.target.value)}
                  className="h-9 text-xs mt-1 bg-background"
                />
              </div>
            </div>
          </div>

          <DialogFooter className="pt-2 gap-2">
            <Button
              type="button"
              variant="outline"
              onClick={() => onOpenChange(false)}
              className="h-10 text-xs font-bold rounded-xl"
            >
              Cancelar
            </Button>
            <Button
              type="submit"
              disabled={saving}
              className="h-10 text-xs font-bold gap-1.5 rounded-xl px-6"
            >
              {saving ? (
                <>
                  <Loader2 className="h-4 w-4 animate-spin" />
                  Guardando...
                </>
              ) : (
                <>
                  <Save className="h-4 w-4" />
                  Crear Producto
                </>
              )}
            </Button>
          </DialogFooter>
        </form>
      </DialogContent>
    </Dialog>
  );
}
