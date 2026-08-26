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

  const loadKardex = useCallback(async () => {
    setLoading(true);
    try {
      const params = new URLSearchParams();
      if (filters.q) params.set("q", filters.q);
      if (filters.tipo) params.set("tipo", filters.tipo);
      if (filters.motivo) params.set("motivo", filters.motivo);
      if (filters.desde) params.set("desde", filters.desde);
      if (filters.hasta) params.set("hasta", filters.hasta);
      params.set("page", String(filters.page));
      params.set("limit", String(filters.limit));

      const res = await fetch(`/api/movimientos?${params.toString()}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      const data = await res.json();
      if (res.ok) {
        setMovimientos(data.movimientos || []);
        setTotal(data.total || 0);
        if (data.stats) setStats(data.stats);
      }
    } catch {
      // error handling
    } finally {
      setLoading(false);
    }
  }, [filters, token]);

  useEffect(() => {
    loadKardex();
  }, [loadKardex]);

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
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-3.5">
        <Card className="border-border/60 shadow-xs bg-emerald-500/5">
          <CardContent className="p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-emerald-600 dark:text-emerald-400">
              <span>Total Ingresos (+)</span>
              <ArrowDownCircle className="h-4 w-4" />
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-2xl sm:text-3xl font-black font-mono text-foreground">
                {stats.ingresos_count}
              </span>
              <span className="text-xs text-muted-foreground">
                ({stats.total_unidades_ingresadas.toLocaleString()} unds)
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs bg-rose-500/5">
          <CardContent className="p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-rose-600 dark:text-rose-400">
              <span>Total Salidas (-)</span>
              <ArrowUpCircle className="h-4 w-4" />
            </div>
            <div className="mt-2 flex items-baseline gap-2">
              <span className="text-2xl sm:text-3xl font-black font-mono text-foreground">
                {stats.salidas_count}
              </span>
              <span className="text-xs text-muted-foreground">
                ({stats.total_unidades_salidas.toLocaleString()} unds)
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs bg-primary/5">
          <CardContent className="p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-primary">
              <span>Movimientos Totales</span>
              <Package className="h-4 w-4" />
            </div>
            <div className="mt-2">
              <span className="text-2xl sm:text-3xl font-black font-mono text-foreground">
                {total}
              </span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 shadow-xs flex items-center justify-center p-3 bg-emerald-500/5">
          <Button
            type="button"
            onClick={handleExportExcel}
            disabled={exporting}
            className="w-full h-full min-h-[56px] text-xs font-bold gap-2 rounded-xl bg-emerald-600 hover:bg-emerald-700 text-white shadow-md shadow-emerald-600/20"
          >
            {exporting ? (
              <Loader2 className="animate-spin h-4 w-4" />
            ) : (
              <FileSpreadsheet className="h-4 w-4" />
            )}
            Exportar a Excel (.xlsx)
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
            <select
              value={filters.tipo}
              onChange={(e) =>
                setFilters((prev) => ({ ...prev, tipo: e.target.value, page: 1 }))
              }
              className="h-10 px-3 text-xs rounded-xl bg-background border border-input focus:ring-2 focus:ring-primary/40"
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
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <div className="overflow-x-auto">
          <table className="w-full text-xs text-left border-collapse">
            <thead>
              <tr className="bg-secondary/40 border-b border-border text-[11px] font-bold text-muted-foreground uppercase tracking-wider">
                <th className="p-3.5">Fecha / Hora</th>
                <th className="p-3.5">Tipo</th>
                <th className="p-3.5">SKU / Código</th>
                <th className="p-3.5">Descripción del Material</th>
                <th className="p-3.5">Motivo</th>
                <th className="p-3.5 text-right">Cantidad</th>
                <th className="p-3.5 text-right">Stock Ant.</th>
                <th className="p-3.5 text-right">Stock Resultante</th>
                <th className="p-3.5">Doc. Ref / Solicitante</th>
                <th className="p-3.5">Registrado Por</th>
                <th className="p-3.5 text-center">Foto</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-border/60">
              {loading ? (
                <tr>
                  <td colSpan={11} className="p-10 text-center text-muted-foreground">
                    <Loader2 className="animate-spin h-6 w-6 mx-auto mb-2 text-primary" />
                    Cargando movimientos del Kardex...
                  </td>
                </tr>
              ) : movimientos.length === 0 ? (
                <tr>
                  <td colSpan={11} className="p-10 text-center text-muted-foreground">
                    <Package className="h-8 w-8 mx-auto mb-2 opacity-50" />
                    No se encontraron transacciones con los filtros seleccionados.
                  </td>
                </tr>
              ) : (
                movimientos.map((m) => (
                  <tr key={m.id} className="hover:bg-secondary/20 transition-colors">
                    <td className="p-3.5 whitespace-nowrap font-mono text-[11px] text-muted-foreground">
                      {m.created_at}
                    </td>

                    <td className="p-3.5 whitespace-nowrap">
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

                    <td className="p-3.5 whitespace-nowrap font-mono font-bold text-foreground">
                      {m.producto}
                      {m.lote && (
                        <span className="text-[10px] text-muted-foreground font-normal ml-1.5">
                          ({m.lote})
                        </span>
                      )}
                    </td>

                    <td className="p-3.5 min-w-[220px]">
                      <span className="line-clamp-2 font-medium text-foreground">{m.descripcion}</span>
                    </td>

                    <td className="p-3.5 whitespace-nowrap font-medium text-foreground">
                      {m.motivo}
                    </td>

                    <td className="p-3.5 text-right whitespace-nowrap font-mono font-black text-sm">
                      <span
                        className={
                          m.tipo === "INGRESO"
                            ? "text-emerald-600 dark:text-emerald-400"
                            : "text-rose-600 dark:text-rose-400"
                        }
                      >
                        {m.tipo === "INGRESO" ? `+${m.cantidad}` : `-${m.cantidad}`}
                      </span>{" "}
                      <span className="text-[10px] font-normal text-muted-foreground">
                        {m.unidad || "UND"}
                      </span>
                    </td>

                    <td className="p-3.5 text-right whitespace-nowrap font-mono text-muted-foreground">
                      {m.stock_anterior}
                    </td>

                    <td className="p-3.5 text-right whitespace-nowrap font-mono font-black text-foreground">
                      {m.stock_resultante}
                    </td>

                    <td className="p-3.5 min-w-[160px]">
                      {m.documento_referencia && (
                        <div className="font-mono font-bold text-primary line-clamp-1">
                          {m.documento_referencia}
                        </div>
                      )}
                      {m.solicitante && (
                        <div className="text-[11px] text-muted-foreground line-clamp-1">
                          {m.solicitante}
                        </div>
                      )}
                    </td>

                    <td className="p-3.5 whitespace-nowrap text-muted-foreground text-[11px]">
                      {m.usuario_nombre || "Sistema"}
                    </td>

                    <td className="p-3.5 text-center whitespace-nowrap">
                      {m.foto_path ? (
                        <button
                          type="button"
                          onClick={() => setSelectedPhoto(m.foto_path || null)}
                          className="p-1.5 text-primary hover:bg-primary/10 rounded-lg transition-colors"
                          title="Ver Foto de Sustento / Guía"
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

        {total > filters.limit && (
          <div className="p-3.5 border-t border-border flex items-center justify-between text-xs text-muted-foreground">
            <span>
              Mostrando {movimientos.length} de {total} registros (Página {filters.page} de {totalPages})
            </span>
            <div className="flex items-center gap-1.5">
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={filters.page <= 1}
                onClick={() => setFilters((p) => ({ ...p, page: p.page - 1 }))}
                className="h-8 px-2.5 rounded-lg"
              >
                <ChevronLeft className="h-4 w-4" />
              </Button>
              <Button
                type="button"
                variant="outline"
                size="sm"
                disabled={filters.page >= totalPages}
                onClick={() => setFilters((p) => ({ ...p, page: p.page + 1 }))}
                className="h-8 px-2.5 rounded-lg"
              >
                <ChevronRight className="h-4 w-4" />
              </Button>
            </div>
          </div>
        )}
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
