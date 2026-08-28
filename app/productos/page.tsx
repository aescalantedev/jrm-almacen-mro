"use client";

import { useState, useEffect, useCallback, useRef, useMemo } from "react";
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
  ClipboardCheck,
  Building2,
  Boxes,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { AlertDialog, AlertDialogAction, AlertDialogCancel, AlertDialogContent, AlertDialogDescription, AlertDialogFooter, AlertDialogHeader, AlertDialogTitle } from "@/components/ui/alert-dialog";
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
import { Combobox, ComboboxOption } from "@/components/ui/combobox";
import { Checkbox } from "@/components/ui/checkbox";
import { useAuth } from "../inventario/hooks/use-auth";
import { BarcodeScanner } from "@/components/ui/barcode-scanner";
import { ProductDetailSheet, MasterProduct } from "@/components/products/product-detail-sheet";
import { QuantitySelectorDialog, SelectorProduct } from "@/components/movimientos/quantity-selector-dialog";
import { QuickCountDialog, QuickCountProduct } from "@/components/products/quick-count-dialog";
import { MovementCartSheet } from "@/components/movimientos/movement-cart-sheet";
import { NewProductDialog } from "@/components/products/new-product-dialog";
import { MultiProductEditSheet } from "@/components/products/multi-product-edit-sheet";
import { useMovementCart, MovementCartType } from "@/hooks/use-movement-cart";
import { TableLoadMore } from "@/components/ui/table-load-more";

