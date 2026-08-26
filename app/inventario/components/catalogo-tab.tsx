"use client";

import {
  Search,
  Package,
  RotateCcw,
  Barcode,
  Loader2,
  X,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import type { StockItem } from "../types";

interface CatalogoTabProps {
  catalogItems: StockItem[];
  loadingCatalog: boolean;
  loadingMore: boolean;
  hasMore: boolean;
  total: number;
  catalogSearch: string;
  setCatalogSearch: (v: string) => void;
  loadCatalog: (q?: string, pendingOnly?: boolean) => Promise<void>;
  loadMore: () => Promise<void>;
  onSelectStock: (item: StockItem) => void;
  pendingFilter: boolean;
  setPendingFilter: (v: boolean) => void;
}

function SkeletonCard() {
  return (
    <div className="p-3.5 space-y-2 animate-pulse">
      <div className="flex items-center justify-between">
        <div className="h-5 w-24 rounded bg-secondary" />
        <div className="h-5 w-20 rounded bg-secondary" />
      </div>
      <div className="h-4 w-3/4 rounded bg-secondary" />
      <div className="flex items-center justify-between">
        <div className="h-3 w-20 rounded bg-secondary" />
        <div className="h-3 w-12 rounded bg-secondary" />
      </div>
      <div className="h-8 rounded bg-secondary" />
    </div>
  );
}

export function CatalogoTab({
  catalogItems,
  loadingCatalog,
  loadingMore,
  hasMore,
  total,
  catalogSearch,
  setCatalogSearch,
  loadCatalog,
  loadMore,
  onSelectStock,
  pendingFilter,
  setPendingFilter,
}: CatalogoTabProps) {
  return (
    <Card className="border-border/60 shadow-xs">
      <CardHeader className="p-4 pb-3">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div>
            <CardTitle className="text-base font-bold flex items-center gap-2">
              <Package className="h-4 w-4 text-primary" />
              Catálogo de Existencias (Stock Flexline)
            </CardTitle>
            <CardDescription className="text-xs">
              {loadingCatalog
                ? "Cargando catálogo..."
                : `Mostrando ${catalogItems.length} de ${total} productos`}
            </CardDescription>
          </div>
          <Button
            type="button"
            variant="outline"
            size="sm"
            onClick={() => loadCatalog(catalogSearch, pendingFilter)}
            disabled={loadingCatalog}
            className="h-8 text-xs font-semibold gap-1.5 rounded-lg"
          >
            <RotateCcw className={`h-3.5 w-3.5 ${loadingCatalog ? "animate-spin" : ""}`} />
            Recargar
          </Button>
        </div>

        <div className="pt-2">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              value={catalogSearch}
              onChange={(e) => setCatalogSearch(e.target.value.toUpperCase())}
              onKeyDown={(e) => e.key === "Enter" && loadCatalog(catalogSearch, pendingFilter)}
              placeholder="Buscar en catálogo por código SKU, descripción o lote..."
              className="pl-9 h-10 text-xs rounded-xl bg-secondary/30"
            />
            {catalogSearch && (
              <button
                type="button"
                onClick={() => {
                  setCatalogSearch("");
                  loadCatalog("", pendingFilter);
                }}
                className="absolute right-3 top-1/2 -translate-y-1/2 p-1 text-muted-foreground hover:text-foreground"
              >
                <X className="h-3.5 w-3.5" />
              </button>
            )}
          </div>
          <div className="flex items-center gap-2 mt-3">
            <span className="text-[10px] font-bold uppercase text-muted-foreground">Filtro rápido:</span>
            <div className="flex items-center gap-1.5 p-1 bg-secondary/40 rounded-lg">
              <Button
                variant={!pendingFilter ? "default" : "ghost"}
                size="sm"
                onClick={() => {
                  setPendingFilter(false);
                  loadCatalog(catalogSearch, false);
                }}
                className={`h-7 px-3 text-[11px] rounded-md transition-all ${!pendingFilter ? "shadow-sm" : ""}`}
              >
                Todos
              </Button>
              <Button
                variant={pendingFilter ? "default" : "ghost"}
                size="sm"
                onClick={() => {
                  setPendingFilter(true);
                  loadCatalog(catalogSearch, true);
                }}
                className={`h-7 px-3 text-[11px] rounded-md transition-all ${pendingFilter ? "shadow-sm bg-slate-600 text-white hover:bg-slate-700" : ""}`}
              >
                Solo Pendientes
              </Button>
            </div>
          </div>
        </div>
      </CardHeader>

      <CardContent className="p-0">
        {loadingCatalog ? (
          <>
            <div className="md:hidden">
              {Array.from({ length: 4 }).map((_, i) => (
                <div key={i} className="border-b border-border/20">
                  <SkeletonCard />
                </div>
              ))}
            </div>
            <div className="hidden md:block py-12">
              <div className="flex flex-col items-center justify-center gap-3 text-muted-foreground">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
                <span className="text-sm font-medium">Cargando catálogo...</span>
              </div>
            </div>
          </>
        ) : catalogItems.length === 0 ? (
          <div className="py-16 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
            <Package className="h-8 w-8 opacity-30" />
            <span className="text-xs">No se encontraron productos en el catálogo.</span>
          </div>
        ) : (
          <>
            {/* MOBILE VIEW */}
            <div className="md:hidden divide-y divide-border/40">
              {catalogItems.map((item, i) => (
                <div key={`${item.producto}-${item.lote}-${i}`} className="p-3.5 space-y-2 hover:bg-secondary/20 transition">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-1.5 flex-wrap">
                      <span className="font-mono font-bold text-xs bg-secondary px-2 py-0.5 rounded border border-border/50">
                        {item.producto}
                      </span>
                      {item.ya_contado ? (
                        <span className="text-[10px] font-semibold px-2 py-0.5 rounded-md bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 border border-emerald-500/30">
                          ✓ Contado: {item.cantidad_fisica} {item.inventario_um || item.unidad}
                        </span>
                      ) : (
                        <span className="text-[10px] px-2 py-0.5 rounded-md text-muted-foreground border border-border/40">
                          Pendiente
                        </span>
                      )}
                    </div>
                    <span className="font-mono font-bold text-xs text-primary">
                      Stock: {item.stock} {item.unidad}
                    </span>
                  </div>
                  <div className="text-xs font-medium text-foreground">{item.glosa}</div>
                  <div className="flex items-center justify-between text-[11px] text-muted-foreground pt-1">
                    <span>
                      Lote: <strong className="font-mono text-foreground">{item.lote || "S/L"}</strong>
                    </span>
                    <span>{item.familia || "MRO"}</span>
                  </div>
                  <div className="pt-2">
                    <Button
                      type="button"
                      size="sm"
                      variant={item.ya_contado ? "secondary" : "default"}
                      onClick={() => onSelectStock(item)}
                      className="w-full h-9 text-xs font-bold gap-1.5 rounded-xl"
                    >
                      <Barcode className="h-3.5 w-3.5" />
                      {item.ya_contado ? "Editar conteo registrado" : "Contar este producto"}
                    </Button>
                  </div>
                </div>
              ))}
            </div>

            {/* DESKTOP VIEW */}
            <div className="hidden md:block overflow-x-auto">
              <table className="w-full text-xs">
                <thead className="bg-secondary/50 border-b border-border/50 sticky top-0 z-10 backdrop-blur-sm">
                  <tr>
                    <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Código SKU</th>
                    <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Descripción</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Lote</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Stock</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Estado</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Familia</th>
                    <th className="text-center py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Acción</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-border/30">
                  {catalogItems.map((item, i) => (
                    <tr key={`${item.producto}-${item.lote}-${i}`} className="hover:bg-secondary/20 transition">
                      <td className="py-2.5 px-4 font-mono font-bold text-foreground whitespace-nowrap">{item.producto}</td>
                      <td className="py-2.5 px-4 max-w-[280px] truncate font-medium" title={item.glosa}>
                        {item.glosa}
                      </td>
                      <td className="py-2.5 px-3 text-center font-mono text-[11px] text-muted-foreground">{item.lote || "-"}</td>
                      <td className="py-2.5 px-3 text-center font-mono font-bold text-primary">
                        {item.stock} <span className="font-normal text-muted-foreground text-[10px]">{item.unidad}</span>
                      </td>
                      <td className="py-2.5 px-3 text-center">
                        {item.ya_contado ? (
                          <span className="inline-block text-[10px] font-semibold px-2 py-0.5 rounded-md bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 border border-emerald-500/30 whitespace-nowrap">
                            ✓ {item.cantidad_fisica} {item.inventario_um || item.unidad}
                          </span>
                        ) : (
                          <span className="inline-block text-[10px] text-muted-foreground px-2 py-0.5 rounded-md border border-border/40 whitespace-nowrap">
                            Pendiente
                          </span>
                        )}
                      </td>
                      <td className="py-2.5 px-3 text-center text-[11px] text-muted-foreground">{item.familia || "-"}</td>
                      <td className="py-2.5 px-4 text-center">
                        <Button
                          type="button"
                          size="sm"
                          variant={item.ya_contado ? "secondary" : "default"}
                          onClick={() => onSelectStock(item)}
                          className="h-8 text-xs font-bold gap-1 rounded-lg px-3"
                        >
                          <Barcode className="h-3.5 w-3.5 mr-1" />
                          {item.ya_contado ? "Editar" : "Contar"}
                        </Button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            {/* LOAD MORE */}
            {hasMore && (
              <div className="p-4 flex justify-center">
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={loadMore}
                  disabled={loadingMore}
                  className="h-9 text-xs font-semibold gap-1.5 rounded-xl"
                >
                  {loadingMore ? (
                    <>
                      <Loader2 className="h-3.5 w-3.5 animate-spin" />
                      Cargando más...
                    </>
                  ) : (
                    <>
                      Cargar más ({catalogItems.length} de {total})
                    </>
                  )}
                </Button>
              </div>
            )}

            {!hasMore && catalogItems.length > 0 && (
              <div className="p-3 text-center text-[10px] text-muted-foreground border-t border-border/30">
                Todos los productos cargados ({catalogItems.length} de {total})
              </div>
            )}
          </>
        )}
      </CardContent>
    </Card>
  );
}
