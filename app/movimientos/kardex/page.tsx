"use client";

import React, { useState, useEffect, useCallback } from "react";
import {
  ArrowDownCircle,
  ArrowUpCircle,
  Search,
  Download,
  Package,
  Image as ImageIcon,
  X,
  ChevronLeft,
  ChevronRight,
  ExternalLink,
  History,
  Loader2,
  FileSpreadsheet,
  Calendar,
  Filter,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { DatePicker } from "@/components/ui/date-picker";
import { TableLoadMore } from "@/components/ui/table-load-more";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { useAuth } from "@/app/inventario/hooks/use-auth";
import type { MovimientoItem, MovimientosStats, MovimientosFilter } from "../types";

export default function KardexPage() {
  const { token } = useAuth();
  const [movimientos, setMovimientos] = useState<MovimientoItem[]>([]);
  const [total, setTotal] = useState(0);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [exporting, setExporting] = useState(false);
  const [selectedPhoto, setSelectedPhoto] = useState<string | null>(null);

  const [stats, setStats] = useState<MovimientosStats>({
    ingresos_count: 0,
    salidas_count: 0,
    total_unidades_ingresadas: 0,
    total_unidades_salidas: 0,
  });

  const [filters, setFilters] = useState<MovimientosFilter>({
    q: "",
    tipo: "",
    motivo: "",
    desde: "",
    hasta: "",
    page: 1,
    limit: 50,
  });

  const loadKardex = useCallback(async (pageNum = 1, append = false) => {
    if (pageNum === 1) setLoading(true);
    else setLoadingMore(true);

    try {
      const params = new URLSearchParams();
      if (filters.q) params.set("q", filters.q);
      if (filters.tipo) params.set("tipo", filters.tipo);
      if (filters.motivo) params.set("motivo", filters.motivo);
      if (filters.desde) params.set("desde", filters.desde);
      if (filters.hasta) params.set("hasta", filters.hasta);
      params.set("page", String(pageNum));
      params.set("limit", "50");

      const res = await fetch(`/api/movimientos?${params.toString()}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      const data = await res.json();
      if (res.ok) {
        if (append) {
          setMovimientos((prev) => [...prev, ...(data.movimientos || [])]);
        } else {
          setMovimientos(data.movimientos || []);
        }
        setTotal(data.total || 0);
        if (data.stats) setStats(data.stats);
      }
    } catch {
      // error handling
    } finally {
      setLoading(false);
      setLoadingMore(false);
    }
  }, [filters.q, filters.tipo, filters.motivo, filters.desde, filters.hasta, token]);

  useEffect(() => {
    setFilters((prev) => ({ ...prev, page: 1 }));
    loadKardex(1, false);
  }, [loadKardex]);

  const handleLoadMore = () => {
    const nextPage = filters.page + 1;
    setFilters((prev) => ({ ...prev, page: nextPage }));
    loadKardex(nextPage, true);
  };

  const handleExportExcel = async () => {
    setExporting(true);
    try {
      const params = new URLSearchParams();
      if (filters.q) params.set("q", filters.q);
      if (filters.tipo) params.set("tipo", filters.tipo);
      if (filters.desde) params.set("desde", filters.desde);
      if (filters.hasta) params.set("hasta", filters.hasta);

      window.open(`/api/movimientos/export?${params.toString()}`, "_blank");
    } finally {
      setTimeout(() => setExporting(false), 1500);
    }
  };

  const totalPages = Math.ceil(total / filters.limit) || 1;

  return (
    <div className="w-full min-w-0 space-y-4">
      {/* SUMMARY METRICS CARDS (FULL-WIDTH 4 COLUMNS) */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-2 sm:gap-3">
        <Card className="border-border/60 shadow-xs bg-emerald-500/5">
          <CardContent className="p-3">
            <div className="flex items-center justify-between text-xs font-semibold text-emerald-600 dark:text-emerald-400">
              <span>Total Ingresos (+)</span>
              <ArrowDownCircle className="h-4 w-4" />
            </div>
            <div className="mt-1.5 flex items-baseline gap-1.5">
              <span className="text-xl sm:text-2xl font-black font-mono text-foreground">
                {stats.ingresos_count}
              </span>
              <span className="text-[10px] sm:text-xs text-muted-foreground">
                ({stats.total_unidades_ingresadas.toLocaleString()} unds)
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs bg-rose-500/5">
          <CardContent className="p-3">
            <div className="flex items-center justify-between text-xs font-semibold text-rose-600 dark:text-rose-400">
              <span>Total Salidas (-)</span>
              <ArrowUpCircle className="h-4 w-4" />
            </div>
            <div className="mt-1.5 flex items-baseline gap-1.5">
              <span className="text-xl sm:text-2xl font-black font-mono text-foreground">
                {stats.salidas_count}
              </span>
              <span className="text-[10px] sm:text-xs text-muted-foreground">
                ({stats.total_unidades_salidas.toLocaleString()} unds)
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs bg-primary/5">
          <CardContent className="p-3">
            <div className="flex items-center justify-between text-xs font-semibold text-primary">
              <span>Movimientos Totales</span>
              <Package className="h-4 w-4" />
            </div>
            <div className="mt-1.5">
              <span className="text-xl sm:text-2xl font-black font-mono text-foreground">
                {total}
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs flex items-center justify-center p-2.5 bg-emerald-500/5">
          <Button
            type="button"
            onClick={handleExportExcel}
            disabled={exporting}
            className="w-full h-full min-h-[44px] text-xs font-bold gap-2 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white shadow-sm"
          >
            {exporting ? (
              <Loader2 className="animate-spin h-4 w-4" />
            ) : (
              <FileSpreadsheet className="h-4 w-4" />
            )}
            <span className="hidden sm:inline">Exportar a Excel</span>
            <span className="sm:hidden">Exportar</span>
          </Button>
        </Card>
      </div>

      {/* FILTROS FULL-WIDTH */}
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-3.5 sm:p-4">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-3">
            {/* Buscador General */}
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
              <Input
                value={filters.q}
                onChange={(e) =>
                  setFilters((prev) => ({
                    ...prev,
                    q: e.target.value.toUpperCase(),
                    page: 1,
                  }))
                }
                placeholder="Buscar SKU, descripción, guía o solicitante..."
                className="pl-9 pr-8 h-10 text-xs rounded-xl"
              />
              {filters.q && (
                <button
                  type="button"
                  onClick={() => setFilters((p) => ({ ...p, q: "", page: 1 }))}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                >
                  <X className="h-3.5 w-3.5" />
                </button>
              )}
            </div>

            {/* Tipo */}
            <Select
              value={filters.tipo || "ALL"}
              onValueChange={(val) =>
                setFilters((prev) => ({ ...prev, tipo: val === "ALL" ? "" : val, page: 1 }))
              }
            >
              <SelectTrigger className="h-10 px-3 text-xs rounded-xl bg-background border border-input focus:ring-2 focus:ring-primary/40">
                <SelectValue placeholder="Todos los Tipos" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="ALL">Todos los Tipos (Ingresos y Salidas)</SelectItem>
                <SelectItem value="INGRESO">Solo Ingresos (+)</SelectItem>
                <SelectItem value="SALIDA">Solo Salidas (-)</SelectItem>
                <SelectItem value="AJUSTE">Solo Ajustes (≡)</SelectItem>
              </SelectContent>
            </Select>

            {/* Fecha Desde */}
            <div>
              <DatePicker
                value={filters.desde}
                onChange={(val) =>
                  setFilters((prev) => ({ ...prev, desde: val, page: 1 }))
                }
                placeholder="Desde: dd/mm/aaaa"
                title="Fecha Desde"
              />
            </div>

            {/* Fecha Hasta */}
            <div>
              <DatePicker
                value={filters.hasta}
                onChange={(val) =>
                  setFilters((prev) => ({ ...prev, hasta: val, page: 1 }))
                }
                placeholder="Hasta: dd/mm/aaaa"
                title="Fecha Hasta"
              />
            </div>
          </div>
        </CardContent>
      </Card>

      {/* TABLA DE AUDITORÍA FULL-WIDTH */}
      {/* TABLA PRINCIPAL DEL KARDEX ESTANDARIZADA */}
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <CardContent className="p-0">
          {loading ? (
            <div className="p-12 text-center text-muted-foreground">
              <Loader2 className="animate-spin h-7 w-7 mx-auto mb-2 text-primary" />
              <p className="text-xs font-semibold">Cargando movimientos del Kardex...</p>
            </div>
          ) : movimientos.length === 0 ? (
            <div className="p-12 text-center space-y-2">
              <Package className="h-10 w-10 text-muted-foreground/40 mx-auto" />
              <p className="text-sm font-semibold text-foreground">No se encontraron transacciones</p>
              <p className="text-xs text-muted-foreground">Prueba ajustando el rango de fechas o los filtros</p>
            </div>
          ) : (
            <>
              {/* VISTA MÓVIL (CARDS INTERACTIVAS) */}
              <div className="block sm:hidden divide-y divide-border/40">
                {movimientos.map((m) => {
                  const isIngreso = m.tipo === "INGRESO";
                  return (
                    <div key={m.id} className="p-3.5 space-y-2.5 hover:bg-secondary/20 transition-colors">
                      <div className="flex items-center justify-between gap-2">
                        <div className="flex items-center gap-1.5 min-w-0">
                          <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                            {m.producto}
                          </span>
                          <Badge
                            className={`text-[10px] py-0.5 px-2 font-bold border-none ${
                              isIngreso
                                ? "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400"
                                : "bg-rose-500/10 text-rose-600 dark:text-rose-400"
                            }`}
                          >
                            {isIngreso ? "+ INGRESO" : "- SALIDA"}
                          </Badge>
                        </div>

                        <div className="text-right font-mono font-black text-sm shrink-0">
                          <span className={isIngreso ? "text-emerald-600 dark:text-emerald-400" : "text-rose-600 dark:text-rose-400"}>
                            {isIngreso ? `+${m.cantidad}` : `-${m.cantidad}`}
                          </span>{" "}
                          <span className="text-[10px] font-normal text-muted-foreground">
                            {m.unidad || "UND"}
                          </span>
                        </div>
                      </div>

                      <div className="text-xs font-bold text-foreground line-clamp-2 leading-relaxed">
                        {m.descripcion}
                      </div>

                      <div className="flex items-center justify-between pt-1 text-[11px] text-muted-foreground">
                        <div className="flex items-center gap-2 truncate max-w-[200px]">
                          <span className="truncate">{m.motivo || "General"}</span>
                          {m.solicitante && <span className="text-[10px] font-medium opacity-80 truncate">({m.solicitante})</span>}
                        </div>

                        <div className="flex items-center gap-2 font-mono text-[10px] shrink-0">
                          <span>Saldo: <strong className="text-foreground">{m.stock_resultante}</strong></span>
                          {m.foto_path && (
                            <button
                              type="button"
                              onClick={() => setSelectedPhoto(m.foto_path || null)}
                              className="p-1 text-primary hover:bg-primary/10 rounded"
                            >
                              <ImageIcon className="h-3.5 w-3.5" />
                            </button>
                          )}
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>

              {/* VISTA DESKTOP (TABLA CORPORATIVA) */}
              <div className="hidden sm:block overflow-x-auto">
                <table className="w-full text-left text-xs border-collapse">
                  <thead className="bg-secondary/30 text-muted-foreground uppercase text-[10px] font-bold tracking-wider border-b border-border/50">
                    <tr>
                      <th className="py-3 px-4">Fecha / Hora</th>
                      <th className="py-3 px-3 text-center">Tipo</th>
                      <th className="py-3 px-3">SKU / Código</th>
                      <th className="py-3 px-4">Descripción del Material</th>
                      <th className="py-3 px-3">Motivo</th>
                      <th className="py-3 px-3 text-right">Cantidad</th>
                      <th className="py-3 px-3 text-right">Stock Ant.</th>
                      <th className="py-3 px-3 text-right">Stock Result.</th>
                      <th className="py-3 px-3">Doc. Ref / Solicitante</th>
                      <th className="py-3 px-3">Registrado Por</th>
                      <th className="py-3 px-3 text-center">Foto</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-border/40 font-medium">
                    {movimientos.map((m) => {
                      const isIngreso = m.tipo === "INGRESO";
                      return (
                        <tr key={m.id} className="hover:bg-secondary/20 transition-colors">
                          <td className="py-2.5 px-4 font-mono text-[11px] text-muted-foreground whitespace-nowrap">
                            {m.created_at}
                          </td>
                          <td className="py-2.5 px-3 text-center whitespace-nowrap">
                            <Badge
                              className={`text-[10px] py-0.5 px-2 font-bold border-none ${
                                isIngreso
                                  ? "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400"
                                  : "bg-rose-500/10 text-rose-600 dark:text-rose-400"
                              }`}
                            >
                              {isIngreso ? "+ INGRESO" : "- SALIDA"}
                            </Badge>
                          </td>
                          <td className="py-2.5 px-3 font-mono font-bold text-primary whitespace-nowrap">
                            {m.producto}
                          </td>
                          <td className="py-2.5 px-4 font-bold text-foreground max-w-sm truncate" title={m.descripcion}>
                            {m.descripcion}
                          </td>
                          <td className="py-2.5 px-3 text-muted-foreground truncate max-w-[140px]">
                            {m.motivo || "-"}
                          </td>
                          <td className="py-2.5 px-3 text-right font-mono font-bold whitespace-nowrap">
                            <span className={isIngreso ? "text-emerald-600 dark:text-emerald-400" : "text-rose-600 dark:text-rose-400"}>
                              {isIngreso ? `+${m.cantidad}` : `-${m.cantidad}`}
                            </span>{" "}
                            <span className="text-[10px] font-normal text-muted-foreground">
                              {m.unidad || "UND"}
                            </span>
                          </td>
                          <td className="py-2.5 px-3 text-right font-mono text-muted-foreground">
                            {m.stock_anterior}
                          </td>
                          <td className="py-2.5 px-3 text-right font-mono font-black text-foreground">
                            {m.stock_resultante}
                          </td>
                          <td className="py-2.5 px-3 text-muted-foreground truncate max-w-[150px]">
                            <div className="font-mono text-xs text-foreground font-semibold truncate">{m.documento_referencia || "-"}</div>
                            {m.solicitante && <div className="text-[10px] text-muted-foreground truncate">{m.solicitante}</div>}
                          </td>
                          <td className="py-2.5 px-3 text-muted-foreground text-[11px] truncate max-w-[120px]">
                            {m.usuario_nombre || "Sistema"}
                          </td>
                          <td className="py-2.5 px-3 text-center">
                            {m.foto_path ? (
                              <button
                                type="button"
                                onClick={() => setSelectedPhoto(m.foto_path || null)}
                                className="p-1.5 text-primary hover:bg-primary/10 rounded-lg transition-colors"
                                title="Ver foto de respaldo"
                              >
                                <ImageIcon className="h-4 w-4" />
                              </button>
                            ) : (
                              <span className="text-muted-foreground/40 text-[10px]">—</span>
                            )}
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>

              {/* PIE DE TABLA UNIFICADO (CARGAR 50 MÁS) */}
              <TableLoadMore
                currentCount={movimientos.length}
                totalCount={total}
                hasMore={movimientos.length < total}
                loadingMore={loadingMore}
                onLoadMore={handleLoadMore}
                itemName="movimientos"
              />
            </>
          )}
        </CardContent>
      </Card>

      {/* MODAL DE FOTO */}
      <Dialog open={Boolean(selectedPhoto)} onOpenChange={(open) => !open && setSelectedPhoto(null)}>
        <DialogContent className="max-w-lg p-4">
          <DialogHeader className="pb-2">
            <DialogTitle className="text-sm font-bold flex items-center gap-2">
              <ImageIcon className="h-4 w-4 text-primary" />
              Foto de Sustento / Guía Firmada
            </DialogTitle>
          </DialogHeader>
          {selectedPhoto && (
            <div className="space-y-3">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={selectedPhoto}
                alt="Sustento"
                className="w-full max-h-[70vh] object-contain rounded-xl border bg-black/5"
              />
              <div className="flex justify-end">
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={() => window.open(selectedPhoto, "_blank")}
                  className="gap-1.5 text-xs rounded-lg"
                >
                  <ExternalLink className="h-3.5 w-3.5" />
                  Abrir original en pestaña nueva
                </Button>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}
