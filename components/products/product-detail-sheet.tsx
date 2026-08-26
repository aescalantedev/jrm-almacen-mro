"use client";

import React, { useState } from "react";
import { useRouter } from "next/navigation";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
} from "@/components/ui/sheet";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import {
  Package,
  Plus,
  Minus,
  MapPin,
  Scale,
  DollarSign,
  Layers,
  Edit3,
  ArrowLeft,
  ClipboardCheck,
  FileText,
} from "lucide-react";
import { QuantitySelectorDialog, SelectorProduct } from "@/components/movimientos/quantity-selector-dialog";

export interface MasterProduct {
  producto: string;
  glosa: string;
  unidad: string;
  familia: string;
  subfamilia: string;
  tipo: string;
  peso: number;
  costo_unitario: number;
  tipo_acero?: string;
  grado_acero?: string;
  espesor_acero?: string;
  peso_producto?: number;
  stock_total?: number;
  rack?: string;
  lote?: string;
}

interface ProductDetailSheetProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  product: MasterProduct | null;
  isAdmin?: boolean;
  usuarioId?: number;
  token?: string;
  onEdit?: (product: MasterProduct) => void;
  onAddMovement?: (product: SelectorProduct, cantidad: number, tipo: "INGRESO" | "SALIDA") => boolean;
  onProductUpdated?: () => void;
}

