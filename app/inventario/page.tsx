"use client";

import { useState, useEffect, useCallback, useMemo } from "react";
import { toast } from "sonner";
import {
  Search,
  Package,
  Save,
  RotateCcw,
  Edit3,
  Trash2,
  CheckCircle2,
  AlertTriangle,
  XCircle,
  Clock,
  Loader2,
  MapPin,
  Barcode,
  ArrowRight,
  ClipboardList,
  Layers,
  Plus,
  Minus,
  Copy,
  X,
  Box,
  Scale,
  Ruler,
  Tag,
  ChevronDown,
  ChevronUp,
  FileSpreadsheet,
  Download
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Combobox } from "@/components/ui/combobox";

interface StockItem {
  id: number;
  producto: string;
  lote: string;
  glosa: string;
  unidad: string;
  stock: number;
  familia: string;
  peso: number;
  ubicacion?: string;
}

interface InventarioItem {
  id: number;
  producto: string;
  lote: string;
  descripcion: string;
  stock_sistema: number;
  unidad: string;
  familia: string;
  familia2: string;
  cantidad_fisica: number;
  dif: number;
  um: string;
  presentacion: string;
  n_cajas_bultos: string;
  largo: number;
  ancho: number;
  alto: number;
  peso_aprox_unitario: number;
  peso_total_cant_fisica: number;
  observacion: string;
  comentario: string;
  rack: string;
  ubicacion_actual: string;
  almacenamiento: string;
  contenedor: string;
  responsable: string;
  fecha_conteo: string;
  costo_unitario: number;
  total_costo: number;
  s_dif: number;
  rotacion: string;
  linea: string;
  prioridad: string;
  usuario_nombre: string;
  updated_at: string;
}

const FAMILIA2_OPTIONS = [
  "REPUESTO",
  "CONSUMIBLE",
  "HERRAMIENTAS",
  "EPP",
  "MATERIALES",
  "ACCESORIO",
  "ECONOMATO",
  "SUMINISTRO",
  "PINTURA",
  "LIMPIEZA",
  "OTRO",
];

const PRESENTACION_OPTIONS = [
  "CAJA",
  "SUELTO",
  "EMPAQUE",
  "EMBASE",
  "BOLSA",
  "ROLLO",
  "ENVUELTO",
  "SPRAY",
  "PAQUETE",
  "BIDON",
  "RODILLO",
  "SACO",
  "BALDE",
  "BALDE DE LATA",
  "OTRO",
];

const UM_OPTIONS = [
  "UND",
  "CIEN",
  "PAR",
  "MT",
  "JGO",
  "KG",
  "GL",
  "MTS",
  "MIL",
  "CJA",
  "LT",
  "PAQ",
  "RLLO",
  "GALON",
];

const defaultForm = {
  producto: "",
  lote: "",
  descripcion: "",
  stock_sistema: 0,
  unidad: "UND",
  familia: "",
  familia2: "REPUESTO",
  cantidad_fisica: 0,
  um: "UND",
  presentacion: "SUELTO",
  n_cajas_bultos: "1 UND",
  largo: 0,
  ancho: 0,
  alto: 0,
  peso_aprox_unitario: 0,
  observacion: "OK",
  comentario: "",
  rack: "",
  ubicacion_actual: "",
  almacenamiento: "",
  contenedor: "",
  responsable: "",
  fecha_conteo: new Date().toISOString().split("T")[0],
  costo_unitario: 0,
};

