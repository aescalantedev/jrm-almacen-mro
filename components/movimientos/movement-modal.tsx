"use client";

import React, { useState, useEffect } from "react";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import {
  ArrowDownCircle,
  ArrowUpCircle,
  Package,
  Barcode,
  Search,
  Camera,
  RotateCcw,
  Loader2,
  AlertTriangle,
  CheckCircle2,
  X,
} from "lucide-react";
import { toast } from "sonner";
import { BarcodeScanner } from "@/components/ui/barcode-scanner";

export interface MovementProduct {
  producto: string;
  glosa: string;
  unidad: string;
  stock_actual: number;
  rack?: string;
  lote?: string;
}

interface MovementModalProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  tipo: "INGRESO" | "SALIDA";
  preselectedProduct?: MovementProduct | null;
  token?: string;
  usuarioId?: number;
  onSuccess?: (movimiento: unknown) => void;
}

const MOTIVOS_INGRESO = [
  "COMPRA DIRECTA",
  "RECEPCION PROVEEDOR",
  "DEVOLUCION DE TALLER",
  "TRASLADO ENTRE ALMACENES",
  "AJUSTE POSITIVO",
  "OTRO",
];

const MOTIVOS_SALIDA = [
  "MANTENIMIENTO / OT",
  "CONSUMO PLANTA",
  "DESPACHO A CUADRILLA",
  "PRESTAMO HERRAMIENTA",
  "MERMA / OBSOLETO",
  "TRASLADO ENTRE ALMACENES",
  "OTRO",
];

