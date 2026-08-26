"use client";

import React, { useState, useEffect, useCallback } from "react";
import {
  Search,
  Loader2,
  Package,
  ArrowDownCircle,
  ArrowUpCircle,
  ArrowRightLeft,
  X,
  ChevronLeft,
  ChevronRight,
  MapPin,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import type { StockItem } from "@/app/inventario/types";

interface StockConsolidadoTabProps {
  token: string;
  onSelectForMovement: (item: StockItem) => void;
}

export function StockConsolidadoTab({
  token,
  onSelectForMovement,
}: StockConsolidadoTabProps) {
  const [stockList, setStockList] = useState<StockItem[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(false);
  const [search, setSearch] = useState("");
  const [page, setPage] = useState(1);
  const limit = 30;

  const loadStock = useCallback(
    async (q = "", p = 1) => {
      setLoading(true);
      try {
        const res = await fetch(`/api/stock?q=${encodeURIComponent(q)}&page=${p}&limit=${limit}`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        const data = await res.json();
        if (res.ok) {
          setStockList(data.stock || []);
          setTotal(data.total || 0);
        }
      } catch {
        // error handling
      } finally {
        setLoading(false);
      }
    },
    [token]
  );

  useEffect(() => {
    loadStock(search, page);
  }, [loadStock, search, page]);

  const totalPages = Math.ceil(total / limit) || 1;

  return (
    <div className="space-y-4">
      {/* BUSCADOR */}
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-3 sm:p-4">
          <div className="relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              value={search}
              onChange={(e) => {
                const val = e.target.value.toUpperCase();
                setSearch(val);
                setPage(1);
              }}
              placeholder="Buscar por código SKU, descripción o lote..."
              className="pl-9 h-10 text-xs rounded-xl"
            />
            {search && (
              <button
                type="button"
                onClick={() => {
                  setSearch("");
                  setPage(1);
                }}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
              >
                <X className="h-3.5 w-3.5" />
              </button>
            )}
          </div>
        </CardContent>
      </Card>

      {/* TABLA DE STOCK CONSOLIDADO */}
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-xs text-left border-collapse">
            <thead>
              <tr className="bg-secondary/40 border-b border-border text-[11px] font-bold text-muted-foreground uppercase tracking-wider">
                <th className="p-3">SKU / Código</th>
                <th className="p-3">Descripción</th>
                <th className="p-3">Rack / Ubicación</th>
                <th className="p-3 text-right">Inventario Base</th>
                <th className="p-3 text-right text-emerald-600 dark:text-emerald-400">Ingresos (+)</th>
                <th className="p-3 text-right text-rose-600 dark:text-rose-400">Salidas (-)</th>
                <th className="p-3 text-right font-black">Stock Disponible</th>
                <th className="p-3 text-center">Acción</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border/60">
              {loading ? (
                <tr>
                  <td colSpan={8} className="p-8 text-center text-muted-foreground">
                    <Loader2 className="animate-spin h-6 w-6 mx-auto mb-2 text-primary" />
                    Cargando stock consolidado...
                  </td>
                </tr>
              ) : stockList.length === 0 ? (
                <tr>
                  <td colSpan={8} className="p-8 text-center text-muted-foreground">
                    <Package className="h-8 w-8 mx-auto mb-2 opacity-50" />
                    No se encontraron productos en el catálogo.
                  </td>
                </tr>
              ) : (
                stockList.map((item) => {
                  const base = item.cantidad_fisica ?? item.stock ?? 0;
                  const ingresos = item.total_ingresos ?? 0;
                  const salidas = item.total_salidas ?? 0;
                  const disponible = item.stock_disponible ?? (base + ingresos - salidas);

                  return (
                    <tr key={`${item.producto}-${item.lote || ""}`} className="hover:bg-secondary/20 transition-colors">
                      <td className="p-3 whitespace-nowrap font-mono font-bold text-foreground">
                        {item.producto}
                        {item.lote && (
                          <span className="text-[10px] text-muted-foreground font-normal ml-1.5">
                            ({item.lote})
                          </span>
                        )}
                      </td>

                      <td className="p-3 min-w-[200px]">
                        <span className="line-clamp-1 font-medium">{item.glosa}</span>
                      </td>

                      <td className="p-3 whitespace-nowrap text-muted-foreground">
                        {item.rack ? (
                          <div className="flex items-center gap-1 font-mono text-[11px]">
                            <MapPin className="h-3 w-3 text-primary" />
                            {item.rack}
                          </div>
                        ) : (
                          "—"
                        )}
                      </td>

                      <td className="p-3 text-right whitespace-nowrap font-mono text-muted-foreground">
                        {base} {item.inventario_um || item.unidad || "UND"}
                      </td>

                      <td className="p-3 text-right whitespace-nowrap font-mono font-semibold text-emerald-600 dark:text-emerald-400">
                        {ingresos > 0 ? `+${ingresos}` : "0"}
                      </td>

                      <td className="p-3 text-right whitespace-nowrap font-mono font-semibold text-rose-600 dark:text-rose-400">
                        {salidas > 0 ? `-${salidas}` : "0"}
                      </td>

                      <td className="p-3 text-right whitespace-nowrap font-mono font-black text-sm text-foreground">
                        <span
                          className={`px-2 py-0.5 rounded-md ${
                            disponible > 0
                              ? "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400"
                              : "bg-rose-500/10 text-rose-600 dark:text-rose-400"
                          }`}
                        >
                          {disponible} {item.inventario_um || item.unidad || "UND"}
                        </span>
                      </td>

                      <td className="p-3 text-center whitespace-nowrap">
                        <Button
                          type="button"
                          variant="ghost"
                          size="sm"
                          onClick={() => onSelectForMovement(item)}
                          className="h-8 text-xs font-semibold text-primary hover:bg-primary/10 gap-1 rounded-lg"
                        >
                          <ArrowRightLeft className="h-3.5 w-3.5" />
                          Mover
                        </Button>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>

        {/* PAGINACIÓN */}
        {total > limit && (
          <div className="p-3 border-t border-border flex items-center justify-between text-xs text-muted-foreground">
            <span>
              Mostrando {stockList.length} de {total} productos (Página {page} de {totalPages})
            </span>
            <div className="flex items-center gap-1.5">
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={page <= 1}
                onClick={() => setPage((p) => p - 1)}
                className="h-8 px-2.5 rounded-lg"
              >
                <ChevronLeft className="h-4 w-4" />
              </Button>
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={page >= totalPages}
                onClick={() => setPage((p) => p + 1)}
                className="h-8 px-2.5 rounded-lg"
              >
                <ChevronRight className="h-4 w-4" />
              </Button>
            </div>
          </div>
        )}
      </Card>
    </div>
  );
}
