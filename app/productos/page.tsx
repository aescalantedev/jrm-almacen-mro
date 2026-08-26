"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { toast } from "sonner";
import {
  Package,
  Search,
  Save,
  Loader2,
  Edit3,
  X,
  Barcode,
  Plus,
  Minus,
  MapPin,
  ArrowRight,
  ShoppingCart,
  Trash2,
  CheckCircle2,
  FileText,
  Eye,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardHeader } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from "@/components/ui/dialog";
import { useAuth } from "../inventario/hooks/use-auth";
import { BarcodeScanner } from "@/components/ui/barcode-scanner";
import { ProductDetailSheet, MasterProduct } from "@/components/products/product-detail-sheet";
import { QuantitySelectorDialog, SelectorProduct } from "@/components/movimientos/quantity-selector-dialog";
import { MovementCartSheet } from "@/components/movimientos/movement-cart-sheet";
import { useMovementCart } from "@/hooks/use-movement-cart";

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
  form: Partial<MasterProduct>;
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
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Tipo</label>
          <Input
            value={form.tipo || ""}
            onChange={(e) => onChange("tipo", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Peso (kg)</label>
          <Input
            type="number"
            step="0.01"
            value={form.peso ?? ""}
            onChange={(e) => onChange("peso", parseFloat(e.target.value) || 0)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
      </div>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Costo Unitario</label>
          <Input
            type="number"
            step="0.01"
            value={form.costo_unitario ?? ""}
            onChange={(e) => onChange("costo_unitario", parseFloat(e.target.value) || 0)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
        <div>
          <label className="text-[10px] text-muted-foreground uppercase font-semibold">Tipo Acero</label>
          <Input
            value={form.tipo_acero || ""}
            onChange={(e) => onChange("tipo_acero", e.target.value)}
            className="h-9 text-xs rounded-lg mt-1"
          />
        </div>
      </div>
    </div>
  );
}

export default function ProductosPage() {
  const { user, token: authToken } = useAuth();
  const [items, setItems] = useState<MasterProduct[]>([]);
  const [total, setTotal] = useState(0);
  const [page, setPage] = useState(1);
  const [hasMore, setHasMore] = useState(false);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [editingItem, setEditingItem] = useState<MasterProduct | null>(null);
  const [editForm, setEditForm] = useState<Partial<MasterProduct>>({});
  const [saving, setSaving] = useState(false);

  // Overlays
  const [selectedProduct, setSelectedProduct] = useState<MasterProduct | null>(null);
  const [detailOpen, setDetailOpen] = useState(false);
  const [selectorProduct, setSelectorProduct] = useState<SelectorProduct | null>(null);
  const [selectorOpen, setSelectorOpen] = useState(false);
  const [defaultSelectorTipo, setDefaultSelectorTipo] = useState<"INGRESO" | "SALIDA">("SALIDA");
  const [cartSheetOpen, setCartSheetOpen] = useState(false);
  const [scannerOpen, setScannerOpen] = useState(false);
  const debounceTimerRef = useRef<NodeJS.Timeout | null>(null);

  // Cart hook
  const {
    tipo: cartTipo,
    items: cartItems,
    totalItemsCount,
    totalUnitsCount,
    startMovement,
    addItem,
    updateItemQty,
    removeItem,
    clearItems,
    cancelMovement,
  } = useMovementCart();

  const isAdmin = user?.rol === "admin" || user?.rol === "auditor";

  const getToken = () => {
    if (authToken) return authToken;
    if (typeof window === "undefined") return "";
    const raw = localStorage.getItem("mro_auth");
    return raw ? JSON.parse(raw).token : "";
  };

  const loadPage = useCallback(
    async (query: string, pageNum: number, append = false) => {
      if (pageNum === 1) setLoading(true);
      else setLoadingMore(true);

      try {
        const params = new URLSearchParams({
          page: String(pageNum),
          limit: String(PAGE_SIZE),
        });
        if (query.trim()) params.set("q", query.trim());

        const res = await fetch(`/api/productos?${params.toString()}`, {
          headers: { Authorization: `Bearer ${getToken()}` },
        });
        const data = await res.json();

        if (append) {
          setItems((prev) => [...prev, ...(data.items || [])]);
        } else {
          setItems(data.items || []);
        }
        setTotal(data.total || 0);
        setHasMore(data.page * data.limit < data.total);
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
    loadPage("", 1);
  }, [loadPage]);

  // Debounced real-time search
  const handleSearchInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const val = e.target.value;
    setSearchQuery(val);

    if (debounceTimerRef.current) {
      clearTimeout(debounceTimerRef.current);
    }

    if (val.trim().length >= 2) {
      debounceTimerRef.current = setTimeout(() => {
        setPage(1);
        loadPage(val, 1, false);
      }, 300);
    } else if (val.trim().length === 0) {
      setPage(1);
      loadPage("", 1, false);
    }
  };

  const handleSearch = () => {
    setPage(1);
    loadPage(searchQuery, 1, false);
  };

  const handleClearSearch = () => {
    setSearchQuery("");
    setPage(1);
    loadPage("", 1, false);
  };

  const handleLoadMore = () => {
    const nextPage = page + 1;
    setPage(nextPage);
    loadPage(searchQuery, nextPage, true);
  };

  // Open product detail sheet
  const handleOpenDetail = (item: MasterProduct) => {
    setSelectedProduct(item);
    setDetailOpen(true);
  };

  // Tapping a product card:
  // - If a movement mode (Salida / Ingreso) is active: opens QuantitySelectorDialog directly.
  // - If NO mode is active: opens full ProductDetailSheet.
  const handleProductTap = (item: MasterProduct) => {
    if (cartTipo) {
      const p: SelectorProduct = {
        producto: item.producto,
        glosa: item.glosa,
        unidad: item.unidad || "UND",
        stock_actual: Number(item.stock_total ?? 0),
        rack: item.rack || "",
        lote: item.lote || "",
      };
      setSelectorProduct(p);
      setDefaultSelectorTipo(cartTipo);
      setSelectorOpen(true);
    } else {
      handleOpenDetail(item);
    }
  };

  // Start Ingreso / Salida mode from FABs
  const handleStartMode = (tipo: "INGRESO" | "SALIDA") => {
    startMovement(tipo);
    toast.info(`Modo ${tipo === "SALIDA" ? "Salida" : "Ingreso"} activado. Toca los productos para agregarlos al vale.`);
  };

  const startEdit = (item: MasterProduct) => {
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
      toast.error("Error de conexión");
    } finally {
      setSaving(false);
    }
  };

  if (!user) return null;

  return (
    <div className="w-full min-w-0 space-y-3 pb-24 relative">
      <BarcodeScanner
        open={scannerOpen}
        onOpenChange={setScannerOpen}
        onResult={(res) => {
          const code = res.trim().toUpperCase();
          setSearchQuery(code);
          setScannerOpen(false);
          setPage(1);
          loadPage(code, 1, false);
        }}
      />

      {/* BUSCADOR UNIFICADO INTEGRADO (STICKY TOP) */}
      <div className="sticky -top-3 sm:-top-5 z-30 bg-background/95 backdrop-blur-md pt-3 sm:pt-5 pb-2 -mx-3 sm:-mx-5 px-3 sm:px-5">
        <Card className="border-border/60 shadow-sm">
          <CardContent className="p-3 sm:p-3.5 space-y-2.5">
            <div className="relative flex items-center w-full group">
              {/* Botón de Escáner Código de Barras */}
              <Button
                type="button"
                variant="ghost"
                size="icon"
                onClick={() => setScannerOpen(true)}
                className="absolute left-1.5 h-9 w-9 text-muted-foreground hover:text-primary transition-colors z-10 rounded-lg"
                title="Escanear con cámara"
              >
                <Barcode className="h-5 w-5" />
              </Button>

              {/* Input Principal Unificado */}
              <Input
                value={searchQuery}
                onChange={handleSearchInputChange}
                onKeyDown={(e) => e.key === "Enter" && handleSearch()}
                placeholder="Buscar SKU, descripción, familia o rack (ej: RPTS01, 801., etc.)..."
                className="pl-12 pr-24 font-mono text-xs sm:text-sm h-12 rounded-xl bg-secondary/30 focus-visible:ring-2 focus-visible:ring-primary/40 transition-all border-border/50 group-focus-within:border-primary/40 group-focus-within:bg-background"
                autoComplete="off"
              />

              {/* Acciones Derecha (Limpiar X y Botón Buscar) */}
              <div className="absolute right-1.5 flex items-center gap-1">
                {searchQuery && (
                  <button
                    type="button"
                    onClick={handleClearSearch}
                    className="p-1.5 text-muted-foreground hover:text-foreground rounded-full hover:bg-muted transition-colors"
                    title="Limpiar búsqueda"
                  >
                    <X className="h-4 w-4" />
                  </button>
                )}

                <Button
                  type="button"
                  onClick={handleSearch}
                  disabled={loading}
                  size="sm"
                  className="h-9 px-3 rounded-lg text-xs font-bold shadow-xs"
                  title="Buscar"
                >
                  {loading ? <Loader2 className="animate-spin h-3.5 w-3.5" /> : <Search className="h-3.5 w-3.5" />}
                </Button>
              </div>
            </div>

            <div className="flex items-center justify-between text-xs text-muted-foreground px-1">
              <span>
                {loading ? "Cargando catálogo..." : `Mostrando ${items.length} de ${total} productos`}
              </span>
              <span className="font-mono font-semibold">{total} SKUs en sistema</span>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* LISTA / TABLA DE PRODUCTOS */}
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <CardContent className="p-0">
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
              {/* MOBILE VIEW (CARDS TACTILES CON BOTÓN DETALLE) */}
              <div className="md:hidden divide-y divide-border/40">
                {items.map((item) => {
                  const inCart = cartItems.find((it) => it.producto === item.producto);

                  return (
                    <div
                      key={item.producto}
                      onClick={() => handleProductTap(item)}
                      className={`p-3.5 space-y-2 hover:bg-secondary/20 active:bg-secondary/40 transition cursor-pointer ${
                        inCart ? "bg-primary/5 border-l-4 border-l-primary" : ""
                      }`}
                    >
                      <div className="flex items-center justify-between">
                        <div className="flex items-center gap-1.5 flex-wrap min-w-0 flex-1">
                          <span className="font-mono font-bold text-xs bg-primary/10 text-primary border border-primary/20 px-2 py-0.5 rounded-lg shrink-0">
                            {item.producto}
                          </span>
                          {item.familia && (
                            <Badge variant="outline" className="text-[9px] shrink-0">
                              {item.familia}
                            </Badge>
                          )}
                        </div>
                        <Badge
                          variant="secondary"
                          className="font-mono font-bold text-xs shrink-0 ml-2"
                        >
                          Stock: {item.stock_total ?? 0} {item.unidad}
                        </Badge>
                      </div>
                      <div className="text-xs font-semibold text-foreground truncate">{item.glosa || "-"}</div>
                      <div className="flex items-center justify-between text-[11px] text-muted-foreground">
                        <span className="flex items-center gap-1">
                          <MapPin className="h-3 w-3 text-muted-foreground" />
                          Rack: <strong className="font-mono text-foreground">{item.rack || "Sin asignar"}</strong>
                        </span>

                        {inCart ? (
                          <Badge className="bg-primary text-primary-foreground font-mono text-[10px] font-bold">
                            En Vale: {inCart.cantidad} {item.unidad}
                          </Badge>
                        ) : cartTipo ? (
                          <span className="text-primary font-bold text-xs flex items-center gap-1">
                            <Plus className="h-3 w-3" /> Agregar
                          </span>
                        ) : (
                          <Button
                            type="button"
                            variant="ghost"
                            size="sm"
                            onClick={(e) => {
                              e.stopPropagation();
                              handleOpenDetail(item);
                            }}
                            className="h-6 px-2 text-[11px] font-bold text-primary hover:bg-primary/10 rounded-lg"
                          >
                            <FileText className="h-3 w-3 mr-1" />
                            Detalle
                          </Button>
                        )}
                      </div>
                    </div>
                  );
                })}
              </div>

              {/* DESKTOP VIEW (TABLA FULL-WIDTH) */}
              <div className="hidden md:block overflow-x-auto">
                <table className="w-full text-xs">
                  <thead className="bg-secondary/50 border-b border-border/50 sticky top-0 z-10 backdrop-blur-sm">
                    <tr>
                      <th className="text-left py-3 px-3.5 font-bold text-muted-foreground uppercase tracking-wider">SKU</th>
                      <th className="text-left py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Descripción del Material</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Unidad</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Familia</th>
                      <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Stock</th>
                      <th className="text-center py-3 px-2 font-bold text-muted-foreground uppercase tracking-wider">Rack</th>
                      {isAdmin && (
                        <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Costo Unit.</th>
                      )}
                      <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-border/30">
                    {items.map((item) => {
                      const inCart = cartItems.find((it) => it.producto === item.producto);

                      return (
                        <tr
                          key={item.producto}
                          onClick={() => handleProductTap(item)}
                          className={`hover:bg-secondary/30 cursor-pointer transition ${
                            inCart ? "bg-primary/5" : ""
                          }`}
                        >
                          <td className="py-2.5 px-3.5 font-mono font-bold text-primary whitespace-nowrap">{item.producto}</td>
                          <td className="py-2.5 px-3 max-w-[280px] truncate font-medium text-foreground" title={item.glosa}>{item.glosa}</td>
                          <td className="py-2.5 px-2 text-center text-[11px] font-semibold">{item.unidad}</td>
                          <td className="py-2.5 px-2 text-center">
                            <Badge variant="secondary" className="text-[9px]">{item.familia}</Badge>
                          </td>
                          <td className="py-2.5 px-3 text-center font-mono font-black text-foreground">
                            {item.stock_total ?? 0}
                          </td>
                          <td className="py-2.5 px-2 text-center font-mono text-[11px] text-muted-foreground">
                            {item.rack || "-"}
                          </td>
                          {isAdmin && (
                            <td className="py-2.5 px-3 text-center font-mono font-bold text-primary">
                              {item.costo_unitario > 0 ? `S/ ${item.costo_unitario.toFixed(2)}` : "-"}
                            </td>
                          )}
                          <td className="py-2.5 px-3 text-center" onClick={(e) => e.stopPropagation()}>
                            <div className="flex items-center justify-center gap-1.5">
                              {inCart ? (
                                <Badge className="bg-primary text-primary-foreground font-mono text-[10px] font-bold">
                                  En Vale ({inCart.cantidad})
                                </Badge>
                              ) : (
                                <Button
                                  type="button"
                                  variant="ghost"
                                  size="sm"
                                  className="h-7 px-2.5 text-[11px] font-bold text-primary hover:bg-primary/10 rounded-lg"
                                  onClick={() => handleOpenDetail(item)}
                                >
                                  <FileText className="h-3.5 w-3.5 mr-1" /> Detalle
                                </Button>
                              )}
                              {isAdmin && (
                                <Button
                                  type="button"
                                  variant="ghost"
                                  size="icon"
                                  className="h-7 w-7 rounded-lg text-muted-foreground hover:text-foreground"
                                  onClick={() => startEdit(item)}
                                  title="Editar datos maestros"
                                >
                                  <Edit3 className="h-3.5 w-3.5" />
                                </Button>
                              )}
                            </div>
                          </td>
                        </tr>
                      );
                    })}
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
                        Cargando más...
                      </>
                    ) : (
                      <>
                        Cargar más ({items.length} de {total})
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

      {/* FOOTER FLOTANTE */}
      {!cartTipo ? (
        <div className="fixed bottom-6 right-6 z-40 flex items-center gap-2">
          <Button
            type="button"
            onClick={() => handleStartMode("INGRESO")}
            className="h-11 px-3.5 rounded-full bg-emerald-600 hover:bg-emerald-700 text-white shadow-xl shadow-emerald-600/30 gap-1.5 font-bold text-xs transition-transform active:scale-95 flex items-center"
            title="Activar modo Ingreso"
          >
            <Plus className="h-4 w-4" />
            <span>Ingreso</span>
          </Button>

          <Button
            type="button"
            onClick={() => handleStartMode("SALIDA")}
            className="h-11 px-3.5 rounded-full bg-rose-600 hover:bg-rose-700 text-white shadow-xl shadow-rose-600/30 gap-1.5 font-bold text-xs transition-transform active:scale-95 flex items-center"
            title="Activar modo Salida"
          >
            <Minus className="h-4 w-4" />
            <span>Salida</span>
          </Button>
        </div>
      ) : (
        <div className="fixed bottom-6 inset-x-4 sm:inset-x-auto sm:right-6 z-40 flex items-center justify-center gap-2 animate-in slide-in-from-bottom-3 duration-300">
          <Button
            type="button"
            onClick={() => setCartSheetOpen(true)}
            className={`h-12 sm:h-13 px-4 sm:px-5 rounded-2xl text-white shadow-2xl gap-3 font-bold text-xs sm:text-sm flex items-center justify-between flex-1 sm:flex-initial sm:min-w-[300px] border border-white/20 transition-transform active:scale-95 ${
              cartTipo === "SALIDA"
                ? "bg-rose-600 hover:bg-rose-700 shadow-rose-600/30"
                : "bg-emerald-600 hover:bg-emerald-700 shadow-emerald-600/30"
            }`}
          >
            <div className="flex items-center gap-2.5 min-w-0">
              <span className="flex h-7 w-7 items-center justify-center rounded-full bg-white/25 font-mono font-black text-xs shrink-0">
                {totalItemsCount}
              </span>
              <span className="truncate">
                {totalItemsCount === 0
                  ? `Modo ${cartTipo === "SALIDA" ? "Salida" : "Ingreso"}: Selecciona repuestos`
                  : `Vale de ${cartTipo === "SALIDA" ? "Salida" : "Ingreso"}: ${totalUnitsCount} unds`}
              </span>
            </div>
            <div className="flex items-center gap-1 font-black shrink-0">
              <span className="text-xs uppercase tracking-wider">Ver Vale</span>
              <ArrowRight className="h-4 w-4" />
            </div>
          </Button>

          <Button
            type="button"
            variant="secondary"
            size="icon"
            onClick={cancelMovement}
            className="h-12 sm:h-13 w-12 sm:w-13 rounded-2xl shadow-xl border border-border/60 bg-background/90 backdrop-blur-md text-muted-foreground hover:text-rose-500 shrink-0"
            title="Cancelar modo"
          >
            <X className="h-5 w-5" />
          </Button>
        </div>
      )}

      {/* PANTALLA COMPLETA DE DETALLE DEL PRODUCTO */}
      <ProductDetailSheet
        open={detailOpen}
        onOpenChange={setDetailOpen}
        product={selectedProduct}
        isAdmin={isAdmin}
        usuarioId={user?.id}
        token={getToken()}
        onEdit={startEdit}
        onAddMovement={(prod, cant, tipo) => {
          return addItem(prod, cant, tipo);
        }}
        onProductUpdated={() => {
          loadPage(searchQuery, page, false);
        }}
      />

      {/* SELECTOR RAPIDO DE CANTIDAD AL TOCAR UN PRODUCTO EN MODO ACTIVO */}
      <QuantitySelectorDialog
        open={selectorOpen}
        onOpenChange={setSelectorOpen}
        product={selectorProduct}
        defaultTipo={defaultSelectorTipo}
        lockedTipo={cartTipo}
        onAdd={(prod, cant, tipo) => {
          return addItem(prod, cant, tipo);
        }}
      />

      {/* VALE DE MOVIMIENTO (FULLSCREEN EN ANDROID / SIDEPANEL EN DESKTOP) */}
      <MovementCartSheet
        open={cartSheetOpen}
        onOpenChange={setCartSheetOpen}
        tipo={cartTipo}
        items={cartItems}
        token={getToken()}
        usuarioId={user?.id}
        onUpdateQty={updateItemQty}
        onRemoveItem={removeItem}
        onClearItems={clearItems}
        onCancelMovement={cancelMovement}
        onSuccess={() => {
          loadPage(searchQuery, page, false);
        }}
      />

      {/* EDIT DIALOG (SOLO ADMIN) */}
      <Dialog open={!!editingItem} onOpenChange={(open) => !open && setEditingItem(null)}>
        <DialogContent aria-describedby={undefined} className="fixed inset-0 z-50 w-full h-full translate-x-0 translate-y-0 rounded-none border-0 p-0 overflow-y-auto sm:fixed sm:inset-auto sm:left-[50%] sm:top-[50%] sm:max-w-lg sm:h-auto sm:translate-x-[-50%] sm:translate-y-[-50%] sm:rounded-2xl sm:border sm:p-6 sm:shadow-lg">
          <DialogHeader className="p-4 sm:p-0 sm:pb-2 border-b sm:border-b-0 sticky top-0 bg-background z-10">
            <DialogTitle className="text-base sm:text-lg">
              Editando Producto
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
