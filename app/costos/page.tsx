"use client";

import * as React from "react";
import {
  CircleDollarSign,
  Search,
  Filter,
  TrendingUp,
  History,
  Edit3,
  UploadCloud,
  FileSpreadsheet,
  AlertTriangle,
  CheckCircle2,
  X,
  Loader2,
  Calendar,
  User as UserIcon,
  FileText,
  DollarSign,
  Package,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogFooter,
} from "@/components/ui/dialog";
import {
  Sheet,
  SheetContent,
  SheetHeader,
  SheetTitle,
  SheetDescription,
} from "@/components/ui/sheet";
import { Combobox } from "@/components/ui/combobox";
import { TableLoadMore } from "@/components/ui/table-load-more";
import { useAuth } from "@/app/inventario/hooks/use-auth";
import { toast } from "sonner";

interface ProductoCosto {
  sku: string;
  glosa: string;
  unidad: string;
  familia: string;
  costo_unitario: number;
  moneda: string;
  ultima_actualizacion: string | null;
  total_cambios: number;
  costo_anterior: number | null;
}

interface CostoStats {
  total_productos: number;
  con_costo: number;
  sin_costo: number;
  costo_promedio: number;
  costo_maximo: number;
}

interface HistorialItem {
  id: number;
  costo_unitario: number;
  moneda: string;
  fecha_validez_desde: string;
  fecha_validez_hasta: string | null;
  motivo_modificacion: string;
  documento_referencia: string;
  created_at: string;
  usuario_nombre: string | null;
}

const PAGE_SIZE = 50;

