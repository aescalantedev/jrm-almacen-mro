"use client";

import React from "react";
import { toast } from "sonner";
import {
  Search,
  Save,
  RotateCcw,
  Loader2,
  MapPin,
  Barcode,
  ClipboardList,
  Plus,
  Minus,
  Copy,
  X,
  Scale,
  Ruler,
  ChevronDown,
  ChevronUp,
  Camera,
  CheckCircle2,
  AlertCircle,
  Clock,
  ArrowLeft,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Combobox } from "@/components/ui/combobox";
import { BarcodeScanner } from "@/components/ui/barcode-scanner";
import { ObsBadge } from "./obs-badge";
import { FAMILIA2_OPTIONS, PRESENTACION_OPTIONS, UM_OPTIONS } from "../constants";
import { cleanNumberDisplay } from "../utils";
import type { ConteoForm, StockItem } from "../types";

interface ConteoTabProps {
  form: ConteoForm;
  setForm: (fn: (prev: ConteoForm) => ConteoForm) => void;
  isEditing: number | null;
  saving: boolean;
  showAdvanced: boolean;
  setShowAdvanced: (v: boolean) => void;
  searchQuery: string;
  setSearchQuery: (v: string) => void;
  stockResults: StockItem[];
  setStockResults: (v: StockItem[]) => void;
  searching: boolean;
  dif: number;
  pesoTotal: number;
  updateQuantity: (qty: number | string) => void;
  clearForm: () => void;
  searchStock: (queryOverride?: string, autoSelectExact?: boolean) => Promise<void>;
  selectStock: (item: StockItem) => void;
  handleSave: (conCierre: boolean) => Promise<void>;
  catalogCount: number;
  onGoToCatalogo: () => void;
  onNewProduct?: () => void;
}

