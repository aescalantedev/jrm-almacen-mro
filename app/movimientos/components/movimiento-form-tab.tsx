"use client";

import React, { useState, useRef } from "react";
import {
  ArrowDownCircle,
  ArrowUpCircle,
  Sliders,
  Barcode,
  Search,
  X,
  Loader2,
  Package,
  Plus,
  Minus,
  Camera,
  Image as ImageIcon,
  Save,
  RotateCcw,
  CheckCircle2,
  AlertTriangle,
  FileText,
  User as UserIcon,
  MapPin,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Combobox } from "@/components/ui/combobox";
import { BarcodeScanner } from "@/components/ui/barcode-scanner";
import { toast } from "sonner";
import type { MovimientoFormState, TipoMovimiento } from "../types";
import type { StockItem } from "@/app/inventario/types";
import { MOTIVOS_INGRESO, MOTIVOS_SALIDA, MOTIVOS_AJUSTE } from "../constants";
import { sanitizeNumeric, cleanNumberDisplay } from "@/app/inventario/utils";

interface MovimientoFormTabProps {
  form: MovimientoFormState;
  setForm: React.Dispatch<React.SetStateAction<MovimientoFormState>>;
  saving: boolean;
  searchQuery: string;
  setSearchQuery: (v: string) => void;
  stockResults: StockItem[];
  setStockResults: (items: StockItem[]) => void;
  searching: boolean;
  changeTipo: (tipo: TipoMovimiento) => void;
  searchStock: (query?: string, autoSelect?: boolean) => Promise<void>;
  selectStockItem: (item: StockItem) => void;
  clearForm: () => void;
  handleSaveMovimiento: () => Promise<boolean>;
  token: string;
}

