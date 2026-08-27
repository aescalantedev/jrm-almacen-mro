"use client";

import React, { useState, useEffect } from "react";
import {
  Save,
  Loader2,
  Check,
  Building2,
  Boxes,
  Layers,
  ChevronRight,
  ChevronLeft,
  X,
  Package,
  Sparkles,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
} from "@/components/ui/dialog";
import { Combobox, ComboboxOption } from "@/components/ui/combobox";
import { MasterProduct } from "./product-detail-sheet";
import { toast } from "sonner";

interface MultiProductEditSheetProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  products: MasterProduct[];
  onSaved: () => void;
  catalogs: {
    bodegas: { id: number; codigo: string; nombre: string }[];
    grupos: ComboboxOption[];
    unidades: ComboboxOption[];
    contenedores: { id: number; bodega_id?: number; nombre: string; codigo_contenedor: string }[];
    tiposAlmacenamiento: ComboboxOption[];
  };
}

export function MultiProductEditSheet({
  open,
  onOpenChange,
  products,
  onSaved,
  catalogs,
}: MultiProductEditSheetProps) {
  const [activeIndex, setActiveIndex] = useState(0);
  const [formsState, setFormsState] = useState<Record<string, Partial<MasterProduct>>>({});
  const [savingItem, setSavingItem] = useState<string | null>(null);
  const [savingAll, setSavingAll] = useState(false);
  const [savedSkus, setSavedSkus] = useState<Set<string>>(new Set());

  useEffect(() => {
    if (products.length > 0) {
      const initialForms: Record<string, Partial<MasterProduct>> = {};
      products.forEach((p) => {
        initialForms[p.producto] = { ...p };
      });
      setFormsState(initialForms);
      setActiveIndex(0);
      setSavedSkus(new Set());
    }
  }, [products]);

  if (products.length === 0) return null;

  const currentProduct = products[activeIndex] || products[0];
  const currentForm = formsState[currentProduct.producto] || currentProduct;

  const handleFieldChange = (field: string, value: any) => {
    setFormsState((prev) => ({
      ...prev,
      [currentProduct.producto]: {
        ...prev[currentProduct.producto],
        [field]: value,
      },
    }));
  };

  const handleBodegaChange = (newBodegaId: number) => {
    const matchingConts = catalogs.contenedores.filter(
      (c) => !c.bodega_id || c.bodega_id === newBodegaId
    );
    const firstContId = matchingConts.length > 0 ? Number(matchingConts[0].id) : 1;
    setFormsState((prev) => ({
      ...prev,
      [currentProduct.producto]: {
        ...prev[currentProduct.producto],
        bodega_id: newBodegaId,
        contenedor_id: firstContId,
      },
    }));
  };

  const filteredContenedores = catalogs.contenedores.filter(
    (c) => !c.bodega_id || c.bodega_id === (currentForm.bodega_id || 1)
  );

  const contenedorOptions: ComboboxOption[] = filteredContenedores.map((c) => ({
    value: String(c.id),
    label: `${c.codigo_contenedor} - ${c.nombre}`,
  }));

  const saveSingleProduct = async (sku: string, advanceNext = false) => {
    const formData = formsState[sku];
    if (!formData) return;

    setSavingItem(sku);
    try {
      const res = await fetch("/api/productos", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ producto: sku, ...formData }),
      });

      if (res.ok) {
        toast.success(`Producto ${sku} guardado correctamente`);
        setSavedSkus((prev) => new Set(prev).add(sku));
        if (advanceNext && activeIndex < products.length - 1) {
          setActiveIndex((prev) => prev + 1);
        }
      } else {
        const data = await res.json();
        toast.error(data.error || `Error al guardar ${sku}`);
      }
    } catch {
      toast.error(`Error de conexión al guardar ${sku}`);
    } finally {
      setSavingItem(null);
    }
  };

  const saveAllProducts = async () => {
    setSavingAll(true);
    let successCount = 0;
    try {
      for (const p of products) {
        const formData = formsState[p.producto] || p;
        const res = await fetch("/api/productos", {
          method: "PUT",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ producto: p.producto, ...formData }),
        });
        if (res.ok) {
          successCount++;
          setSavedSkus((prev) => new Set(prev).add(p.producto));
        }
      }
      toast.success(`${successCount} de ${products.length} productos guardados exitosamente`);
      onSaved();
      onOpenChange(false);
    } catch {
      toast.error("Error al guardar productos");
    } finally {
      setSavingAll(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-4xl max-h-[92vh] flex flex-col p-0 rounded-2xl overflow-hidden">
        {/* HEADER */}
        <DialogHeader className="p-4 sm:p-5 border-b border-border/50 bg-secondary/15">
          <div className="flex items-center justify-between">
            <div className="space-y-0.5">
              <DialogTitle className="text-base sm:text-lg font-black flex items-center gap-2">
                <Package className="h-5 w-5 text-primary" />
                Edición de Datos Maestros ({products.length} {products.length === 1 ? "Item" : "Items"})
              </DialogTitle>
              <DialogDescription className="text-xs">
                Modifica los datos maestros de los productos seleccionados y guarda individual o masivamente.
              </DialogDescription>
            </div>

            <Button
              type="button"
              size="sm"
              onClick={saveAllProducts}
              disabled={savingAll}
              className="h-9 text-xs font-bold gap-1.5 rounded-xl px-4 shrink-0 shadow-xs"
            >
              {savingAll ? (
                <>
                  <Loader2 className="h-3.5 w-3.5 animate-spin" />
                  Guardando Todos...
                </>
              ) : (
                <>
                  <Sparkles className="h-3.5 w-3.5" />
                  Guardar Todos ({products.length})
                </>
              )}
            </Button>
          </div>

          {/* TABS DE PRODUCTOS SELECCIONADOS */}
          {products.length > 1 && (
            <div className="flex items-center gap-1.5 overflow-x-auto pt-3 pb-1 scrollbar-thin">
              {products.map((p, idx) => {
                const isSelected = idx === activeIndex;
                const isSaved = savedSkus.has(p.producto);
                return (
                  <button
                    key={p.producto}
                    type="button"
                    onClick={() => setActiveIndex(idx)}
                    className={`flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-mono font-bold whitespace-nowrap transition-all border shrink-0 ${
                      isSelected
                        ? "bg-primary text-primary-foreground border-primary shadow-xs"
                        : "bg-background text-muted-foreground border-border/60 hover:bg-secondary/40 hover:text-foreground"
                    }`}
                  >
                    {isSaved && <Check className="h-3 w-3 text-emerald-400" />}
                    <span>{p.producto}</span>
                    <span className="text-[9px] font-normal opacity-70">
                      ({idx + 1}/{products.length})
                    </span>
                  </button>
                );
              })}
            </div>
          )}
        </DialogHeader>

        {/* CONTENIDO DEL FORMULARIO ACTIVO */}
        <div className="flex-1 overflow-y-auto p-4 sm:p-6 space-y-4">
          {/* BANNER DEL SKU ACTUAL */}
          <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-2 p-3 bg-secondary/30 rounded-xl border border-border/50">
            <div>
              <div className="flex items-center gap-2">
                <span className="font-mono text-sm font-black text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                  {currentProduct.producto}
                </span>
                {savedSkus.has(currentProduct.producto) && (
                  <Badge variant="outline" className="text-[10px] text-emerald-600 dark:text-emerald-400 border-emerald-500/30 gap-1">
                    <Check className="h-3 w-3" /> Guardado
                  </Badge>
                )}
              </div>
              <p className="text-xs font-bold text-foreground mt-1 line-clamp-1">
                {currentForm.glosa || currentProduct.glosa}
              </p>
            </div>

            <div className="flex items-center gap-1.5 self-end sm:self-auto">
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={activeIndex === 0}
                onClick={() => setActiveIndex((prev) => Math.max(0, prev - 1))}
                className="h-8 px-2.5 text-xs rounded-lg gap-1"
              >
                <ChevronLeft className="h-3.5 w-3.5" /> Anterior
              </Button>
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={activeIndex === products.length - 1}
                onClick={() => setActiveIndex((prev) => Math.min(products.length - 1, prev + 1))}
                className="h-8 px-2.5 text-xs rounded-lg gap-1"
              >
                Siguiente <ChevronRight className="h-3.5 w-3.5" />
              </Button>
            </div>
          </div>

          {/* SECCIÓN 1: IDENTIFICACIÓN */}
          <div className="space-y-3 bg-secondary/15 p-4 rounded-xl border border-border/40">
            <div className="text-xs font-bold text-primary uppercase tracking-wider">
              1. Identificación & Clasificación SAP MM
            </div>

            <div>
              <Label className="text-xs font-bold">Descripción / Glosa (MAKTX)</Label>
              <Input
                value={currentForm.glosa ?? ""}
                onChange={(e) => handleFieldChange("glosa", e.target.value)}
                className="h-9 text-xs font-medium mt-1 bg-background"
              />
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <Label className="text-xs font-bold">Grupo de Artículos (MATKL)</Label>
                <Combobox
                  options={catalogs.grupos}
                  value={String(currentForm.grupo_articulo_id || 1)}
                  onChange={(val) => handleFieldChange("grupo_articulo_id", Number(val))}
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
                  value={String(currentForm.unidad || "UND")}
                  onChange={(val) => handleFieldChange("unidad", val)}
                  placeholder="Selecciona U.M..."
                  searchPlaceholder="Buscar U.M..."
                  className="h-9 text-xs mt-1 bg-background"
                  allowCustom={false}
                />
              </div>
            </div>
          </div>

          {/* SECCIÓN 2: JERARQUÍA */}
          <div className="space-y-3 bg-secondary/15 p-4 rounded-xl border border-border/40">
            <div className="text-xs font-bold text-primary uppercase tracking-wider">
              2. Jerarquía de Almacenamiento (Bodega $\rightarrow$ Contenedor $\rightarrow$ Ubicación)
            </div>

            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <Label className="text-xs font-bold flex items-center gap-1.5">
                  <Building2 className="h-3.5 w-3.5 text-muted-foreground" />
                  Bodega / Centro (LGORT)
                </Label>
                <select
                  value={currentForm.bodega_id || 1}
                  onChange={(e) => handleBodegaChange(Number(e.target.value))}
                  className="w-full h-9 rounded-md border border-input bg-background px-3 py-1 text-xs font-semibold shadow-xs focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring mt-1"
                >
                  {catalogs.bodegas.map((b) => (
                    <option key={b.id} value={b.id}>
                      {b.nombre}
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
                  value={String(currentForm.contenedor_id || 1)}
                  onChange={(val) => handleFieldChange("contenedor_id", Number(val))}
                  placeholder="Selecciona contenedor..."
                  searchPlaceholder="Buscar contenedor..."
                  className="h-9 text-xs mt-1 bg-background"
                  allowCustom={false}
                />
              </div>
            </div>

            <div>
              <Label className="text-xs font-bold flex items-center gap-1.5">
                <Layers className="h-3.5 w-3.5 text-muted-foreground" />
                Formato de Almacenamiento / Estiba (LETYP)
              </Label>
              <Combobox
                options={catalogs.tiposAlmacenamiento}
                value={String(currentForm.tipo_almacenamiento_id || 1)}
                onChange={(val) => handleFieldChange("tipo_almacenamiento_id", Number(val))}
                placeholder="Selecciona formato..."
                searchPlaceholder="Buscar formato de estiba..."
                className="h-9 text-xs mt-1 bg-background"
                allowCustom={false}
              />
            </div>

            <div className="grid grid-cols-3 gap-3">
              <div>
                <Label className="text-xs font-bold">Rack / Estante</Label>
                <Input
                  value={currentForm.rack ?? ""}
                  onChange={(e) => handleFieldChange("rack", e.target.value)}
                  className="h-9 font-mono text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Nivel</Label>
                <Input
                  value={currentForm.nivel_rack ?? ""}
                  onChange={(e) => handleFieldChange("nivel_rack", e.target.value)}
                  className="h-9 font-mono text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Posición / Gaveta</Label>
                <Input
                  value={currentForm.posicion_detalle ?? ""}
                  onChange={(e) => handleFieldChange("posicion_detalle", e.target.value)}
                  className="h-9 font-mono text-xs mt-1 bg-background uppercase"
                />
              </div>
            </div>
          </div>

          {/* SECCIÓN 3: VALORIZACIÓN Y METALES */}
          <div className="space-y-3 bg-secondary/15 p-4 rounded-xl border border-border/40">
            <div className="text-xs font-bold text-primary uppercase tracking-wider">
              3. Valorización & Ficha Metalmecánica
            </div>

            <div className="grid grid-cols-3 gap-3">
              <div>
                <Label className="text-xs font-bold">Costo Unitario (S/.)</Label>
                <Input
                  type="number"
                  step="0.01"
                  value={currentForm.costo_unitario ?? 0}
                  onChange={(e) => handleFieldChange("costo_unitario", Number(e.target.value))}
                  className="h-9 font-mono font-bold text-xs mt-1 bg-background"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Peso Neto (KG)</Label>
                <Input
                  type="number"
                  step="0.01"
                  value={currentForm.peso ?? 0}
                  onChange={(e) => handleFieldChange("peso", Number(e.target.value))}
                  className="h-9 font-mono text-xs mt-1 bg-background"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Stock Mínimo</Label>
                <Input
                  type="number"
                  value={currentForm.stock_seguridad_min ?? 0}
                  onChange={(e) => handleFieldChange("stock_seguridad_min", Number(e.target.value))}
                  className="h-9 font-mono text-xs mt-1 bg-background"
                />
              </div>
            </div>

            <div className="grid grid-cols-3 gap-3">
              <div>
                <Label className="text-xs font-bold">Tipo Acero</Label>
                <Input
                  value={currentForm.tipo_acero ?? ""}
                  onChange={(e) => handleFieldChange("tipo_acero", e.target.value)}
                  className="h-9 text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Grado Acero</Label>
                <Input
                  value={currentForm.grado_acero ?? ""}
                  onChange={(e) => handleFieldChange("grado_acero", e.target.value)}
                  className="h-9 text-xs mt-1 bg-background uppercase"
                />
              </div>
              <div>
                <Label className="text-xs font-bold">Espesor Acero</Label>
                <Input
                  value={currentForm.espesor_acero ?? ""}
                  onChange={(e) => handleFieldChange("espesor_acero", e.target.value)}
                  className="h-9 text-xs mt-1 bg-background"
                />
              </div>
            </div>
          </div>
        </div>

        {/* FOOTER */}
        <div className="p-4 border-t border-border/50 bg-secondary/15 flex flex-col sm:flex-row items-center justify-between gap-3">
          <Button
            type="button"
            variant="outline"
            onClick={() => onOpenChange(false)}
            className="h-10 text-xs font-bold rounded-xl w-full sm:w-auto"
          >
            Cerrar
          </Button>

          <div className="flex items-center gap-2 w-full sm:w-auto">
            <Button
              type="button"
              variant="secondary"
              onClick={() => saveSingleProduct(currentProduct.producto, false)}
              disabled={savingItem === currentProduct.producto}
              className="h-10 text-xs font-bold gap-1.5 rounded-xl flex-1 sm:flex-initial"
            >
              {savingItem === currentProduct.producto ? (
                <Loader2 className="h-3.5 w-3.5 animate-spin" />
              ) : (
                <Save className="h-3.5 w-3.5" />
              )}
              Guardar este SKU
            </Button>

            {activeIndex < products.length - 1 && (
              <Button
                type="button"
                onClick={() => saveSingleProduct(currentProduct.producto, true)}
                disabled={savingItem === currentProduct.producto}
                className="h-10 text-xs font-bold gap-1.5 rounded-xl flex-1 sm:flex-initial"
              >
                Guardar y Siguiente
                <ChevronRight className="h-3.5 w-3.5" />
              </Button>
            )}
          </div>
        </div>
      </DialogContent>
    </Dialog>
  );
}
