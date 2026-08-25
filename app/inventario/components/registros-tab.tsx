"use client";

import {
  Search,
  Edit3,
  Trash2,
  RotateCcw,
  ClipboardList,
  Layers,
  Plus,
  X,
  MapPin,
  FileSpreadsheet,
  Loader2,
} from "lucide-react";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { ObsBadge } from "./obs-badge";
import type { InventarioItem } from "../types";

interface RegistrosTabProps {
  registros: InventarioItem[];
  loadingRegistros: boolean;
  loadingMore: boolean;
  hasMore: boolean;
  total: number;
  recordFilterStatus: string;
  setRecordFilterStatus: (v: string) => void;
  recordSearchQuery: string;
  setRecordSearchQuery: (v: string) => void;
  loadRegistros: () => Promise<void>;
  loadMore: () => Promise<void>;
  editRecord: (item: InventarioItem) => void;
  deleteRecord: (id: number) => Promise<void>;
  onGoToConteo: () => void;
}

function SkeletonCard() {
  return (
    <div className="p-3.5 space-y-3 animate-pulse">
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-1.5">
          <div className="h-5 w-20 rounded bg-secondary" />
          <div className="h-5 w-14 rounded bg-secondary" />
        </div>
        <div className="h-4 w-16 rounded bg-secondary" />
      </div>
      <div className="h-4 w-3/4 rounded bg-secondary" />
      <div className="grid grid-cols-3 gap-2">
        <div className="h-10 rounded bg-secondary" />
        <div className="h-10 rounded bg-secondary" />
        <div className="h-10 rounded bg-secondary" />
      </div>
      <div className="h-4 w-1/2 rounded bg-secondary" />
    </div>
  );
}