export function MovimientoFormTab({
  form,
  setForm,
  saving,
  searchQuery,
  setSearchQuery,
  stockResults,
  setStockResults,
  searching,
  changeTipo,
  searchStock,
  selectStockItem,
  clearForm,
  handleSaveMovimiento,
  token,
}: MovimientoFormTabProps) {
  const [scannerOpen, setScannerOpen] = useState(false);
  const [uploading, setUploading] = useState(false);
  const debounceRef = useRef<NodeJS.Timeout | null>(null);

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

  const handleScanResult = (result: string) => {
    const code = result.trim().toUpperCase();
    setSearchQuery(code);
    setScannerOpen(false);
    searchStock(code, true);
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
        toast.success("Foto adjuntada con éxito");
      } else {
        toast.error(data.error || "Error al subir la foto");
      }
    } catch {
      toast.error("Error de conexión al subir imagen");
    } finally {
      setUploading(false);
    }
  };

  const cantNum = sanitizeNumeric(form.cantidad);
  const stockResultante =
    form.tipo === "INGRESO"
      ? form.stock_actual_disponible + cantNum
      : form.tipo === "SALIDA"
        ? form.stock_actual_disponible - cantNum
        : cantNum;

  const stockInsuficiente = form.tipo === "SALIDA" && cantNum > form.stock_actual_disponible;

  const motivosOptions = (
    form.tipo === "INGRESO"
      ? MOTIVOS_INGRESO
      : form.tipo === "SALIDA"
        ? MOTIVOS_SALIDA
        : MOTIVOS_AJUSTE
  ).map((m) => ({ label: m, value: m }));

  return (
    <div className="space-y-4">
      <BarcodeScanner
        open={scannerOpen}
        onOpenChange={setScannerOpen}
        onResult={handleScanResult}
      />

      {/* STEP 1: SELECTOR DE TIPO (INGRESO / SALIDA / AJUSTE) */}
      <div className="grid grid-cols-3 gap-2 p-1.5 bg-secondary/30 rounded-2xl border border-border/60">
        <button
          type="button"
          onClick={() => changeTipo("SALIDA")}
          className={`flex items-center justify-center gap-2 py-3 px-2 rounded-xl font-bold text-xs sm:text-sm transition-all ${
            form.tipo === "SALIDA"
              ? "bg-rose-500 text-white shadow-md shadow-rose-500/20 scale-[1.02]"
              : "text-muted-foreground hover:bg-secondary/60"
          }`}
        >
          <ArrowUpCircle className="h-4 w-4 shrink-0" />
          <span>Salida (-)</span>
        </button>

        <button
          type="button"
          onClick={() => changeTipo("INGRESO")}
          className={`flex items-center justify-center gap-2 py-3 px-2 rounded-xl font-bold text-xs sm:text-sm transition-all ${
            form.tipo === "INGRESO"
              ? "bg-emerald-600 text-white shadow-md shadow-emerald-600/20 scale-[1.02]"
              : "text-muted-foreground hover:bg-secondary/60"
          }`}
        >
          <ArrowDownCircle className="h-4 w-4 shrink-0" />
          <span>Ingreso (+)</span>
        </button>

        <button
          type="button"
          onClick={() => changeTipo("AJUSTE")}
          className={`flex items-center justify-center gap-2 py-3 px-2 rounded-xl font-bold text-xs sm:text-sm transition-all ${
            form.tipo === "AJUSTE"
              ? "bg-primary text-primary-foreground shadow-md shadow-primary/20 scale-[1.02]"
              : "text-muted-foreground hover:bg-secondary/60"
          }`}
        >
          <Sliders className="h-4 w-4 shrink-0" />
          <span>Ajuste (≡)</span>
        </button>
      </div>

      {/* STEP 2: BUSCADOR / ESCÁNER */}
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-3 sm:p-4 space-y-3">
          <div className="relative flex items-center w-full group">
            <Button
              type="button"
              variant="ghost"
              size="icon"
              onClick={() => setScannerOpen(true)}
              className="absolute left-1.5 h-9 w-9 text-muted-foreground hover:text-primary transition-colors z-10"
              title="Escanear Código"
            >
              <Barcode className="h-5 w-5" />
            </Button>

            <Input
              value={searchQuery}
              onChange={handleSearchChange}
              onKeyDown={(e) => e.key === "Enter" && searchStock()}
              placeholder="Buscar SKU, glosa o lote (ej: RPTS01, 801., etc.)..."
              className="pl-12 pr-24 font-mono text-sm sm:text-base h-12 rounded-xl bg-secondary/30 focus-visible:ring-2 focus-visible:ring-primary/40 transition-all border-border/50 group-focus-within:border-primary/40 group-focus-within:bg-background"
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
                  className="p-2 text-muted-foreground hover:text-foreground rounded-full hover:bg-muted transition-colors mr-1"
                  title="Limpiar"
                >
                  <X className="h-4 w-4" />
                </button>
              )}

              <Button
                type="button"
                onClick={() => searchStock()}
                disabled={searching}
                size="sm"
                className="h-9 px-3 rounded-lg shadow-sm"
              >
                {searching ? (
                  <Loader2 className="animate-spin h-4 w-4" />
                ) : (
                  <Search className="h-4 w-4" />
                )}
              </Button>
            </div>
          </div>

          {/* LISTA DE RESULTADOS DE BÚSQUEDA */}
          {stockResults.length > 0 && (
            <div className="space-y-2 pt-2">
              <div className="flex items-center justify-between text-xs text-muted-foreground px-1">
                <span>Coincidencias encontradas: {stockResults.length}</span>
                <span className="text-[11px] font-medium text-primary">Toca para seleccionar</span>
              </div>
              <div className="max-h-60 overflow-y-auto space-y-1.5 border border-border/60 rounded-xl p-1.5 bg-background shadow-inner">
                {stockResults.map((item) => {
                  const disp = item.stock_disponible ?? (item.cantidad_fisica ?? item.stock ?? 0);
                  return (
                    <button
                      key={`${item.producto}-${item.lote || ""}`}
                      type="button"
                      onClick={() => selectStockItem(item)}
                      className="w-full text-left p-2.5 rounded-lg hover:bg-primary/10 transition-colors border border-transparent hover:border-primary/30 flex items-start justify-between gap-3 group"
                    >
                      <div className="min-w-0 flex-1">
                        <div className="flex items-center gap-2">
                          <span className="font-mono font-bold text-xs sm:text-sm text-primary group-hover:underline">
                            {item.producto}
                          </span>
                          {item.lote && (
                            <Badge variant="outline" className="text-[10px] py-0 h-4">
                              Lote: {item.lote}
                            </Badge>
                          )}
                        </div>
                        <p className="text-xs text-muted-foreground line-clamp-1 mt-0.5">
                          {item.glosa}
                        </p>
                        {item.rack && (
                          <div className="flex items-center gap-1 text-[11px] text-muted-foreground mt-1">
                            <MapPin className="h-3 w-3" />
                            <span>Rack: {item.rack}</span>
                          </div>
                        )}
                      </div>
                      <div className="text-right shrink-0">
                        <span className="text-xs font-mono font-bold block text-foreground">
                          {disp} {item.inventario_um || item.unidad || "UND"}
                        </span>
                        <span className="text-[10px] text-muted-foreground">Disponible</span>
                      </div>
                    </button>
                  );
                })}
              </div>
            </div>
          )}
        </CardContent>
      </Card>

      {/* STEP 3: FORMULARIO DE REGISTRO */}
      {form.producto ? (
        <Card className="border-border/60 shadow-sm overflow-hidden animate-in fade-in-50 duration-200">
          <CardHeader className="p-4 bg-secondary/20 border-b border-border/50">
            <div className="flex items-start justify-between gap-3">
              <div>
                <div className="flex items-center gap-2">
                  <Badge
                    variant={form.tipo === "SALIDA" ? "destructive" : "default"}
                    className={
                      form.tipo === "INGRESO"
                        ? "bg-emerald-600"
                        : form.tipo === "SALIDA"
                          ? "bg-rose-500"
                          : "bg-primary"
                    }
                  >
                    {form.tipo === "INGRESO" ? "📥 INGRESO (+)" : form.tipo === "SALIDA" ? "📤 SALIDA (-)" : "⚖️ AJUSTE"}
                  </Badge>
                  <span className="font-mono font-black text-base sm:text-lg text-foreground">
                    {form.producto}
                  </span>
                </div>
                <h3 className="text-sm font-semibold text-foreground/90 mt-1">
                  {form.descripcion}
                </h3>
              </div>
              <Button
                type="button"
                variant="ghost"
                size="sm"
                onClick={clearForm}
                className="h-8 text-xs text-muted-foreground hover:text-foreground"
              >
                <X className="h-4 w-4 mr-1" />
                Cambiar
              </Button>
            </div>

            {/* STATUS DE STOCK DISPONIBLE Y RESULTANTE */}
            <div className="grid grid-cols-2 gap-2 mt-3 pt-3 border-t border-border/40">
              <div className="p-2.5 rounded-xl bg-background border border-border/50">
                <span className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground block">
                  Stock Disponible Actual
                </span>
                <span className="text-lg font-mono font-bold text-foreground">
                  {form.stock_actual_disponible} <span className="text-xs font-normal text-muted-foreground">{form.unidad}</span>
                </span>
              </div>

              <div
                className={`p-2.5 rounded-xl border ${
                  stockInsuficiente
                    ? "bg-rose-500/10 border-rose-500/30 text-rose-600"
                    : "bg-background border-border/50"
                }`}
              >
                <span className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground block">
                  Stock Resultante
                </span>
                <span
                  className={`text-lg font-mono font-bold ${
                    stockInsuficiente
                      ? "text-rose-600 dark:text-rose-400"
                      : "text-emerald-600 dark:text-emerald-400"
                  }`}
                >
                  {stockResultante} <span className="text-xs font-normal text-muted-foreground">{form.unidad}</span>
                </span>
              </div>
            </div>

            {stockInsuficiente && (
              <div className="flex items-center gap-2 p-2.5 mt-2 rounded-xl bg-rose-500/10 border border-rose-500/20 text-rose-700 dark:text-rose-300 text-xs font-semibold">
                <AlertTriangle className="h-4 w-4 shrink-0" />
                <span>Advertencia: La cantidad solicitada supera el stock disponible en almacén.</span>
              </div>
            )}
          </CardHeader>

          <CardContent className="p-4 space-y-4">
            {/* CANTIDAD A MOVER */}
            <div className="p-3.5 rounded-2xl bg-secondary/15 border border-border/50 space-y-2">
              <Label className="text-xs font-bold uppercase tracking-wider text-muted-foreground flex items-center gap-1.5">
                <Package className="h-3.5 w-3.5 text-primary" />
                Cantidad a {form.tipo === "INGRESO" ? "Ingresar" : form.tipo === "SALIDA" ? "Despachar" : "Ajustar"} *
              </Label>

              <div className="flex items-center gap-2">
                <Button
                  type="button"
                  variant="outline"
                  onClick={() =>
                    setForm((prev) => ({
                      ...prev,
                      cantidad: Math.max(1, (Number(prev.cantidad) || 0) - 1),
                    }))
                  }
                  className="h-12 w-12 rounded-xl shrink-0 font-bold text-lg"
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
                    onBlur={() =>
                      setForm((prev) => ({
                        ...prev,
                        cantidad: cleanNumberDisplay(prev.cantidad),
                      }))
                    }
                    required
                    className="h-12 text-center font-mono text-2xl font-black rounded-xl bg-background border-2 border-primary/40 focus-visible:ring-2 focus-visible:ring-primary/20"
                  />
                  <span className="absolute right-3 top-1/2 -translate-y-1/2 text-xs font-bold text-muted-foreground uppercase pointer-events-none">
                    {form.unidad}
                  </span>
                </div>

                <Button
                  type="button"
                  variant="outline"
                  onClick={() =>
                    setForm((prev) => ({
                      ...prev,
                      cantidad: (Number(prev.cantidad) || 0) + 1,
                    }))
                  }
                  className="h-12 w-12 rounded-xl shrink-0 font-bold text-lg text-primary"
                >
                  <Plus className="h-5 w-5" />
                </Button>
              </div>

              {/* Quick Step Buttons */}
              <div className="flex items-center justify-center gap-1.5 pt-1">
                <Button
                  type="button"
                  variant="secondary"
                  size="sm"
                  onClick={() =>
                    setForm((prev) => ({
                      ...prev,
                      cantidad: Math.max(1, (Number(prev.cantidad) || 0) - 5),
                    }))
                  }
                  className="h-7 px-2.5 text-xs font-mono"
                >
                  -5
                </Button>
                <Button
                  type="button"
                  variant="secondary"
                  size="sm"
                  onClick={() =>
                    setForm((prev) => ({
                      ...prev,
                      cantidad: (Number(prev.cantidad) || 0) + 5,
                    }))
                  }
                  className="h-7 px-2.5 text-xs font-mono"
                >
                  +5
                </Button>
                <Button
                  type="button"
                  variant="secondary"
                  size="sm"
                  onClick={() =>
                    setForm((prev) => ({
                      ...prev,
                      cantidad: (Number(prev.cantidad) || 0) + 10,
                    }))
                  }
                  className="h-7 px-2.5 text-xs font-mono"
                >
                  +10
                </Button>
                {form.tipo === "SALIDA" && (
                  <Button
                    type="button"
                    variant="outline"
                    size="sm"
                    onClick={() =>
                      setForm((prev) => ({
                        ...prev,
                        cantidad: prev.stock_actual_disponible,
                      }))
                    }
                    className="h-7 px-2.5 text-xs font-medium text-muted-foreground hover:text-foreground"
                  >
                    Todo ({form.stock_actual_disponible})
                  </Button>
                )}
              </div>
            </div>

            {/* MOTIVO Y DOCUMENTO DE REFERENCIA */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <Label className="text-xs font-semibold">Motivo del Movimiento *</Label>
                <div className="mt-1">
                  <Combobox
                    options={motivosOptions}
                    value={form.motivo}
                    onChange={(val) => setForm((prev) => ({ ...prev, motivo: val }))}
                    placeholder="Seleccionar motivo..."
                    searchPlaceholder="Buscar motivo..."
                  />
                </div>
              </div>

              <div>
                <Label className="text-xs font-semibold flex items-center gap-1">
                  <FileText className="h-3 w-3" />
                  N° Documento / Guía / OT
                </Label>
                <Input
                  value={form.documento_referencia}
                  onChange={(e) =>
                    setForm((prev) => ({ ...prev, documento_referencia: e.target.value.toUpperCase() }))
                  }
                  placeholder="Ej: GR-001234, OT-8940, VALE-50"
                  className="h-10 text-xs mt-1 rounded-xl font-mono uppercase"
                />
              </div>
            </div>

            {/* SOLICITANTE / DESTINATARIO Y RACK */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div>
                <Label className="text-xs font-semibold flex items-center gap-1">
                  <UserIcon className="h-3 w-3" />
                  Solicitante / Entregado a / Área
                </Label>
                <Input
                  value={form.solicitante}
                  onChange={(e) => setForm((prev) => ({ ...prev, solicitante: e.target.value }))}
                  placeholder="Ej: Juan Pérez / Mantenimiento Mecánico"
                  className="h-10 text-xs mt-1 rounded-xl"
                />
              </div>

              <div>
                <Label className="text-xs font-semibold flex items-center gap-1">
                  <MapPin className="h-3 w-3" />
                  Ubicación / Rack / Destino
                </Label>
                <Input
                  value={form.rack}
                  onChange={(e) => setForm((prev) => ({ ...prev, rack: e.target.value.toUpperCase() }))}
                  placeholder="Ej: RACK-A3, TALLER-CHILCA"
                  className="h-10 text-xs mt-1 rounded-xl font-mono uppercase"
                />
              </div>
            </div>

            {/* FOTO ADJUNTA / COMPROBANTE */}
            <div>
              <Label className="text-xs font-semibold flex items-center gap-1 mb-1">
                <Camera className="h-3 w-3" />
                Foto de Sustento / Guía Firmada / Material (Opcional)
              </Label>
              {form.foto_path ? (
                <div className="flex items-center gap-3 p-2.5 bg-secondary/30 rounded-xl border border-border/50">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img
                    src={form.foto_path}
                    alt="Evidencia"
                    className="h-14 w-14 object-cover rounded-lg border border-border shadow-xs"
                  />
                  <div className="flex-1 min-w-0">
                    <span className="text-xs font-medium text-emerald-600 dark:text-emerald-400 flex items-center gap-1">
                      <CheckCircle2 className="h-3.5 w-3.5" />
                      Foto adjuntada correctamente
                    </span>
                    <p className="text-[10px] text-muted-foreground truncate">{form.foto_path}</p>
                  </div>
                  <Button
                    type="button"
                    variant="ghost"
                    size="sm"
                    onClick={() => setForm((prev) => ({ ...prev, foto_path: undefined }))}
                    className="h-8 text-xs text-rose-500 hover:bg-rose-500/10"
                  >
                    Eliminar
                  </Button>
                </div>
              ) : (
                <label className="flex flex-col items-center justify-center p-4 border-2 border-dashed border-border/80 hover:border-primary/60 rounded-xl cursor-pointer bg-secondary/10 hover:bg-secondary/25 transition-all text-center">
                  <Camera className="h-6 w-6 text-muted-foreground mb-1" />
                  <span className="text-xs font-semibold text-foreground">Tomar foto o subir archivo</span>
                  <span className="text-[10px] text-muted-foreground">Guía firmada, vale o repuesto</span>
                  <input
                    type="file"
                    accept="image/*"
                    capture="environment"
                    onChange={handleFileUpload}
                    className="hidden"
                  />
                </label>
              )}
            </div>

            {/* COMENTARIO */}
            <div>
              <Label className="text-xs font-semibold">Comentario / Observación</Label>
              <Input
                value={form.comentario}
                onChange={(e) => setForm((prev) => ({ ...prev, comentario: e.target.value }))}
                placeholder="Observaciones adicionales sobre el movimiento..."
                className="h-10 text-xs mt-1 rounded-xl"
              />
            </div>

            {/* BOTÓN DE GUARDADO */}
            <div className="pt-2">
              <Button
                type="button"
                onClick={handleSaveMovimiento}
                disabled={saving || stockInsuficiente}
                className={`w-full h-12 text-sm font-bold rounded-xl shadow-lg transition-all ${
                  form.tipo === "INGRESO"
                    ? "bg-emerald-600 hover:bg-emerald-700 text-white shadow-emerald-600/20"
                    : form.tipo === "SALIDA"
                      ? "bg-rose-600 hover:bg-rose-700 text-white shadow-rose-600/20"
                      : "bg-primary text-primary-foreground shadow-primary/20"
                }`}
              >
                {saving ? (
                  <>
                    <Loader2 className="animate-spin mr-2 h-5 w-5" />
                    Registrando Movimiento...
                  </>
                ) : (
                  <>
                    <Save className="mr-2 h-5 w-5" />
                    Confirmar {form.tipo === "INGRESO" ? "Ingreso" : form.tipo === "SALIDA" ? "Salida" : "Ajuste"} ({form.cantidad} {form.unidad})
                  </>
                )}
              </Button>
            </div>
          </CardContent>
        </Card>
      ) : (
        <div className="p-8 text-center border border-dashed border-border/80 rounded-2xl bg-secondary/10">
          <Package className="h-10 w-10 text-muted-foreground mx-auto mb-2 opacity-50" />
          <h4 className="text-sm font-bold text-foreground">Ningún producto seleccionado</h4>
          <p className="text-xs text-muted-foreground mt-1 max-w-sm mx-auto">
            Utiliza la barra de búsqueda o el botón del escáner de código de barras para cargar el producto a mover.
          </p>
        </div>
      )}
    </div>
  );
}
