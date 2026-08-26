"use client";

import React, { useState, useEffect } from "react";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import {
  ClipboardCheck,
  Package,
  MapPin,
  Save,
  Loader2,
  Plus,
  Minus,
  CheckCircle2,
  AlertTriangle,
  FileText,
} from "lucide-react";
import { toast } from "sonner";

export interface QuickInventoryProduct {
  producto: string;
  glosa: string;
  unidad: string;
  stock_sistema: number;
  rack?: string;
  lote?: string;
}

interface QuickInventoryDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  product: QuickInventoryProduct | null;
  usuarioId?: number;
  token?: string;
  onSuccess?: (newStock: number, newRack: string) => void;
}

export function QuickInventoryDialog({
  open,
  onOpenChange,
  product,
  usuarioId,
  token,
  onSuccess,
}: QuickInventoryDialogProps) {
  const [cantidadFisica, setCantidadFisica] = useState<number | string>(0);
  const [rack, setRack] = useState("");
  const [comentario, setComentario] = useState("");
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    if (product && open) {
      setCantidadFisica(product.stock_sistema);
      setRack(product.rack || "");
      setComentario("");
    }
  }, [product, open]);

  if (!product) return null;

  const numFisico = typeof cantidadFisica === "number" ? cantidadFisica : parseFloat(cantidadFisica) || 0;
  const dif = numFisico - product.stock_sistema;

  const handleSave = async () => {
    if (numFisico < 0) {
      toast.error("La cantidad física no puede ser negativa");
      return;
    }

    setSaving(true);
    try {
      const authToken =
        token ||
        (typeof window !== "undefined" && localStorage.getItem("mro_auth")
          ? JSON.parse(localStorage.getItem("mro_auth")!).token
          : "");

      const todayStr = new Date().toISOString().split("T")[0];

      const body = {
        producto: product.producto,
        lote: product.lote || "",
        cantidad_fisica: numFisico,
        um: product.unidad,
        rack: rack.trim().toUpperCase(),
        ubicacion_actual: rack.trim().toUpperCase(),
        comentario: comentario.trim(),
        fecha_conteo: todayStr,
        usuario_id: usuarioId,
      };

      const res = await fetch("/api/inventario", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${authToken}`,
        },
        body: JSON.stringify(body),
      });

      if (res.ok) {
        toast.success(
          `Conteo físico guardado: ${numFisico} ${product.unidad} (Dif: ${dif > 0 ? "+" : ""}${dif})`
        );
        onOpenChange(false);
        if (onSuccess) {
          onSuccess(numFisico, rack.trim().toUpperCase());
        }
      } else {
        const data = await res.json();
        toast.error(data.error || "Error al registrar el conteo");
      }
    } catch {
      toast.error("Error de conexión");
    } finally {
      setSaving(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="w-full sm:max-w-md p-4 sm:p-6 rounded-2xl border-border shadow-2xl">
        <DialogHeader className="pb-3 border-b border-border/40">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Badge variant="outline" className="font-mono text-xs font-bold text-primary bg-primary/10 border-primary/20">
                {product.producto}
              </Badge>
            </div>
            <Badge variant="outline" className="text-[10px] font-bold bg-primary/10 text-primary border-primary/20">
              <ClipboardCheck className="h-3 w-3 mr-1" /> CONTEO FÍSICO
            </Badge>
          </div>
          <DialogTitle className="text-sm sm:text-base font-bold text-foreground line-clamp-2 mt-1">
            {product.glosa}
          </DialogTitle>
        </DialogHeader>

        <div className="space-y-4 pt-2">
          {/* STOCK EN SISTEMA VS CONTEO FÍSICO */}
          <div className="grid grid-cols-2 gap-3">
            <div className="p-3 rounded-xl bg-secondary/20 border border-border/40 space-y-1">
              <span className="text-[10px] font-semibold text-muted-foreground uppercase">
                Stock Teórico / Sistema
              </span>
              <div className="font-mono font-bold text-lg text-foreground">
                {product.stock_sistema} {product.unidad}
              </div>
            </div>

            <div
              className={`p-3 rounded-xl border space-y-1 ${
                dif === 0
                  ? "bg-emerald-500/10 border-emerald-500/30 text-emerald-700 dark:text-emerald-300"
                  : dif > 0
                  ? "bg-blue-500/10 border-blue-500/30 text-blue-700 dark:text-blue-300"
                  : "bg-amber-500/10 border-amber-500/30 text-amber-700 dark:text-amber-300"
              }`}
            >
              <span className="text-[10px] font-semibold uppercase">
                Discrepancia (Δ)
              </span>
              <div className="font-mono font-black text-lg">
                {dif > 0 ? `+${dif}` : dif} {product.unidad}
              </div>
            </div>
          </div>

          {/* INPUT DE CONTEO FÍSICO CON BOTONES DE PASO */}
          <div className="space-y-2">
            <Label className="text-xs font-bold text-foreground">
              Cantidad Física Real en Bodega ({product.unidad})
            </Label>
            <div className="flex items-center gap-2">
              <Button
                type="button"
                variant="outline"
                size="icon"
                onClick={() => setCantidadFisica((prev) => Math.max(0, (Number(prev) || 0) - 1))}
                className="h-11 w-11 rounded-xl shrink-0"
              >
                <Minus className="h-4 w-4" />
              </Button>
              <Input
                type="number"
                step="any"
                min="0"
                value={cantidadFisica}
                onChange={(e) => setCantidadFisica(e.target.value)}
                onKeyDown={(e) => e.key === "Enter" && handleSave()}
                autoFocus
                className="h-11 text-center font-mono text-xl font-black rounded-xl"
              />
              <Button
                type="button"
                variant="outline"
                size="icon"
                onClick={() => setCantidadFisica((prev) => (Number(prev) || 0) + 1)}
                className="h-11 w-11 rounded-xl shrink-0"
              >
                <Plus className="h-4 w-4" />
              </Button>
            </div>

            {/* BOTONES DE INCREMENTO RAPIDO */}
            <div className="flex gap-1.5 pt-1">
              {[1, 2, 5, 10, 20].map((step) => (
                <Button
                  key={step}
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={() => setCantidadFisica((prev) => (Number(prev) || 0) + step)}
                  className="h-7 text-xs font-bold rounded-lg flex-1 bg-background"
                >
                  +{step}
                </Button>
              ))}
            </div>
          </div>

          {/* RACK / UBICACIÓN */}
          <div className="space-y-1">
            <Label className="text-xs font-semibold text-foreground">
              Ubicación en Rack / Gaveta
            </Label>
            <div className="relative">
              <MapPin className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
              <Input
                value={rack}
                onChange={(e) => setRack(e.target.value.toUpperCase())}
                placeholder="ej: RACK-A-03, GAVETA-12"
                className="pl-9 h-10 text-xs font-mono font-bold rounded-xl uppercase"
              />
            </div>
          </div>

          {/* OBSERVACIÓN / COMENTARIO */}
          <div className="space-y-1">
            <Label className="text-xs font-semibold text-foreground">
              Observación o Motivo de Ajuste (Opcional)
            </Label>
            <Input
              value={comentario}
              onChange={(e) => setComentario(e.target.value)}
              placeholder="ej: Conteo cíclico, repuesto reubicado..."
              className="h-10 text-xs rounded-xl"
            />
          </div>
        </div>

        <DialogFooter className="pt-3 border-t border-border/40 flex-row gap-2">
          <Button
            type="button"
            variant="outline"
            onClick={() => onOpenChange(false)}
            disabled={saving}
            className="h-11 text-xs font-semibold rounded-xl flex-1"
          >
            Cancelar
          </Button>
          <Button
            type="button"
            onClick={handleSave}
            disabled={saving || numFisico < 0}
            className="h-11 text-xs font-bold gap-1.5 rounded-xl flex-1 bg-primary text-primary-foreground shadow-md"
          >
            {saving ? <Loader2 className="h-4 w-4 animate-spin" /> : <Save className="h-4 w-4" />}
            Guardar Conteo
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
