"use client";

import { useState, useEffect, useCallback } from "react";
import { toast } from "sonner";
import {
  Package,
  Search,
  Save,
  Loader2,
  Edit3,
  X,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from "@/components/ui/dialog";

interface ProductoMaster {
  producto: string;
  glosa: string;
  unidad: string;
  familia: string;
  subfamilia: string;
  tipo: string;
  peso: number;
  costo_unitario: number;
  tipo_acero: string;
  grado_acero: string;
  espesor_acero: string;
  peso_producto: number;
  stock_total: number;
  lotes_count: number;
  inventario_count: number;
}

const PAGE_SIZE = 50;

function SkeletonCard() {
  return (
    <div className="p-3.5 space-y-2 animate-pulse">
      <div className="flex items-center justify-between">
        <div className="h-5 w-24 rounded bg-secondary" />
        <div className="h-5 w-16 rounded bg-secondary" />
      </div>
      <div className="h-4 w-3/4 rounded bg-secondary" />
      <div className="h-3 w-1/2 rounded bg-secondary" />
    </div>
  );
}

function EditFields({
  form,
  onChange,
}: {
  form: Partial<ProductoMaster>;
  onChange: (field: string, value: string | number) => void;
}) {
  return (
    <div className="space-y-3">
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Glosa</label>
          <Input
            value={form.glosa || ""}
            onChange={(e) => onChange("glosa", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Unidad</label>
          <Input
            value={form.unidad || ""}
            onChange={(e) => onChange("unidad", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
      </div>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Familia</label>
          <Input
            value={form.familia || ""}
            onChange={(e) => onChange("familia", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Subfamilia</label>
          <Input
            value={form.subfamilia || ""}
            onChange={(e) => onChange("subfamilia", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
      </div>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Peso (kg)</label>
          <Input
            type="number"
            step="any"
            value={form.peso ?? 0}
            onChange={(e) => onChange("peso", Number(e.target.value))}
            className="h-9 text-xs rounded-lg mt-1 font-mono"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Costo Unitario (S/)</label>
          <Input
            type="number"
            step="any"
            value={form.costo_unitario ?? 0}
            onChange={(e) => onChange("costo_unitario", Number(e.target.value))}
            className="h-9 text-xs rounded-lg mt-1 font-mono"
          />
        </div>
      </div>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Tipo</label>
          <Input
            value={form.tipo || ""}
            onChange={(e) => onChange("tipo", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Peso Prod.</label>
          <Input
            type="number"
            step="any"
            value={form.peso_producto ?? 0}
            onChange={(e) => onChange("peso_producto", Number(e.target.value))}
            className="h-9 text-xs rounded-lg mt-1 font-mono"
          />
        </div>
      </div>
      <div className="grid grid-cols-3 gap-3">
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Tipo Acero</label>
          <Input
            value={form.tipo_acero || ""}
            onChange={(e) => onChange("tipo_acero", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Grado</label>
          <Input
            value={form.grado_acero || ""}
            onChange={(e) => onChange("grado_acero", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Espesor</label>
          <Input
            value={form.espesor_acero || ""}
            onChange={(e) => onChange("espesor_acero", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
      </div>
    </div>
  );
}

export default function ProductosPage() {
  const [items, setItems] = useState<ProductoMaster[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [editingItem, setEditingItem] = useState<ProductoMaster | null>(null);
  const [editForm, setEditForm] = useState<Partial<ProductoMaster>>({});
  const [saving, setSaving] = useState(false);

  const hasMore = items.length < total;

  const getToken = () => {
    const raw = localStorage.getItem("mro_auth");
    return raw ? JSON.parse(raw).token : "";
  };

  const loadPage = useCallback(
    async (q: string, pageNum: number, append: boolean) => {
      if (append) setLoadingMore(true);
      else setLoading(true);
      try {
        const params = new URLSearchParams({ page: String(pageNum), limit: String(PAGE_SIZE) });
        if (q) params.set("q", q);
        const res = await fetch(`/api/productos?${params}`, {
          headers: { Authorization: `Bearer ${getToken()}` },
        });
        const data = await res.json();
        setItems((prev) => (append ? [...prev, ...(data.items || [])] : data.items || []));
        setTotal(data.total || 0);
        setPage(pageNum);
      } catch {
        toast.error("Error al cargar productos");
      } finally {
        setLoading(false);
        setLoadingMore(false);
      }
    },
    []
  );

  useEffect(() => {
    loadPage("", 1, false);
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  const handleSearch = () => {
    setEditingItem(null);
    loadPage(searchQuery, 1, false);
  };

  const handleClearSearch = () => {
    setSearchQuery("");
    setEditingItem(null);
    loadPage("", 1, false);
  };

  const handleLoadMore = () => loadPage(searchQuery, page + 1, true);

  const startEdit = (item: ProductoMaster) => {
    setEditingItem(item);
    setEditForm({
      glosa: item.glosa,
      unidad: item.unidad,
      familia: item.familia,
      subfamilia: item.subfamilia,
      tipo: item.tipo,
      peso: item.peso,
      costo_unitario: item.costo_unitario,
      tipo_acero: item.tipo_acero,
      grado_acero: item.grado_acero,
      espesor_acero: item.espesor_acero,
      peso_producto: item.peso_producto,
    });
  };

  const handleFieldChange = (field: string, value: string | number) => {
    setEditForm((prev) => ({ ...prev, [field]: value }));
  };

  const saveProduct = async (producto: string) => {
    setSaving(true);
    try {
      const res = await fetch("/api/productos", {
        method: "PUT",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${getToken()}`,
        },
        body: JSON.stringify({ producto, ...editForm }),
      });
      if (res.ok) {
        toast.success("Producto actualizado");
        setEditingItem(null);
        loadPage(searchQuery, page, false);
      } else {
        toast.error("Error al actualizar");
      }
    } catch {
      toast.error("Error de conexion");
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="w-full space-y-4">
      <div className="flex items-center justify-between gap-3">
        <div>
          <h1 className="text-lg sm:text-2xl font-bold tracking-tight text-foreground flex items-center gap-2">
            <Package className="h-5 w-5 sm:h-6 sm:w-6 text-primary" />
            Maestro de Productos
          </h1>
          <p className="text-[11px] sm:text-sm text-muted-foreground mt-0.5">
            Edita datos maestros de cada producto
          </p>
        </div>
        <Badge variant="outline" className="px-2 py-1 text-[10px] sm:text-xs font-semibold shrink-0">
          {total}
        </Badge>
      </div>

      <Card className="border-border/60 shadow-xs">
        <CardHeader className="p-3 sm:p-4 pb-2 sm:pb-3">
          <CardTitle className="text-sm sm:text-base font-bold flex items-center gap-2">
            <Package className="h-4 w-4 text-primary" />
            Productos
          </CardTitle>
          <CardDescription className="text-[11px] sm:text-xs">
            {loading
              ? "Cargando..."
              : `Mostrando ${items.length} de ${total} productos`}
          </CardDescription>
        </CardHeader>

        <CardContent className="p-0">
          <div className="px-3 sm:px-4 pb-3">
            <div className="flex gap-2">
              <div className="relative flex-1">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                <Input
                  value={searchQuery}
                  onChange={(e) => setSearchQuery(e.target.value)}
                  onKeyDown={(e) => e.key === "Enter" && handleSearch()}
                  placeholder="SKU, descripcion, familia..."
                  className="pl-9 h-9 text-xs rounded-xl bg-secondary/30"
                />
                {searchQuery && (
                  <button
                    type="button"
                    onClick={handleClearSearch}
                    className="absolute right-2.5 top-1/2 -translate-y-1/2 p-1 text-muted-foreground hover:text-foreground"
                  >
                    <X className="h-3.5 w-3.5" />
                  </button>
                )}
              </div>
              <Button
                onClick={handleSearch}
                variant="outline"
                className="h-9 px-3 text-xs font-semibold rounded-xl shrink-0"
              >
                <Search className="h-3.5 w-3.5 mr-1" />
                Buscar
              </Button>
            </div>
          </div>

          {loading ? (
            <div className="md:hidden">
              {Array.from({ length: 4 }).map((_, i) => (
                <div key={i} className="border-b border-border/20">
                  <SkeletonCard />
                </div>
              ))}
            </div>
          ) : items.length === 0 ? (
            <div className="py-16 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
              <Package className="h-8 w-8 opacity-30" />
              <span className="text-xs">No se encontraron productos</span>
            </div>
          ) : (
            <>
              {/* MOBILE VIEW */}
              <div className="md:hidden divide-y divide-border/40">
                {items.map((item) => (
                  <div key={item.producto} className="p-3 space-y-2">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-1.5 flex-wrap min-w-0 flex-1">
                        <span className="font-mono font-bold text-[11px] bg-secondary px-1.5 py-0.5 rounded border border-border/50 shrink-0">
                          {item.producto}
                        </span>
                        {item.familia && (
                          <Badge variant="outline" className="text-[9px] shrink-0">
                            {item.familia}
                          </Badge>
                        )}
                      </div>
                      <span className="font-mono font-bold text-[11px] text-primary shrink-0 ml-2">
                        {item.costo_unitario > 0 ? `S/ ${item.costo_unitario.toFixed(2)}` : "-"}
                      </span>
                    </div>
                    <div className="text-[11px] text-muted-foreground truncate">{item.glosa || "-"}</div>
                    <div className="flex items-center justify-between text-[10px] text-muted-foreground">
                      <span>
                        Stock: <strong className="font-mono text-foreground">{item.stock_total}</strong>
                      </span>
                      <span>
                        Unidad: <strong className="text-foreground">{item.unidad || "-"}</strong>
                      </span>
                    </div>
                    <Button
                      type="button"
                      size="sm"
                      onClick={() => startEdit(item)}
                      className="h-8 text-xs font-semibold gap-1.5 rounded-lg w-full"
                    >
                      <Edit3 className="h-3 w-3" />
                      Editar
                    </Button>
                  </div>
                ))}
              </div>

              {/* DESKTOP VIEW */}
              <div className="hidden md:block overflow-x-auto">
                <table className="w-full text-xs">
                  <thead className="bg-secondary/50 border-b border-border/50 sticky top-0 z-10 backdrop-blur-sm">
                    <tr>
                      <th className="text-left py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">SKU</th>
                      <th className="text-left py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Descripcion</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Unidad</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Familia</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Stock</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Peso</th>
                      <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Costo Unit.</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-border/30">
                    {items.map((item) => (
                      <tr key={item.producto} className="hover:bg-secondary/20 transition">
                        <td className="py-2 px-3 font-mono font-bold text-foreground whitespace-nowrap">{item.producto}</td>
                        <td className="py-2 px-3 max-w-[200px] truncate font-medium" title={item.glosa}>{item.glosa}</td>
                        <td className="py-2 px-2 text-center text-[11px]">{item.unidad}</td>
                        <td className="py-2 px-2 text-center">
                          <Badge variant="secondary" className="text-[9px]">{item.familia}</Badge>
                        </td>
                        <td className="py-2 px-2 text-center font-mono font-bold">{item.stock_total}</td>
                        <td className="py-2 px-2 text-center font-mono text-[11px] text-muted-foreground">{item.peso || "-"}</td>
                        <td className="py-2 px-3 text-center font-mono font-bold text-primary">
                          {item.costo_unitario > 0 ? `S/ ${item.costo_unitario.toFixed(2)}` : "-"}
                        </td>
                        <td className="py-2 px-2 text-center">
                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            className="h-7 w-7 rounded-lg"
                            onClick={() => startEdit(item)}
                            title="Editar producto"
                          >
                            <Edit3 className="h-3.5 w-3.5 text-primary" />
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
                    onClick={handleLoadMore}
                    disabled={loadingMore}
                    className="h-9 text-xs font-semibold gap-1.5 rounded-xl"
                  >
                    {loadingMore ? (
                      <>
                        <Loader2 className="h-3.5 w-3.5 animate-spin" />
                        Cargando mas...
                      </>
                    ) : (
                      <>
                        Cargar mas ({items.length} de {total})
                      </>
                    )}
                  </Button>
                </div>
              )}

              {!hasMore && items.length > 0 && (
                <div className="p-3 text-center text-[10px] text-muted-foreground border-t border-border/30">
                  Todos los productos cargados ({items.length} de {total})
                </div>
              )}
            </>
          )}
        </CardContent>
      </Card>

      {/* EDIT DIALOG — full-screen on mobile, centered on desktop */}
      <Dialog open={!!editingItem} onOpenChange={(open) => !open && setEditingItem(null)}>
        <DialogContent className="fixed inset-0 z-50 w-full h-full translate-x-0 translate-y-0 rounded-none border-0 p-0 overflow-y-auto sm:fixed sm:inset-auto sm:left-[50%] sm:top-[50%] sm:max-w-lg sm:h-auto sm:translate-x-[-50%] sm:translate-y-[-50%] sm:rounded-2xl sm:border sm:p-6 sm:shadow-lg">
          <DialogHeader className="p-4 sm:p-0 sm:pb-2 border-b sm:border-b-0 sticky top-0 bg-background z-10">
            <DialogTitle className="text-base sm:text-lg">
              Editar Producto
            </DialogTitle>
            <p className="text-xs text-muted-foreground font-mono mt-0.5">{editingItem?.producto}</p>
          </DialogHeader>

          <div className="px-4 sm:px-0 py-4 space-y-4">
            {editingItem && (
              <EditFields form={editForm} onChange={handleFieldChange} />
            )}
          </div>

          <DialogFooter className="p-4 sm:p-0 sm:pt-2 border-t sm:border-t-0 sticky bottom-0 bg-background z-10 flex-row gap-2">
            <Button
              type="button"
              variant="outline"
              onClick={() => setEditingItem(null)}
              disabled={saving}
              className="h-10 text-xs font-semibold rounded-xl flex-1 sm:flex-none"
            >
              Cancelar
            </Button>
            <Button
              type="button"
              onClick={() => editingItem && saveProduct(editingItem.producto)}
              disabled={saving}
              className="h-10 text-xs font-bold gap-1.5 rounded-xl flex-1 sm:flex-none"
            >
              {saving ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Save className="h-3.5 w-3.5" />}
              Guardar
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </div>
  );
}