export default function InventarioPage() {
  const [activeTab, setActiveTab] = useState<string>("conteo");
  const [user, setUser] = useState<{ id: number; nombre: string } | null>(null);
  const [token, setToken] = useState("");

  // Search & Catalog State
  const [searchQuery, setSearchQuery] = useState("");
  const [stockResults, setStockResults] = useState<StockItem[]>([]);
  const [searching, setSearching] = useState(false);

  // Form State
  const [form, setForm] = useState(defaultForm);
  const [isEditing, setIsEditing] = useState<number | null>(null);
  const [saving, setSaving] = useState(false);
  const [showAdvanced, setShowAdvanced] = useState(true);

  // User Records State
  const [registros, setRegistros] = useState<InventarioItem[]>([]);
  const [loadingRegistros, setLoadingRegistros] = useState(true);
  const [recordFilterStatus, setRecordFilterStatus] = useState<string>("TODOS");
  const [recordSearchQuery, setRecordSearchQuery] = useState("");

  // Catalog Explorer State
  const [catalogItems, setCatalogItems] = useState<StockItem[]>([]);
  const [loadingCatalog, setLoadingCatalog] = useState(false);
  const [catalogSearch, setCatalogSearch] = useState("");

  useEffect(() => {
    try {
      const raw = localStorage.getItem("mro_auth");
      if (raw) {
        const d = JSON.parse(raw);
        setUser(d.user);
        setToken(d.token);
        if (d.user?.nombre) {
          setForm((prev) => ({ ...prev, responsable: d.user.nombre }));
        }
      }
    } catch {
      window.location.href = "/auth/login";
    }
  }, []);

  const loadRegistros = useCallback(async () => {
    if (!token) return;
    try {
      const res = await fetch(`/api/inventario?limit=9999`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      const data = await res.json();
      setRegistros(data.items || []);
    } catch {
      toast.error("Error al cargar los registros");
    } finally {
      setLoadingRegistros(false);
    }
  }, [token]);

  const loadCatalog = useCallback(async (query = "") => {
    if (!token) return;
    setLoadingCatalog(true);
    try {
      const res = await fetch(`/api/stock?q=${encodeURIComponent(query)}&limit=100`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      const data = await res.json();
      setCatalogItems(data.stock || []);
    } catch {
      toast.error("Error al cargar catálogo");
    } finally {
      setLoadingCatalog(false);
    }
  }, [token]);

  useEffect(() => {
    if (token) {
      loadRegistros();
    }
  }, [token, loadRegistros]);

  useEffect(() => {
    if (activeTab === "catalogo" && token && catalogItems.length === 0) {
      loadCatalog();
    }
  }, [activeTab, token, catalogItems.length, loadCatalog]);

  const searchStock = async () => {
    if (!searchQuery.trim()) return;
    setSearching(true);
    try {
      const res = await fetch(`/api/stock?q=${encodeURIComponent(searchQuery)}&limit=30`, {
        headers: { Authorization: `Bearer ${token}` }
      });
      const data = await res.json();
      setStockResults(data.stock || []);
      if (!data.stock?.length) {
        toast.warning("No se encontraron productos con ese código");
      }
    } catch {
      toast.error("Error al buscar en el catálogo");
    } finally {
      setSearching(false);
    }
  };

  const selectStock = (item: StockItem) => {
    const defaultObs = "OK";
    const baseUM = item.unidad || "UND";
    let defaultFam2 = "REPUESTO";
    if (item.familia === "HERRAMIENTAS") defaultFam2 = "HERRAMIENTAS";
    else if (item.familia === "CONSUMIBLES") defaultFam2 = "CONSUMIBLE";
    else if (item.familia === "EPP") defaultFam2 = "EPP";

    setForm({
      ...defaultForm,
      producto: item.producto,
      lote: item.lote || "",
      descripcion: item.glosa || "",
      stock_sistema: item.stock || 0,
      unidad: baseUM,
      um: baseUM,
      familia: item.familia || "",
      familia2: defaultFam2,
      peso_aprox_unitario: item.peso || 0,
      ubicacion_actual: item.ubicacion || "",
      cantidad_fisica: item.stock || 0,
      observacion: defaultObs,
      responsable: user?.nombre || "",
      fecha_conteo: new Date().toISOString().split("T")[0],
    });
    setStockResults([]);
    setSearchQuery("");
    setIsEditing(null);
    setActiveTab("conteo");
    toast.info(`Producto ${item.producto} cargado`);
  };

  const handleSave = async () => {
    if (!form.producto) {
      toast.error("Seleccione o busque un producto primero");
      return;
    }
    setSaving(true);
    try {
      const body = { ...form, usuario_id: user?.id };
      const url = isEditing ? `/api/inventario/${isEditing}` : "/api/inventario";
      const method = isEditing ? "PUT" : "POST";
      const res = await fetch(url, {
        method,
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`
        },
        body: JSON.stringify(isEditing ? { id: isEditing, ...body } : body)
      });
      if (res.ok) {
        toast.success(isEditing ? "Registro actualizado con éxito" : "Conteo guardado exitosamente");
        setForm({
          ...defaultForm,
          responsable: user?.nombre || "",
          fecha_conteo: new Date().toISOString().split("T")[0],
        });
        setIsEditing(null);
        loadRegistros();
      } else {
        const d = await res.json();
        toast.error(d.error || "Error al guardar registro");
      }
    } catch {
      toast.error("Error de conexión al guardar");
    } finally {
      setSaving(false);
    }
  };

  const editRecord = (item: InventarioItem) => {
    setForm({
      producto: item.producto,
      lote: item.lote || "",
      descripcion: item.descripcion,
      stock_sistema: item.stock_sistema,
      unidad: item.unidad || "UND",
      familia: item.familia || "",
      familia2: item.familia2 || "REPUESTO",
      cantidad_fisica: item.cantidad_fisica,
      um: item.um || item.unidad || "UND",
      presentacion: item.presentacion || "SUELTO",
      n_cajas_bultos: item.n_cajas_bultos || "1 UND",
      largo: item.largo || 0,
      ancho: item.ancho || 0,
      alto: item.alto || 0,
      peso_aprox_unitario: item.peso_aprox_unitario || 0,
      rack: item.rack || "",
      ubicacion_actual: item.ubicacion_actual || "",
      almacenamiento: item.almacenamiento || "",
      contenedor: item.contenedor || "",
      observacion: item.observacion || "OK",
      comentario: item.comentario || "",
      responsable: item.responsable || user?.nombre || "",
      fecha_conteo: item.fecha_conteo || new Date().toISOString().split("T")[0],
      costo_unitario: item.costo_unitario || 0,
    });
    setIsEditing(item.id);
    setActiveTab("conteo");
    window.scrollTo({ top: 0, behavior: "smooth" });
    toast.info(`Editando registro #${item.id} (${item.producto})`);
  };

  const deleteRecord = async (id: number) => {
    if (!confirm("¿Deseas eliminar este registro de inventario?")) return;
    try {
      const res = await fetch(`/api/inventario/${id}`, {
        method: "DELETE",
        headers: { Authorization: `Bearer ${token}` }
      });
      if (res.ok) {
        toast.success("Registro eliminado");
        loadRegistros();
      } else {
        toast.error("No se pudo eliminar el registro");
      }
    } catch {
      toast.error("Error al eliminar");
    }
  };

  const clearForm = () => {
    setForm({
      ...defaultForm,
      responsable: user?.nombre || "",
      fecha_conteo: new Date().toISOString().split("T")[0],
    });
    setIsEditing(null);
    setStockResults([]);
    setSearchQuery("");
  };

  // Difference and auto observation
  const dif = (form.cantidad_fisica || 0) - (form.stock_sistema || 0);
  const pesoTotal = (form.cantidad_fisica || 0) * (form.peso_aprox_unitario || 0);

  const updateQuantity = (newQty: number) => {
    const val = Math.max(0, newQty);
    const newDif = val - form.stock_sistema;
    let autoObs = form.observacion;
    if (newDif === 0) autoObs = "OK";
    else if (newDif > 0) autoObs = "SOBRANTE";
    else if (newDif < 0) autoObs = "FALTANTE";

    setForm((prev) => ({
      ...prev,
      cantidad_fisica: val,
      observacion: autoObs,
    }));
  };

  const getObsBadge = (obs: string) => {
    switch (obs) {
      case "OK":
        return (
          <Badge className="bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 hover:bg-emerald-500/20 border-emerald-500/30 text-[11px] gap-1 py-0.5">
            <CheckCircle2 className="h-3 w-3" />
            OK
          </Badge>
        );
      case "FALTANTE":
        return (
          <Badge className="bg-rose-500/10 text-rose-600 dark:text-rose-400 hover:bg-rose-500/20 border-rose-500/30 text-[11px] gap-1 py-0.5">
            <XCircle className="h-3 w-3" />
            Faltante
          </Badge>
        );
      case "SOBRANTE":
        return (
          <Badge className="bg-amber-500/10 text-amber-600 dark:text-amber-400 hover:bg-amber-500/20 border-amber-500/30 text-[11px] gap-1 py-0.5">
            <AlertTriangle className="h-3 w-3" />
            Sobrante
          </Badge>
        );
      default:
        return (
          <Badge variant="secondary" className="text-[11px] gap-1 py-0.5">
            <Clock className="h-3 w-3" />
            Pendiente
          </Badge>
        );
    }
  };

  // Filtered records for Tab 2
  const filteredRegistros = useMemo(() => {
    return registros.filter((item) => {
      const matchStatus =
        recordFilterStatus === "TODOS" || item.observacion === recordFilterStatus;
      const q = recordSearchQuery.toLowerCase();
      const matchQuery =
        !q ||
        item.producto.toLowerCase().includes(q) ||
        (item.descripcion && item.descripcion.toLowerCase().includes(q)) ||
        (item.lote && item.lote.toLowerCase().includes(q)) ||
        (item.rack && item.rack.toLowerCase().includes(q)) ||
        (item.familia2 && item.familia2.toLowerCase().includes(q));
      return matchStatus && matchQuery;
    });
  }, [registros, recordFilterStatus, recordSearchQuery]);

  return (
    <div className="w-full space-y-4">
      {/* Navigation Tabs Header */}
      <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
        <TabsList className="grid grid-cols-3 w-full h-12 p-1 bg-secondary/40 rounded-xl">
          <TabsTrigger
            value="conteo"
            className="flex items-center justify-center gap-1.5 sm:gap-2 text-xs sm:text-sm font-bold rounded-lg data-[state=active]:bg-background data-[state=active]:text-primary data-[state=active]:shadow-sm transition-all"
          >
            <Barcode className="h-4 w-4" />
            <span>Registrar Conteo</span>
            {isEditing && (
              <span className="h-2 w-2 rounded-full bg-amber-500 animate-pulse" />
            )}
          </TabsTrigger>

          <TabsTrigger
            value="registros"
            className="flex items-center justify-center gap-1.5 sm:gap-2 text-xs sm:text-sm font-bold rounded-lg data-[state=active]:bg-background data-[state=active]:text-primary data-[state=active]:shadow-sm transition-all"
          >
            <ClipboardList className="h-4 w-4" />
            <span>Mis Registros</span>
            <Badge variant="secondary" className="ml-1 px-1.5 py-0 text-[10px] font-mono">
              {registros.length}
            </Badge>
          </TabsTrigger>

          <TabsTrigger
            value="catalogo"
            className="flex items-center justify-center gap-1.5 sm:gap-2 text-xs sm:text-sm font-bold rounded-lg data-[state=active]:bg-background data-[state=active]:text-primary data-[state=active]:shadow-sm transition-all"
          >
            <Package className="h-4 w-4" />
            <span className="hidden sm:inline">Explorar Stock</span>
            <span className="sm:hidden">Catálogo</span>
          </TabsTrigger>
        </TabsList>

        {/* ========================================================= */}
        {/* TAB 1: REGISTRAR CONTEO (MOBILE FIRST & ANDROID ERGONOMIC) */}
        {/* ========================================================= */}
        <TabsContent value="conteo" className="space-y-4 mt-4 focus-visible:outline-none">
          {/* STEP 1: PROMINENT SEARCH BAR */}
          <Card className="border-border/60 shadow-xs">
            <CardContent className="p-3 sm:p-4 space-y-3">
              <div className="flex flex-col sm:flex-row gap-2">
                <div className="relative flex-1">
                  <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 h-5 w-5 text-muted-foreground" />
                  <Input
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    onKeyDown={(e) => e.key === "Enter" && searchStock()}
                    placeholder="Código SKU, glosa o lote (ej: 20.90.04...)"
                    className="pl-11 pr-10 font-mono text-sm sm:text-base h-12 rounded-xl bg-secondary/30 focus-visible:ring-2 focus-visible:ring-primary/40"
                    autoCapitalize="characters"
                    autoComplete="off"
                  />
                  {searchQuery && (
                    <button
                      type="button"
                      onClick={() => {
                        setSearchQuery("");
                        setStockResults([]);
                      }}
                      className="absolute right-3 top-1/2 -translate-y-1/2 p-1 text-muted-foreground hover:text-foreground rounded-full"
                    >
                      <X className="h-4 w-4" />
                    </button>
                  )}
                </div>
                <Button
                  type="button"
                  onClick={searchStock}
                  disabled={searching}
                  className="h-12 px-6 font-bold text-sm rounded-xl shrink-0"
                >
                  {searching ? (
                    <Loader2 className="animate-spin mr-2 h-4 w-4" />
                  ) : (
                    <Search className="mr-2 h-4 w-4" />
                  )}
                  Buscar Producto
                </Button>
              </div>

              {/* SEARCH RESULTS (CARD LIST) */}
              {stockResults.length > 0 && (
                <div className="space-y-2 pt-2">
                  <div className="flex items-center justify-between text-xs text-muted-foreground font-semibold px-1">
                    <span>Resultados ({stockResults.length}) — Toca para seleccionar</span>
                    <Button
                      variant="ghost"
                      size="sm"
                      onClick={() => setStockResults([])}
                      className="h-6 text-[11px] px-2"
                    >
                      Cerrar
                    </Button>
                  </div>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-2 max-h-72 overflow-y-auto p-1 border border-border/50 rounded-xl bg-background/50">
                    {stockResults.map((item, i) => (
                      <div
                        key={`${item.producto}-${item.lote}-${i}`}
                        onClick={() => selectStock(item)}
                        role="button"
                        tabIndex={0}
                        onKeyDown={(e) => {
                          if (e.key === "Enter" || e.key === " ") {
                            selectStock(item);
                          }
                        }}
                        className="w-full text-left p-3 rounded-xl border border-border/40 hover:border-primary/50 hover:bg-primary/5 transition flex flex-col justify-between gap-2 cursor-pointer active:scale-[0.99]"
                      >
                        <div className="flex items-start justify-between gap-2">
                          <span className="font-mono font-bold text-xs bg-secondary px-2 py-0.5 rounded border border-border/60 text-foreground">
                            {item.producto}
                          </span>
                          <span className="text-xs font-mono font-bold text-primary">
                            Stock: {item.stock} {item.unidad}
                          </span>
                        </div>
                        <div className="text-xs font-medium text-foreground line-clamp-2">
                          {item.glosa}
                        </div>
                        <div className="flex items-center justify-between text-[11px] text-muted-foreground pt-1 border-t border-border/30">
                          <span>Lote: <strong className="font-mono text-foreground">{item.lote || "S/L"}</strong></span>
                          <span>{item.familia || "MRO"}</span>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              )}
            </CardContent>
          </Card>

          {/* STEP 2: ACTIVE COUNTING INTERFACE (WHEN PRODUCT IS LOADED OR EDITING) */}
          {form.producto ? (
            <Card className="border-border/60 shadow-md">
              {/* Product Info Header Banner */}
              <CardHeader className="p-4 bg-secondary/30 border-b border-border/40">
                <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
                  <div className="space-y-1">
                    <div className="flex flex-wrap items-center gap-2">
                      <span className="font-mono font-black text-sm sm:text-base px-2.5 py-0.5 rounded-lg bg-primary text-primary-foreground">
                        {form.producto}
                      </span>
                      {form.lote && (
                        <Badge variant="outline" className="text-xs font-mono">
                          Lote: {form.lote}
                        </Badge>
                      )}
                      {form.familia && (
                        <Badge variant="secondary" className="text-[11px]">
                          {form.familia}
                        </Badge>
                      )}
                      {isEditing && (
                        <Badge className="bg-amber-500/20 text-amber-600 dark:text-amber-400 border-amber-500/30 text-xs">
                          Editando #{isEditing}
                        </Badge>
                      )}
                    </div>
                    <div className="text-sm font-semibold text-foreground mt-1">
                      {form.descripcion}
                    </div>
                  </div>

                  <div className="flex items-center justify-between sm:justify-end gap-3 shrink-0 pt-2 sm:pt-0 border-t sm:border-t-0 border-border/40">
                    <div className="text-right">
                      <div className="text-[10px] uppercase font-bold text-muted-foreground">Stock Sistema</div>
                      <div className="text-base font-mono font-extrabold text-foreground">
                        {form.stock_sistema} <span className="text-xs font-normal text-muted-foreground">{form.unidad}</span>
                      </div>
                    </div>
                    <Button
                      type="button"
                      variant="outline"
                      size="sm"
                      onClick={clearForm}
                      className="h-8 text-xs text-muted-foreground hover:text-foreground"
                    >
                      <X className="h-3.5 w-3.5 mr-1" />
                      Cambiar
                    </Button>
                  </div>
                </div>
              </CardHeader>

              <CardContent className="p-4 sm:p-6 space-y-6">
                <form
                  onSubmit={(e) => {
                    e.preventDefault();
                    handleSave();
                  }}
                  className="space-y-6"
                >
                  {/* HERO COUNT INPUT (ANDROID TOUCH ERGONOMIC) */}
                  <div className="p-4 sm:p-5 rounded-2xl bg-secondary/20 border-2 border-primary/20 space-y-3">
                    <div className="flex items-center justify-between">
                      <Label htmlFor="cant-fisica" className="text-xs sm:text-sm font-bold text-primary flex items-center gap-1.5">
                        <Barcode className="h-4 w-4" />
                        CANTIDAD FÍSICA CONTADA *
                      </Label>
                      <Button
                        type="button"
                        variant="ghost"
                        size="sm"
                        onClick={() => updateQuantity(form.stock_sistema)}
                        className="h-7 text-xs font-medium text-muted-foreground hover:text-primary gap-1"
                      >
                        <Copy className="h-3 w-3" />
                        Copiar Sistema ({form.stock_sistema})
                      </Button>
                    </div>

                    <div className="flex items-center gap-2">
                      <Button
                        type="button"
                        variant="outline"
                        onClick={() => updateQuantity((form.cantidad_fisica || 0) - 1)}
                        className="h-14 w-14 rounded-xl shrink-0 font-bold text-xl border-border/80 active:scale-95"
                      >
                        <Minus className="h-6 w-6" />
                      </Button>

                      <div className="relative flex-1">
                        <Input
                          id="cant-fisica"
                          type="number"
                          step="any"
                          inputMode="decimal"
                          value={form.cantidad_fisica === 0 && !form.cantidad_fisica ? "" : form.cantidad_fisica}
                          onChange={(e) => updateQuantity(Number(e.target.value))}
                          required
                          className="h-14 text-center font-mono text-2xl sm:text-3xl font-black rounded-xl bg-background border-2 border-primary/40 focus-visible:ring-4 focus-visible:ring-primary/20"
                        />
                        <span className="absolute right-3 top-1/2 -translate-y-1/2 text-xs font-bold text-muted-foreground uppercase pointer-events-none">
                          {form.um || form.unidad || "UND"}
                        </span>
                      </div>

                      <Button
                        type="button"
                        variant="outline"
                        onClick={() => updateQuantity((form.cantidad_fisica || 0) + 1)}
                        className="h-14 w-14 rounded-xl shrink-0 font-bold text-xl border-border/80 active:scale-95 text-primary"
                      >
                        <Plus className="h-6 w-6" />
                      </Button>
                    </div>

                    {/* Quick Step Buttons */}
                    <div className="flex items-center justify-center gap-2 pt-1">
                      <Button
                        type="button"
                        variant="secondary"
                        size="sm"
                        onClick={() => updateQuantity((form.cantidad_fisica || 0) - 10)}
                        className="h-8 px-3 text-xs font-mono"
                      >
                        -10
                      </Button>
                      <Button
                        type="button"
                        variant="secondary"
                        size="sm"
                        onClick={() => updateQuantity((form.cantidad_fisica || 0) - 5)}
                        className="h-8 px-3 text-xs font-mono"
                      >
                        -5
                      </Button>
                      <Button
                        type="button"
                        variant="secondary"
                        size="sm"
                        onClick={() => updateQuantity((form.cantidad_fisica || 0) + 5)}
                        className="h-8 px-3 text-xs font-mono"
                      >
                        +5
                      </Button>
                      <Button
                        type="button"
                        variant="secondary"
                        size="sm"
                        onClick={() => updateQuantity((form.cantidad_fisica || 0) + 10)}
                        className="h-8 px-3 text-xs font-mono"
                      >
                        +10
                      </Button>
                    </div>

                    {/* LIVE DIFFERENCE & WEIGHT STATUS STRIP */}
                    <div className="mt-3 p-3 rounded-xl bg-background border border-border/50 flex flex-wrap items-center justify-between gap-3 text-xs">
                      <div className="flex items-center gap-2">
                        <span className="text-muted-foreground font-medium">Diferencia (DIF):</span>
                        <span
                          className={`font-mono font-bold px-2 py-0.5 rounded-md text-sm ${
                            dif === 0
                              ? "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400"
                              : dif > 0
                              ? "bg-amber-500/10 text-amber-600 dark:text-amber-400"
                              : "bg-rose-500/10 text-rose-600 dark:text-rose-400"
                          }`}
                        >
                          {dif > 0 ? `+${dif}` : dif} {form.um || form.unidad}
                        </span>
                        {getObsBadge(form.observacion)}
                      </div>

                      <div className="text-muted-foreground">
                        Peso Total: <strong className="font-mono text-foreground font-semibold">{pesoTotal.toFixed(3)} kg</strong>
                      </div>
                    </div>
                  </div>

                  {/* CLASSIFICATION: FAMILIA2, UM, PRESENTACION */}
                  <div className="p-4 rounded-2xl bg-secondary/15 border border-border/50 space-y-3">
                    <div className="text-xs font-bold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                      <Tag className="h-3.5 w-3.5 text-primary" />
                      Clasificación y Presentación
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                      <div>
                        <Label className="text-xs font-semibold">Familia 2 *</Label>
                        <div className="mt-1">
                          <Combobox
                            options={FAMILIA2_OPTIONS.map((f) => ({ label: f, value: f }))}
                            value={form.familia2}
                            onChange={(val) => setForm({ ...form, familia2: val })}
                            placeholder="Seleccionar familia..."
                            searchPlaceholder="Buscar familia..."
                          />
                        </div>
                      </div>

                      <div>
                        <Label className="text-xs font-semibold">Unidad de Medida (UM) *</Label>
                        <div className="mt-1">
                          <Combobox
                            options={UM_OPTIONS.map((u) => ({ label: u, value: u }))}
                            value={form.um}
                            onChange={(val) => setForm({ ...form, um: val })}
                            placeholder="Seleccionar UM..."
                            searchPlaceholder="Buscar unidad..."
                          />
                        </div>
                      </div>

                      <div>
                        <Label className="text-xs font-semibold">Presentación *</Label>
                        <div className="mt-1">
                          <Combobox
                            options={PRESENTACION_OPTIONS.map((p) => ({ label: p, value: p }))}
                            value={form.presentacion}
                            onChange={(val) => setForm({ ...form, presentacion: val })}
                            placeholder="Seleccionar presentación..."
                            searchPlaceholder="Buscar presentación..."
                          />
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* PACKAGING & DIMENSIONS SECTION */}
                  <div className="p-4 rounded-2xl bg-secondary/15 border border-border/50 space-y-3">
                    <div className="flex items-center justify-between">
                      <div className="text-xs font-bold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                        <Box className="h-3.5 w-3.5 text-primary" />
                        Empaque, Dimensiones y Peso
                      </div>
                      <Button
                        type="button"
                        variant="ghost"
                        size="sm"
                        onClick={() => setShowAdvanced(!showAdvanced)}
                        className="h-6 text-[11px] text-muted-foreground px-2"
                      >
                        {showAdvanced ? (
                          <>
                            <ChevronUp className="h-3.5 w-3.5 mr-1" />
                            Ocultar
                          </>
                        ) : (
                          <>
                            <ChevronDown className="h-3.5 w-3.5 mr-1" />
                            Mostrar
                          </>
                        )}
                      </Button>
                    </div>

                    {showAdvanced && (
                      <div className="space-y-3 pt-1">
                        <div className="grid grid-cols-1 sm:grid-cols-2 gap-3">
                          <div>
                            <Label className="text-xs font-semibold">N° Cajas / Bultos</Label>
                            <Input
                              value={form.n_cajas_bultos}
                              onChange={(e) => setForm({ ...form, n_cajas_bultos: e.target.value })}
                              placeholder="Ej: 1 UND o 2 CAJAS"
                              className="h-10 text-xs mt-1 rounded-xl"
                            />
                          </div>
                          <div>
                            <Label className="text-xs font-semibold flex items-center gap-1">
                              <Scale className="h-3 w-3" />
                              Peso Aprox. Unitario (kg)
                            </Label>
                            <Input
                              type="number"
                              step="any"
                              inputMode="decimal"
                              value={form.peso_aprox_unitario || ""}
                              onChange={(e) => setForm({ ...form, peso_aprox_unitario: Number(e.target.value) })}
                              placeholder="0.000"
                              className="h-10 text-xs mt-1 font-mono rounded-xl"
                            />
                          </div>
                        </div>

                        <div>
                          <Label className="text-xs font-semibold flex items-center gap-1 mb-1">
                            <Ruler className="h-3 w-3" />
                            Dimensiones del Producto / Empaque (cm)
                          </Label>
                          <div className="grid grid-cols-3 gap-2">
                            <div>
                              <Input
                                type="number"
                                step="any"
                                inputMode="decimal"
                                value={form.largo || ""}
                                onChange={(e) => setForm({ ...form, largo: Number(e.target.value) })}
                                placeholder="Largo (cm)"
                                className="h-10 text-xs font-mono rounded-xl text-center"
                              />
                              <span className="text-[10px] text-muted-foreground block text-center mt-0.5">Largo</span>
                            </div>
                            <div>
                              <Input
                                type="number"
                                step="any"
                                inputMode="decimal"
                                value={form.ancho || ""}
                                onChange={(e) => setForm({ ...form, ancho: Number(e.target.value) })}
                                placeholder="Ancho (cm)"
                                className="h-10 text-xs font-mono rounded-xl text-center"
                              />
                              <span className="text-[10px] text-muted-foreground block text-center mt-0.5">Ancho</span>
                            </div>
                            <div>
                              <Input
                                type="number"
                                step="any"
                                inputMode="decimal"
                                value={form.alto || ""}
                                onChange={(e) => setForm({ ...form, alto: Number(e.target.value) })}
                                placeholder="Alto (cm)"
                                className="h-10 text-xs font-mono rounded-xl text-center"
                              />
                              <span className="text-[10px] text-muted-foreground block text-center mt-0.5">Alto</span>
                            </div>
                          </div>
                        </div>
                      </div>
                    )}
                  </div>

                  {/* LOCATION & AUDIT DETAILS SECTION */}
                  <div className="p-4 rounded-2xl bg-secondary/15 border border-border/50 space-y-3">
                    <div className="text-xs font-bold text-muted-foreground uppercase tracking-wider flex items-center gap-1.5">
                      <MapPin className="h-3.5 w-3.5 text-primary" />
                      Ubicación y Almacenamiento en Bodega
                    </div>

                    <div className="grid grid-cols-2 sm:grid-cols-4 gap-3">
                      <div>
                        <Label className="text-xs font-semibold">Rack</Label>
                        <Input
                          value={form.rack}
                          onChange={(e) => setForm({ ...form, rack: e.target.value })}
                          placeholder="Ej: 1"
                          className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                        />
                      </div>
                      <div>
                        <Label className="text-xs font-semibold">Ubicación Actual</Label>
                        <Input
                          value={form.ubicacion_actual}
                          onChange={(e) => setForm({ ...form, ubicacion_actual: e.target.value })}
                          placeholder="Ej: NIVEL1"
                          className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                        />
                      </div>
                      <div>
                        <Label className="text-xs font-semibold">Almacenamiento</Label>
                        <Input
                          value={form.almacenamiento}
                          onChange={(e) => setForm({ ...form, almacenamiento: e.target.value })}
                          placeholder="Ej: C.C.01"
                          className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                        />
                      </div>
                      <div>
                        <Label className="text-xs font-semibold">Contenedor</Label>
                        <Input
                          value={form.contenedor}
                          onChange={(e) => setForm({ ...form, contenedor: e.target.value })}
                          placeholder="Ej: 2"
                          className="h-10 text-xs mt-1 font-mono uppercase rounded-xl"
                        />
                      </div>
                    </div>

                    <div className="grid grid-cols-1 sm:grid-cols-3 gap-3">
                      <div>
                        <Label className="text-xs font-semibold">Responsable Auditor</Label>
                        <Input
                          value={form.responsable}
                          onChange={(e) => setForm({ ...form, responsable: e.target.value })}
                          placeholder="Nombre del auditor"
                          className="h-10 text-xs mt-1 rounded-xl"
                        />
                      </div>
                      <div>
                        <Label className="text-xs font-semibold">Fecha de Conteo</Label>
                        <Input
                          type="date"
                          value={form.fecha_conteo}
                          onChange={(e) => setForm({ ...form, fecha_conteo: e.target.value })}
                          className="h-10 text-xs mt-1 font-mono rounded-xl"
                        />
                      </div>
                      <div>
                        <Label className="text-xs font-semibold">Observación / Estado</Label>
                        <select
                          value={form.observacion}
                          onChange={(e) => setForm({ ...form, observacion: e.target.value })}
                          className="flex h-10 w-full mt-1 rounded-xl border border-input bg-background px-3 py-2 text-xs font-semibold focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-primary/40"
                        >
                          <option value="OK">OK (Coincide con sistema)</option>
                          <option value="SOBRANTE">SOBRANTE (Físico mayor)</option>
                          <option value="FALTANTE">FALTANTE (Físico menor)</option>
                          <option value="PENDIENTE">PENDIENTE (Por revisar)</option>
                        </select>
                      </div>
                    </div>

                    <div>
                      <Label className="text-xs font-semibold">Comentarios / Observaciones Adicionales</Label>
                      <Input
                        value={form.comentario}
                        onChange={(e) => setForm({ ...form, comentario: e.target.value })}
                        placeholder="Detalles sobre estado del empaque, caja #12, etc."
                        className="h-10 text-xs mt-1 rounded-xl"
                      />
                    </div>
                  </div>

                  {/* ACTION BUTTONS (LARGE TOUCH TARGETS) */}
                  <div className="pt-2 flex flex-col sm:flex-row items-stretch sm:items-center justify-end gap-2">
                    <Button
                      type="button"
                      variant="outline"
                      size="lg"
                      onClick={clearForm}
                      className="h-12 px-6 font-bold text-xs rounded-xl"
                    >
                      <RotateCcw className="mr-2 h-4 w-4" />
                      Limpiar / Cancelar
                    </Button>
                    <Button
                      type="submit"
                      disabled={saving || !form.producto}
                      size="lg"
                      className="h-12 px-8 font-bold text-sm shadow-md rounded-xl"
                    >
                      {saving ? (
                        <>
                          <Loader2 className="animate-spin mr-2 h-4 w-4" />
                          Guardando...
                        </>
                      ) : (
                        <>
                          <Save className="mr-2 h-4 w-4" />
                          {isEditing ? "Actualizar Registro" : "Guardar Conteo"}
                        </>
                      )}
                    </Button>
                  </div>
                </form>
              </CardContent>
            </Card>
          ) : (
            /* EMPTY HELPER STATE */
            <Card className="border-border/50 border-dashed bg-secondary/10">
              <CardContent className="p-8 sm:p-12 text-center space-y-4">
                <div className="h-16 w-16 rounded-2xl bg-primary/10 text-primary flex items-center justify-center mx-auto">
                  <Barcode className="h-8 w-8" />
                </div>
                <div className="max-w-md mx-auto space-y-1">
                  <h3 className="text-base font-bold text-foreground">
                    Inicia un nuevo conteo de inventario
                  </h3>
                  <p className="text-xs text-muted-foreground">
                    Escribe el código del producto (SKU) en la barra superior o explora el catálogo para autocompletar la ficha y registrar la cantidad física.
                  </p>
                </div>
                <Button
                  type="button"
                  variant="outline"
                  onClick={() => setActiveTab("catalogo")}
                  className="rounded-xl font-bold text-xs gap-1.5"
                >
                  <Package className="h-4 w-4" />
                  Ver Catálogo de Stock ({catalogItems.length || "1800+"})
                  <ArrowRight className="h-3.5 w-3.5 ml-1" />
                </Button>
              </CardContent>
            </Card>
          )}
        </TabsContent>

        {/* ========================================================= */}
        {/* TAB 2: MIS REGISTROS (MOBILE CARDS / DESKTOP TABLE)       */}
        {/* ========================================================= */}
        <TabsContent value="registros" className="space-y-4 mt-4 focus-visible:outline-none">
          <Card className="border-border/60 shadow-xs">
            <CardHeader className="p-4 pb-3">
              <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
                <div>
                  <CardTitle className="text-base font-bold flex items-center gap-2">
                    <ClipboardList className="h-4 w-4 text-primary" />
                    Registros de Inventario
                  </CardTitle>
                  <CardDescription className="text-xs">
                    Historial de productos auditados y migrados ({registros.length} registros)
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
                        link.setAttribute("download", `Inventario_MRO_${new Date().toISOString().split("T")[0]}.xlsx`);
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
                  <Button
                    type="button"
                    size="sm"
                    onClick={() => setActiveTab("conteo")}
                    className="h-8 text-xs font-bold gap-1.5 rounded-lg"
                  >
                    <Plus className="h-3.5 w-3.5" />
                    Nuevo Conteo
                  </Button>
                </div>
              </div>

              {/* SEARCH & STATUS FILTER TOOLBAR */}
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
                    Todos ({registros.length})
                  </Button>
                  <Button
                    type="button"
                    variant={recordFilterStatus === "OK" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setRecordFilterStatus("OK")}
                    className="h-9 text-xs px-3 rounded-xl shrink-0 text-emerald-600 dark:text-emerald-400"
                  >
                    OK ({registros.filter((r) => r.observacion === "OK").length})
                  </Button>
                  <Button
                    type="button"
                    variant={recordFilterStatus === "FALTANTE" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setRecordFilterStatus("FALTANTE")}
                    className="h-9 text-xs px-3 rounded-xl shrink-0 text-rose-600 dark:text-rose-400"
                  >
                    Faltante ({registros.filter((r) => r.observacion === "FALTANTE").length})
                  </Button>
                  <Button
                    type="button"
                    variant={recordFilterStatus === "SOBRANTE" ? "default" : "outline"}
                    size="sm"
                    onClick={() => setRecordFilterStatus("SOBRANTE")}
                    className="h-9 text-xs px-3 rounded-xl shrink-0 text-amber-600 dark:text-amber-400"
                  >
                    Sobrante ({registros.filter((r) => r.observacion === "SOBRANTE").length})
                  </Button>
                </div>
              </div>
            </CardHeader>

            <CardContent className="p-0">
              {loadingRegistros ? (
                <div className="py-16 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
                  <Loader2 className="animate-spin h-6 w-6 text-primary" />
                  <span className="text-xs">Cargando registros...</span>
                </div>
              ) : filteredRegistros.length === 0 ? (
                <div className="py-16 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
                  <Layers className="h-8 w-8 opacity-30" />
                  <span className="text-xs">
                    {registros.length === 0
                      ? "Aún no hay registros de inventario guardados."
                      : "No hay registros que coincidan con los filtros aplicados."}
                  </span>
                </div>
              ) : (
                <>
                  {/* MOBILE VIEW (< 768px): HIGH QUALITY TOUCH CARDS */}
                  <div className="md:hidden divide-y divide-border/40 max-h-[600px] overflow-y-auto">
                    {filteredRegistros.map((item) => (
                      <div key={item.id} className="p-3.5 space-y-3 hover:bg-secondary/20 transition">
                        <div className="flex items-center justify-between">
                          <div className="flex items-center gap-1.5 flex-wrap">
                            <span className="font-mono font-bold text-xs bg-secondary px-2 py-0.5 rounded border border-border/50">
                              {item.producto}
                            </span>
                            {getObsBadge(item.observacion)}
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

                        <div className="text-xs font-semibold text-foreground">
                          {item.descripcion}
                        </div>

                        <div className="grid grid-cols-3 gap-2 p-2 rounded-xl bg-secondary/30 text-center text-xs">
                          <div>
                            <span className="text-[10px] text-muted-foreground uppercase block font-semibold">Sistema</span>
                            <span className="font-mono font-bold">{item.stock_sistema} {item.um || item.unidad}</span>
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
                            {item.rack && <span>Rack: <strong className="text-foreground">{item.rack}</strong></span>}
                            {item.ubicacion_actual && <span>Ubic: <strong className="text-foreground">{item.ubicacion_actual}</strong></span>}
                            {item.contenedor && <span>Cont: <strong className="text-foreground">{item.contenedor}</strong></span>}
                          </div>
                          {item.presentacion && (
                            <span className="text-[10px] bg-secondary/60 px-1.5 py-0.5 rounded">
                              {item.presentacion}
                            </span>
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

                  {/* DESKTOP VIEW (>= 768px): FULL-WIDTH DATA TABLE */}
                  <div className="hidden md:block overflow-x-auto max-h-[600px]">
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
                        {filteredRegistros.map((item) => (
                          <tr key={item.id} className="hover:bg-secondary/20 transition">
                            <td className="py-2.5 px-4 font-mono font-bold text-foreground whitespace-nowrap">
                              {item.producto}
                            </td>
                            <td className="py-2.5 px-4 max-w-[200px] truncate font-medium" title={item.descripcion}>
                              {item.descripcion}
                            </td>
                            <td className="py-2.5 px-3 text-center text-[11px] text-muted-foreground">
                              {item.familia2 || "-"}
                            </td>
                            <td className="py-2.5 px-3 text-center text-[11px] text-muted-foreground">
                              {item.presentacion || "-"}
                            </td>
                            <td className="py-2.5 px-3 text-center font-mono">
                              {item.stock_sistema} <span className="text-[10px] text-muted-foreground">{item.um || item.unidad}</span>
                            </td>
                            <td className="py-2.5 px-3 text-center font-mono font-bold text-primary text-sm">
                              {item.cantidad_fisica}
                            </td>
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
                              {item.rack ? `R:${item.rack} ` : ""}{item.ubicacion_actual || ""} {item.almacenamiento ? `| ${item.almacenamiento}` : ""}
                            </td>
                            <td className="py-2.5 px-3 text-center">
                              {getObsBadge(item.observacion)}
                            </td>
                            <td className="py-2.5 px-4 text-center">
                              <div className="flex items-center justify-center gap-1">
                                <Button
                                  variant="ghost"
                                  size="icon"
                                  className="h-8 w-8 rounded-lg"
                                  onClick={() => editRecord(item)}
                                  title="Editar conteo"
                                >
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
                </>
              )}
            </CardContent>
          </Card>
        </TabsContent>

        {/* ========================================================= */}
        {/* TAB 3: CATÁLOGO DE STOCK (EXPLORER & DIRECT COUNT BUTTON) */}
        {/* ========================================================= */}
        <TabsContent value="catalogo" className="space-y-4 mt-4 focus-visible:outline-none">
          <Card className="border-border/60 shadow-xs">
            <CardHeader className="p-4 pb-3">
              <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3">
                <div>
                  <CardTitle className="text-base font-bold flex items-center gap-2">
                    <Package className="h-4 w-4 text-primary" />
                    Catálogo de Existencias (Stock Flexline)
                  </CardTitle>
                  <CardDescription className="text-xs">
                    Explora los productos del almacén e inicia el conteo con un toque
                  </CardDescription>
                </div>
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={() => loadCatalog(catalogSearch)}
                  disabled={loadingCatalog}
                  className="h-8 text-xs font-semibold gap-1.5 rounded-lg"
                >
                  <RotateCcw className={`h-3.5 w-3.5 ${loadingCatalog ? "animate-spin" : ""}`} />
                  Recargar
                </Button>
              </div>

              {/* Catalog Search Bar */}
              <div className="pt-2">
                <div className="relative">
                  <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                  <Input
                    value={catalogSearch}
                    onChange={(e) => setCatalogSearch(e.target.value)}
                    onKeyDown={(e) => e.key === "Enter" && loadCatalog(catalogSearch)}
                    placeholder="Buscar en catálogo por código SKU, descripción o lote..."
                    className="pl-9 h-10 text-xs rounded-xl bg-secondary/30"
                  />
                  {catalogSearch && (
                    <button
                      type="button"
                      onClick={() => {
                        setCatalogSearch("");
                        loadCatalog("");
                      }}
                      className="absolute right-3 top-1/2 -translate-y-1/2 p-1 text-muted-foreground hover:text-foreground"
                    >
                      <X className="h-3.5 w-3.5" />
                    </button>
                  )}
                </div>
              </div>
            </CardHeader>

            <CardContent className="p-0">
              {loadingCatalog ? (
                <div className="py-16 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
                  <Loader2 className="animate-spin h-6 w-6 text-primary" />
                  <span className="text-xs">Cargando catálogo de existencias...</span>
                </div>
              ) : catalogItems.length === 0 ? (
                <div className="py-16 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
                  <Package className="h-8 w-8 opacity-30" />
                  <span className="text-xs">No se encontraron productos en el catálogo.</span>
                </div>
              ) : (
                <>
                  {/* Mobile View: Cards */}
                  <div className="md:hidden divide-y divide-border/40 max-h-[600px] overflow-y-auto">
                    {catalogItems.map((item, i) => (
                      <div key={`${item.producto}-${item.lote}-${i}`} className="p-3.5 space-y-2 hover:bg-secondary/20 transition">
                        <div className="flex items-center justify-between">
                          <span className="font-mono font-bold text-xs bg-secondary px-2 py-0.5 rounded border border-border/50">
                            {item.producto}
                          </span>
                          <span className="font-mono font-bold text-xs text-primary">
                            Stock: {item.stock} {item.unidad}
                          </span>
                        </div>
                        <div className="text-xs font-medium text-foreground">
                          {item.glosa}
                        </div>
                        <div className="flex items-center justify-between text-[11px] text-muted-foreground pt-1">
                          <span>Lote: <strong className="font-mono text-foreground">{item.lote || "S/L"}</strong></span>
                          <span>{item.familia || "MRO"}</span>
                        </div>
                        <div className="pt-2">
                          <Button
                            type="button"
                            size="sm"
                            onClick={() => selectStock(item)}
                            className="w-full h-9 text-xs font-bold gap-1.5 rounded-xl"
                          >
                            <Barcode className="h-3.5 w-3.5" />
                            Contar este producto
                          </Button>
                        </div>
                      </div>
                    ))}
                  </div>

                  {/* Desktop View: Table */}
                  <div className="hidden md:block overflow-x-auto max-h-[600px]">
                    <table className="w-full text-xs">
                      <thead className="bg-secondary/50 border-b border-border/50 sticky top-0 z-10 backdrop-blur-sm">
                        <tr>
                          <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Código SKU</th>
                          <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Descripción</th>
                          <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Lote</th>
                          <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Stock</th>
                          <th className="text-center py-3 px-3 font-bold text-muted-foreground uppercase tracking-wider">Familia</th>
                          <th className="text-center py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Acción</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-border/30">
                        {catalogItems.map((item, i) => (
                          <tr key={`${item.producto}-${item.lote}-${i}`} className="hover:bg-secondary/20 transition">
                            <td className="py-2.5 px-4 font-mono font-bold text-foreground whitespace-nowrap">
                              {item.producto}
                            </td>
                            <td className="py-2.5 px-4 max-w-[280px] truncate font-medium" title={item.glosa}>
                              {item.glosa}
                            </td>
                            <td className="py-2.5 px-3 text-center font-mono text-[11px] text-muted-foreground">
                              {item.lote || "-"}
                            </td>
                            <td className="py-2.5 px-3 text-center font-mono font-bold text-primary">
                              {item.stock} <span className="font-normal text-muted-foreground text-[10px]">{item.unidad}</span>
                            </td>
                            <td className="py-2.5 px-3 text-center text-[11px] text-muted-foreground">
                              {item.familia || "-"}
                            </td>
                            <td className="py-2.5 px-4 text-center">
                              <Button
                                type="button"
                                size="sm"
                                onClick={() => selectStock(item)}
                                className="h-8 text-xs font-bold gap-1 rounded-lg px-3"
                              >
                                <Barcode className="h-3.5 w-3.5 mr-1" />
                                Contar
                              </Button>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </>
              )}
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  );
}