export function ProductDetailSheet({
  open,
  onOpenChange,
  product,
  isAdmin = false,
  onEdit,
  onAddMovement,
}: ProductDetailSheetProps) {
  const router = useRouter();
  const [selectorOpen, setSelectorOpen] = useState(false);
  const [selectedMovementTipo, setSelectedMovementTipo] = useState<"INGRESO" | "SALIDA">("SALIDA");

  if (!product) return null;

  const stockActual = Number(product.stock_total ?? 0);

  const handleStartMovement = (tipo: "INGRESO" | "SALIDA") => {
    setSelectedMovementTipo(tipo);
    setSelectorOpen(true);
  };

  const handleGoToFullInventory = () => {
    onOpenChange(false);
    router.push(`/inventario?sku=${encodeURIComponent(product.producto)}`);
  };

  const selectorProduct: SelectorProduct = {
    producto: product.producto,
    glosa: product.glosa,
    unidad: product.unidad || "UND",
    stock_actual: stockActual,
    rack: product.rack || "",
    lote: product.lote || "",
  };

  return (
    <>
      <Sheet open={open} onOpenChange={onOpenChange}>
        <SheetContent
          side="right"
          hideCloseButton={true}
          className="w-full sm:max-w-xl md:max-w-2xl p-0 flex flex-col h-full bg-background border-l border-border/60 shadow-2xl z-50 fixed inset-0 sm:inset-y-0 sm:left-auto"
        >
          {/* HEADER DEL DETALLE CON BOTÓN DE RETROCESO GRANDE */}
          <SheetHeader className="p-4 sm:p-5 border-b border-border/50 bg-secondary/15">
            <div className="flex items-center justify-between gap-3">
              <div className="flex items-center gap-3 min-w-0">
                <Button
                  type="button"
                  variant="ghost"
                  size="icon"
                  onClick={() => onOpenChange(false)}
                  className="h-10 w-10 rounded-xl bg-background border border-border/60 hover:bg-secondary shrink-0"
                  title="Regresar"
                >
                  <ArrowLeft className="h-5 w-5 text-foreground" />
                </Button>

                <div className="min-w-0">
                  <div className="flex items-center gap-2">
                    <span className="font-mono text-xs font-bold text-primary bg-primary/10 border border-primary/20 px-2 py-0.5 rounded-lg">
                      {product.producto}
                    </span>
                    {product.familia && (
                      <Badge variant="outline" className="text-[10px] truncate max-w-[120px]">
                        {product.familia}
                      </Badge>
                    )}
                  </div>
                  <SheetTitle className="text-sm sm:text-base font-bold tracking-tight text-foreground line-clamp-1 mt-0.5">
                    {product.glosa}
                  </SheetTitle>
                </div>
              </div>

              {isAdmin && onEdit && (
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={() => {
                    onOpenChange(false);
                    onEdit(product);
                  }}
                  className="h-8 px-2.5 text-xs font-semibold rounded-xl shrink-0"
                  title="Editar datos maestros"
                >
                  <Edit3 className="h-3.5 w-3.5 mr-1 text-primary" />
                  Editar
                </Button>
              )}
            </div>
          </SheetHeader>

          {/* CUERPO DEL DETALLE (SCROLL COMPLETO) */}
          <div className="flex-1 overflow-y-auto p-4 sm:p-6 space-y-5">
            {/* NOMBRE COMPLETO */}
            <div className="p-4 rounded-2xl bg-secondary/20 border border-border/40 space-y-1">
              <span className="text-[10px] font-bold text-muted-foreground uppercase tracking-wider">
                Descripción Completa del Material
              </span>
              <p className="text-sm sm:text-base font-bold text-foreground leading-relaxed">
                {product.glosa}
              </p>
            </div>

            {/* METRICAS PRINCIPALES: STOCK Y UBICACIÓN */}
            <div className="grid grid-cols-2 gap-3">
              <Card className="border-border/60 shadow-xs bg-primary/5">
                <CardContent className="p-4 space-y-1">
                  <div className="flex items-center justify-between text-xs font-semibold text-primary">
                    <span>Stock Disponible</span>
                    <Package className="h-4 w-4" />
                  </div>
                  <div className="text-2xl sm:text-3xl font-black font-mono text-foreground">
                    {stockActual.toLocaleString()}
                    <span className="text-xs font-semibold text-muted-foreground ml-1.5">
                      {product.unidad || "UND"}
                    </span>
                  </div>
                </CardContent>
              </Card>

              <Card className="border-border/60 shadow-xs bg-secondary/30">
                <CardContent className="p-4 space-y-1">
                  <div className="flex items-center justify-between text-xs font-semibold text-muted-foreground">
                    <span>Ubicación en Bodega</span>
                    <MapPin className="h-4 w-4 text-primary" />
                  </div>
                  <div className="text-lg sm:text-xl font-black font-mono text-foreground truncate">
                    {product.rack || "Sin asignar"}
                  </div>
                </CardContent>
              </Card>
            </div>

            {/* ESPECIFICACIONES TÉCNICAS */}
            <div className="space-y-2.5">
              <span className="text-xs font-bold text-muted-foreground uppercase tracking-wider">
                Ficha Técnica del Material
              </span>
              <div className="rounded-2xl border border-border/50 bg-card overflow-hidden divide-y divide-border/40 text-xs">
                <div className="flex justify-between items-center p-3">
                  <span className="text-muted-foreground">Unidad de Medida (UM)</span>
                  <span className="font-bold text-foreground">{product.unidad || "UND"}</span>
                </div>

                {product.familia && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Familia</span>
                    <span className="font-semibold text-foreground">{product.familia}</span>
                  </div>
                )}

                {product.subfamilia && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Subfamilia</span>
                    <span className="font-semibold text-foreground">{product.subfamilia}</span>
                  </div>
                )}

                {product.tipo && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Tipo de Repuesto / Material</span>
                    <span className="font-semibold text-foreground">{product.tipo}</span>
                  </div>
                )}

                {product.peso > 0 && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground flex items-center gap-1.5">
                      <Scale className="h-3.5 w-3.5" /> Peso Unitario Estimado
                    </span>
                    <span className="font-mono font-bold text-foreground">{product.peso} kg</span>
                  </div>
                )}

                {product.tipo_acero && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Tipo de Acero</span>
                    <span className="font-semibold text-foreground">{product.tipo_acero}</span>
                  </div>
                )}

                {product.grado_acero && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Grado de Acero</span>
                    <span className="font-semibold text-foreground">{product.grado_acero}</span>
                  </div>
                )}

                {product.espesor_acero && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Espesor de Acero</span>
                    <span className="font-semibold text-foreground">{product.espesor_acero}</span>
                  </div>
                )}

                {product.costo_unitario > 0 && (
                  <>
                    <div className="flex justify-between items-center p-3 bg-emerald-500/5">
                      <span className="text-muted-foreground flex items-center gap-1.5 font-semibold">
                        <DollarSign className="h-3.5 w-3.5 text-emerald-600" /> Costo Unitario
                      </span>
                      <span className="font-mono font-bold text-xs sm:text-sm text-emerald-600 dark:text-emerald-400">
                        S/ {product.costo_unitario.toFixed(2)}
                      </span>
                    </div>

                    <div className="flex justify-between items-center p-3 bg-emerald-500/10 border-t border-emerald-500/20">
                      <div className="flex flex-col">
                        <span className="text-foreground flex items-center gap-1.5 font-bold text-xs">
                          <DollarSign className="h-3.5 w-3.5 text-emerald-600" /> Costo Valorizado Total
                        </span>
                        <span className="text-[10px] text-muted-foreground font-mono ml-5">
                          {stockActual} {product.unidad || "UND"} × S/ {product.costo_unitario.toFixed(2)}
                        </span>
                      </div>
                      <span className="font-mono font-black text-sm sm:text-base text-emerald-700 dark:text-emerald-300">
                        S/ {(product.costo_unitario * stockActual).toLocaleString("es-PE", {
                          minimumFractionDigits: 2,
                          maximumFractionDigits: 2,
                        })}
                      </span>
                    </div>
                  </>
                )}
              </div>
            </div>
          </div>

          {/* BARRA DE ACCIONES INFERIOR FIJA */}
          <div className="p-4 sm:p-6 border-t border-border/50 bg-secondary/15 space-y-2.5">
            <div className="grid grid-cols-2 gap-2.5">
              <Button
                type="button"
                onClick={() => handleStartMovement("INGRESO")}
                className="h-12 text-xs sm:text-sm font-bold gap-2 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white shadow-md shadow-emerald-600/20"
              >
                <Plus className="h-4 w-4" />
                Ingreso
              </Button>

              <Button
                type="button"
                onClick={() => handleStartMovement("SALIDA")}
                className="h-12 text-xs sm:text-sm font-bold gap-2 rounded-xl bg-rose-600 hover:bg-rose-700 text-white shadow-md shadow-rose-600/20"
              >
                <Minus className="h-4 w-4" />
                Salida
              </Button>
            </div>

            {/* BOTÓN INVENTARIAR / CONTEO FÍSICO COMPLETO */}
            <Button
              type="button"
              variant="outline"
              onClick={handleGoToFullInventory}
              className="w-full h-11 text-xs font-bold gap-2 rounded-xl border-primary/40 text-primary hover:bg-primary/10"
            >
              <ClipboardCheck className="h-4 w-4" />
              Inventariar / Conteo Físico Completo (Medidas, Peso y Foto)
            </Button>
          </div>
        </SheetContent>
      </Sheet>

      {/* SELECTOR DE CANTIDAD PARA AGREGAR AL VALE */}
      <QuantitySelectorDialog
        open={selectorOpen}
        onOpenChange={setSelectorOpen}
        product={selectorProduct}
        defaultTipo={selectedMovementTipo}
        onAdd={(prod, cant, tipo) => {
          if (onAddMovement) {
            const ok = onAddMovement(prod, cant, tipo);
            if (ok) {
              onOpenChange(false);
            }
            return ok;
          }
          return false;
        }}
      />
    </>
  );
}
