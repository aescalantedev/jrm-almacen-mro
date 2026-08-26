"use client";

import React, { useState } from "react";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
} from "@/components/ui/sheet";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import {
  ArrowLeft,
  Trash2,
  Plus,
  Minus,
  CheckCircle2,
  Camera,
  X,
  Loader2,
  AlertTriangle,
  Package,
} from "lucide-react";
import { toast } from "sonner";
import { CartItem } from "@/hooks/use-movement-cart";

interface MovementCartSheetProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  tipo: "INGRESO" | "SALIDA" | null;
  items: CartItem[];
  token?: string;
  usuarioId?: number;
  onUpdateQty: (producto: string, qty: number) => void;
  onRemoveItem: (producto: string) => void;
  onClearItems: () => void;
  onCancelMovement: () => void;
  onSuccess?: () => void;
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

export function MovementCartSheet({
  open,
  onOpenChange,
  tipo,
  items,
  token,
  usuarioId,
  onUpdateQty,
  onRemoveItem,
  onClearItems,
  onCancelMovement,
  onSuccess,
}: MovementCartSheetProps) {
  const [motivo, setMotivo] = useState(
    tipo === "INGRESO" ? MOTIVOS_INGRESO[0] : MOTIVOS_SALIDA[0]
  );
  const [documento, setDocumento] = useState("");
  const [solicitante, setSolicitante] = useState("");
  const [fotoPath, setFotoPath] = useState("");
  const [comentario, setComentario] = useState("");
  const [saving, setSaving] = useState(false);

  const isSalida = tipo === "SALIDA";
  const totalUnidades = items.reduce((acc, it) => acc + (it.cantidad || 0), 0);

  // Check if any item in cart exceeds stock
  const hasStockErrors = isSalida && items.some((it) => it.cantidad > it.stock_actual);

  const handlePhotoCapture = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = (uploadEvent) => {
        setFotoPath(uploadEvent.target?.result as string);
        toast.success("Foto de vale adjuntada");
      };
      reader.readAsDataURL(file);
    }
  };

  const handleConfirmVale = async () => {
    if (items.length === 0) {
      toast.error("El vale no tiene repuestos agregados");
      return;
    }
    if (hasStockErrors) {
      toast.error("Corrige las cantidades: hay repuestos que exceden el stock disponible");
      return;
    }
    if (!motivo) {
      toast.error("Seleccione un motivo");
      return;
    }

    setSaving(true);
    try {
      const authToken =
        token ||
        (typeof window !== "undefined" && localStorage.getItem("mro_auth")
          ? JSON.parse(localStorage.getItem("mro_auth")!).token
          : "");

      const body = {
        tipo,
        items: items.map((it) => ({
          producto: it.producto,
          cantidad: it.cantidad,
          rack: it.rack || "",
          lote: it.lote || "",
        })),
        motivo,
        documento_referencia: documento,
        solicitante,
        foto_path: fotoPath,
        comentario,
        usuario_id: usuarioId,
      };

      const res = await fetch("/api/movimientos", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${authToken}`,
        },
        body: JSON.stringify(body),
      });

      const data = await res.json();
      if (res.ok) {
        toast.success(
          data.message ||
            `Vale de ${isSalida ? "Salida" : "Ingreso"} registrado con éxito (${items.length} repuestos)`
        );
        onCancelMovement();
        onOpenChange(false);
        if (onSuccess) {
          onSuccess();
        }
      } else {
        toast.error(data.error || "Error al procesar el vale");
      }
    } catch {
      toast.error("Error de conexión al registrar el vale");
    } finally {
      setSaving(false);
    }
  };

  return (
    <Sheet open={open} onOpenChange={onOpenChange}>
      <SheetContent
        side="right"
        hideCloseButton={true}
        className="w-full sm:max-w-xl md:max-w-2xl p-0 flex flex-col h-full bg-background border-l border-border/60 shadow-2xl z-50 fixed inset-0 sm:inset-y-0 sm:left-auto"
      >
        {/* HEADER GRANDE CON BOTON DE RETROCESO DESTACADO */}
        <SheetHeader className="p-4 sm:p-5 border-b border-border/50 bg-secondary/15">
          <div className="flex items-center justify-between gap-3">
            <div className="flex items-center gap-3 min-w-0">
              <Button
                type="button"
                variant="ghost"
                size="icon"
                onClick={() => onOpenChange(false)}
                className="h-10 w-10 rounded-xl bg-background border border-border/60 hover:bg-secondary shrink-0"
                title="Regresar a productos"
              >
                <ArrowLeft className="h-5 w-5 text-foreground" />
              </Button>

              <div className="min-w-0">
                <div className="flex items-center gap-2">
                  <SheetTitle className="text-base sm:text-lg font-black tracking-tight text-foreground">
                    {isSalida ? "Vale de Salida" : "Vale de Ingreso"}
                  </SheetTitle>
                  <Badge
                    variant="outline"
                    className={`text-[10px] font-mono font-bold uppercase ${
                      isSalida
                        ? "bg-rose-500/10 text-rose-600 border-rose-500/20"
                        : "bg-emerald-500/10 text-emerald-600 border-emerald-500/20"
                    }`}
                  >
                    {items.length} {items.length === 1 ? "repuesto" : "repuestos"}
                  </Badge>
                </div>
                <p className="text-xs text-muted-foreground truncate">
                  Total: {totalUnidades} unidades en canasta
                </p>
              </div>
            </div>

            {items.length > 0 && (
              <Button
                type="button"
                variant="ghost"
                size="sm"
                onClick={onClearItems}
                className="text-xs text-rose-500 hover:text-rose-600 hover:bg-rose-50/10 h-8 px-2.5 rounded-lg"
                title="Vaciar repuestos del vale"
              >
                <Trash2 className="h-3.5 w-3.5 mr-1" />
                Vaciar
              </Button>
            )}
          </div>
        </SheetHeader>

        {/* CUERPO DEL VALE (SCROLL) */}
        <div className="flex-1 overflow-y-auto p-4 sm:p-6 space-y-5">
          {items.length === 0 ? (
            <div className="py-20 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
              <Package className="h-10 w-10 opacity-30" />
              <span className="text-sm font-semibold">El vale está vacío</span>
              <p className="text-xs max-w-xs text-muted-foreground">
                Toca cualquier producto en el catálogo para sumarlo a este vale de{" "}
                {isSalida ? "despacho" : "ingreso"}.
              </p>
            </div>
          ) : (
            <>
              {/* LISTA DE REPUESTOS EN EL VALE */}
              <div className="space-y-2">
                <span className="text-xs font-bold text-muted-foreground uppercase tracking-wider">
                  Repuestos Seleccionados ({items.length})
                </span>

                <div className="space-y-2.5">
                  {items.map((it) => {
                    const stockInsuficiente = isSalida && it.cantidad > it.stock_actual;

                    return (
                      <div
                        key={it.producto}
                        className={`p-3 rounded-xl border transition-all ${
                          stockInsuficiente
                            ? "bg-rose-500/10 border-rose-500/60 shadow-sm"
                            : "bg-card border-border/50 shadow-xs"
                        }`}
                      >
                        <div className="flex items-start justify-between gap-2">
                          <div className="min-w-0 flex-1">
                            <div className="flex items-center gap-2">
                              <span className="font-mono text-xs font-bold text-primary">
                                {it.producto}
                              </span>
                              {it.rack && (
                                <Badge variant="secondary" className="text-[9px] py-0">
                                  Rack: {it.rack}
                                </Badge>
                              )}
                            </div>
                            <p className="text-xs font-semibold text-foreground line-clamp-1 mt-0.5">
                              {it.glosa}
                            </p>
                            <span className="text-[11px] text-muted-foreground font-mono">
                              Stock en bodega: <strong className="text-foreground">{it.stock_actual} {it.unidad}</strong>
                            </span>
                          </div>

                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            onClick={() => onRemoveItem(it.producto)}
                            className="h-7 w-7 text-muted-foreground hover:text-rose-500 rounded-lg shrink-0"
                            title="Quitar repuesto"
                          >
                            <X className="h-3.5 w-3.5" />
                          </Button>
                        </div>

                        {/* STEPPER DE CANTIDAD POR PRODUCTO CON BLOQUEO DE STOCK */}
                        <div className="flex items-center justify-between pt-2.5 mt-2 border-t border-border/40">
                          <span className="text-xs font-medium text-muted-foreground">
                            Cantidad:
                          </span>
                          <div className="flex items-center gap-2">
                            <Button
                              type="button"
                              variant="outline"
                              size="icon"
                              onClick={() => onUpdateQty(it.producto, Math.max(1, it.cantidad - 1))}
                              className="h-8 w-8 rounded-lg"
                            >
                              <Minus className="h-3 w-3" />
                            </Button>
                            <Input
                              type="number"
                              step="any"
                              min="0.01"
                              max={isSalida ? it.stock_actual : undefined}
                              value={it.cantidad}
                              onChange={(e) => {
                                const val = parseFloat(e.target.value) || 0;
                                if (isSalida && val > it.stock_actual) {
                                  toast.error(`Stock máximo disponible: ${it.stock_actual} ${it.unidad}`);
                                }
                                onUpdateQty(it.producto, val);
                              }}
                              className={`h-8 w-16 text-center font-mono font-bold text-xs rounded-lg ${
                                stockInsuficiente ? "border-rose-500 text-rose-600 focus-visible:ring-rose-500" : ""
                              }`}
                            />
                            <Button
                              type="button"
                              variant="outline"
                              size="icon"
                              disabled={isSalida && it.cantidad >= it.stock_actual}
                              onClick={() => {
                                if (isSalida && it.cantidad >= it.stock_actual) {
                                  toast.error(`Stock insuficiente (${it.stock_actual} disponible)`);
                                  return;
                                }
                                onUpdateQty(it.producto, it.cantidad + 1);
                              }}
                              className="h-8 w-8 rounded-lg"
                            >
                              <Plus className="h-3 w-3" />
                            </Button>
                            <span className="text-xs font-semibold text-muted-foreground ml-1">
                              {it.unidad}
                            </span>
                          </div>
                        </div>

                        {stockInsuficiente && (
                          <div className="p-2 mt-2 rounded-lg bg-rose-500/15 border border-rose-500/30 text-rose-600 dark:text-rose-400 text-[11px] font-bold flex items-center gap-1.5">
                            <AlertTriangle className="h-3.5 w-3.5 shrink-0" />
                            <span>Excede el stock disponible ({it.stock_actual} {it.unidad}). Reduce la cantidad.</span>
                          </div>
                        )}
                      </div>
                    );
                  })}
                </div>
              </div>

              {/* DATOS GLOBALES DEL VALE */}
              <div className="space-y-3 pt-2 border-t border-border/50">
                <span className="text-xs font-bold text-muted-foreground uppercase tracking-wider">
                  Datos de la Orden / Sustento
                </span>

                <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                  <div className="space-y-1">
                    <Label className="text-xs font-semibold text-foreground">Motivo</Label>
                    <select
                      value={motivo}
                      onChange={(e) => setMotivo(e.target.value)}
                      className="w-full h-10 px-3 text-xs rounded-xl bg-background border border-input focus:ring-2 focus:ring-primary/30 font-medium"
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
                    <Label className="text-xs font-semibold text-foreground">
                      Foto del Vale Firmado
                    </Label>
                    <div className="flex items-center gap-2">
                      <label className="flex items-center justify-center gap-2 h-10 px-3 rounded-xl border border-input bg-background hover:bg-secondary/40 text-xs font-medium cursor-pointer w-full">
                        <Camera className="h-4 w-4 text-muted-foreground" />
                        <span className="truncate">
                          {fotoPath ? "Cambiar Foto" : "Tomar Foto / Adjuntar"}
                        </span>
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
                </div>

                <div className="space-y-1">
                  <Label className="text-xs font-semibold text-foreground">Observaciones</Label>
                  <Input
                    value={comentario}
                    onChange={(e) => setComentario(e.target.value)}
                    placeholder="Comentario o detalle adicional del despacho..."
                    className="h-10 text-xs rounded-xl"
                  />
                </div>
              </div>
            </>
          )}
        </div>

        {/* FOOTER CON BOTON PRINCIPAL FIJO */}
        {items.length > 0 && (
          <div className="p-4 sm:p-6 border-t border-border/50 bg-secondary/15">
            <Button
              type="button"
              onClick={handleConfirmVale}
              disabled={saving || hasStockErrors}
              className={`w-full h-12 text-sm font-bold gap-2 rounded-xl text-white shadow-xl ${
                isSalida
                  ? "bg-rose-600 hover:bg-rose-700 shadow-rose-600/25"
                  : "bg-emerald-600 hover:bg-emerald-700 shadow-emerald-600/25"
              }`}
            >
              {saving ? (
                <Loader2 className="h-4 w-4 animate-spin" />
              ) : (
                <CheckCircle2 className="h-4 w-4" />
              )}
              Confirmar {isSalida ? "Despacho" : "Ingreso"} ({items.length}{" "}
              {items.length === 1 ? "repuesto" : "repuestos"})
            </Button>
          </div>
        )}
      </SheetContent>
    </Sheet>
  );
}
