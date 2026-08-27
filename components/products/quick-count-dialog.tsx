"use client";

import React, { useState, useEffect, useRef } from "react";
import { toast } from "sonner";
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
import { Card, CardContent } from "@/components/ui/card";
import {
  ClipboardCheck,
  CheckCircle2,
  AlertTriangle,
  Clock,
  MapPin,
  Package,
  Plus,
  Minus,
  RotateCcw,
  Loader2,
  ArrowLeft,
} from "lucide-react";
import { useAuth } from "@/app/inventario/hooks/use-auth";

export interface QuickCountProduct {
  producto: string;
  glosa: string;
  unidad: string;
  stock_actual: number;
  rack?: string;
  posicion_detalle?: string;
  lote?: string;
  foto_url?: string;
}

interface QuickCountDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  product: QuickCountProduct | null;
  onSaved?: () => void;
}

export function QuickCountDialog({
  open,
  onOpenChange,
  product,
  onSaved,
}: QuickCountDialogProps) {
  const { user, token } = useAuth();
  const [cantidadFisica, setCantidadFisica] = useState<string>("");
  const [rack, setRack] = useState<string>("");
  const [ubicacionActual, setUbicacionActual] = useState<string>("");
  const [comentario, setComentario] = useState<string>("");
  const [saving, setSaving] = useState<boolean>(false);

  const startTimeRef = useRef<number>(0);
  const startDateRef = useRef<string>("");

  useEffect(() => {
    if (open && product) {
      startTimeRef.current = Date.now();
      startDateRef.current = new Date().toISOString();
      setCantidadFisica("");
      setRack(product.rack || "");
      setUbicacionActual(product.posicion_detalle || "");
      setComentario("");
    }
  }, [open, product]);

  if (!product) return null;

  const stockSistema = Number(product.stock_actual ?? 0);
  const numCantFisica = cantidadFisica === "" ? null : Number(cantidadFisica);
  const dif = numCantFisica !== null ? numCantFisica - stockSistema : 0;

  const handleIncrement = (val: number) => {
    const current = numCantFisica !== null ? numCantFisica : 0;
    const next = Math.max(0, current + val);
    setCantidadFisica(String(next));
  };

  const handleMatchStock = () => {
    setCantidadFisica(String(stockSistema));
  };

  const handleSaveCount = async () => {
    if (numCantFisica === null || isNaN(numCantFisica)) {
      toast.error("Por favor ingresa la cantidad física contada.");
      return;
    }

    setSaving(true);
    try {
      const endDate = new Date().toISOString();
      const durationSec = Math.max(1, Math.round((Date.now() - startTimeRef.current) / 1000));

      const payload = {
        producto: product.producto,
        lote: product.lote || "",
        cantidad_fisica: numCantFisica,
        um: product.unidad || "UND",
        rack: rack.trim(),
        ubicacion_actual: ubicacionActual.trim(),
        comentario: comentario.trim(),
        fecha_conteo: new Date().toLocaleDateString("sv-SE"),
        usuario_id: user?.id,
        fecha_inicio: startDateRef.current,
        fecha_fin: endDate,
        duracion_segundos: durationSec,
      };

      const res = await fetch("/api/inventario", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(payload),
      });

      const data = await res.json();
      if (!res.ok) {
        throw new Error(data.error || "Error al guardar el conteo físico.");
      }

      toast.success(
        `Conteo registrado en ${durationSec}s: ${numCantFisica} ${product.unidad || "UND"} (${data.obs || "OK"})`
      );

      onOpenChange(false);
      if (onSaved) onSaved();
    } catch (err: unknown) {
      const msg = err instanceof Error ? err.message : String(err);
      toast.error(msg);
    } finally {
      setSaving(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="w-full sm:max-w-md p-0 overflow-hidden rounded-2xl border-border/60 shadow-2xl bg-background">
        {/* HEADER */}
        <DialogHeader className="p-4 sm:p-5 border-b border-border/50 bg-secondary/15 flex-row items-center justify-between space-y-0">
          <div className="flex items-center gap-2.5 min-w-0">
            <div className="h-9 w-9 rounded-xl bg-primary/10 text-primary flex items-center justify-center shrink-0">
              <ClipboardCheck className="h-5 w-5" />
            </div>
            <div className="min-w-0">
              <div className="flex items-center gap-1.5">
                <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-1.5 py-0.5 rounded">
                  {product.producto}
                </span>
                <span className="text-[10px] text-muted-foreground uppercase flex items-center gap-1 font-semibold">
                  <Clock className="h-3 w-3 text-emerald-500 animate-pulse" /> Conteo en curso
                </span>
              </div>
              <DialogTitle className="text-sm font-bold text-foreground truncate mt-0.5">
                {product.glosa}
              </DialogTitle>
            </div>
          </div>
        </DialogHeader>

        {/* CONTENIDO */}
        <div className="p-4 sm:p-5 space-y-4">
          {/* COMPARATIVA STOCK TEÓRICO */}
          <div className="grid grid-cols-2 gap-2.5">
            <Card className="border-border/60 bg-secondary/30 shadow-none">
              <CardContent className="p-3 space-y-0.5">
                <span className="text-[10px] font-bold text-muted-foreground uppercase">
                  Stock Teórico (Sistema)
                </span>
                <div className="text-xl font-black font-mono text-foreground">
                  {stockSistema.toLocaleString()}
                  <span className="text-xs font-semibold text-muted-foreground ml-1">
                    {product.unidad || "UND"}
                  </span>
                </div>
              </CardContent>
            </Card>

            <Card
              className={`border-border/60 shadow-none transition-colors ${
                numCantFisica === null
                  ? "bg-secondary/10"
                  : dif === 0
                  ? "bg-emerald-500/10 border-emerald-500/30"
                  : "bg-rose-500/10 border-rose-500/30"
              }`}
            >
              <CardContent className="p-3 space-y-0.5">
                <span className="text-[10px] font-bold text-muted-foreground uppercase">
                  Diferencia Calculada
                </span>
                <div
                  className={`text-xl font-black font-mono ${
                    numCantFisica === null
                      ? "text-muted-foreground"
                      : dif === 0
                      ? "text-emerald-600 dark:text-emerald-400"
                      : "text-rose-600 dark:text-rose-400"
                  }`}
                >
                  {numCantFisica === null
                    ? "--"
                    : `${dif > 0 ? "+" : ""}${dif.toLocaleString()}`}
                  <span className="text-xs font-semibold ml-1">
                    {product.unidad || "UND"}
                  </span>
                </div>
              </CardContent>
            </Card>
          </div>

          {/* INPUT PRINCIPAL DE CANTIDAD FÍSICA */}
          <div className="space-y-2 p-3.5 rounded-xl bg-secondary/15 border border-border/50">
            <div className="flex items-center justify-between">
              <Label className="text-xs font-bold text-foreground">
                Cantidad Física en Estante
              </Label>
              <Button
                type="button"
                variant="ghost"
                size="sm"
                onClick={handleMatchStock}
                className="h-6 px-2 text-[10px] text-primary hover:bg-primary/10 font-bold"
              >
                Coincide con Sistema ({stockSistema})
              </Button>
            </div>

            <div className="flex items-center gap-2">
              <Input
                type="number"
                min="0"
                step="any"
                autoFocus
                placeholder="0"
                value={cantidadFisica}
                onChange={(e) => setCantidadFisica(e.target.value)}
                className="h-12 text-xl font-black font-mono text-center rounded-xl bg-background border-border/80 focus-visible:ring-primary shadow-inner"
              />
            </div>

            {/* BOTONES DE INCREMENTO RÁPIDO */}
            <div className="flex items-center justify-between gap-1.5 pt-1">
              <Button
                type="button"
                variant="outline"
                size="sm"
                onClick={() => handleIncrement(1)}
                className="flex-1 h-8 text-xs font-bold rounded-lg"
              >
                +1
              </Button>
              <Button
                type="button"
                variant="outline"
                size="sm"
                onClick={() => handleIncrement(5)}
                className="flex-1 h-8 text-xs font-bold rounded-lg"
              >
                +5
              </Button>
              <Button
                type="button"
                variant="outline"
                size="sm"
                onClick={() => handleIncrement(10)}
                className="flex-1 h-8 text-xs font-bold rounded-lg"
              >
                +10
              </Button>
              <Button
                type="button"
                variant="ghost"
                size="sm"
                onClick={() => setCantidadFisica("")}
                className="h-8 px-2 text-muted-foreground hover:text-foreground"
                title="Limpiar"
              >
                <RotateCcw className="h-3.5 w-3.5" />
              </Button>
            </div>
          </div>

          {/* UBICACIÓN EN BODEGA / RACK */}
          <div className="grid grid-cols-2 gap-2.5">
            <div className="space-y-1">
              <Label className="text-[10px] uppercase font-bold text-muted-foreground">
                Rack / Estante
              </Label>
              <Input
                value={rack}
                onChange={(e) => setRack(e.target.value.toUpperCase())}
                placeholder="Ej. RACK 01"
                className="h-9 text-xs font-semibold rounded-lg"
              />
            </div>
            <div className="space-y-1">
              <Label className="text-[10px] uppercase font-bold text-muted-foreground">
                Posición / Gaveta
              </Label>
              <Input
                value={ubicacionActual}
                onChange={(e) => setUbicacionActual(e.target.value.toUpperCase())}
                placeholder="Ej. GAVETA 14"
                className="h-9 text-xs font-semibold rounded-lg"
              />
            </div>
          </div>

          {/* COMENTARIO / OBSERVACIÓN OPCIONAL */}
          <div className="space-y-1">
            <Label className="text-[10px] uppercase font-bold text-muted-foreground">
              Comentario u Observación (Opcional)
            </Label>
            <Input
              value={comentario}
              onChange={(e) => setComentario(e.target.value)}
              placeholder="Ej. Empaque sellado, repuesto nuevo"
              className="h-9 text-xs rounded-lg"
            />
          </div>
        </div>

        {/* FOOTER FIJO CON CONFIRMACIÓN */}
        <div className="p-4 sm:p-5 border-t border-border/50 bg-secondary/15 flex items-center justify-end gap-2.5">
          <Button
            type="button"
            variant="ghost"
            onClick={() => onOpenChange(false)}
            disabled={saving}
            className="h-10 px-4 text-xs font-semibold rounded-xl"
          >
            Cancelar
          </Button>

          <Button
            type="button"
            onClick={handleSaveCount}
            disabled={saving || cantidadFisica === ""}
            className="h-10 px-5 text-xs font-bold gap-2 rounded-xl bg-primary hover:bg-primary/90 text-primary-foreground shadow-md"
          >
            {saving ? (
              <>
                <Loader2 className="h-4 w-4 animate-spin" />
                Guardando...
              </>
            ) : (
              <>
                <CheckCircle2 className="h-4 w-4" />
                Confirmar Conteo Físico
              </>
            )}
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  );
}