export function MovementModal({
  open,
  onOpenChange,
  tipo,
  preselectedProduct,
  token,
  usuarioId,
  onSuccess,
}: MovementModalProps) {
  const [product, setProduct] = useState<MovementProduct | null>(preselectedProduct || null);
  const [searchQuery, setSearchQuery] = useState("");
  const [searching, setSearching] = useState(false);
  const [searchResults, setSearchResults] = useState<MovementProduct[]>([]);
  const [scannerOpen, setScannerOpen] = useState(false);
  const [saving, setSaving] = useState(false);

  // Form fields
  const [cantidad, setCantidad] = useState<number | string>(1);
  const [motivo, setMotivo] = useState(tipo === "INGRESO" ? MOTIVOS_INGRESO[0] : MOTIVOS_SALIDA[0]);
  const [documento, setDocumento] = useState("");
  const [solicitante, setSolicitante] = useState("");
  const [rack, setRack] = useState("");
  const [lote, setLote] = useState("");
  const [fotoPath, setFotoPath] = useState("");
  const [comentario, setComentario] = useState("");

  // Sync preselected product
  useEffect(() => {
    if (preselectedProduct) {
      setProduct(preselectedProduct);
      setRack(preselectedProduct.rack || "");
      setLote(preselectedProduct.lote || "");
    }
  }, [preselectedProduct]);

  // Set default motivo when tipo changes
  useEffect(() => {
    setMotivo(tipo === "INGRESO" ? MOTIVOS_INGRESO[0] : MOTIVOS_SALIDA[0]);
  }, [tipo]);

  const searchStock = async (query: string, autoSelectFirst = false) => {
    const q = query.trim();
    if (!q) return;
    setSearching(true);
    try {
      const res = await fetch(`/api/stock?q=${encodeURIComponent(q)}`, {
        headers: token ? { Authorization: `Bearer ${token}` } : {},
      });
      const data = await res.json();
      const items = (data.items || []).map((item: any) => ({
        producto: item.producto,
        glosa: item.glosa,
        unidad: item.unidad,
        stock_actual: Number(item.stock_disponible ?? item.stock ?? 0),
        rack: item.rack || "",
        lote: item.lote || "",
      }));
      setSearchResults(items);

      if (autoSelectFirst && items.length === 1) {
        selectProduct(items[0]);
      }
    } catch {
      toast.error("Error al buscar repuesto");
    } finally {
      setSearching(false);
    }
  };

  const selectProduct = (p: MovementProduct) => {
    setProduct(p);
    setRack(p.rack || "");
    setLote(p.lote || "");
    setSearchResults([]);
    setSearchQuery("");
  };

  const clearSelectedProduct = () => {
    setProduct(null);
    setCantidad(1);
    setDocumento("");
    setSolicitante("");
    setRack("");
    setLote("");
    setFotoPath("");
    setComentario("");
  };

  const numCantidad = typeof cantidad === "number" ? cantidad : parseFloat(cantidad) || 0;
  const isSalida = tipo === "SALIDA";
  const stockInsuficiente = isSalida && product ? numCantidad > product.stock_actual : false;
  const stockResultante = product
    ? isSalida
      ? product.stock_actual - numCantidad
      : product.stock_actual + numCantidad
    : 0;

  const handleSave = async () => {
    if (!product) {
      toast.error("Seleccione o escanee un producto primero");
      return;
    }
    if (numCantidad <= 0) {
      toast.error("Ingrese una cantidad válida mayor a 0");
      return;
    }
    if (stockInsuficiente) {
      toast.error(
        `Stock insuficiente: Disponible (${product.stock_actual} ${product.unidad}), Intentando retirar (${numCantidad} ${product.unidad})`
      );
      return;
    }

    setSaving(true);
    try {
      const authToken = token || (typeof window !== "undefined" && localStorage.getItem("mro_auth") ? JSON.parse(localStorage.getItem("mro_auth")!).token : "");
      const res = await fetch("/api/movimientos", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${authToken}`,
        },
        body: JSON.stringify({
          tipo,
          producto: product.producto,
          lote: lote || product.lote || "",
          cantidad: numCantidad,
          motivo,
          documento_referencia: documento,
          solicitante,
          rack: rack || product.rack || "",
          foto_path: fotoPath,
          comentario,
          usuario_id: usuarioId,
        }),
      });

      const data = await res.json();
      if (res.ok) {
        toast.success(data.message || `${tipo === "INGRESO" ? "Ingreso" : "Despacho"} registrado con éxito`);
        if (onSuccess) {
          onSuccess(data);
        }
        onOpenChange(false);
        clearSelectedProduct();
      } else {
        toast.error(data.error || "Error al registrar movimiento");
      }
    } catch {
      toast.error("Error de conexión");
    } finally {
      setSaving(false);
    }
  };

  const handlePhotoCapture = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (uploadEvent) => {
        setFotoPath(uploadEvent.target?.result as string);
        toast.success("Foto adjuntada");
      };
      reader.readAsDataURL(file);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="w-full sm:max-w-xl max-h-[92vh] overflow-y-auto p-4 sm:p-6 rounded-2xl border-border shadow-2xl">
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

        <DialogHeader className="pb-3 border-b border-border/60">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-3">
              <div
                className={`flex h-10 w-10 items-center justify-center rounded-xl border shadow-xs ${
                  isSalida
                    ? "bg-rose-500/10 text-rose-600 dark:text-rose-400 border-rose-500/20"
                    : "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 border-emerald-500/20"
                }`}
              >
                {isSalida ? (
                  <ArrowUpCircle className="h-5 w-5" />
                ) : (
                  <ArrowDownCircle className="h-5 w-5" />
                )}
              </div>
              <div>
                <DialogTitle className="text-base sm:text-lg font-bold tracking-tight">
                  {isSalida ? "Despacho de Material" : "Ingreso de Material"}
                </DialogTitle>
                <p className="text-xs text-muted-foreground">
                  {isSalida
                    ? "Salida de repuesto para orden de trabajo o consumo"
                    : "Recepción de compra o devolución a bodega"}
                </p>
              </div>
            </div>
            <Badge
              variant="outline"
              className={`text-[10px] font-bold uppercase ${
                isSalida
                  ? "bg-rose-500/10 text-rose-600 border-rose-500/20"
                  : "bg-emerald-500/10 text-emerald-600 border-emerald-500/20"
              }`}
            >
              {isSalida ? "- SALIDA" : "+ INGRESO"}
            </Badge>
          </div>
        </DialogHeader>

        <div className="space-y-4 pt-3">
          {/* SELECCION O BUSCADOR DE PRODUCTO */}
          {!product ? (
            <div className="space-y-3">
              <Label className="text-xs font-bold text-foreground">
                Buscar o Escanear Repuesto
              </Label>
              <div className="flex gap-2">
                <div className="relative flex-1">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <Input
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    onKeyDown={(e) => e.key === "Enter" && searchStock(searchQuery)}
                    placeholder="Código SKU, descripción o lote..."
                    className="pl-9 h-10 text-xs rounded-xl"
                  />
                </div>
                <Button
                  type="button"
                  onClick={() => searchStock(searchQuery)}
                  disabled={searching}
                  className="h-10 text-xs font-bold px-3 rounded-xl"
                >
                  {searching ? <Loader2 className="h-4 w-4 animate-spin" /> : "Buscar"}
                </Button>
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => setScannerOpen(true)}
                  className="h-10 px-3 rounded-xl border-primary/40 text-primary"
                  title="Escanear con cámara"
                >
                  <Barcode className="h-4 w-4" />
                </Button>
              </div>

              {/* LISTA DE RESULTADOS DE BUSQUEDA */}
              {searchResults.length > 0 && (
                <div className="max-h-48 overflow-y-auto space-y-1.5 border border-border/60 rounded-xl p-2 bg-secondary/10">
                  {searchResults.map((item) => (
                    <div
                      key={item.producto}
                      onClick={() => selectProduct(item)}
                      className="p-2.5 rounded-lg border border-border/40 bg-background hover:bg-primary/5 hover:border-primary/40 cursor-pointer transition-all flex items-center justify-between gap-2"
                    >
                      <div className="min-w-0">
                        <span className="font-mono text-xs font-bold text-primary">
                          {item.producto}
                        </span>
                        <p className="text-xs text-foreground truncate">{item.glosa}</p>
                      </div>
                      <div className="text-right shrink-0">
                        <span className="text-xs font-mono font-black text-foreground">
                          {item.stock_actual} {item.unidad}
                        </span>
                        {item.rack && (
                          <p className="text-[10px] text-muted-foreground">Rack: {item.rack}</p>
                        )}
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          ) : (
            /* PRODUCTO SELECCIONADO CARD */
            <div className="p-3.5 rounded-xl border border-primary/30 bg-primary/5 flex items-center justify-between gap-3">
              <div className="min-w-0">
                <div className="flex items-center gap-2">
                  <Badge variant="outline" className="font-mono text-[11px] font-bold bg-background text-primary">
                    {product.producto}
                  </Badge>
                  <span className="text-xs text-muted-foreground font-mono">
                    Stock: {product.stock_actual} {product.unidad}
                  </span>
                  {product.rack && (
                    <Badge variant="secondary" className="text-[10px] py-0 h-4">
                      Rack: {product.rack}
                    </Badge>
                  )}
                </div>
                <p className="text-xs font-semibold text-foreground truncate mt-1">
                  {product.glosa}
                </p>
              </div>
              <Button
                type="button"
                variant="ghost"
                size="sm"
                onClick={clearSelectedProduct}
                className="h-8 w-8 p-0 rounded-lg text-muted-foreground hover:text-foreground shrink-0"
                title="Cambiar producto"
              >
                <RotateCcw className="h-3.5 w-3.5" />
              </Button>
            </div>
          )}

          {/* FORMULARIO DE MOVIMIENTO (SOLO VISIBLE CUANDO HAY PRODUCTO SELECCIONADO) */}
          {product && (
            <div className="space-y-3.5 pt-1">
              {/* CANTIDAD & BALANCE VISUAL */}
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 p-3 rounded-xl bg-secondary/20 border border-border/40">
                <div className="space-y-1.5">
                  <Label className="text-xs font-bold text-foreground">
                    Cantidad a {isSalida ? "Despachar" : "Ingresar"} ({product.unidad})
                  </Label>
                  <div className="flex items-center gap-2">
                    <Input
                      type="number"
                      step="any"
                      min="0.01"
                      value={cantidad}
                      onChange={(e) => setCantidad(e.target.value)}
                      className={`h-10 text-base font-mono font-bold text-center rounded-xl ${
                        stockInsuficiente ? "border-rose-500 focus-visible:ring-rose-500" : ""
                      }`}
                    />
                  </div>
                  {/* Botones de incremento rápido */}
                  <div className="flex gap-1 pt-1">
                    {[1, 2, 5, 10].map((step) => (
                      <Button
                        key={step}
                        type="button"
                        variant="outline"
                        size="sm"
                        onClick={() => setCantidad((prev) => (Number(prev) || 0) + step)}
                        className="h-6 px-2 text-[10px] font-bold rounded-md flex-1 bg-background"
                      >
                        +{step}
                      </Button>
                    ))}
                  </div>
                </div>

                {/* Resumen de impacto en stock */}
                <div className="flex flex-col justify-center space-y-1.5 p-2.5 rounded-lg bg-background/80 border border-border/40 text-xs">
                  <div className="flex justify-between text-muted-foreground">
                    <span>Stock Actual:</span>
                    <span className="font-mono font-bold">{product.stock_actual} {product.unidad}</span>
                  </div>
                  <div className="flex justify-between text-muted-foreground">
                    <span>{isSalida ? "Despacho:" : "Ingreso:"}</span>
                    <span className={`font-mono font-bold ${isSalida ? "text-rose-600" : "text-emerald-600"}`}>
                      {isSalida ? "-" : "+"}{numCantidad} {product.unidad}
                    </span>
                  </div>
                  <div className="flex justify-between pt-1 border-t border-border/50 font-bold">
                    <span>Nuevo Saldo:</span>
                    <span className={`font-mono ${stockInsuficiente ? "text-rose-600 font-black" : "text-foreground"}`}>
                      {stockResultante} {product.unidad}
                    </span>
                  </div>
                </div>
              </div>

              {stockInsuficiente && (
                <div className="p-2.5 rounded-xl bg-rose-500/10 border border-rose-500/20 text-rose-600 dark:text-rose-400 text-xs flex items-center gap-2">
                  <AlertTriangle className="h-4 w-4 shrink-0" />
                  <span>No hay stock suficiente para realizar este despacho.</span>
                </div>
              )}

              {/* MOTIVO Y DOCUMENTO */}
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <div className="space-y-1">
                  <Label className="text-xs font-semibold text-foreground">Motivo</Label>
                  <select
                    value={motivo}
                    onChange={(e) => setMotivo(e.target.value)}
                    className="w-full h-10 px-3 text-xs rounded-xl bg-background border border-input focus:ring-2 focus:ring-primary/30"
                  >
                    {(isSalida ? MOTIVOS_SALIDA : MOTIVOS_INGRESO).map((m) => (
                      <option key={m} value={m}>
                        {m}
                      </option>
                    ))}
                  </select>
                </div>

                <div className="space-y-1">
                  <Label className="text-xs font-semibold text-foreground">
                    {isSalida ? "N° OT / Documento" : "N° Guía / Factura"}
                  </Label>
                  <Input
                    value={documento}
                    onChange={(e) => setDocumento(e.target.value)}
                    placeholder={isSalida ? "ej: OT-10492" : "ej: GR-001-9281"}
                    className="h-10 text-xs rounded-xl"
                  />
                </div>
              </div>

              {/* SOLICITANTE Y RACK */}
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <div className="space-y-1">
                  <Label className="text-xs font-semibold text-foreground">
                    {isSalida ? "Solicitante / Cuadrilla" : "Proveedor / Remitente"}
                  </Label>
                  <Input
                    value={solicitante}
                    onChange={(e) => setSolicitante(e.target.value)}
                    placeholder={isSalida ? "ej: Cuadrilla Mecánica" : "ej: Ferreyros S.A."}
                    className="h-10 text-xs rounded-xl"
                  />
                </div>

                <div className="space-y-1">
                  <Label className="text-xs font-semibold text-foreground">Ubicación / Rack</Label>
                  <Input
                    value={rack}
                    onChange={(e) => setRack(e.target.value)}
                    placeholder="ej: A-04-02"
                    className="h-10 text-xs rounded-xl"
                  />
                </div>
              </div>

              {/* FOTO Y OBSERVACIONES */}
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <div className="space-y-1">
                  <Label className="text-xs font-semibold text-foreground">Foto de Sustento</Label>
                  <div className="flex items-center gap-2">
                    <label className="flex items-center justify-center gap-2 h-10 px-3 rounded-xl border border-input bg-background hover:bg-secondary/40 text-xs font-medium cursor-pointer w-full">
                      <Camera className="h-4 w-4 text-muted-foreground" />
                      <span className="truncate">{fotoPath ? "Cambiar Foto" : "Tomar Foto / Adjuntar"}</span>
                      <input
                        type="file"
                        accept="image/*"
                        capture="environment"
                        onChange={handlePhotoCapture}
                        className="hidden"
                      />
                    </label>
                    {fotoPath && (
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        onClick={() => setFotoPath("")}
                        className="h-10 w-10 text-rose-500 rounded-xl"
                        title="Eliminar foto"
                      >
                        <X className="h-4 w-4" />
                      </Button>
                    )}
                  </div>
                </div>

                <div className="space-y-1">
                  <Label className="text-xs font-semibold text-foreground">Comentario</Label>
                  <Input
                    value={comentario}
                    onChange={(e) => setComentario(e.target.value)}
                    placeholder="Observaciones adicionales..."
                    className="h-10 text-xs rounded-xl"
                  />
                </div>
              </div>

              {/* BOTON DE ACCION PRINCIPAL */}
              <div className="pt-2">
                <Button
                  type="button"
                  onClick={handleSave}
                  disabled={saving || stockInsuficiente}
                  className={`w-full h-11 text-sm font-bold gap-2 rounded-xl text-white shadow-md ${
                    isSalida
                      ? "bg-rose-600 hover:bg-rose-700 shadow-rose-600/20"
                      : "bg-emerald-600 hover:bg-emerald-700 shadow-emerald-600/20"
                  }`}
                >
                  {saving ? (
                    <Loader2 className="h-4 w-4 animate-spin" />
                  ) : (
                    <CheckCircle2 className="h-4 w-4" />
                  )}
                  {isSalida ? "Confirmar Despacho" : "Confirmar Ingreso"}
                </Button>
              </div>
            </div>
          )}
        </div>
      </DialogContent>
    </Dialog>
  );
}