export function ConteoTab({
  form,
  setForm,
  isEditing,
  saving,
  showAdvanced,
  setShowAdvanced,
  searchQuery,
  setSearchQuery,
  stockResults,
  setStockResults,
  searching,
  dif,
  pesoTotal,
  updateQuantity,
  clearForm,
  searchStock,
  selectStock,
  handleSave,
  catalogCount,
  onGoToCatalogo,
  onNewProduct,
}: ConteoTabProps) {
  const [uploading, setUploading] = React.useState(false);
  const [scannerOpen, setScannerOpen] = React.useState(false);
  const debounceTimerRef = React.useRef<NodeJS.Timeout | null>(null);

  const handleSearchInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const val = e.target.value.toUpperCase();
    setSearchQuery(val);

    if (debounceTimerRef.current) {
      clearTimeout(debounceTimerRef.current);
    }

    if (val.trim().length >= 2) {
      debounceTimerRef.current = setTimeout(() => {
        searchStock(val, false);
      }, 250);
    } else if (val.trim().length === 0) {
      setStockResults([]);
    }
  };

  const handleScanResult = (result: string) => {
    const cleanResult = result.trim();
    setSearchQuery(cleanResult);
    setScannerOpen(false);
    searchStock(cleanResult, true);
  };

  const handleFileUpload = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;
    setUploading(true);
    try {
      const raw = localStorage.getItem("mro_auth");
      const token = raw ? JSON.parse(raw).token : "";
      
      const formData = new FormData();
      formData.append("file", file);
      
      const res = await fetch("/api/upload", {
        method: "POST",
        headers: { Authorization: `Bearer ${token}` },
        body: formData,
      });
      const data = await res.json();
      if (data.success) {
        setForm(prev => ({ ...prev, foto_path: data.url }));
        toast.success("Foto adjuntada");
      } else {
        toast.error("Error al subir foto: " + data.error);
      }
    } catch {
      toast.error("Error de conexión");
    } finally {
      setUploading(false);
    }
  };

  return (
    <div className="space-y-4">
      {/* STEP 1: SEARCH BAR */}
      <BarcodeScanner 
        open={scannerOpen} 
        onOpenChange={setScannerOpen} 
        onResult={handleScanResult} 
      />
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-3 sm:p-4 space-y-3">
          <div className="relative flex items-center w-full group">
            {/* Botón de Escanear Código de Barras (Izquierda) */}
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

            {/* Input Principal */}
            <Input
              value={searchQuery}
              onChange={handleSearchInputChange}
              onKeyDown={(e) => e.key === "Enter" && searchStock()}
              placeholder="Buscar SKU, glosa o lote (ej: RPTS01, 801., etc.)..."
              className="pl-12 pr-24 font-mono text-sm sm:text-base h-12 rounded-xl bg-secondary/30 focus-visible:ring-2 focus-visible:ring-primary/40 transition-all border-border/50 group-focus-within:border-primary/40 group-focus-within:bg-background"
              autoCapitalize="characters"
              autoComplete="off"
            />

            {/* Acciones Derecha (Limpiar y Buscar) */}
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
                title="Buscar"
              >
                {searching ? (
                  <Loader2 className="animate-spin h-4 w-4" />
                ) : (
                  <Search className="h-4 w-4" />
                )}
              </Button>
            </div>
          </div>

          {searchQuery.length >= 2 && !searching && stockResults.length === 0 && (
            <div className="pt-6 pb-4 text-center space-y-3 flex flex-col items-center">
              <p className="text-sm text-muted-foreground">No se encontraron resultados para "{searchQuery}"</p>
              {onNewProduct && (
                <Button type="button" onClick={onNewProduct} variant="outline" className="gap-2">
                  <Plus className="h-4 w-4" />
                  Registrar Nuevo Producto
                </Button>
              )}
            </div>
          )}

          {stockResults.length > 0 && (
            <div className="space-y-2 pt-2">
              <div className="flex items-center justify-between text-xs text-muted-foreground font-semibold px-1">
                <span>Resultados ({stockResults.length}) — Toca para seleccionar</span>
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => setStockResults([])}
                  className="h-6 text-[11px] px-2"
                >
                  Cerrar
                </Button>
              </div>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-2 max-h-72 overflow-y-auto p-1 border border-border/50 rounded-xl bg-background/50">
                {stockResults.map((item, i) => (
                  <div
                    key={`${item.producto}-${item.lote}-${i}`}
                    onClick={() => selectStock(item)}
                    role="button"
                    tabIndex={0}
                    className={`w-full text-left p-3 rounded-xl border transition flex flex-col justify-between gap-2 cursor-pointer active:scale-[0.99] ${
                      item.ya_contado
                        ? "border-emerald-500/30 bg-emerald-500/5 hover:border-emerald-500/60 hover:bg-emerald-500/10"
                        : "border-border/40 hover:border-primary/50 hover:bg-primary/5"
                    }`}
                  >
                    <div className="flex items-start justify-between gap-2">
                      <div className="flex items-center gap-1.5 flex-wrap">
                        <span className="font-mono font-bold text-xs bg-secondary px-2 py-0.5 rounded border border-border/60 text-foreground">
                          {item.producto}
                        </span>
                        {item.ya_contado ? (
                          <Badge variant="outline" className="text-[10px] bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 border-emerald-500/30 font-semibold">
                            ✓ Contado: {item.cantidad_fisica} {item.inventario_um || item.unidad}
                          </Badge>
                        ) : (
                          <Badge variant="outline" className="text-[10px] text-muted-foreground border-border/50">
                            Pendiente
                          </Badge>
                        )}
                      </div>
                      <span className="text-xs font-mono font-bold text-primary shrink-0">
                        Stock: {item.stock} {item.unidad}
                      </span>
                    </div>
                    <div className="text-xs font-medium text-foreground line-clamp-2">
                      {item.glosa}
                    </div>
                    <div className="flex items-center justify-between text-[11px] text-muted-foreground pt-1 border-t border-border/30">
                      <span>
                        Lote: <strong className="font-mono text-foreground">{item.lote || "S/L"}</strong>
                      </span>
                      <span>{item.familia || "MRO"}</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          )}
        </CardContent>
      </Card>

      {/* STEP 2: COUNTING FORM */}
      {form.producto ? (
        <Card className="border-border/60 shadow-md">
          <CardHeader className="p-4 bg-secondary/30 border-b border-border/40">
            <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
              <div className="space-y-1 min-w-0">
                <div className="flex flex-wrap items-center gap-2">
                  <span className="font-mono font-black text-sm sm:text-base px-2.5 py-0.5 rounded-lg bg-primary text-primary-foreground">
                    {form.producto}
                  </span>
                  {form.lote && (
                    <Badge variant="outline" className="text-xs font-mono">
                      Lote: {form.lote}
                    </Badge>
                  )}
                  {form.familia && (
                    <Badge variant="secondary" className="text-[11px]">
                      {form.familia}
                    </Badge>
                  )}
                  {isEditing && (
                    <Badge className="bg-amber-500/20 text-amber-600 dark:text-amber-400 border-amber-500/30 text-xs font-semibold">
                      Editando Conteo #{isEditing}
                    </Badge>
                  )}
                </div>
                <div className="text-sm font-semibold text-foreground mt-1 line-clamp-2">{form.descripcion}</div>
              </div>

              <div className="flex items-center justify-between sm:justify-end gap-3 shrink-0 pt-2 sm:pt-0 border-t sm:border-t-0 border-border/40">
                <div className="text-right">
                  <div className="text-[10px] uppercase font-bold text-muted-foreground">Stock Sistema</div>
                  <div className="text-base font-mono font-extrabold text-foreground">
                    {form.stock_sistema}{" "}
                    <span className="text-xs font-normal text-muted-foreground">{form.unidad}</span>
                  </div>
                </div>

                {/* BOTON CANCELAR VISIBLE Y DESTACADO */}
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={clearForm}
                  className="h-9 px-3 text-xs font-bold text-rose-500 hover:text-rose-600 border-rose-500/30 hover:bg-rose-500/10 rounded-xl"
                  title="Cancelar y seleccionar otro producto"
                >
                  <X className="h-4 w-4 mr-1" />
                  Cancelar
                </Button>
              </div>
            </div>
          </CardHeader>

          <CardContent className="p-4 sm:p-6 space-y-6">
            <form
              onSubmit={(e) => {
                e.preventDefault();
                handleSave(false);
              }}
              className="space-y-6"
            >
              {/* HERO COUNT INPUT */}
              <div className="p-4 sm:p-5 rounded-2xl bg-secondary/20 border-2 border-primary/20 space-y-3">
                <div className="flex items-center justify-between">
                  <Label htmlFor="cant-fisica" className="text-xs sm:text-sm font-bold text-primary flex items-center gap-1.5">
                    <Barcode className="h-4 w-4" />
                    CANTIDAD FÍSICA CONTADA *
                  </Label>
                  <Button
                    type="button"
                    variant="ghost"
                    size="sm"
                    onClick={() => updateQuantity(form.stock_sistema)}
                    className="h-7 text-xs font-medium text-muted-foreground hover:text-primary gap-1"
                  >
                    <Copy className="h-3 w-3" />
                    Copiar Sistema ({form.stock_sistema})
                  </Button>
                </div>

                <div className="flex items-center gap-2">
                  <Button
                    type="button"
                    variant="outline"
                    size="icon"
                    onClick={() => {
                      const current = typeof form.cantidad_fisica === "number" ? form.cantidad_fisica : parseFloat(form.cantidad_fisica) || 0;
                      updateQuantity(Math.max(0, current - 1));
                    }}
                    className="h-12 w-12 sm:h-14 sm:w-14 rounded-xl shrink-0"
                  >
                    <Minus className="h-5 w-5" />
                  </Button>

                  <Input
                    id="cant-fisica"
                    type="number"
                    step="any"
                    min="0"
                    inputMode="decimal"
                    value={form.cantidad_fisica}
                    onChange={(e) => updateQuantity(e.target.value)}
                    placeholder="0"
                    className="h-12 sm:h-14 text-center font-mono text-2xl sm:text-3xl font-black bg-background border-2 border-primary/40 focus-visible:ring-2 focus-visible:ring-primary rounded-xl"
                    autoFocus
                  />

                  <Button
                    type="button"
                    variant="outline"
                    size="icon"
                    onClick={() => {
                      const current = typeof form.cantidad_fisica === "number" ? form.cantidad_fisica : parseFloat(form.cantidad_fisica) || 0;
                      updateQuantity(current + 1);
                    }}
                    className="h-12 w-12 sm:h-14 sm:w-14 rounded-xl shrink-0"
                  >
                    <Plus className="h-5 w-5" />
                  </Button>
                </div>

                {/* Quick Add Buttons */}
                <div className="flex gap-1.5 sm:gap-2 pt-1">
                  {[-10, -5, +5, +10].map((step) => (
                    <Button
                      key={step}
                      type="button"
                      variant="outline"
                      size="sm"
                      onClick={() => {
                        const current = typeof form.cantidad_fisica === "number" ? form.cantidad_fisica : parseFloat(form.cantidad_fisica) || 0;
                        updateQuantity(Math.max(0, current + step));
                      }}
                      className="flex-1 h-8 text-xs font-mono font-bold rounded-lg bg-background"
                    >
                      {step > 0 ? `+${step}` : step}
                    </Button>
                  ))}
                </div>

                {/* SUMMARY ROW (DIF, ESTADO AUTO, PESO) */}
                <div className="flex flex-wrap items-center justify-between gap-2 pt-2 border-t border-border/40 text-xs">
                  <div className="flex items-center gap-1.5">
                    <span className="text-muted-foreground">Diferencia (DIF):</span>
                    <span
                      className={`font-mono font-extrabold ${
                        dif === 0
                          ? "text-emerald-600 dark:text-emerald-400"
                          : dif > 0
                          ? "text-blue-600 dark:text-blue-400"
                          : "text-rose-600 dark:text-rose-400"
                      }`}
                    >
                      {dif > 0 ? `+${dif}` : dif} {form.unidad}
                    </span>
                    <ObsBadge status={form.observacion} />
                  </div>

                  <div className="text-muted-foreground">
                    Peso Total: <strong className="font-mono text-foreground">{pesoTotal.toFixed(3)} kg</strong>
                  </div>
                </div>
              </div>

              {/* CLASSIFICATION & PRESENTATION */}
              <div className="p-4 rounded-2xl bg-secondary/15 border border-border/50 space-y-4">
                <div className="text-xs font-bold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                  <ClipboardList className="h-3.5 w-3.5 text-primary" />
                  Clasificación y Presentación
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div>
                    <Label className="text-xs font-semibold">Familia 2 *</Label>
                    <Combobox
                      value={form.familia2}
                      onChange={(v) => setForm((prev) => ({ ...prev, familia2: v }))}
                      options={FAMILIA2_OPTIONS}
                      placeholder="Seleccionar familia..."
                    />
                  </div>

                  <div>
                    <Label className="text-xs font-semibold">Unidad de Medida (UM) *</Label>
                    <Combobox
                      value={form.um}
                      onChange={(v) => setForm((prev) => ({ ...prev, um: v }))}
                      options={UM_OPTIONS}
                      placeholder="Seleccionar UM..."
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div>
                    <Label className="text-xs font-semibold">Presentación *</Label>
                    <Combobox
                      value={form.presentacion}
                      onChange={(v) => setForm((prev) => ({ ...prev, presentacion: v }))}
                      options={PRESENTACION_OPTIONS}
                      placeholder="Seleccionar presentación..."
                    />
                  </div>

                  <div className="flex items-end">
                    <Button
                      type="button"
                      variant="outline"
                      size="sm"
                      onClick={() => setShowAdvanced(!showAdvanced)}
                      className="w-full h-10 text-xs font-semibold gap-1.5 rounded-xl border-border/60"
                    >
                      <Ruler className="h-3.5 w-3.5" />
                      {showAdvanced ? "Ocultar Medidas y Bultos" : "Agregar Medidas y Bultos"}
                      {showAdvanced ? <ChevronUp className="h-3.5 w-3.5 ml-auto" /> : <ChevronDown className="h-3.5 w-3.5 ml-auto" />}
                    </Button>
                  </div>
                </div>

                {showAdvanced && (
                  <div className="space-y-3 pt-1">
                    <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                      <div>
                        <Label className="text-xs font-semibold">N° Cajas / Bultos</Label>
                        <Input
                          value={form.n_cajas_bultos}
                          onChange={(e) => setForm((prev) => ({ ...prev, n_cajas_bultos: e.target.value }))}
                          placeholder="Ej: 1 UND o 2 CAJAS"
                          className="h-10 text-xs mt-1 rounded-xl"
                        />
                      </div>
                      <div>
                        <Label className="text-xs font-semibold flex items-center gap-1">
                          <Scale className="h-3 w-3" />
                          Peso Aprox. Unitario (kg)
                        </Label>
                        <Input
                          type="number"
                          step="any"
                          inputMode="decimal"
                          value={form.peso_aprox_unitario === 0 ? "0" : (form.peso_aprox_unitario ?? "")}
                          onChange={(e) => setForm((prev) => ({ ...prev, peso_aprox_unitario: e.target.value }))}
                          onBlur={() => setForm((prev) => ({ ...prev, peso_aprox_unitario: cleanNumberDisplay(prev.peso_aprox_unitario) }))}
                          placeholder="0.000"
                          className="h-10 text-xs mt-1 font-mono rounded-xl"
                        />
                      </div>
                    </div>

                    <div>
                      <Label className="text-xs font-semibold flex items-center gap-1 mb-1">
                        <Ruler className="h-3 w-3" />
                        Dimensiones del Producto / Empaque (cm)
                      </Label>
                      <div className="grid grid-cols-3 gap-2">
                        <div>
                          <Input
                            type="number"
                            step="any"
                            inputMode="decimal"
                            value={form.largo === 0 ? "0" : (form.largo ?? "")}
                            onChange={(e) => setForm((prev) => ({ ...prev, largo: e.target.value }))}
                            onBlur={() => setForm((prev) => ({ ...prev, largo: cleanNumberDisplay(prev.largo) }))}
                            placeholder="Largo (cm)"
                            className="h-10 text-xs font-mono rounded-xl text-center"
                          />
                          <span className="text-[10px] text-muted-foreground block text-center mt-0.5">Largo</span>
                        </div>
                        <div>
                          <Input
                            type="number"
                            step="any"
                            inputMode="decimal"
                            value={form.ancho === 0 ? "0" : (form.ancho ?? "")}
                            onChange={(e) => setForm((prev) => ({ ...prev, ancho: e.target.value }))}
                            onBlur={() => setForm((prev) => ({ ...prev, ancho: cleanNumberDisplay(prev.ancho) }))}
                            placeholder="Ancho (cm)"
                            className="h-10 text-xs font-mono rounded-xl text-center"
                          />
                          <span className="text-[10px] text-muted-foreground block text-center mt-0.5">Ancho</span>
                        </div>
                        <div>
                          <Input
                            type="number"
                            step="any"
                            inputMode="decimal"
                            value={form.alto === 0 ? "0" : (form.alto ?? "")}
                            onChange={(e) => setForm((prev) => ({ ...prev, alto: e.target.value }))}
                            onBlur={() => setForm((prev) => ({ ...prev, alto: cleanNumberDisplay(prev.alto) }))}
                            placeholder="Alto (cm)"
                            className="h-10 text-xs font-mono rounded-xl text-center"
                          />
                          <span className="text-[10px] text-muted-foreground block text-center mt-0.5">Alto</span>
                        </div>
                      </div>
                    </div>
                  </div>
                )}
              </div>

              {/* LOCATION & AUDIT */}
              <div className="p-4 rounded-2xl bg-secondary/15 border border-border/50 space-y-3">
                <div className="text-xs font-bold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                  <MapPin className="h-3.5 w-3.5 text-primary" />
                  Ubicación y Almacenamiento en Bodega
                </div>

                <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                  <div>
                    <Label className="text-xs font-semibold">Rack</Label>
                    <Input
                      value={form.rack}
                      onChange={(e) => setForm((prev) => ({ ...prev, rack: e.target.value }))}
                      placeholder="Ej: 1"
                      className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                    />
                  </div>
                  <div>
                    <Label className="text-xs font-semibold">Ubicación Actual</Label>
                    <Input
                      value={form.ubicacion_actual}
                      onChange={(e) => setForm((prev) => ({ ...prev, ubicacion_actual: e.target.value }))}
                      placeholder="Ej: NIVEL1"
                      className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                    />
                  </div>
                  <div>
                    <Label className="text-xs font-semibold">Almacenamiento</Label>
                    <Input
                      value={form.almacenamiento}
                      onChange={(e) => setForm((prev) => ({ ...prev, almacenamiento: e.target.value }))}
                      placeholder="Ej: C.C.01"
                      className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                    />
                  </div>
                  <div>
                    <Label className="text-xs font-semibold">Contenedor</Label>
                    <Input
                      value={form.contenedor}
                      onChange={(e) => setForm((prev) => ({ ...prev, contenedor: e.target.value }))}
                      placeholder="Ej: 2"
                      className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                    />
                  </div>
                </div>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div>
                    <div className="flex items-center justify-between">
                      <Label className="text-xs font-semibold">Observación / Estado (Automático)</Label>
                      <span className="text-[10px] text-muted-foreground font-mono">Calculado</span>
                    </div>
                    <select
                      value={form.observacion}
                      onChange={(e) => setForm((prev) => ({ ...prev, observacion: e.target.value }))}
                      className="flex h-10 w-full mt-1 rounded-xl border border-input bg-background px-3 py-2 text-xs font-bold focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/40"
                    >
                      <option value="OK">OK (Coincide con sistema)</option>
                      <option value="SOBRANTE">SOBRANTE (Físico mayor)</option>
                      <option value="FALTANTE">FALTANTE (Físico menor)</option>
                      <option value="PENDIENTE">PENDIENTE (Por revisar)</option>
                    </select>
                  </div>
                  <div>
                    <Label className="text-xs font-semibold">Comentarios / Observaciones Adicionales</Label>
                    <Input
                      value={form.comentario}
                      onChange={(e) => setForm((prev) => ({ ...prev, comentario: e.target.value }))}
                      placeholder="Detalles sobre estado del empaque, caja #12, etc."
                      className="h-10 text-xs mt-1 rounded-xl"
                    />
                  </div>
                </div>

                <div className="pt-2">
                  <Label className="text-xs font-semibold block mb-2">Evidencia Fotográfica (Opcional)</Label>
                  {form.foto_path ? (
                    <div className="flex items-center gap-2">
                      <div className="relative h-16 w-16 rounded-xl overflow-hidden border border-border/50">
                        {/* eslint-disable-next-line @next/next/no-img-element */}
                        <img src={form.foto_path} alt="Evidencia" className="h-full w-full object-cover" />
                      </div>
                      <Button type="button" variant="ghost" size="sm" onClick={() => setForm(prev => ({ ...prev, foto_path: undefined }))} className="text-rose-500 hover:text-rose-600 hover:bg-rose-500/10">
                        <X className="h-4 w-4 mr-1" /> Quitar
                      </Button>
                    </div>
                  ) : (
                    <div className="flex items-center gap-2">
                      <Button type="button" variant="outline" onClick={() => document.getElementById('camera-upload')?.click()} disabled={uploading} className="h-10 text-xs gap-1.5 rounded-xl">
                        {uploading ? <Loader2 className="h-4 w-4 animate-spin" /> : <Camera className="h-4 w-4" />}
                        {uploading ? "Subiendo..." : "Tomar Foto / Subir"}
                      </Button>
                      <input 
                        id="camera-upload" 
                        type="file" 
                        accept="image/*" 
                        capture="environment" 
                        onChange={handleFileUpload} 
                        className="hidden" 
                      />
                    </div>
                  )}
                </div>
              </div>

              {/* ACTION BUTTONS */}
              <div className="pt-2 flex flex-col sm:flex-row items-stretch sm:items-center justify-end gap-2">
                <Button type="button" variant="outline" size="lg" onClick={clearForm} className="h-12 px-6 font-bold text-xs rounded-xl border-rose-500/30 text-rose-600 hover:bg-rose-500/10">
                  <X className="mr-2 h-4 w-4" />
                  Cancelar
                </Button>
                <Button type="submit" disabled={saving || !form.producto} size="lg" className="h-12 px-8 font-bold text-sm shadow-md rounded-xl">
                  {saving ? (
                    <>
                      <Loader2 className="animate-spin mr-2 h-4 w-4" />
                      Guardando...
                    </>
                  ) : (
                    <>
                      <Save className="mr-2 h-4 w-4" />
                      {isEditing ? "Actualizar Registro" : "Guardar Conteo"}
                    </>
                  )}
                </Button>
              </div>
            </form>
          </CardContent>
        </Card>
      ) : (
        /* EMPTY STATE */
        <Card className="border-border/50 border-dashed bg-secondary/10">
          <CardContent className="p-8 sm:p-12 text-center space-y-4">
            <div className="h-16 w-16 rounded-2xl bg-primary/10 text-primary flex items-center justify-center mx-auto">
              <Barcode className="h-8 w-8" />
            </div>
            <div className="max-w-md mx-auto space-y-1">
              <h3 className="text-base font-bold text-foreground">Inicia un nuevo conteo de inventario</h3>
              <p className="text-xs text-muted-foreground">
                Escribe el código del producto (SKU) en la barra superior o explora el catálogo para autocompletar la ficha y registrar la cantidad física.
              </p>
            </div>
            <Button type="button" variant="outline" onClick={onGoToCatalogo} className="rounded-xl font-bold text-xs gap-1.5">
              <ClipboardList className="h-4 w-4" />
              Ver Catálogo de Stock ({catalogCount || "1800+"})
            </Button>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