export default function CostosPage() {
  const { user, token, logout } = useAuth();
  const isAdmin = user?.rol === "admin";

  // Data State
  const [items, setItems] = React.useState<ProductoCosto[]>([]);
  const [familias, setFamilias] = React.useState<{ id: number; codigo: string; nombre: string }[]>([]);
  const [stats, setStats] = React.useState<CostoStats | null>(null);
  const [loading, setLoading] = React.useState(true);
  const [loadingMore, setLoadingMore] = React.useState(false);

  // Filters & Pagination
  const [searchTerm, setSearchTerm] = React.useState("");
  const [selectedFamilia, setSelectedFamilia] = React.useState("");
  const [page, setPage] = React.useState(1);
  const [total, setTotal] = React.useState(0);

  // Edit Modal State
  const [editingItem, setEditingItem] = React.useState<ProductoCosto | null>(null);
  const [nuevoCosto, setNuevoCosto] = React.useState("");
  const [motivo, setMotivo] = React.useState("");
  const [docRef, setDocRef] = React.useState("");
  const [savingCosto, setSavingCosto] = React.useState(false);

  // History Sheet State
  const [historySKU, setHistorySKU] = React.useState<string | null>(null);
  const [historyData, setHistoryData] = React.useState<HistorialItem[]>([]);
  const [historyProduct, setHistoryProduct] = React.useState<any>(null);
  const [loadingHistory, setLoadingHistory] = React.useState(false);

  // Import Modal State
  const [isImportOpen, setIsImportOpen] = React.useState(false);
  const [csvContent, setCsvContent] = React.useState("");
  const [parsedImportItems, setParsedImportItems] = React.useState<{ sku: string; costo: number }[]>([]);
  const [importing, setImporting] = React.useState(false);

  // Fetch Data Progressive 50 en 50
  const fetchData = React.useCallback(async (pageNum = 1, append = false) => {
    if (!token) return;
    if (pageNum === 1) setLoading(true);
    else setLoadingMore(true);

    try {
      const params = new URLSearchParams({
        page: pageNum.toString(),
        limit: PAGE_SIZE.toString(),
        q: searchTerm,
        familia: selectedFamilia,
      });

      const res = await fetch(`/api/costos?${params.toString()}`, {
        headers: { Authorization: `Bearer ${token}` },
      });

      if (res.status === 401 || res.status === 403) {
        toast.error("Acceso restringido: Solo administradores pueden gestionar costos");
        return;
      }

      const data = await res.json();
      if (data.items) {
        if (append) {
          setItems((prev) => [...prev, ...data.items]);
        } else {
          setItems(data.items);
        }
        setTotal(data.total || 0);
        setStats(data.stats);
        setFamilias(data.familias || []);
      }
    } catch (err) {
      toast.error("Error al cargar lista de costos");
    } finally {
      setLoading(false);
      setLoadingMore(false);
    }
  }, [token, searchTerm, selectedFamilia]);

  React.useEffect(() => {
    setPage(1);
    fetchData(1, false);
  }, [fetchData]);

  const handleLoadMore = () => {
    const nextPage = page + 1;
    setPage(nextPage);
    fetchData(nextPage, true);
  };

  // Handle Edit Cost
  const handleOpenEdit = (item: ProductoCosto) => {
    setEditingItem(item);
    setNuevoCosto(item.costo_unitario ? item.costo_unitario.toString() : "");
    setMotivo("Actualización de precio");
    setDocRef("");
  };

  const handleSaveCosto = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!editingItem || !token) return;

    const costNum = parseFloat(nuevoCosto);
    if (isNaN(costNum) || costNum < 0) {
      toast.error("Ingresa un costo válido mayor o igual a 0");
      return;
    }

    setSavingCosto(true);
    try {
      const res = await fetch("/api/costos", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          sku: editingItem.sku,
          nuevo_costo: costNum,
          motivo,
          documento_referencia: docRef,
        }),
      });

      if (!res.ok) {
        const err = await res.json();
        throw new Error(err.error || "Error al actualizar costo");
      }

      toast.success(`Costo de ${editingItem.sku} actualizado a S/ ${costNum.toFixed(2)}`);
      setEditingItem(null);
      fetchData();
    } catch (err: any) {
      toast.error(err.message || "Error al guardar costo");
    } finally {
      setSavingCosto(false);
    }
  };

  // Handle View History
  const handleOpenHistory = async (sku: string) => {
    if (!token) return;
    setHistorySKU(sku);
    setLoadingHistory(true);
    try {
      const res = await fetch(`/api/costos/${encodeURIComponent(sku)}/historial`, {
        headers: { Authorization: `Bearer ${token}` },
      });
      const data = await res.json();
      if (data.historial) {
        setHistoryData(data.historial);
        setHistoryProduct(data.product);
      }
    } catch {
      toast.error("Error al cargar historial");
    } finally {
      setLoadingHistory(false);
    }
  };

  // Handle CSV Import
  const handleFileUpload = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0];
    if (!file) return;

    const reader = new FileReader();
    reader.onload = (event) => {
      const text = event.target?.result as string;
      setCsvContent(text);

      // Parse lines (supports semicolon and comma)
      const lines = text.split(/\r?\n/).filter((l) => l.trim().length > 0);
      if (lines.length <= 1) {
        toast.error("El archivo está vacío o no contiene datos válidos");
        return;
      }

      const parsed: { sku: string; costo: number }[] = [];
      const delimiter = lines[0].includes(";") ? ";" : ",";

      for (let i = 1; i < lines.length; i++) {
        const cols = lines[i].split(delimiter).map((c) => c.replace(/"/g, "").trim());
        if (cols.length >= 2) {
          const sku = cols[0].toUpperCase();
          // Cost may be in column 3 or 4 depending on format (Producto;Descripcion;Unidad;Costo)
          const rawCost = cols[cols.length - 1] || cols[3] || cols[1];
          const cost = parseFloat(rawCost.replace(/,/g, ""));
          if (sku && !isNaN(cost)) {
            parsed.push({ sku, costo: cost });
          }
        }
      }

      setParsedImportItems(parsed);
      toast.info(`Se detectaron ${parsed.length} repuestos listos para actualizar`);
    };
    reader.readAsText(file);
  };

  const handleExecuteImport = async () => {
    if (!parsedImportItems.length || !token) return;
    setImporting(true);
    try {
      const res = await fetch("/api/costos/import", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          items: parsedImportItems,
          motivo: "Importación Masiva de Costos",
        }),
      });

      const data = await res.json();
      if (data.success) {
        toast.success(`¡Éxito! ${data.actualizados} costos actualizados correctamente`);
        setIsImportOpen(false);
        setParsedImportItems([]);
        setCsvContent("");
        fetchData();
      } else {
        toast.error(data.error || "Error durante la importación");
      }
    } catch (err: any) {
      toast.error(err.message || "Error al procesar archivo");
    } finally {
      setImporting(false);
    }
  };

  // Restrict to admin
  if (user && user.rol !== "admin") {
    return (
      <div className="flex flex-col items-center justify-center min-h-[60vh] space-y-4 text-center p-6">
        <div className="p-4 rounded-3xl bg-rose-500/10 border border-rose-500/20 text-rose-500">
          <AlertTriangle className="h-12 w-12" />
        </div>
        <h2 className="text-2xl font-black tracking-tight">Acceso Restringido</h2>
        <p className="text-sm text-muted-foreground max-w-md">
          El módulo de mantenimiento y valorización de costos está reservado exclusivamente para la administración.
        </p>
        <Button onClick={() => (window.location.href = "/inventario")} className="rounded-xl font-bold">
          Volver a Inventario
        </Button>
      </div>
    );
  }

  return (
    <div className="space-y-4 animate-in fade-in duration-300 pb-10">
      {/* KPI Stats Cards */}
      {stats && (
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-3">
          <Card className="border-border/60 shadow-sm bg-card/60">
            <CardContent className="p-3.5 flex items-center gap-3">
              <div className="p-2 rounded-xl bg-primary/10 text-primary shrink-0">
                <Package className="h-4 w-4" />
              </div>
              <div className="min-w-0">
                <p className="text-[10px] font-medium text-muted-foreground truncate">Total Productos</p>
                <p className="text-base sm:text-lg font-black text-foreground">{stats.total_productos}</p>
              </div>
            </CardContent>
          </Card>

          <Card className="border-border/60 shadow-sm bg-card/60">
            <CardContent className="p-3.5 flex items-center gap-3">
              <div className="p-2 rounded-xl bg-emerald-500/10 text-emerald-500 shrink-0">
                <CheckCircle2 className="h-4 w-4" />
              </div>
              <div className="min-w-0">
                <p className="text-[10px] font-medium text-muted-foreground truncate">Con Costo</p>
                <p className="text-base sm:text-lg font-black text-emerald-600 dark:text-emerald-400">
                  {stats.con_costo} <span className="text-[10px] font-normal text-muted-foreground">items</span>
                </p>
              </div>
            </CardContent>
          </Card>

          <Card className="border-border/60 shadow-sm bg-card/60">
            <CardContent className="p-3.5 flex items-center gap-3">
              <div className="p-2 rounded-xl bg-amber-500/10 text-amber-500 shrink-0">
                <AlertTriangle className="h-4 w-4" />
              </div>
              <div className="min-w-0">
                <p className="text-[10px] font-medium text-muted-foreground truncate">Sin Costo</p>
                <p className="text-base sm:text-lg font-black text-amber-600 dark:text-amber-400">
                  {stats.sin_costo} <span className="text-[10px] font-normal text-muted-foreground">items</span>
                </p>
              </div>
            </CardContent>
          </Card>

          <Card className="border-border/60 shadow-sm bg-card/60">
            <CardContent className="p-3.5 flex items-center gap-3">
              <div className="p-2 rounded-xl bg-blue-500/10 text-blue-500 shrink-0">
                <TrendingUp className="h-4 w-4" />
              </div>
              <div className="min-w-0">
                <p className="text-[10px] font-medium text-muted-foreground truncate">Costo Promedio</p>
                <p className="text-base sm:text-lg font-black text-foreground">
                  S/ {stats.costo_promedio.toLocaleString("es-PE", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}
                </p>
              </div>
            </CardContent>
          </Card>
        </div>
      )}

      {/* Search & Filter Toolbar */}
      <Card className="border-border/60 shadow-sm">
        <CardContent className="p-3">
          <div className="flex flex-col sm:flex-row gap-2 sm:items-center">
            <div className="relative flex-1">
              <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-3.5 w-3.5 text-muted-foreground" />
              <Input
                placeholder="Buscar por código SKU o descripción..."
                value={searchTerm}
                onChange={(e) => {
                  setSearchTerm(e.target.value);
                  setPage(1);
                }}
                className="pl-8 h-9 text-xs rounded-xl bg-background"
              />
            </div>

            <div className="w-full sm:w-60">
              <Combobox
                options={[
                  { value: "", label: "Todas las Familias" },
                  ...familias.map((f: any) =>
                    typeof f === "string"
                      ? { value: f, label: f }
                      : { value: f.codigo || f.nombre || String(f.id), label: `${f.codigo ? f.codigo + " - " : ""}${f.nombre || f.codigo}` }
                  ),
                ]}
                value={selectedFamilia}
                onChange={(val) => {
                  setSelectedFamilia(val);
                  setPage(1);
                }}
                placeholder="Todas las Familias"
                searchPlaceholder="Buscar familia..."
                className="h-9 font-semibold text-xs"
                allowCustom={false}
              />
            </div>

            <Button
              variant="outline"
              onClick={() => setIsImportOpen(true)}
              className="h-9 text-xs font-bold gap-1.5 rounded-xl shrink-0"
            >
              <UploadCloud className="h-3.5 w-3.5 text-primary" />
              Importar CSV
            </Button>
          </div>
        </CardContent>
      </Card>

      {/* Cost Table Standardized */}
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <CardContent className="p-0">
          {loading ? (
            <div className="p-12 text-center text-muted-foreground">
              <Loader2 className="h-7 w-7 animate-spin mx-auto mb-2 text-primary" />
              <p className="text-xs font-semibold">Cargando catálogo de valorización...</p>
            </div>
          ) : items.length === 0 ? (
            <div className="p-12 text-center space-y-2">
              <Package className="h-10 w-10 text-muted-foreground/40 mx-auto" />
              <p className="text-sm font-semibold text-foreground">No se encontraron repuestos</p>
              <p className="text-xs text-muted-foreground">Intenta con otros filtros de búsqueda</p>
            </div>
          ) : (
            <>
              {/* VISTA MÓVIL (CARDS INTERACTIVAS) */}
              <div className="block sm:hidden divide-y divide-border/40">
                {items.map((item) => (
                  <div key={item.sku} className="p-3.5 space-y-2.5 hover:bg-secondary/20 transition-colors">
                    <div className="flex items-center justify-between gap-2">
                      <div className="flex items-center gap-1.5 min-w-0">
                        <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                          {item.sku}
                        </span>
                        {item.familia && (
                          <Badge variant="outline" className="text-[10px] truncate max-w-[120px]">
                            {item.familia}
                          </Badge>
                        )}
                      </div>

                      <div className="text-right shrink-0">
                        {item.costo_unitario > 0 ? (
                          <span className="font-mono text-xs font-bold text-emerald-600 dark:text-emerald-400">
                            S/ {item.costo_unitario.toFixed(2)}
                          </span>
                        ) : (
                          <span className="text-[10px] font-bold text-amber-600 bg-amber-500/10 px-1.5 py-0.5 rounded">
                            Sin Costo
                          </span>
                        )}
                      </div>
                    </div>

                    <div className="text-xs font-bold text-foreground line-clamp-2 leading-relaxed">
                      {item.glosa}
                    </div>

                    <div className="flex items-center justify-between pt-1 text-[11px] text-muted-foreground">
                      <span className="font-mono text-[10px]">
                        {item.ultima_actualizacion || "Base"} {item.total_cambios > 1 ? `(${item.total_cambios} v)` : ""}
                      </span>

                      <div className="flex items-center gap-1.5">
                        <Button
                          size="sm"
                          variant="ghost"
                          onClick={() => handleOpenEdit(item)}
                          className="h-7 px-2.5 text-[10px] font-bold text-primary hover:bg-primary/10 rounded-lg gap-1"
                        >
                          <Edit3 className="h-3 w-3" />
                          Editar
                        </Button>
                        <Button
                          size="sm"
                          variant="ghost"
                          onClick={() => handleOpenHistory(item.sku)}
                          className="h-7 w-7 rounded-lg text-muted-foreground hover:text-foreground p-0"
                          title="Ver historial"
                        >
                          <History className="h-3.5 w-3.5" />
                        </Button>
                      </div>
                    </div>
                  </div>
                ))}
              </div>

              {/* VISTA DESKTOP (TABLA CORPORATIVA) */}
              <div className="hidden sm:block overflow-x-auto">
                <table className="w-full text-left text-xs border-collapse">
                  <thead className="bg-secondary/30 text-muted-foreground uppercase text-[10px] font-bold tracking-wider border-b border-border/50">
                    <tr>
                      <th className="py-3 px-4">SKU / Material</th>
                      <th className="py-3 px-4">Descripción (Glosa)</th>
                      <th className="py-3 px-3">Grupo / Familia</th>
                      <th className="py-3 px-3">U.M.</th>
                      <th className="py-3 px-3 text-right">Costo Vigente (PEN)</th>
                      <th className="py-3 px-3 text-center">Vigencia / Versiones</th>
                      <th className="py-3 px-3 text-center">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-border/40 font-medium">
                    {items.map((item) => (
                      <tr key={item.sku} className="hover:bg-secondary/20 transition-colors">
                        <td className="py-2.5 px-4 font-mono font-bold text-primary">
                          {item.sku}
                        </td>
                        <td className="py-2.5 px-4 font-bold text-foreground max-w-sm truncate">
                          {item.glosa}
                        </td>
                        <td className="py-2.5 px-3">
                          <Badge variant="outline" className="text-[10px] truncate max-w-[130px]">
                            {item.familia || "GENERAL"}
                          </Badge>
                        </td>
                        <td className="py-2.5 px-3 font-mono text-muted-foreground">{item.unidad || "UND"}</td>
                        <td className="py-2.5 px-3 text-right font-mono font-bold">
                          {item.costo_unitario > 0 ? (
                            <span className="text-emerald-600 dark:text-emerald-400">
                              S/ {item.costo_unitario.toLocaleString("es-PE", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}
                            </span>
                          ) : (
                            <span className="text-amber-600 dark:text-amber-400 bg-amber-500/10 px-2 py-0.5 rounded-md text-[10px] font-bold">
                              Sin Costo
                            </span>
                          )}
                        </td>
                        <td className="py-2.5 px-3 text-center">
                          <div className="flex flex-col items-center">
                            <span className="text-[10px] text-muted-foreground font-mono">
                              {item.ultima_actualizacion || "Base"}
                            </span>
                            {item.total_cambios > 1 && (
                              <Badge variant="secondary" className="text-[9px] h-4 font-mono mt-0.5">
                                {item.total_cambios} versiones
                              </Badge>
                            )}
                          </div>
                        </td>
                        <td className="py-2.5 px-3 text-center">
                          <div className="flex items-center justify-center gap-1.5">
                            <Button
                              size="sm"
                              variant="ghost"
                              onClick={() => handleOpenEdit(item)}
                              className="h-7 px-2.5 text-[10px] font-bold text-primary hover:bg-primary/10 rounded-lg gap-1"
                            >
                              <Edit3 className="h-3 w-3" />
                              Editar
                            </Button>
                            <Button
                              size="sm"
                              variant="ghost"
                              onClick={() => handleOpenHistory(item.sku)}
                              className="h-7 w-7 text-muted-foreground hover:text-foreground rounded-lg p-0"
                              title="Historial de precios"
                            >
                              <History className="h-3.5 w-3.5" />
                            </Button>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              {/* PIE DE TABLA UNIFICADO (CARGAR 50 MÁS) */}
              <TableLoadMore
                currentCount={items.length}
                totalCount={total}
                hasMore={items.length < total}
                loadingMore={loadingMore}
                onLoadMore={handleLoadMore}
                itemName="repuestos"
              />
            </>
          )}
        </CardContent>
      </Card>

      {/* Edit Cost Dialog */}
      <Dialog open={Boolean(editingItem)} onOpenChange={(open) => !open && setEditingItem(null)}>
        <DialogContent className="sm:max-w-md rounded-2xl">
          <DialogHeader>
            <DialogTitle className="text-lg font-black flex items-center gap-2">
              <CircleDollarSign className="h-5 w-5 text-primary" />
              Actualizar Costo Unitario
            </DialogTitle>
            <DialogDescription className="text-xs">
              Al guardar, se creará un nuevo periodo de vigencia en el historial financiero.
            </DialogDescription>
          </DialogHeader>

          {editingItem && (
            <form onSubmit={handleSaveCosto} className="space-y-4 pt-2">
              <div className="p-3 rounded-xl bg-secondary/40 border border-border/50 space-y-1 text-xs">
                <div className="flex items-center justify-between">
                  <span className="font-mono font-bold text-primary">{editingItem.sku}</span>
                  <span className="text-muted-foreground">{editingItem.unidad}</span>
                </div>
                <p className="font-medium text-foreground">{editingItem.glosa}</p>
                <p className="text-[11px] text-muted-foreground">
                  Costo actual: S/ {editingItem.costo_unitario.toFixed(2)}
                </p>
              </div>

              <div className="space-y-1.5">
                <Label className="text-xs font-bold">Nuevo Costo Unitario (S/ PEN)</Label>
                <Input
                  type="number"
                  step="0.0001"
                  required
                  placeholder="0.00"
                  value={nuevoCosto}
                  onChange={(e) => setNuevoCosto(e.target.value)}
                  className="h-10 font-mono font-bold text-sm rounded-xl"
                  autoFocus
                />
              </div>

              <div className="space-y-1.5">
                <Label className="text-xs font-bold">Motivo del Cambio</Label>
                <Input
                  placeholder="Ej: Recepción Orden de Compra #1092"
                  value={motivo}
                  onChange={(e) => setMotivo(e.target.value)}
                  className="h-10 text-xs rounded-xl"
                />
              </div>

              <div className="space-y-1.5">
                <Label className="text-xs font-bold">Documento de Referencia (Opcional)</Label>
                <Input
                  placeholder="Ej: FACTURA F001-4921 / OC-9821"
                  value={docRef}
                  onChange={(e) => setDocRef(e.target.value)}
                  className="h-10 text-xs rounded-xl font-mono"
                />
              </div>

              <DialogFooter className="pt-2 gap-2">
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => setEditingItem(null)}
                  className="rounded-xl text-xs"
                >
                  Cancelar
                </Button>
                <Button type="submit" disabled={savingCosto} className="rounded-xl text-xs font-bold gap-2">
                  {savingCosto ? <Loader2 className="h-4 w-4 animate-spin" /> : null}
                  Confirmar y Guardar
                </Button>
              </DialogFooter>
            </form>
          )}
        </DialogContent>
      </Dialog>

      {/* Cost History Sheet */}
      <Sheet open={Boolean(historySKU)} onOpenChange={(open) => !open && setHistorySKU(null)}>
        <SheetContent className="w-full sm:max-w-md p-6 overflow-y-auto">
          <SheetHeader className="pb-4 border-b border-border/50">
            <SheetTitle className="text-lg font-black flex items-center gap-2">
              <History className="h-5 w-5 text-primary" />
              Historial de Precios y Periodos
            </SheetTitle>
            {historyProduct && (
              <SheetDescription className="text-xs text-left pt-1">
                <span className="font-mono font-bold text-foreground">{historyProduct.sku}</span> — {historyProduct.glosa}
              </SheetDescription>
            )}
          </SheetHeader>

          <div className="py-6 space-y-4">
            {loadingHistory ? (
              <div className="py-12 text-center text-muted-foreground">
                <Loader2 className="h-6 w-6 animate-spin mx-auto mb-2 text-primary" />
                Cargando historial cronológico...
              </div>
            ) : historyData.length === 0 ? (
              <p className="text-center text-xs text-muted-foreground py-8">
                No hay registros históricos adicionales para este producto.
              </p>
            ) : (
              <div className="relative border-l-2 border-primary/30 pl-4 ml-2 space-y-6">
                {historyData.map((h, idx) => (
                  <div key={h.id} className="relative group">
                    <div className="absolute -left-[23px] top-1 h-3.5 w-3.5 rounded-full bg-primary ring-4 ring-background" />
                    <div className="p-3.5 rounded-2xl bg-secondary/30 border border-border/50 space-y-2">
                      <div className="flex items-center justify-between">
                        <span className="text-sm font-mono font-black text-emerald-600 dark:text-emerald-400">
                          S/ {h.costo_unitario.toFixed(2)}
                        </span>
                        {idx === 0 ? (
                          <Badge className="bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 border-emerald-500/20 text-[9px]">
                            Vigente
                          </Badge>
                        ) : (
                          <span className="text-[10px] text-muted-foreground font-mono">
                            Hasta: {h.fecha_validez_hasta || "—"}
                          </span>
                        )}
                      </div>

                      <div className="text-[11px] text-muted-foreground space-y-1">
                        <div className="flex items-center gap-1.5">
                          <Calendar className="h-3.5 w-3.5 text-primary" />
                          <span>Desde: {h.fecha_validez_desde}</span>
                        </div>
                        {h.motivo_modificacion && (
                          <div className="flex items-center gap-1.5">
                            <FileText className="h-3.5 w-3.5 text-muted-foreground" />
                            <span>{h.motivo_modificacion}</span>
                          </div>
                        )}
                        {h.documento_referencia && (
                          <div className="font-mono text-[10px] font-bold text-foreground">
                            Doc: {h.documento_referencia}
                          </div>
                        )}
                        {h.usuario_nombre && (
                          <div className="flex items-center gap-1 text-[10px] text-muted-foreground/70">
                            <UserIcon className="h-3 w-3" />
                            <span>Registrado por: {h.usuario_nombre}</span>
                          </div>
                        )}
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        </SheetContent>
      </Sheet>

      {/* Bulk CSV Import Dialog */}
      <Dialog open={isImportOpen} onOpenChange={setIsImportOpen}>
        <DialogContent className="sm:max-w-lg rounded-2xl">
          <DialogHeader>
            <DialogTitle className="text-lg font-black flex items-center gap-2">
              <UploadCloud className="h-5 w-5 text-primary" />
              Carga Masiva de Costos (CSV / Excel)
            </DialogTitle>
            <DialogDescription className="text-xs">
              Sube un archivo delimitado por punto y coma (;) o comas con las columnas SKU y Costo Unitario.
            </DialogDescription>
          </DialogHeader>

          <div className="space-y-4 pt-2">
            <div className="border-2 border-dashed border-border/80 rounded-2xl p-6 text-center hover:border-primary/50 transition-colors">
              <FileSpreadsheet className="h-10 w-10 mx-auto text-muted-foreground mb-2" />
              <p className="text-xs font-semibold text-foreground">Selecciona tu archivo CSV o arrástralo aquí</p>
              <p className="text-[11px] text-muted-foreground mt-1">Formato compatible: costo_mro.csv</p>
              <input
                type="file"
                accept=".csv,.txt"
                onChange={handleFileUpload}
                className="mt-4 text-xs mx-auto block file:mr-4 file:py-2 file:px-4 file:rounded-xl file:border-0 file:text-xs file:font-semibold file:bg-primary file:text-primary-foreground hover:file:bg-primary/90 cursor-pointer"
              />
            </div>

            {parsedImportItems.length > 0 && (
              <div className="p-3 rounded-xl bg-emerald-500/10 border border-emerald-500/20 text-xs space-y-1">
                <p className="font-bold text-emerald-600 dark:text-emerald-400">
                  ✓ {parsedImportItems.length} registros listos para procesar
                </p>
                <p className="text-[11px] text-muted-foreground">
                  Ejemplo primer registro: SKU {parsedImportItems[0].sku} $\rightarrow$ S/ {parsedImportItems[0].costo.toFixed(2)}
                </p>
              </div>
            )}
          </div>

          <DialogFooter className="pt-2 gap-2">
            <Button variant="outline" onClick={() => setIsImportOpen(false)} className="rounded-xl text-xs">
              Cancelar
            </Button>
            <Button
              onClick={handleExecuteImport}
              disabled={parsedImportItems.length === 0 || importing}
              className="rounded-xl text-xs font-bold gap-2"
            >
              {importing ? <Loader2 className="h-4 w-4 animate-spin" /> : null}
              Actualizar {parsedImportItems.length} Costos
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
