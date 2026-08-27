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
  Building2,
  Boxes,
  Archive,
} from "lucide-react";
import { QuantitySelectorDialog, SelectorProduct } from "@/components/movimientos/quantity-selector-dialog";
import { QuickCountDialog, QuickCountProduct } from "./quick-count-dialog";

export interface MasterProduct {
  producto: string;
  glosa: string;
  unidad: string;
  grupo_articulo_id?: number;
  familia?: string;
  contenedor_id?: number;
  contenedor_nombre?: string;
  contenedor_codigo?: string;
  bodega_id?: number;
  bodega_nombre?: string;
  tipo_almacenamiento_id?: number;
  tipo_almacenamiento_nombre?: string;
  tipo_almacenamiento_codigo?: string;
  rack?: string;
  nivel_rack?: string;
  posicion_detalle?: string;
  almacenamiento_codigo?: string;
  costo_unitario: number;
  peso: number;
  stock_seguridad_min?: number;
  stock_maximo?: number;
  tipo_acero?: string;
  grado_acero?: string;
  espesor_acero?: string;
  stock_total?: number;
  lote?: string;
  foto_url?: string;
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
  onProductUpdated,
}: ProductDetailSheetProps) {
  const router = useRouter();
  const [selectorOpen, setSelectorOpen] = useState(false);
  const [selectedMovementTipo, setSelectedMovementTipo] = useState<"INGRESO" | "SALIDA">("SALIDA");
  const [quickCountOpen, setQuickCountOpen] = useState(false);

  if (!product) return null;

  const stockActual = Number(product.stock_total ?? 0);

  const handleStartMovement = (tipo: "INGRESO" | "SALIDA") => {
    setSelectedMovementTipo(tipo);
    setSelectorOpen(true);
  };

  const handleStartQuickCount = () => {
    setQuickCountOpen(true);
  };

  const selectorProduct: SelectorProduct = {
    producto: product.producto,
    glosa: product.glosa,
    unidad: product.unidad || "UND",
    stock_actual: stockActual,
    rack: product.rack || "",
    lote: product.lote || "",
  };

  const quickCountProduct: QuickCountProduct = {
    producto: product.producto,
    glosa: product.glosa,
    unidad: product.unidad || "UND",
    stock_actual: stockActual,
    rack: product.rack || "",
    posicion_detalle: product.posicion_detalle || "",
    lote: product.lote || "",
    foto_url: product.foto_url,
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
                      <Badge variant="outline" className="text-[10px] truncate max-w-[140px]">
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
                Descripción Completa del Material (SAP MAKTX)
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
                  {product.posicion_detalle && (
                    <div className="text-[11px] text-muted-foreground font-semibold truncate">
                      {product.posicion_detalle}
                    </div>
                  )}
                </CardContent>
              </Card>
            </div>

            {/* UBICACIÓN JERÁRQUICA SAP (BODEGA & CONTENEDOR) */}
            <div className="space-y-2.5">
              <span className="text-xs font-bold text-muted-foreground uppercase tracking-wider">
                Almacén & Depósito Físico (SAP LGORT / LGTYP)
              </span>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-2.5">
                <div className="p-3 rounded-xl border border-border/50 bg-card flex items-center gap-2.5">
                  <div className="h-8 w-8 rounded-lg bg-secondary flex items-center justify-center text-primary shrink-0">
                    <Building2 className="h-4 w-4" />
                  </div>
                  <div className="min-w-0">
                    <div className="text-[10px] text-muted-foreground uppercase font-bold">Bodega / Almacén</div>
                    <div className="text-xs font-bold text-foreground truncate">{product.bodega_nombre || "ALM MRO CHILCA"}</div>
                  </div>
                </div>

                <div className="p-3 rounded-xl border border-border/50 bg-card flex items-center gap-2.5">
                  <div className="h-8 w-8 rounded-lg bg-secondary flex items-center justify-center text-primary shrink-0">
                    <Boxes className="h-4 w-4" />
                  </div>
                  <div className="min-w-0">
                    <div className="text-[10px] text-muted-foreground uppercase font-bold">Contenedor / Zona</div>
                    <div className="text-xs font-bold text-foreground truncate">{product.contenedor_nombre || "Almacén Central"}</div>
                  </div>
                </div>
              </div>
            </div>

            {/* ESPECIFICACIONES TÉCNICAS */}
            <div className="space-y-2.5">
              <span className="text-xs font-bold text-muted-foreground uppercase tracking-wider">
                Ficha Técnica del Material (SAP MM)
              </span>
              <div className="rounded-2xl border border-border/50 bg-card overflow-hidden divide-y divide-border/40 text-xs">
                <div className="flex justify-between items-center p-3">
                  <span className="text-muted-foreground">Unidad de Medida (MEINS)</span>
                  <span className="font-bold text-foreground">{product.unidad || "UND"}</span>
                </div>

                {product.familia && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Grupo de Artículos (MATKL)</span>
                    <span className="font-semibold text-foreground">{product.familia}</span>
                  </div>
                )}

                {product.tipo_almacenamiento_nombre && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Formato de Almacenamiento (LETYP)</span>
                    <span className="font-semibold text-foreground">{product.tipo_almacenamiento_nombre}</span>
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

                {product.stock_seguridad_min !== undefined && product.stock_seguridad_min > 0 && (
                  <div className="flex justify-between items-center p-3">
                    <span className="text-muted-foreground">Stock de Seguridad Mínimo</span>
                    <span className="font-mono font-bold text-foreground">{product.stock_seguridad_min} {product.unidad || "UND"}</span>
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
                        <DollarSign className="h-3.5 w-3.5 text-emerald-600" /> Costo Unitario Actual (VERPR)
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

          {/* BARRA DE ACCIONES INFERIOR FIJA: 3 ACCIONES DEL OPERARIO */}
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

            {/* BOTÓN CONTEO RÁPIDO / INVENTARIO DIRECTO */}
            <Button
              type="button"
              variant="outline"
              onClick={handleStartQuickCount}
              className="w-full h-11 text-xs font-bold gap-2 rounded-xl border-primary/50 text-primary hover:bg-primary/10 shadow-xs"
            >
              <ClipboardCheck className="h-4 w-4" />
              Inventariar / Conteo Rápido con Cronómetro
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

      {/* MODAL DE CONTEO RÁPIDO DIRECTO */}
      <QuickCountDialog
        open={quickCountOpen}
        onOpenChange={setQuickCountOpen}
        product={quickCountProduct}
        onSaved={() => {
          if (onProductUpdated) onProductUpdated();
          onOpenChange(false);
        }}
      />
    </>
  );
}
