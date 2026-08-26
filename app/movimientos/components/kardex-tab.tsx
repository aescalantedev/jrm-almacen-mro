"use client";

import React, { useState } from "react";
import {
  ArrowDownCircle,
  ArrowUpCircle,
  Sliders,
  Search,
  Download,
  Calendar,
  Filter,
  Loader2,
  Package,
  Image as ImageIcon,
  User,
  FileText,
  X,
  ChevronLeft,
  ChevronRight,
  ExternalLink,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { DatePicker } from "@/components/ui/date-picker";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import type { MovimientoItem, MovimientosStats, MovimientosFilter } from "../types";

interface KardexTabProps {
  movimientos: MovimientoItem[];
  total: number;
  loading: boolean;
  stats: MovimientosStats;
  filters: MovimientosFilter;
  setFilters: React.Dispatch<React.SetStateAction<MovimientosFilter>>;
  onRefresh: () => void;
  token: string;
}

export function KardexTab({
  movimientos,
  total,
  loading,
  stats,
  filters,
  setFilters,
  onRefresh,
  token,
}: KardexTabProps) {
  const [selectedPhoto, setSelectedPhoto] = useState<string | null>(null);

  const handleFilterChange = (key: keyof MovimientosFilter, value: string | number) => {
    setFilters((prev) => ({ ...prev, [key]: value, page: key === "page" ? Number(value) : 1 }));
  };

  const handleExportCSV = () => {
    const params = new URLSearchParams();
    if (filters.q) params.set("q", filters.q);
    if (filters.tipo) params.set("tipo", filters.tipo);
    if (filters.desde) params.set("desde", filters.desde);
    if (filters.hasta) params.set("hasta", filters.hasta);

    window.open(`/api/movimientos/export?${params.toString()}`, "_blank");
  };

  const totalPages = Math.ceil(total / filters.limit) || 1;

  return (
    <div className="space-y-4">
      {/* SUMMARY METRICS CARDS */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3">
        <Card className="border-border/60 shadow-xs bg-emerald-500/5">
          <CardContent className="p-3 sm:p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-emerald-600 dark:text-emerald-400">
              <span>Total Ingresos</span>
              <ArrowDownCircle className="h-4 w-4" />
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-xl sm:text-2xl font-bold font-mono text-foreground">
                {stats.ingresos_count}
              </span>
              <span className="text-xs text-muted-foreground">
                ({stats.total_unidades_ingresadas.toLocaleString()} unds)
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs bg-rose-500/5">
          <CardContent className="p-3 sm:p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-rose-600 dark:text-rose-400">
              <span>Total Salidas</span>
              <ArrowUpCircle className="h-4 w-4" />
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-xl sm:text-2xl font-bold font-mono text-foreground">
                {stats.salidas_count}
              </span>
              <span className="text-xs text-muted-foreground">
                ({stats.total_unidades_salidas.toLocaleString()} unds)
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs bg-primary/5">
          <CardContent className="p-3 sm:p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-primary">
              <span>Movimientos Totales</span>
              <Package className="h-4 w-4" />
            </div>
            <div className="mt-2">
              <span className="text-xl sm:text-2xl font-bold font-mono text-foreground">
                {total}
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs flex items-center justify-center p-3">
          <Button
            type="button"
            variant="outline"
            onClick={handleExportCSV}
            className="w-full h-full font-bold text-xs gap-2 rounded-xl border-border/80 hover:border-primary/50"
          >
            <Download className="h-4 w-4 text-primary" />
            Exportar Kardex (CSV/Excel)
          </Button>
        </Card>
      </div>

      {/* FILTROS DE BÚSQUEDA */}
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-3 sm:p-4 space-y-3">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-2.5">
            {/* Buscador General */}
            <div className="relative">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
              <Input
                value={filters.q}
                onChange={(e) => handleFilterChange("q", e.target.value.toUpperCase())}
                placeholder="SKU, descripción, guía o solicitante..."
                className="pl-9 h-10 text-xs rounded-xl"
              />
              {filters.q && (
                <button
                  type="button"
                  onClick={() => handleFilterChange("q", "")}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground"
                >
                  <X className="h-3.5 w-3.5" />
                </button>
              )}
            </div>

            {/* Tipo de Movimiento */}
            <select
              value={filters.tipo}
              onChange={(e) => handleFilterChange("tipo", e.target.value)}
              className="h-10 px-3 text-xs rounded-xl bg-background border border-input focus:outline-hidden focus:ring-2 focus:ring-primary/40"
            >
              <option value="">Todos los Tipos (Ingresos y Salidas)</option>
              <option value="INGRESO">Solo Ingresos (+)</option>
              <option value="SALIDA">Solo Salidas (-)</option>
              <option value="AJUSTE">Solo Ajustes (≡)</option>
            </select>

            {/* Fecha Desde */}
            <div>
              <DatePicker
                value={filters.desde}
                onChange={(val) => handleFilterChange("desde", val)}
                placeholder="Desde: dd/mm/aaaa"
                title="Fecha Desde"
              />
            </div>

            {/* Fecha Hasta */}
            <div>
              <DatePicker
                value={filters.hasta}
                onChange={(val) => handleFilterChange("hasta", val)}
                placeholder="Hasta: dd/mm/aaaa"
                title="Fecha Hasta"
              />
            </div>
          </div>
        </CardContent>
      </Card>

      {/* TABLA DE MOVIMIENTOS / KARDEX */}
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-xs text-left border-collapse">
            <thead>
              <tr className="bg-secondary/40 border-b border-border text-[11px] font-bold text-muted-foreground uppercase tracking-wider">
                <th className="p-3">Fecha / Hora</th>
                <th className="p-3">Tipo</th>
                <th className="p-3">SKU / Producto</th>
                <th className="p-3">Motivo</th>
                <th className="p-3 text-right">Cantidad</th>
                <th className="p-3 text-right">Stock Anterior</th>
                <th className="p-3 text-right">Stock Resultante</th>
                <th className="p-3">Doc. Ref / Solicitante</th>
                <th className="p-3">Registrado Por</th>
                <th className="p-3 text-center">Foto</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border/60">
              {loading ? (
                <tr>
                  <td colSpan={10} className="p-8 text-center text-muted-foreground">
                    <Loader2 className="animate-spin h-6 w-6 mx-auto mb-2 text-primary" />
                    Cargando movimientos del Kardex...
                  </td>
                </tr>
              ) : movimientos.length === 0 ? (
                <tr>
                  <td colSpan={10} className="p-8 text-center text-muted-foreground">
                    <Package className="h-8 w-8 mx-auto mb-2 opacity-50" />
                    No se encontraron movimientos registrados con los filtros aplicados.
                  </td>
                </tr>
              ) : (
                movimientos.map((m) => (
                  <tr key={m.id} className="hover:bg-secondary/20 transition-colors">
                    <td className="p-3 whitespace-nowrap font-mono text-[11px] text-muted-foreground">
                      {m.created_at}
                    </td>

                    <td className="p-3 whitespace-nowrap">
                      <Badge
                        variant={m.tipo === "SALIDA" ? "destructive" : "default"}
                        className={`text-[10px] py-0.5 px-2 font-bold ${
                          m.tipo === "INGRESO"
                            ? "bg-emerald-600 text-white"
                            : m.tipo === "SALIDA"
                              ? "bg-rose-500 text-white"
                              : "bg-primary text-primary-foreground"
                        }`}
                      >
                        {m.tipo === "INGRESO" ? "📥 INGRESO" : m.tipo === "SALIDA" ? "📤 SALIDA" : "⚖️ AJUSTE"}
                      </Badge>
                    </td>

                    <td className="p-3 min-w-[180px]">
                      <div className="font-mono font-bold text-foreground flex items-center gap-1.5">
                        {m.producto}
                        {m.lote && (
                          <span className="text-[10px] text-muted-foreground font-normal font-sans">
                            ({m.lote})
                          </span>
                        )}
                      </div>
                      <p className="text-[11px] text-muted-foreground line-clamp-1">
                        {m.descripcion}
                      </p>
                    </td>

                    <td className="p-3 whitespace-nowrap text-foreground font-medium">
                      {m.motivo}
                    </td>

                    <td className="p-3 text-right whitespace-nowrap font-mono font-bold text-sm">
                      <span className={m.tipo === "INGRESO" ? "text-emerald-600 dark:text-emerald-400" : "text-rose-600 dark:text-rose-400"}>
                        {m.tipo === "INGRESO" ? `+${m.cantidad}` : `-${m.cantidad}`}
                      </span>{" "}
                      <span className="text-[10px] font-normal text-muted-foreground">{m.unidad || "UND"}</span>
                    </td>

                    <td className="p-3 text-right whitespace-nowrap font-mono text-muted-foreground">
                      {m.stock_anterior}
                    </td>

                    <td className="p-3 text-right whitespace-nowrap font-mono font-bold text-foreground">
                      {m.stock_resultante}
                    </td>

                    <td className="p-3 min-w-[150px]">
                      {m.documento_referencia && (
                        <div className="font-mono font-semibold text-primary line-clamp-1">
                          {m.documento_referencia}
                        </div>
                      )}
                      {m.solicitante && (
                        <div className="text-[11px] text-muted-foreground line-clamp-1">
                          {m.solicitante}
                        </div>
                      )}
                    </td>

                    <td className="p-3 whitespace-nowrap text-muted-foreground text-[11px]">
                      {m.usuario_nombre || "Sistema"}
                    </td>

                    <td className="p-3 text-center whitespace-nowrap">
                      {m.foto_path ? (
                        <button
                          type="button"
                          onClick={() => setSelectedPhoto(m.foto_path || null)}
                          className="p-1 text-primary hover:text-primary/80 hover:bg-primary/10 rounded-md transition-colors"
                          title="Ver Foto de Sustento"
                        >
                          <ImageIcon className="h-4 w-4" />
                        </button>
                      ) : (
                        <span className="text-muted-foreground/40 text-[10px]">—</span>
                      )}
                    </td>
                  </tr>
                ))
              )}
            </tbody>
          </table>
        </div>

        {/* PAGINACIÓN */}
        {total > filters.limit && (
          <div className="p-3 border-t border-border flex items-center justify-between text-xs text-muted-foreground">
            <span>
              Mostrando {movimientos.length} de {total} registros (Página {filters.page} de {totalPages})
            </span>
            <div className="flex items-center gap-1.5">
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={filters.page <= 1}
                onClick={() => handleFilterChange("page", filters.page - 1)}
                className="h-8 px-2.5 rounded-lg"
              >
                <ChevronLeft className="h-4 w-4" />
              </Button>
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={filters.page >= totalPages}
                onClick={() => handleFilterChange("page", filters.page + 1)}
                className="h-8 px-2.5 rounded-lg"
              >
                <ChevronRight className="h-4 w-4" />
              </Button>
            </div>
          </div>
        )}
      </Card>

      {/* MODAL DE FOTO DE SUSTENTO */}
      <Dialog open={Boolean(selectedPhoto)} onOpenChange={(open) => !open && setSelectedPhoto(null)}>
        <DialogContent className="max-w-md p-4">
          <DialogHeader className="pb-2">
            <DialogTitle className="text-sm font-bold flex items-center gap-2">
              <ImageIcon className="h-4 w-4 text-primary" />
              Foto de Sustento / Guía
            </DialogTitle>
          </DialogHeader>
          {selectedPhoto && (
            <div className="space-y-3">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img
                src={selectedPhoto}
                alt="Foto Sustento"
                className="w-full max-h-[70vh] object-contain rounded-xl border border-border bg-black/5"
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
                  Abrir en pestaña nueva
                </Button>
              </div>
            </div>
          )}
        </DialogContent>
      </Dialog>
    </div>
  );
}