export function RegistrosTab({
  registros,
  loadingRegistros,
  loadingMore,
  hasMore,
  total,
  recordFilterStatus,
  setRecordFilterStatus,
  recordSearchQuery,
  setRecordSearchQuery,
  loadRegistros,
  loadMore,
  editRecord,
  deleteRecord,
  onGoToConteo,
}: RegistrosTabProps) {
  return (
    <Card className="border-border/60 shadow-xs">
      <CardHeader className="p-4 pb-3">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div>
            <CardTitle className="text-base font-bold flex items-center gap-2">
              <ClipboardList className="h-4 w-4 text-primary" />
              Registros de Inventario
            </CardTitle>
            <CardDescription className="text-xs">
              {loadingRegistros
                ? "Cargando registros..."
                : `Mostrando ${registros.length} de ${total} registros`}
            </CardDescription>
          </div>
          <div className="flex items-center gap-2 flex-wrap">
            <Button
              type="button"
              variant="outline"
              size="sm"
              onClick={async () => {
                try {
                  const link = document.createElement("a");
                  link.href = "/api/inventario/export";
                  link.setAttribute("download", `Inventario_MRO_${new Date().toLocaleDateString("sv-SE")}.xlsx`);
                  document.body.appendChild(link);
                  link.click();
                  document.body.removeChild(link);
                  toast.success("Descargando Excel (.xlsx)");
                } catch {
                  toast.error("Error al exportar");
                }
              }}
              className="h-8 text-xs font-semibold gap-1.5 rounded-lg border-emerald-500/40 text-emerald-600 dark:text-emerald-400 hover:bg-emerald-500/10"
            >
              <FileSpreadsheet className="h-3.5 w-3.5" />
              Exportar Excel
            </Button>
            <Button
              type="button"
              variant="outline"
              size="sm"
              onClick={loadRegistros}
              disabled={loadingRegistros}
              className="h-8 text-xs font-semibold gap-1.5 rounded-lg"
            >
              <RotateCcw className={`h-3.5 w-3.5 ${loadingRegistros ? "animate-spin" : ""}`} />
              Actualizar
            </Button>
            <Button type="button" size="sm" onClick={onGoToConteo} className="h-8 text-xs font-bold gap-1.5 rounded-lg">
              <Plus className="h-3.5 w-3.5" />
              Nuevo Conteo
            </Button>
          </div>
        </div>

        <div className="flex flex-col sm:flex-row gap-2 pt-3">
          <div className="relative flex-1">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              value={recordSearchQuery}
              onChange={(e) => setRecordSearchQuery(e.target.value)}
              placeholder="Filtrar por SKU, nombre, rack, familia2..."
              className="pl-9 h-9 text-xs rounded-xl bg-secondary/30"
            />
            {recordSearchQuery && (
              <button
                type="button"
                onClick={() => setRecordSearchQuery("")}
                className="absolute right-2.5 top-1/2 -translate-y-1/2 p-1 text-muted-foreground hover:text-foreground"
              >
                <X className="h-3.5 w-3.5" />
              </button>
            )}
          </div>

          <div className="flex items-center gap-1.5 overflow-x-auto pb-1 sm:pb-0">
            <Button
              type="button"
              variant={recordFilterStatus === "TODOS" ? "default" : "outline"}
              size="sm"
              onClick={() => setRecordFilterStatus("TODOS")}
              className="h-9 text-xs px-3 rounded-xl shrink-0"
            >
              Todos
            </Button>
            <Button
              type="button"
              variant={recordFilterStatus === "OK" ? "default" : "outline"}
              size="sm"
              onClick={() => setRecordFilterStatus("OK")}
              className="h-9 text-xs px-3 rounded-xl shrink-0 text-emerald-600 dark:text-emerald-400"
            >
              OK
            </Button>
            <Button
              type="button"
              variant={recordFilterStatus === "FALTANTE" ? "default" : "outline"}
              size="sm"
              onClick={() => setRecordFilterStatus("FALTANTE")}
              className="h-9 text-xs px-3 rounded-xl shrink-0 text-rose-600 dark:text-rose-400"
            >
              Faltante
            </Button>
            <Button
              type="button"
              variant={recordFilterStatus === "SOBRANTE" ? "default" : "outline"}
              size="sm"
              onClick={() => setRecordFilterStatus("SOBRANTE")}
              className="h-9 text-xs px-3 rounded-xl shrink-0 text-amber-600 dark:text-amber-400"
            >
              Sobrante
            </Button>
          </div>
        </div>
      </CardHeader>

      <CardContent className="p-0">
        {loadingRegistros ? (
          <div className="md:hidden">
            {Array.from({ length: 4 }).map((_, i) => (
              <div key={i} className="border-b border-border/20">
                <SkeletonCard />
              </div>
            ))}
          </div>
        ) : registros.length === 0 ? (
          <div className="py-16 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
            <Layers className="h-8 w-8 opacity-30" />
            <span className="text-xs">
              {total === 0
                ? "Aún no hay registros de inventario guardados."
                : "No hay registros que coincidan con los filtros aplicados."}
            </span>
          </div>
        ) : (
          <>
            {/* MOBILE VIEW */}
            <div className="md:hidden divide-y divide-border/40">
              {registros.map((item) => (
                <div key={item.id} className="p-3.5 space-y-3 hover:bg-secondary/20 transition">
                  <div className="flex items-center justify-between">
                    <div className="flex items-center gap-1.5 flex-wrap">
                      <span className="font-mono font-bold text-xs bg-secondary px-2 py-0.5 rounded border border-border/50">
                        {item.producto}
                      </span>
                      <ObsBadge status={item.observacion} />
                      {item.familia2 && (
                        <Badge variant="outline" className="text-[10px]">
                          {item.familia2}
                        </Badge>
                      )}
                    </div>
                    <span className="text-[11px] text-muted-foreground font-mono">
                      {item.fecha_conteo || item.updated_at?.split("T")[0]}
                    </span>
                  </div>

                  <div className="text-xs font-semibold text-foreground">{item.descripcion}</div>

                  <div className="grid grid-cols-3 gap-2 p-2 rounded-xl bg-secondary/30 text-center text-xs">
                    <div>
                      <span className="text-[10px] text-muted-foreground uppercase block font-semibold">Sistema</span>
                      <span className="font-mono font-bold">
                        {item.stock_sistema} {item.um || item.unidad}
                      </span>
                    </div>
                    <div className="border-x border-border/40">
                      <span className="text-[10px] text-primary uppercase block font-bold">Físico</span>
                      <span className="font-mono font-black text-primary text-sm">{item.cantidad_fisica}</span>
                    </div>
                    <div>
                      <span className="text-[10px] text-muted-foreground uppercase block font-semibold">DIF</span>
                      <span
                        className={`font-mono font-bold ${
                          item.dif === 0
                            ? "text-emerald-600 dark:text-emerald-400"
                            : item.dif > 0
                              ? "text-amber-600 dark:text-amber-400"
                              : "text-rose-600 dark:text-rose-400"
                        }`}
                      >
                        {item.dif > 0 ? `+${item.dif}` : item.dif}
                      </span>
                    </div>
                  </div>

                  <div className="flex flex-wrap items-center justify-between gap-2 text-[11px] text-muted-foreground">
                    <div className="flex flex-wrap items-center gap-2">
                      <MapPin className="h-3 w-3 text-primary shrink-0" />
                      {item.rack && (
                        <span>
                          Rack: <strong className="text-foreground">{item.rack}</strong>
                        </span>
                      )}
                      {item.ubicacion_actual && (
                        <span>
                          Ubic: <strong className="text-foreground">{item.ubicacion_actual}</strong>
                        </span>
                      )}
                      {item.contenedor && (
                        <span>
                          Cont: <strong className="text-foreground">{item.contenedor}</strong>
                        </span>
                      )}
                    </div>
                    {item.presentacion && (
                      <span className="text-[10px] bg-secondary/60 px-1.5 py-0.5 rounded">{item.presentacion}</span>
                    )}
                  </div>

                  {item.comentario && (
                    <div className="text-[11px] text-muted-foreground italic bg-secondary/20 px-2 py-1 rounded">
                      {item.comentario}
                    </div>
                  )}

                  <div className="flex items-center justify-end gap-2 pt-1 border-t border-border/30">
                    <Button
                      type="button"
                      variant="outline"
                      size="sm"
                      onClick={() => editRecord(item)}
                      className="h-8 text-xs font-semibold rounded-lg gap-1.5"
                    >
                      <Edit3 className="h-3.5 w-3.5 text-primary" />
                      Editar Conteo
                    </Button>
                    <Button
                      type="button"
                      variant="ghost"
                      size="sm"
                      onClick={() => deleteRecord(item.id)}
                      className="h-8 text-xs text-rose-500 hover:text-rose-600 hover:bg-rose-500/10 rounded-lg px-2.5"
                    >
                      <Trash2 className="h-3.5 w-3.5" />
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
                    <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">SKU</th>
                    <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Descripción</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Familia 2</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Presentación</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Stock Sis.</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Físico</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">DIF</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Ubicación</th>
                    <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Estado</th>
                    <th className="text-center py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Acciones</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-border/30">
                  {registros.map((item) => (
                    <tr key={item.id} className="hover:bg-secondary/20 transition">
                      <td className="py-2.5 px-4 font-mono font-bold text-foreground whitespace-nowrap">{item.producto}</td>
                      <td className="py-2.5 px-4 max-w-[200px] truncate font-medium" title={item.descripcion}>
                        {item.descripcion}
                      </td>
                      <td className="py-2.5 px-3 text-center text-[11px] text-muted-foreground">{item.familia2 || "-"}</td>
                      <td className="py-2.5 px-3 text-center text-[11px] text-muted-foreground">{item.presentacion || "-"}</td>
                      <td className="py-2.5 px-3 text-center font-mono">
                        {item.stock_sistema} <span className="text-[10px] text-muted-foreground">{item.um || item.unidad}</span>
                      </td>
                      <td className="py-2.5 px-3 text-center font-mono font-bold text-primary text-sm">{item.cantidad_fisica}</td>
                      <td className="py-2.5 px-3 text-center">
                        <span
                          className={`font-mono font-bold px-2 py-0.5 rounded text-[11px] ${
                            item.dif === 0
                              ? "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400"
                              : item.dif > 0
                                ? "bg-amber-500/10 text-amber-600 dark:text-amber-400"
                                : "bg-rose-500/10 text-rose-600 dark:text-rose-400"
                          }`}
                        >
                          {item.dif > 0 ? `+${item.dif}` : item.dif}
                        </span>
                      </td>
                      <td className="py-2.5 px-3 text-center text-[11px] font-mono text-muted-foreground whitespace-nowrap">
                        {item.rack ? `R:${item.rack} ` : ""}
                        {item.ubicacion_actual || ""} {item.almacenamiento ? `| ${item.almacenamiento}` : ""}
                      </td>
                      <td className="py-2.5 px-3 text-center">
                        <ObsBadge status={item.observacion} />
                      </td>
                      <td className="py-2.5 px-4 text-center">
                        <div className="flex items-center justify-center gap-1">
                          <Button variant="ghost" size="icon" className="h-8 w-8 rounded-lg" onClick={() => editRecord(item)} title="Editar conteo">
                            <Edit3 className="h-3.5 w-3.5 text-primary" />
                          </Button>
                          <Button
                            variant="ghost"
                            size="icon"
                            className="h-8 w-8 text-rose-500 hover:text-rose-600 hover:bg-rose-500/10 rounded-lg"
                            onClick={() => deleteRecord(item.id)}
                            title="Eliminar registro"
                          >
                            <Trash2 className="h-3.5 w-3.5" />
                          </Button>
                        </div>
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
                      Cargar más ({registros.length} de {total})
                    </>
                  )}
                </Button>
              </div>
            )}

            {!hasMore && registros.length > 0 && (
              <div className="p-3 text-center text-[10px] text-muted-foreground border-t border-border/30">
                Todos los registros cargados ({registros.length} de {total})
              </div>
            )}
          </>
        )}
      </CardContent>
    </Card>
  );
}