import { SkeletonCard } from "./components/skeleton-card";
import { EditFields } from "./components/edit-fields";
import { PAGE_SIZE, BodegaOption, ContenedorOption, MasterCatalogOptions } from "./types";


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

  // Catálogos para Comboboxes
  const [catalogs, setCatalogs] = useState<MasterCatalogOptions>({
    bodegas: [],
    grupos: [],
    unidades: [],
    contenedores: [],
    tiposAlmacenamiento: [],
  });

  // Overlays
  const [selectedProduct, setSelectedProduct] = useState<MasterProduct | null>(null);
  const [detailOpen, setDetailOpen] = useState(false);
  const [selectorProduct, setSelectorProduct] = useState<SelectorProduct | null>(null);
  const [selectorOpen, setSelectorOpen] = useState(false);
  const [defaultSelectorTipo, setDefaultSelectorTipo] = useState<"INGRESO" | "SALIDA">("SALIDA");
  const [quickCountProduct, setQuickCountProduct] = useState<QuickCountProduct | null>(null);
  const [quickCountOpen, setQuickCountOpen] = useState(false);

  const [cartSheetOpen, setCartSheetOpen] = useState(false);
  const [scannerOpen, setScannerOpen] = useState(false);
  const [selectedSkus, setSelectedSkus] = useState<string[]>([]);
  const [newProductOpen, setNewProductOpen] = useState(false);
  const [multiEditOpen, setMultiEditOpen] = useState(false);
  const [deletingMultiple, setDeletingMultiple] = useState(false);
  const [deleteConfirmOpen, setDeleteConfirmOpen] = useState(false);
  const debounceTimerRef = useRef<NodeJS.Timeout | null>(null);

  // Cart hook (Vales de Ingreso y Salida y Conteo)
  const {
    tipo: cartTipo,
    items: cartItems,
    inventarioCount,
    totalItemsCount,
    totalUnitsCount,
    startMovement,
    incrementInventarioCount,
    addItem,
    updateItemQty,
    removeItem,
    clearItems,
    cancelMovement,
  } = useMovementCart();

  const isAdmin = user?.rol === "admin" || user?.rol === "auditor" || user?.rol === "superadmin";

  const getToken = () => {
    if (authToken) return authToken;
    if (typeof window === "undefined") return "";
    const raw = localStorage.getItem("mro_auth");
    return raw ? JSON.parse(raw).token : "";
  };

  const loadCatalogs = useCallback(async () => {
    const token = getToken();
    if (!token) return;
    try {
      const res = await fetch("/api/maestros", {
        headers: { Authorization: `Bearer ${token}` },
      });
      if (res.ok) {
        const data = await res.json();
        setCatalogs({
          bodegas: data.bodegas || [{ id: 1, codigo: "MRO-CHILCA", nombre: "ALM MRO CHILCA" }],
          grupos: (data.grupos || []).map((g: { id: number; nombre: string; codigo: string }) => ({
            value: String(g.id),
            label: `${g.codigo} - ${g.nombre}`,
          })),
          unidades: (data.unidades || []).map((u: { codigo_unidad: string; nombre: string }) => ({
            value: u.codigo_unidad,
            label: `${u.codigo_unidad} (${u.nombre})`,
          })),
          contenedores: (data.contenedores || []).map((c: { id: number; bodega_id?: number; nombre: string; codigo_contenedor: string }) => ({
            id: c.id,
            bodega_id: c.bodega_id || 1,
            codigo_contenedor: c.codigo_contenedor,
            nombre: c.nombre,
          })),
          tiposAlmacenamiento: (data.tiposAlmacenamiento || []).map((t: { id: number; nombre: string; codigo: string }) => ({
            value: String(t.id),
            label: `${t.codigo} (${t.nombre})`,
          })),
        });
      }
    } catch {
      // ignore
    }
  }, []);

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

        const res = await fetch(`/api/productos?${params.toString()}`);
        const data = await res.json();

        if (append) {
          setItems((prev) => [...prev, ...(data.items || [])]);
        } else {
          setItems(data.items || []);
        }
        setTotal(data.total || 0);
        setHasMore((data.items?.length || 0) === PAGE_SIZE);
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
    loadCatalogs();
  }, [loadPage, loadCatalogs]);

  const handleSearchChange = (val: string) => {
    setSearchQuery(val);
    setPage(1);
    if (debounceTimerRef.current) clearTimeout(debounceTimerRef.current);
    debounceTimerRef.current = setTimeout(() => {
      loadPage(val, 1, false);
    }, 300);
  };

  const handleScanResult = (result: string) => {
    const clean = result.trim();
    setSearchQuery(clean);
    setScannerOpen(false);
    loadPage(clean, 1, false);
  };

  const handleLoadMore = () => {
    const nextPage = page + 1;
    setPage(nextPage);
    loadPage(searchQuery, nextPage, true);
  };

  const handleOpenDetail = (product: MasterProduct) => {
    setSelectedProduct(product);
    setDetailOpen(true);
  };

  const handleStartQuickCountDirect = (product: MasterProduct, e?: React.MouseEvent) => {
    if (e) e.stopPropagation();
    setQuickCountProduct({
      producto: product.producto,
      glosa: product.glosa,
      unidad: product.unidad || "UND",
      stock_actual: Number(product.stock_total ?? 0),
      rack: product.rack || "",
      posicion_detalle: product.posicion_detalle || "",
      lote: product.lote || "",
      foto_url: product.foto_url,
    });
    setQuickCountOpen(true);
  };

  const handleProductCardClick = (product: MasterProduct) => {
    if (cartTipo === "INVENTARIO") {
      handleStartQuickCountDirect(product);
    } else if (cartTipo === "INGRESO" || cartTipo === "SALIDA") {
      setSelectorProduct({
        producto: product.producto,
        glosa: product.glosa,
        unidad: product.unidad || "UND",
        stock_actual: Number(product.stock_total ?? 0),
        rack: product.rack || "",
        lote: product.lote || "",
      });
      setDefaultSelectorTipo(cartTipo);
      setSelectorOpen(true);
    } else {
      handleOpenDetail(product);
    }
  };

  const handleStartMode = (tipo: MovementCartType) => {
    if (!tipo) return;
    startMovement(tipo);
    if (tipo === "INVENTARIO") {
      toast.info("Modo Inventario activado. Toca cualquier repuesto para iniciar su conteo con cronómetro.");
    } else {
      toast.info(`Modo ${tipo === "INGRESO" ? "Ingreso" : "Salida"} activado. Toca los productos para agregarlos al vale.`);
    }
  };

  const startEdit = (item: MasterProduct) => {
    setEditingItem(item);
    setEditForm({ ...item });
  };

  const handleFieldChange = (field: string, value: string | number) => {
    setEditForm((prev) => ({ ...prev, [field]: value }));
  };

  const saveProduct = async (sku: string) => {
    setSaving(true);
    try {
      const res = await fetch("/api/productos", {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ producto: sku, ...editForm }),
      });

      if (res.ok) {
        toast.success("Producto actualizado correctamente");
        setEditingItem(null);
        loadPage(searchQuery, page, false);
      } else {
        const data = await res.json();
        toast.error(data.error || "Error al guardar");
      }
    } catch {
      toast.error("Error de conexión");
    } finally {
      setSaving(false);
    }
  };

  const isAllSelected = items.length > 0 && selectedSkus.length === items.length;

  const toggleSelectAll = () => {
    if (isAllSelected) {
      setSelectedSkus([]);
    } else {
      setSelectedSkus(items.map((i) => i.producto));
    }
  };

  const toggleSelectSku = (sku: string, e?: React.MouseEvent) => {
    if (e) e.stopPropagation();
    setSelectedSkus((prev) =>
      prev.includes(sku) ? prev.filter((s) => s !== sku) : [...prev, sku]
    );
  };

  const confirmDeleteSelected = () => {
    if (selectedSkus.length === 0) return;
    setDeleteConfirmOpen(true);
  };

  const executeDeleteSelected = async () => {
    setDeleteConfirmOpen(false);
    setDeletingMultiple(true);
    try {
      const res = await fetch("/api/productos", {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ skus: selectedSkus }),
      });

      const data = await res.json();
      if (res.ok) {
        toast.success(`${data.deleted || selectedSkus.length} productos eliminados`);
        setSelectedSkus([]);
        loadPage(searchQuery, 1, false);
      } else {
        toast.error(data.error || "Error al eliminar");
      }
    } catch {
      toast.error("Error de conexión al eliminar");
    } finally {
      setDeletingMultiple(false);
    }
  };

  const handleOpenMultiEdit = () => {
    if (selectedSkus.length === 0) return;
    setMultiEditOpen(true);
  };

  const selectedProductsList = useMemo(() => {
    return items.filter((i) => selectedSkus.includes(i.producto));
  }, [items, selectedSkus]);

  return (
    <div className="w-full px-3 sm:px-6 space-y-4 pb-28">
      {/* BARRA DE BÚSQUEDA Y ESCÁNER (STICKY TOP-0) */}
      <div className="sticky top-0 z-30 bg-background/95 backdrop-blur-md py-2.5 -mx-3 px-3 sm:-mx-6 sm:px-6 border-b border-border/40 shadow-2xs space-y-2">
        <div className="flex items-center gap-2">
          <div className="relative flex-1">
            <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              type="text"
              placeholder="Buscar por SKU, glosa, rack, contenedor o grupo..."
              value={searchQuery}
              onChange={(e) => handleSearchChange(e.target.value)}
              className="pl-10 pr-9 h-10 text-xs sm:text-sm rounded-xl bg-card border-border/60"
            />
            {searchQuery && (
              <button
                type="button"
                onClick={() => handleSearchChange("")}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground p-1"
              >
                <X className="h-4 w-4" />
              </button>
            )}
          </div>

          <Button
            type="button"
            variant="outline"
            size="icon"
            onClick={() => setScannerOpen(true)}
            className="h-10 w-10 rounded-xl shrink-0 border-border/60 hover:bg-secondary bg-card"
            title="Escanear código QR o barras"
          >
            <Barcode className="h-5 w-5 text-primary" />
          </Button>

          {isAdmin && (
            <Button
              type="button"
              onClick={() => setNewProductOpen(true)}
              className="h-10 text-xs font-bold gap-1.5 rounded-xl px-3.5 shrink-0 shadow-xs"
            >
              <Plus className="h-4 w-4" />
              <span className="hidden sm:inline">Nuevo Producto</span>
            </Button>
          )}
        </div>

        {/* BARRA DE ACCIÓN MASIVA SI HAY ITEMS SELECCIONADOS */}
        {selectedSkus.length > 0 && (
          <div className="flex items-center justify-between p-2 rounded-xl bg-primary/10 border border-primary/30 animate-in fade-in slide-in-from-top-1 text-xs">
            <div className="flex items-center gap-2 font-bold text-primary">
              <CheckCircle2 className="h-4 w-4" />
              <span>{selectedSkus.length} repuestos seleccionados</span>
            </div>

            <div className="flex items-center gap-1.5">
              <Button
                type="button"
                size="sm"
                variant="outline"
                onClick={handleOpenMultiEdit}
                className="h-7.5 px-3 text-xs font-bold gap-1 rounded-lg border-primary/40 text-primary bg-background hover:bg-primary/10"
              >
                <Edit3 className="h-3.5 w-3.5" />
                Editar ({selectedSkus.length})
              </Button>

              {isAdmin && (
                <Button
                  type="button"
                  size="sm"
                  variant="destructive"
                  onClick={confirmDeleteSelected}
                  disabled={deletingMultiple}
                  className="h-7.5 px-3 text-xs font-bold gap-1 rounded-lg"
                >
                  <Trash2 className="h-3.5 w-3.5" />
                  Eliminar ({selectedSkus.length})
                </Button>
              )}

              <Button
                type="button"
                size="sm"
                variant="ghost"
                onClick={() => setSelectedSkus([])}
                className="h-7.5 w-7.5 p-0 rounded-lg text-muted-foreground hover:text-foreground"
                title="Deseleccionar todos"
              >
                <X className="h-4 w-4" />
              </Button>
            </div>
          </div>
        )}
      </div>

      {/* SCANNER DIALOG */}
      <BarcodeScanner
        open={scannerOpen}
        onOpenChange={setScannerOpen}
        onResult={handleScanResult}
      />

      {/* MODAL PARA CREAR NUEVO PRODUCTO */}
      <NewProductDialog
        open={newProductOpen}
        onOpenChange={setNewProductOpen}
        onProductCreated={() => loadPage(searchQuery, 1, false)}
        catalogs={catalogs}
      />

      {/* MODAL MULTI-TABS PARA EDITAR PRODUCTOS SELECCIONADOS */}
      <MultiProductEditSheet
        open={multiEditOpen}
        onOpenChange={setMultiEditOpen}
        products={selectedProductsList}
        onSaved={() => {
          setSelectedSkus([]);
          loadPage(searchQuery, page, false);
        }}
        catalogs={catalogs}
      />

      {/* LISTA DE PRODUCTOS */}
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <CardContent className="p-0">
          {loading ? (
            <div className="grid grid-cols-1 divide-y divide-border/40">
              {Array.from({ length: 8 }).map((_, i) => (
                <SkeletonCard key={i} />
              ))}
            </div>
          ) : items.length === 0 ? (
            <div className="p-12 text-center space-y-3">
              <Package className="h-12 w-12 text-muted-foreground/40 mx-auto" />
              <p className="text-sm font-semibold text-foreground">No se encontraron productos</p>
              <p className="text-xs text-muted-foreground">Intenta con otro término de búsqueda</p>
            </div>
          ) : (
            <>
              {/* VISTA MÓVIL (CARDS INTERACTIVAS) */}
              <div className="block sm:hidden divide-y divide-border/40">
                {items.map((item) => {
                  const inCart = cartItems.find((ci) => ci.producto === item.producto);
                  const isSelected = selectedSkus.includes(item.producto);
                  const stockNum = Number(item.stock_total ?? 0);

                  return (
                    <div
                      key={item.producto}
                      onClick={() => handleProductCardClick(item)}
                      className={`p-3.5 space-y-2 cursor-pointer transition-colors active:bg-secondary/40 ${
                        isSelected
                          ? "bg-primary/10 border-l-4 border-primary"
                          : inCart
                          ? "bg-primary/5 border-l-4 border-primary"
                          : cartTipo === "INVENTARIO"
                          ? "hover:bg-primary/10 bg-primary/5 border-l-4 border-primary"
                          : "hover:bg-secondary/20"
                      }`}
                    >
                      <div className="flex items-center justify-between gap-2">
                        <div className="flex items-center gap-2 min-w-0">
                          <div onClick={(e) => e.stopPropagation()} className="pt-0.5">
                            <Checkbox
                              checked={isSelected}
                              onCheckedChange={() => toggleSelectSku(item.producto)}
                              className="rounded-sm border-muted-foreground/40"
                            />
                          </div>
                          <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                            {item.producto}
                          </span>
                          {item.familia && (
                            <Badge variant="outline" className="text-[10px] truncate max-w-[120px]">
                              {item.familia}
                            </Badge>
                          )}
                        </div>

                        <div className="flex items-center gap-1 text-right shrink-0">
                          <span className="font-mono text-sm font-black text-foreground">
                            {stockNum.toLocaleString()}
                          </span>
                          <span className="text-[10px] font-semibold text-muted-foreground">
                            {item.unidad || "UND"}
                          </span>
                        </div>
                      </div>

                      <div className="text-xs font-bold text-foreground line-clamp-2 leading-relaxed">
                        {item.glosa}
                      </div>

                      <div className="flex items-center justify-between pt-1 text-[11px] text-muted-foreground">
                        <div className="flex items-center gap-1 truncate max-w-[180px]">
                          <MapPin className="h-3 w-3 text-primary shrink-0" />
                          <span className="truncate font-semibold">{item.rack || "Sin asignar"}</span>
                        </div>

                        <div className="flex items-center gap-1.5" onClick={(e) => e.stopPropagation()}>
                          <Button
                            type="button"
                            variant="ghost"
                            size="sm"
                            onClick={(e) => handleStartQuickCountDirect(item, e)}
                            className="h-7 px-2 text-[10px] font-bold text-emerald-600 dark:text-emerald-400 bg-emerald-500/10 hover:bg-emerald-500/20 rounded-lg gap-1"
                            title="Conteo rápido con cronómetro"
                          >
                            <ClipboardCheck className="h-3.5 w-3.5" />
                            Contar
                          </Button>

                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            onClick={() => handleOpenDetail(item)}
                            className="h-7 w-7 rounded-lg text-muted-foreground hover:text-foreground"
                          >
                            <Eye className="h-3.5 w-3.5" />
                          </Button>
                        </div>
                      </div>
                    </div>
                  );
                })}
              </div>

              {/* VISTA DESKTOP (TABLA CORPORATIVA 100% ANCHO CON CHECKBOX) */}
              <div className="hidden sm:block overflow-x-auto">
                <table className="w-full text-left text-xs border-collapse">
                  <thead className="bg-secondary/30 text-muted-foreground uppercase text-[10px] font-bold tracking-wider border-b border-border/50">
                    <tr>
                      <th className="py-3 px-4 w-[40px]">
                        <Checkbox
                          checked={isAllSelected}
                          onCheckedChange={toggleSelectAll}
                          className="rounded-sm border-muted-foreground/40"
                        />
                      </th>
                      <th className="py-3 px-3">SKU / Material</th>
                      <th className="py-3 px-4">Descripción (Glosa)</th>
                      <th className="py-3 px-3">Grupo / Familia</th>
                      <th className="py-3 px-3">Almacén / Contenedor</th>
                      <th className="py-3 px-3">Ubicación (Rack)</th>
                      <th className="py-3 px-3 text-right">Stock Real</th>
                      {isAdmin && <th className="py-3 px-3 text-center">Costo Unit.</th>}
                      <th className="py-3 px-3 text-center">Acciones</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-border/40 font-medium">
                    {items.map((item) => {
                      const inCart = cartItems.find((ci) => ci.producto === item.producto);
                      const isSelected = selectedSkus.includes(item.producto);
                      const stockNum = Number(item.stock_total ?? 0);

                      return (
                        <tr
                          key={item.producto}
                          onClick={() => handleProductCardClick(item)}
                          className={`cursor-pointer transition-colors ${
                            isSelected
                              ? "bg-primary/10 hover:bg-primary/15"
                              : inCart
                              ? "bg-primary/5 hover:bg-primary/10"
                              : cartTipo === "INVENTARIO"
                              ? "hover:bg-primary/10 bg-primary/5"
                              : "hover:bg-secondary/20"
                          }`}
                        >
                          <td className="py-2.5 px-4" onClick={(e) => e.stopPropagation()}>
                            <Checkbox
                              checked={isSelected}
                              onCheckedChange={() => toggleSelectSku(item.producto)}
                              className="rounded-sm border-muted-foreground/40"
                            />
                          </td>
                          <td className="py-2.5 px-3 font-mono font-bold text-primary">
                            {item.producto}
                          </td>
                          <td className="py-2.5 px-4 font-bold text-foreground max-w-sm truncate">
                            {item.glosa}
                          </td>
                          <td className="py-2.5 px-3">
                            <Badge variant="outline" className="text-[10px] truncate max-w-[130px]">
                              {item.familia || "GENERAL"}
                            </Badge>
                          </td>
                          <td className="py-2.5 px-3 text-muted-foreground truncate max-w-[140px]">
                            {item.contenedor_nombre || "Almacén Central"}
                          </td>
                          <td className="py-2.5 px-3">
                            <span className="font-mono text-muted-foreground font-semibold">
                              {item.rack || "Sin asignar"}
                            </span>
                          </td>
                          <td className="py-2.5 px-3 text-right font-mono font-black text-foreground">
                            {stockNum.toLocaleString()}{" "}
                            <span className="text-[10px] font-normal text-muted-foreground">
                              {item.unidad || "UND"}
                            </span>
                          </td>
                          {isAdmin && (
                            <td className="py-2.5 px-3 text-center font-mono font-bold text-primary">
                              {item.costo_unitario > 0 ? `S/ ${item.costo_unitario.toFixed(2)}` : "-"}
                            </td>
                          )}
                          <td className="py-2.5 px-3 text-center" onClick={(e) => e.stopPropagation()}>
                            <div className="flex items-center justify-center gap-1.5">
                              <Button
                                type="button"
                                variant="ghost"
                                size="sm"
                                onClick={(e) => handleStartQuickCountDirect(item, e)}
                                className="h-7 px-2.5 text-[10px] font-bold text-emerald-600 dark:text-emerald-400 bg-emerald-500/10 hover:bg-emerald-500/20 rounded-lg gap-1"
                                title="Conteo rápido con cronómetro"
                              >
                                <ClipboardCheck className="h-3.5 w-3.5" />
                                Contar
                              </Button>

                              <Button
                                type="button"
                                variant="ghost"
                                size="sm"
                                className="h-7 px-2.5 text-[11px] font-bold text-primary hover:bg-primary/10 rounded-lg"
                                onClick={() => handleOpenDetail(item)}
                              >
                                <FileText className="h-3.5 w-3.5 mr-1" /> Detalle
                              </Button>

                              {isAdmin && (
                                <Button
                                  type="button"
                                  variant="ghost"
                                  size="icon"
                                  className="h-7 w-7 rounded-lg text-muted-foreground hover:text-foreground"
                                  onClick={() => {
                                    setSelectedSkus([item.producto]);
                                    setMultiEditOpen(true);
                                  }}
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

              {/* PIE DE TABLA UNIFICADO (CARGAR 50 MÁS) */}
              <TableLoadMore
                currentCount={items.length}
                totalCount={total}
                hasMore={hasMore && items.length < total}
                loadingMore={loadingMore}
                onLoadMore={handleLoadMore}
                itemName="productos"
              />
            </>
          )}
        </CardContent>
      </Card>

      {/* FOOTER FLOTANTE CON LAS 3 ACCIONES DEL OPERARIO: CONTEO, INGRESO, SALIDA */}
      {cartTipo === "INVENTARIO" ? (
        <div className="fixed bottom-6 inset-x-4 sm:inset-x-auto sm:right-6 z-40 flex items-center justify-center gap-2 animate-in slide-in-from-bottom-3 duration-300">
          <div className="h-12 sm:h-13 px-4 sm:px-5 rounded-2xl bg-primary text-primary-foreground shadow-2xl gap-3 font-bold text-xs sm:text-sm flex items-center justify-between flex-1 sm:flex-initial sm:min-w-[320px] border border-white/20">
            <div className="flex items-center gap-2.5">
              <span className="flex h-7 w-7 items-center justify-center rounded-full bg-white/25 font-mono font-black text-xs shrink-0">
                {inventarioCount}
              </span>
              <span className="truncate">
                {inventarioCount === 0
                  ? "Modo Inventario: Toca un repuesto para auditar"
                  : `Modo Inventario: ${inventarioCount} repuestos auditados`}
              </span>
            </div>
          </div>
          <Button
            type="button"
            variant="secondary"
            size="icon"
            onClick={cancelMovement}
            className="h-12 sm:h-13 w-12 sm:w-13 rounded-2xl shadow-xl border border-border/60 bg-background/90 backdrop-blur-md text-muted-foreground hover:text-rose-500 shrink-0"
            title="Finalizar / Salir del modo inventario"
          >
            <X className="h-5 w-5" />
          </Button>
        </div>
      ) : cartTipo === "INGRESO" || cartTipo === "SALIDA" ? (
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
      ) : (
        <div className="fixed bottom-6 right-4 sm:right-6 z-40 flex items-center gap-2 animate-in fade-in duration-200">
          {/* BOTÓN 1: CONTEO RÁPIDO */}
          <Button
            type="button"
            onClick={() => handleStartMode("INVENTARIO")}
            className="h-11 px-3.5 sm:px-4 rounded-full bg-primary hover:bg-primary/90 text-primary-foreground shadow-xl shadow-primary/30 gap-1.5 font-bold text-xs transition-transform active:scale-95 flex items-center"
            title="Activar modo Conteo / Inventario Continuo"
          >
            <ClipboardCheck className="h-4 w-4" />
            <span>Inventario</span>
          </Button>

          {/* BOTÓN 2: INGRESO */}
          <Button
            type="button"
            onClick={() => handleStartMode("INGRESO")}
            className="h-11 px-3.5 sm:px-4 rounded-full bg-emerald-600 hover:bg-emerald-700 text-white shadow-xl shadow-emerald-600/30 gap-1.5 font-bold text-xs transition-transform active:scale-95 flex items-center"
            title="Activar modo Ingreso"
          >
            <Plus className="h-4 w-4" />
            <span>Ingreso</span>
          </Button>

          {/* BOTÓN 3: SALIDA */}
          <Button
            type="button"
            onClick={() => handleStartMode("SALIDA")}
            className="h-11 px-3.5 sm:px-4 rounded-full bg-rose-600 hover:bg-rose-700 text-white shadow-xl shadow-rose-600/30 gap-1.5 font-bold text-xs transition-transform active:scale-95 flex items-center"
            title="Activar modo Salida"
          >
            <Minus className="h-4 w-4" />
            <span>Salida</span>
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
        lockedTipo={cartTipo === "INVENTARIO" ? null : cartTipo}
        onAdd={(prod, cant, tipo) => {
          return addItem(prod, cant, tipo);
        }}
      />

      {/* MODAL DE CONTEO RÁPIDO DIRECTO DESDE LISTA */}
      <QuickCountDialog
        open={quickCountOpen}
        onOpenChange={setQuickCountOpen}
        product={quickCountProduct}
        onSaved={() => {
          if (cartTipo === "INVENTARIO") {
            incrementInventarioCount();
          }
          loadPage(searchQuery, page, false);
        }}
      />

      {/* VALE DE MOVIMIENTO (FULLSCREEN EN ANDROID / SIDEPANEL EN DESKTOP) */}
      <MovementCartSheet
        open={cartSheetOpen}
        onOpenChange={setCartSheetOpen}
        tipo={cartTipo === "INVENTARIO" ? null : cartTipo}
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

      {/* EDIT DIALOG CON JERARQUÍA COMPLETA BODEGA -> CONTENEDOR -> RACK -> POSICIÓN */}
      <Dialog open={!!editingItem} onOpenChange={(open) => !open && setEditingItem(null)}>
        <DialogContent aria-describedby={undefined} className="fixed inset-0 z-50 w-full h-full translate-x-0 translate-y-0 rounded-none border-0 p-0 overflow-y-auto sm:fixed sm:inset-auto sm:left-[50%] sm:top-[50%] sm:max-w-2xl sm:h-auto sm:max-h-[90vh] sm:translate-x-[-50%] sm:translate-y-[-50%] sm:rounded-2xl sm:border sm:p-6 sm:shadow-2xl bg-background">
          <DialogHeader className="p-4 sm:p-0 sm:pb-3 border-b sm:border-b-0 sticky top-0 bg-background z-10">
            <div className="flex items-center justify-between">
              <div>
                <DialogTitle className="text-base sm:text-lg font-bold">
                  Editar Datos Maestros (SAP MM)
                </DialogTitle>
                <p className="text-xs text-muted-foreground font-mono mt-0.5">
                  SKU: {editingItem?.producto} — {editingItem?.glosa}
                </p>
              </div>
            </div>
          </DialogHeader>

          <div className="px-4 sm:px-0 py-2 space-y-4">
            {editingItem && (
              <EditFields
                form={editForm}
                onChange={handleFieldChange}
                catalogs={catalogs}
              />
            )}
          </div>

          <DialogFooter className="p-4 sm:p-0 sm:pt-3 border-t sm:border-t-0 sticky bottom-0 bg-background z-10 flex-row gap-2">
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
              className="h-10 text-xs font-bold gap-1.5 rounded-xl flex-1 sm:flex-none bg-primary text-primary-foreground"
            >
              {saving ? <Loader2 className="h-3.5 w-3.5 animate-spin" /> : <Save className="h-3.5 w-3.5" />}
              Guardar Cambios
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>

      {/* DIALOG DE CONFIRMACION DE ELIMINACION */}
      <AlertDialog open={deleteConfirmOpen} onOpenChange={setDeleteConfirmOpen}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>¿Eliminar productos?</AlertDialogTitle>
            <AlertDialogDescription>
              ¿Estás seguro de que deseas eliminar los {selectedSkus.length} productos seleccionados?
              Esta acción no se puede deshacer y borrará el historial de estos productos.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel disabled={deletingMultiple}>Cancelar</AlertDialogCancel>
            <AlertDialogAction 
              onClick={executeDeleteSelected}
              className="bg-destructive text-destructive-foreground hover:bg-destructive/90"
              disabled={deletingMultiple}
            >
              Eliminar
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}