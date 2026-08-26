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
  MapPin,
  Check,
  AlertTriangle,
  Plus,
  Minus,
  X,
} from "lucide-react";
import { toast } from "sonner";

export interface SelectorProduct {
  producto: string;
  glosa: string;
  unidad: string;
  stock_actual: number;
  rack?: string;
  lote?: string;
}

interface QuantitySelectorDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  product: SelectorProduct | null;
  defaultTipo?: "INGRESO" | "SALIDA";
  lockedTipo?: "INGRESO" | "SALIDA" | null;
  onAdd: (product: SelectorProduct, cantidad: number, tipo: "INGRESO" | "SALIDA") => boolean;
}

export function QuantitySelectorDialog({
  open,
  onOpenChange,
  product,
  defaultTipo = "SALIDA",
  lockedTipo,
  onAdd,
}: QuantitySelectorDialogProps) {
  const [tipo, setTipo] = useState<"INGRESO" | "SALIDA">(lockedTipo || defaultTipo);
  const [cantidad, setCantidad] = useState<number | string>(1);

  useEffect(() => {
    if (lockedTipo) {
      setTipo(lockedTipo);
    } else {
      setTipo(defaultTipo);
    }
    setCantidad(1);
  }, [lockedTipo, defaultTipo, open]);

  if (!product) return null;

  const numCant = typeof cantidad === "number" ? cantidad : parseFloat(cantidad) || 0;
  const isSalida = tipo === "SALIDA";
  const stockInsuficiente = isSalida && numCant > product.stock_actual;
  const stockResultante = isSalida
    ? product.stock_actual - numCant
    : product.stock_actual + numCant;

  const handleConfirm = () => {
    if (numCant <= 0) {
      toast.error("Ingrese una cantidad válida mayor a 0");
      return;
    }
    if (stockInsuficiente) {
      toast.error(`Stock insuficiente (${product.stock_actual} ${product.unidad} disponibles)`);
      return;
    }

    const success = onAdd(product, numCant, tipo);
    if (success) {
      onOpenChange(false);
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
              {product.rack && (
                <Badge variant="secondary" className="text-[10px]">
                  Rack: {product.rack}
                </Badge>
              )}
            </div>
            <Badge
              variant="outline"
              className={`text-[10px] font-bold ${
                isSalida
                  ? "bg-rose-500/10 text-rose-600 border-rose-500/20"
                  : "bg-emerald-500/10 text-emerald-600 border-emerald-500/20"
              }`}
            >
              {isSalida ? "SALIDA" : "INGRESO"}
            </Badge>
          </div>
          <DialogTitle className="text-sm sm:text-base font-bold text-foreground line-clamp-2 mt-1">
            {product.glosa}
          </DialogTitle>
        </DialogHeader>

        <div className="space-y-4 pt-2">
          {/* SELECTOR DE TIPO (SI NO ESTA BLOQUEADO POR VALE ACTIVO) */}
          {!lockedTipo && (
            <div className="grid grid-cols-2 gap-2 p-1 bg-secondary/30 rounded-xl border border-border/40">
              <button
                type="button"
                onClick={() => setTipo("SALIDA")}
                className={`flex items-center justify-center gap-1.5 py-2 rounded-lg text-xs font-bold transition-all ${
                  tipo === "SALIDA"
                    ? "bg-rose-600 text-white shadow-sm"
                    : "text-muted-foreground hover:text-foreground"
                }`}
              >
                <Minus className="h-3.5 w-3.5" /> Salida
              </button>
              <button
                type="button"
                onClick={() => setTipo("INGRESO")}
                className={`flex items-center justify-center gap-1.5 py-2 rounded-lg text-xs font-bold transition-all ${
                  tipo === "INGRESO"
                    ? "bg-emerald-600 text-white shadow-sm"
                    : "text-muted-foreground hover:text-foreground"
                }`}
              >
                <Plus className="h-3.5 w-3.5" /> Ingreso
              </button>
            </div>
          )}

          {/* STOCK DISPONIBLE Y RACK */}
          <div className="flex items-center justify-between p-3 rounded-xl bg-secondary/20 border border-border/40 text-xs">
            <span className="text-muted-foreground">Stock en Bodega:</span>
            <span className="font-mono font-black text-sm text-foreground">
              {product.stock_actual} {product.unidad}
            </span>
          </div>

          {/* INPUT DE CANTIDAD CON BOTONES DE PASO */}
          <div className="space-y-2">
            <Label className="text-xs font-bold text-foreground">
              Cantidad ({product.unidad})
            </Label>
            <div className="flex items-center gap-2">
              <Button
                type="button"
                variant="outline"
                size="icon"
                onClick={() => setCantidad((prev) => Math.max(1, (Number(prev) || 1) - 1))}
                className="h-11 w-11 rounded-xl shrink-0"
              >
                <Minus className="h-4 w-4" />
              </Button>
              <Input
                type="number"
                step="any"
                min="0.01"
                value={cantidad}
                onChange={(e) => setCantidad(e.target.value)}
                onKeyDown={(e) => e.key === "Enter" && handleConfirm()}
                autoFocus
                className={`h-11 text-center font-mono text-lg font-black rounded-xl ${
                  stockInsuficiente ? "border-rose-500 focus-visible:ring-rose-500" : ""
                }`}
              />
              <Button
                type="button"
                variant="outline"
                size="icon"
                onClick={() => setCantidad((prev) => (Number(prev) || 0) + 1)}
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
                  onClick={() => setCantidad((prev) => (Number(prev) || 0) + step)}
                  className="h-7 text-xs font-bold rounded-lg flex-1 bg-background"
                >
                  +{step}
                </Button>
              ))}
            </div>
          </div>

          {/* BALANCE VISUAL DE STOCK */}
          <div className="p-2.5 rounded-xl bg-background border border-border/50 text-xs flex justify-between items-center">
            <span className="text-muted-foreground">Saldo Resultante:</span>
            <span className={`font-mono font-bold ${stockInsuficiente ? "text-rose-600 font-black" : "text-foreground"}`}>
              {stockResultante} {product.unidad}
            </span>
          </div>

          {stockInsuficiente && (
            <div className="p-2.5 rounded-xl bg-rose-500/10 border border-rose-500/20 text-rose-600 dark:text-rose-400 text-xs flex items-center gap-2">
              <AlertTriangle className="h-4 w-4 shrink-0" />
              <span>La cantidad excede el stock disponible.</span>
            </div>
          )}

          {/* BOTON DE AGREGAR AL VALE */}
          <div className="pt-2">
            <Button
              type="button"
              onClick={handleConfirm}
              disabled={numCant <= 0 || stockInsuficiente}
              className={`w-full h-11 text-xs font-bold gap-2 rounded-xl text-white shadow-md ${
                isSalida
                  ? "bg-rose-600 hover:bg-rose-700 shadow-rose-600/20"
                  : "bg-emerald-600 hover:bg-emerald-700 shadow-emerald-600/20"
              }`}
            >
              <Check className="h-4 w-4" />
              Agregar al Vale ({numCant} {product.unidad})
            </Button>
          </div>
        </div>
      </DialogContent>
    </Dialog>
  );
}
