"use client";

import React, { useState, useRef, useCallback } from "react";
import {
  ArrowDownCircle,
  Barcode,
  Search,
  X,
  Loader2,
  Package,
  Plus,
  Minus,
  Camera,
  Save,
  CheckCircle2,
  FileText,
  User as UserIcon,
  MapPin,
  Sparkles,
  ArrowRight,
  RotateCcw,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Combobox } from "@/components/ui/combobox";
import { BarcodeScanner } from "@/components/ui/barcode-scanner";
import { toast } from "sonner";
import { useAuth } from "@/app/inventario/hooks/use-auth";
import type { StockItem } from "@/app/inventario/types";
import { MOTIVOS_INGRESO } from "../constants";
import { sanitizeNumeric, cleanNumberDisplay } from "@/app/inventario/utils";

export default function IngresoPage() {
  const { user, token } = useAuth();
  const [scannerOpen, setScannerOpen] = useState(false);
  const [searching, setSearching] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [stockResults, setStockResults] = useState<StockItem[]>([]);
  const [saving, setSaving] = useState(false);
  const [uploading, setUploading] = useState(false);

  const [form, setForm] = useState({
    producto: "",
    lote: "",
    descripcion: "",
    unidad: "UND",
    familia: "",
    stock_actual: 0,
    cantidad: 1 as number | string,
    motivo: MOTIVOS_INGRESO[0],
    documento_referencia: "",
    solicitante: "",
    rack: "",
    foto_path: undefined as string | undefined,
    comentario: "",
  });

  const debounceRef = useRef<NodeJS.Timeout | null>(null);

  const searchStock = useCallback(
    async (qOverride?: string, autoSelect = false) => {
      const q = (qOverride !== undefined ? qOverride : searchQuery).trim();
      if (!q) {
        setStockResults([]);
        return;
      }
      setSearching(true);
      try {
        const res = await fetch(`/api/stock?q=${encodeURIComponent(q)}&limit=50`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        const data = await res.json();
        const results: StockItem[] = data.stock || [];
        setStockResults(results);

        if (autoSelect && results.length > 0) {
          const exact = results.find(
            (i) => i.producto.trim().toUpperCase() === q.toUpperCase()
          );
          if (exact) {
            selectItem(exact);
            toast.success(`Producto ${exact.producto} cargado`);
            return;
          } else if (results.length === 1) {
            selectItem(results[0]);
            toast.success(`Producto ${results[0].producto} cargado`);
            return;
          }
        }
        if (!results.length && autoSelect) {
          toast.warning(`No se encontró el código: ${q}`);
        }
      } catch {
        toast.error("Error al buscar en catálogo");
      } finally {
        setSearching(false);
      }
    },
    [searchQuery, token]
  );

  const handleSearchChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const val = e.target.value.toUpperCase();
    setSearchQuery(val);

    if (debounceRef.current) clearTimeout(debounceRef.current);
    if (val.trim().length >= 2) {
      debounceRef.current = setTimeout(() => {
        searchStock(val, false);
      }, 250);
    } else if (val.trim().length === 0) {
      setStockResults([]);
    }
  };

  const selectItem = (item: StockItem) => {
    const stock = item.stock_disponible ?? (item.cantidad_fisica ?? item.stock ?? 0);
    setForm((prev) => ({
      ...prev,
      producto: item.producto,
      lote: item.lote || "",
      descripcion: item.glosa || "",
      unidad: item.inventario_um || item.unidad || "UND",
      familia: item.familia || "",
      stock_actual: stock,
      rack: item.rack || item.ubicacion_actual || item.ubicacion || "",
    }));
    setStockResults([]);
    setSearchQuery("");
  };

  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setUploading(true);
    try {
      const formData = new FormData();
      formData.append("file", file);
      const res = await fetch("/api/upload", {
        method: "POST",
        headers: { Authorization: `Bearer ${token}` },
        body: formData,
      });
      const data = await res.json();
      if (data.success) {
        setForm((prev) => ({ ...prev, foto_path: data.url }));
        toast.success("Foto de guía / comprobante adjuntada");
      } else {
        toast.error(data.error || "Error al subir foto");
      }
    } catch {
      toast.error("Error de conexión al subir foto");
    } finally {
      setUploading(false);
    }
  };

  const resetForm = () => {
    setForm({
      producto: "",
      lote: "",
      descripcion: "",
      unidad: "UND",
      familia: "",
      stock_actual: 0,
      cantidad: 1,
      motivo: MOTIVOS_INGRESO[0],
      documento_referencia: "",
      solicitante: "",
      rack: "",
      foto_path: undefined,
      comentario: "",
    });
    setSearchQuery("");
    setStockResults([]);
  };

  const handleSave = async () => {
    if (!form.producto) {
      toast.error("Seleccione un producto primero");
      return;
    }
    const numCant = sanitizeNumeric(form.cantidad);
    if (numCant <= 0) {
      toast.error("Ingrese una cantidad válida mayor a 0");
      return;
    }

    setSaving(true);
    try {
      const body = {
        tipo: "INGRESO",
        producto: form.producto,
        lote: form.lote,
        cantidad: numCant,
        motivo: form.motivo,
        documento_referencia: form.documento_referencia,
        solicitante: form.solicitante,
        rack: form.rack,
        foto_path: form.foto_path,
        comentario: form.comentario,
        usuario_id: user?.id,
      };

      const res = await fetch("/api/movimientos", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(body),
      });
      const data = await res.json();
      if (res.ok) {
        toast.success(data.message || "Ingreso registrado con éxito");
        resetForm();
      } else {
        toast.error(data.error || "Error al registrar ingreso");
      }
    } catch {
      toast.error("Error de conexión");
    } finally {
      setSaving(false);
    }
  };

  const cantNum = sanitizeNumeric(form.cantidad);
  const stockResultante = form.stock_actual + cantNum;

  return (
    <div className="w-full min-w-0 space-y-4">
      <BarcodeScanner
        open={scannerOpen}
        onOpenChange={setScannerOpen}
        onResult={(res) => {
          const code = res.trim().toUpperCase();
          setSearchQuery(code);
          setScannerOpen(false);
          searchStock(code, true);
        }}
      />

      {/* BUSCADOR FULL WIDTH */}
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-3 sm:p-4 space-y-3">
          <div className="relative flex items-center w-full">
            <Button
              type="button"
              variant="ghost"
              size="icon"
              onClick={() => setScannerOpen(true)}
              className="absolute left-1.5 h-9 w-9 text-muted-foreground hover:text-emerald-600"
              title="Escanear Código con Cámara"
            >
              <Barcode className="h-5 w-5" />
            </Button>

            <Input
              value={searchQuery}
              onChange={handleSearchChange}
              onKeyDown={(e) => e.key === "Enter" && searchStock()}
              placeholder="Buscar por código SKU, glosa, descripción o lote (ej: RPTS01, 801., etc.)..."
              className="pl-12 pr-28 font-mono text-sm sm:text-base h-12 rounded-xl bg-secondary/20 focus-visible:ring-2 focus-visible:ring-emerald-500/40 border-border/70"
              autoCapitalize="characters"
              autoComplete="off"
            />

            <div className="absolute right-1.5 flex items-center gap-1">
              {searchQuery && (
                <button
                  type="button"
                  onClick={() => {
                    setSearchQuery("");
                    setStockResults([]);
                  }}
                  className="p-2 text-muted-foreground hover:text-foreground rounded-full"
                  title="Limpiar búsqueda"
                >
                  <X className="h-4 w-4" />
                </button>
              )}
              <Button
                type="button"
                onClick={() => searchStock()}
                disabled={searching}
                size="sm"
                className="h-9 px-3.5 rounded-lg bg-emerald-600 hover:bg-emerald-700 text-white font-semibold text-xs shadow-xs"
              >
                {searching ? <Loader2 className="animate-spin h-4 w-4" /> : <Search className="h-4 w-4" />}
                <span className="hidden sm:inline ml-1.5">Buscar</span>
              </Button>
            </div>
          </div>

          {/* LISTA DE RESULTADOS FLUIDA */}
          {stockResults.length > 0 && (
            <div className="space-y-1.5 max-h-64 overflow-y-auto border border-border/60 rounded-xl p-2 bg-background shadow-inner">
              <div className="flex items-center justify-between text-[11px] text-muted-foreground px-1 pb-1 border-b border-border/40">
                <span>{stockResults.length} coincidencias encontradas</span>
                <span className="text-emerald-600 dark:text-emerald-400 font-medium">Haz clic para seleccionar</span>
              </div>
              {stockResults.map((item) => (
                <button
                  key={`${item.producto}-${item.lote || ""}`}
                  type="button"
                  onClick={() => selectItem(item)}
                  className="w-full text-left p-2.5 rounded-lg hover:bg-emerald-500/10 transition-colors flex items-center justify-between gap-3 group border border-transparent hover:border-emerald-500/30"
                >
                  <div className="min-w-0 flex-1">
                    <div className="flex items-center gap-2">
                      <span className="font-mono font-bold text-xs sm:text-sm text-emerald-600 dark:text-emerald-400 group-hover:underline">
                        {item.producto}
                      </span>
                      {item.lote && (
                        <Badge variant="outline" className="text-[10px] py-0 h-4">
                          Lote: {item.lote}
                        </Badge>
                      )}
                      {item.rack && (
                        <span className="text-[11px] text-muted-foreground flex items-center gap-0.5">
                          <MapPin className="h-3 w-3" /> {item.rack}
                        </span>
                      )}
                    </div>
                    <p className="text-xs text-muted-foreground line-clamp-1 mt-0.5">{item.glosa}</p>
                  </div>
                  <div className="text-right shrink-0">
                    <span className="text-xs font-mono font-bold block text-foreground">
                      {item.stock_disponible ?? (item.cantidad_fisica ?? item.stock ?? 0)} {item.inventario_um || item.unidad || "UND"}
                    </span>
                    <span className="text-[10px] text-muted-foreground">Stock actual</span>
                  </div>
                </button>
              ))}
            </div>
          )}
        </CardContent>
      </Card>

      {/* WORKSPACE PRINCIPAL: 2 COLUMNAS EN DESKTOP (100% WIDTH) */}
      {form.producto ? (
        <div className="grid grid-cols-1 lg:grid-cols-12 gap-5 animate-in fade-in-50 duration-200">
          {/* COLUMNA IZQUIERDA: FORMULARIO DE ENTRADA (7 Cols en Desktop / 8 en XL) */}
          <div className="lg:col-span-7 xl:col-span-8 space-y-4">
            <Card className="border-border/60 shadow-xs">
              <CardHeader className="p-4 bg-emerald-500/5 border-b border-border/50">
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <Package className="h-4 w-4 text-emerald-600" />
                    <span className="text-xs font-bold uppercase tracking-wider text-emerald-700 dark:text-emerald-300">
                      Datos del Movimiento de Ingreso
                    </span>
                  </div>
                  <Badge variant="secondary" className="font-mono text-xs">
                    {form.unidad}
                  </Badge>
                </div>
              </CardHeader>

              <CardContent className="p-4 sm:p-5 space-y-4">
                {/* CANTIDAD A INGRESAR */}
                <div className="p-4 rounded-2xl bg-secondary/15 border border-border/60 space-y-2.5">
                  <Label className="text-xs font-bold uppercase tracking-wider text-muted-foreground flex items-center gap-1.5">
                    <Package className="h-3.5 w-3.5 text-emerald-600" />
                    Cantidad a Ingresar *
                  </Label>

                  <div className="flex items-center gap-2">
                    <Button
                      type="button"
                      variant="outline"
                      onClick={() => setForm((prev) => ({ ...prev, cantidad: Math.max(1, (Number(prev.cantidad) || 0) - 1) }))}
                      className="h-12 w-12 rounded-xl font-bold text-lg shrink-0"
                    >
                      <Minus className="h-5 w-5" />
                    </Button>

                    <div className="relative flex-1">
                      <Input
                        type="number"
                        step="any"
                        inputMode="decimal"
                        value={form.cantidad === 0 ? "0" : form.cantidad ?? ""}
                        onChange={(e) => setForm((prev) => ({ ...prev, cantidad: e.target.value }))}
                        onBlur={() => setForm((prev) => ({ ...prev, cantidad: cleanNumberDisplay(prev.cantidad) }))}
                        required
                        className="h-12 text-center font-mono text-2xl font-black rounded-xl bg-background border-2 border-emerald-500/40 focus-visible:ring-2 focus-visible:ring-emerald-500/20"
                      />
                      <span className="absolute right-3 top-1/2 -translate-y-1/2 text-xs font-bold text-muted-foreground uppercase pointer-events-none">
                        {form.unidad}
                      </span>
                    </div>

                    <Button
                      type="button"
                      variant="outline"
                      onClick={() => setForm((prev) => ({ ...prev, cantidad: (Number(prev.cantidad) || 0) + 1 }))}
                      className="h-12 w-12 rounded-xl font-bold text-lg text-emerald-600 shrink-0"
                    >
                      <Plus className="h-5 w-5" />
                    </Button>
                  </div>

                  <div className="flex items-center justify-center gap-2 pt-1">
                    <Button type="button" variant="secondary" size="sm" onClick={() => setForm((p) => ({ ...p, cantidad: (Number(p.cantidad) || 0) + 5 }))} className="h-7 px-3 text-xs font-mono">
                      +5
                    </Button>
                    <Button type="button" variant="secondary" size="sm" onClick={() => setForm((p) => ({ ...p, cantidad: (Number(p.cantidad) || 0) + 10 }))} className="h-7 px-3 text-xs font-mono">
                      +10
                    </Button>
                    <Button type="button" variant="secondary" size="sm" onClick={() => setForm((p) => ({ ...p, cantidad: (Number(p.cantidad) || 0) + 50 }))} className="h-7 px-3 text-xs font-mono">
                      +50
                    </Button>
                    <Button type="button" variant="secondary" size="sm" onClick={() => setForm((p) => ({ ...p, cantidad: (Number(p.cantidad) || 0) + 100 }))} className="h-7 px-3 text-xs font-mono">
                      +100
                    </Button>
                  </div>
                </div>

                {/* MOTIVO Y GUÍA */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3.5">
                  <div>
                    <Label className="text-xs font-semibold">Motivo de Ingreso *</Label>
                    <div className="mt-1">
                      <Combobox
                        options={MOTIVOS_INGRESO.map((m) => ({ label: m, value: m }))}
                        value={form.motivo}
                        onChange={(val) => setForm((p) => ({ ...p, motivo: val }))}
                        placeholder="Seleccionar motivo..."
                        searchPlaceholder="Buscar motivo..."
                      />
                    </div>
                  </div>

                  <div>
                    <Label className="text-xs font-semibold flex items-center gap-1">
                      <FileText className="h-3 w-3" />
                      N° Guía de Remisión / Factura / OC
                    </Label>
                    <Input
                      value={form.documento_referencia}
                      onChange={(e) => setForm((p) => ({ ...p, documento_referencia: e.target.value.toUpperCase() }))}
                      placeholder="Ej: GR-004521, OC-8921"
                      className="h-10 text-xs mt-1 rounded-xl font-mono uppercase"
                    />
                  </div>
                </div>

                {/* PROVEEDOR / RACK */}
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3.5">
                  <div>
                    <Label className="text-xs font-semibold flex items-center gap-1">
                      <UserIcon className="h-3 w-3" />
                      Proveedor / Transportista / Entrega
                    </Label>
                    <Input
                      value={form.solicitante}
                      onChange={(e) => setForm((p) => ({ ...p, solicitante: e.target.value }))}
                      placeholder="Ej: Ferreyros S.A. / Juan Perez"
                      className="h-10 text-xs mt-1 rounded-xl"
                    />
                  </div>

                  <div>
                    <Label className="text-xs font-semibold flex items-center gap-1">
                      <MapPin className="h-3 w-3" />
                      Rack / Ubicación de Almacenamiento
                    </Label>
                    <Input
                      value={form.rack}
                      onChange={(e) => setForm((p) => ({ ...p, rack: e.target.value.toUpperCase() }))}
                      placeholder="Ej: RACK-B2, BODEGA-01"
                      className="h-10 text-xs mt-1 rounded-xl font-mono uppercase"
                    />
                  </div>
                </div>

                {/* FOTO ADJUNTA */}
                <div>
                  <Label className="text-xs font-semibold flex items-center gap-1 mb-1">
                    <Camera className="h-3 w-3" />
                    Foto de Guía Firmada o Repuesto (Opcional)
                  </Label>
                  {form.foto_path ? (
                    <div className="flex items-center gap-3 p-3 bg-emerald-500/10 rounded-xl border border-emerald-500/20">
                      {/* eslint-disable-next-line @next/next/no-img-element */}
                      <img src={form.foto_path} alt="Guía" className="h-14 w-14 object-cover rounded-lg border shadow-xs" />
                      <div className="flex-1 min-w-0">
                        <span className="text-xs font-semibold text-emerald-600 dark:text-emerald-400 flex items-center gap-1">
                          <CheckCircle2 className="h-3.5 w-3.5" /> Foto adjuntada con éxito
                        </span>
                        <p className="text-[10px] text-muted-foreground truncate">{form.foto_path}</p>
                      </div>
                      <Button
                        type="button"
                        variant="ghost"
                        size="sm"
                        onClick={() => setForm((p) => ({ ...p, foto_path: undefined }))}
                        className="h-8 text-xs text-rose-500 hover:bg-rose-500/10"
                      >
                        Eliminar
                      </Button>
                    </div>
                  ) : (
                    <label className="flex flex-col items-center justify-center p-4 border-2 border-dashed border-border/80 hover:border-emerald-500/60 rounded-xl cursor-pointer bg-secondary/10 hover:bg-secondary/20 transition-all text-center">
                      <Camera className="h-6 w-6 text-muted-foreground mb-1" />
                      <span className="text-xs font-semibold">Tomar foto de la guía o material</span>
                      <span className="text-[10px] text-muted-foreground">Sustento fotográfico para auditoría</span>
                      <input type="file" accept="image/*" capture="environment" onChange={handleFileUpload} className="hidden" />
                    </label>
                  )}
                </div>

                {/* OBSERVACIONES */}
                <div>
                  <Label className="text-xs font-semibold">Observaciones Adicionales</Label>
                  <Input
                    value={form.comentario}
                    onChange={(e) => setForm((p) => ({ ...p, comentario: e.target.value }))}
                    placeholder="Notas sobre el estado del material, bultos, etc..."
                    className="h-10 text-xs mt-1 rounded-xl"
                  />
                </div>

                {/* BOTÓN DE GUARDADO */}
                <div className="pt-2">
                  <Button
                    type="button"
                    onClick={handleSave}
                    disabled={saving}
                    className="w-full h-12 text-sm font-bold rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white shadow-lg shadow-emerald-600/20 transition-all"
                  >
                    {saving ? (
                      <>
                        <Loader2 className="animate-spin mr-2 h-5 w-5" />
                        Guardando Ingreso...
                      </>
                    ) : (
                      <>
                        <Save className="mr-2 h-5 w-5" />
                        Guardar Ingreso (+{form.cantidad} {form.unidad})
                      </>
                    )}
                  </Button>
                </div>
              </CardContent>
            </Card>
          </div>

          {/* COLUMNA DERECHA: TARJETA DE RESUMEN EN VIVO (5 Cols en Desktop / 4 en XL - STICKY) */}
          <div className="lg:col-span-5 xl:col-span-4 space-y-4">
            <Card className="border-border/60 shadow-xs lg:sticky lg:top-4 overflow-hidden">
              <CardHeader className="p-4 bg-secondary/30 border-b border-border/50">
                <div className="flex items-center justify-between">
                  <span className="text-[11px] font-bold uppercase tracking-wider text-muted-foreground">
                    Resumen del Producto
                  </span>
                  <Badge className="bg-emerald-600 text-white text-[10px]">
                    📥 Ingreso
                  </Badge>
                </div>
                <div className="mt-2">
                  <span className="font-mono font-black text-lg text-foreground block">
                    {form.producto}
                  </span>
                  <h3 className="text-xs font-medium text-muted-foreground mt-0.5 line-clamp-2">
                    {form.descripcion}
                  </h3>
                </div>
              </CardHeader>

              <CardContent className="p-4 space-y-4">
                {/* INDICADOR VISUAL DE IMPACTO EN STOCK */}
                <div className="p-3.5 rounded-xl bg-emerald-500/10 border border-emerald-500/20 space-y-2">
                  <span className="text-[10px] font-bold uppercase text-emerald-800 dark:text-emerald-200 block">
                    Impacto en Stock en Vivo
                  </span>
                  <div className="flex items-center justify-between gap-2">
                    <div>
                      <span className="text-[10px] text-muted-foreground block">Stock Actual</span>
                      <span className="text-base font-mono font-bold text-foreground">
                        {form.stock_actual} {form.unidad}
                      </span>
                    </div>

                    <div className="flex items-center text-emerald-600 dark:text-emerald-400 font-bold text-xs gap-1">
                      <ArrowRight className="h-4 w-4" />
                      <span>+{cantNum}</span>
                    </div>

                    <div className="text-right">
                      <span className="text-[10px] text-emerald-700 dark:text-emerald-300 font-bold block">Nuevo Saldo</span>
                      <span className="text-lg font-mono font-black text-emerald-600 dark:text-emerald-400">
                        {stockResultante} {form.unidad}
                      </span>
                    </div>
                  </div>
                </div>

                {/* DETALLES ADICIONALES */}
                <div className="space-y-2 text-xs divide-y divide-border/40">
                  <div className="flex justify-between py-1.5">
                    <span className="text-muted-foreground">Unidad de Medida:</span>
                    <span className="font-semibold text-foreground">{form.unidad}</span>
                  </div>
                  {form.familia && (
                    <div className="flex justify-between py-1.5">
                      <span className="text-muted-foreground">Familia:</span>
                      <span className="font-semibold text-foreground truncate max-w-[160px]">{form.familia}</span>
                    </div>
                  )}
                  {form.rack && (
                    <div className="flex justify-between py-1.5">
                      <span className="text-muted-foreground">Ubicación Rack:</span>
                      <span className="font-mono font-bold text-foreground">{form.rack}</span>
                    </div>
                  )}
                  {form.documento_referencia && (
                    <div className="flex justify-between py-1.5">
                      <span className="text-muted-foreground">Documento:</span>
                      <span className="font-mono font-bold text-primary">{form.documento_referencia}</span>
                    </div>
                  )}
                  {form.solicitante && (
                    <div className="flex justify-between py-1.5">
                      <span className="text-muted-foreground">Proveedor:</span>
                      <span className="font-medium text-foreground truncate max-w-[160px]">{form.solicitante}</span>
                    </div>
                  )}
                </div>
              </CardContent>
            </Card>
          </div>
        </div>
      ) : (
        <div className="p-12 text-center border border-dashed border-border/80 rounded-2xl bg-secondary/10 max-w-2xl mx-auto mt-4">
          <Package className="h-12 w-12 text-muted-foreground mx-auto mb-3 opacity-40" />
          <h4 className="text-base font-bold text-foreground">Busca o escanea un producto para ingresar</h4>
          <p className="text-xs text-muted-foreground mt-1.5 max-w-md mx-auto">
            Utiliza la barra de búsqueda superior o el botón del escáner con cámara para cargar el SKU que deseas ingresar al almacén.
          </p>
        </div>
      )}
    </div>
  );
}
