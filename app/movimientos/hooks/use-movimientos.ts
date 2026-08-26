import { useState, useCallback, useEffect, useRef } from "react";
import { toast } from "sonner";
import type { MovimientoItem, MovimientoFormState, MovimientosStats, MovimientosFilter, TipoMovimiento } from "../types";
import { getDefaultMovimientoForm, MOTIVOS_INGRESO, MOTIVOS_SALIDA, MOTIVOS_AJUSTE } from "../constants";
import type { StockItem, User } from "@/app/inventario/types";
import { sanitizeNumeric, cleanNumberDisplay } from "@/app/inventario/utils";

export function useMovimientos(token: string, user: User | null) {
  // Form State
  const [form, setForm] = useState<MovimientoFormState>(() => getDefaultMovimientoForm());
  const [saving, setSaving] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [stockResults, setStockResults] = useState<StockItem[]>([]);
  const [searching, setSearching] = useState(false);

  // Kardex List State
  const [movimientos, setMovimientos] = useState<MovimientoItem[]>([]);
  const [totalMovimientos, setTotalMovimientos] = useState(0);
  const [loadingKardex, setLoadingKardex] = useState(false);
  const [stats, setStats] = useState<MovimientosStats>({
    ingresos_count: 0,
    salidas_count: 0,
    total_unidades_ingresadas: 0,
    total_unidades_salidas: 0,
  });

  // Filters State
  const [filters, setFilters] = useState<MovimientosFilter>({
    q: "",
    tipo: "",
    motivo: "",
    desde: "",
    hasta: "",
    page: 1,
    limit: 30,
  });

  const debounceTimerRef = useRef<NodeJS.Timeout | null>(null);

  // Set default motivo when changing tipo
  const changeTipo = useCallback((newTipo: TipoMovimiento) => {
    setForm((prev) => ({
      ...prev,
      tipo: newTipo,
      motivo: newTipo === "INGRESO"
        ? MOTIVOS_INGRESO[0]
        : newTipo === "SALIDA"
          ? MOTIVOS_SALIDA[0]
          : MOTIVOS_AJUSTE[0],
    }));
  }, []);

  // Search stock in catalog
  const searchStock = useCallback(
    async (queryOverride?: string, autoSelectExact = false) => {
      const q = (queryOverride !== undefined ? queryOverride : searchQuery).trim();
      if (!q) {
        setStockResults([]);
        return;
      }
      setSearching(true);
      try {
        const res = await fetch(`/api/stock?q=${encodeURIComponent(q)}&limit=50`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        const data = await res.json();
        const results: StockItem[] = data.stock || [];
        setStockResults(results);

        if (autoSelectExact && results.length > 0) {
          const exactMatch = results.find(
            (item) => item.producto.trim().toUpperCase() === q.toUpperCase()
          );
          if (exactMatch) {
            selectStockItem(exactMatch);
            toast.success(`Producto ${exactMatch.producto} seleccionado`);
            return;
          } else if (results.length === 1) {
            selectStockItem(results[0]);
            toast.success(`Producto ${results[0].producto} seleccionado`);
            return;
          }
        }

        if (!results.length && autoSelectExact) {
          toast.warning(`No se encontraron productos con el código: ${q}`);
        }
      } catch {
        toast.error("Error al buscar productos");
      } finally {
        setSearching(false);
      }
    },
    [searchQuery, token]
  );

  const selectStockItem = useCallback((item: StockItem) => {
    const currentStock = item.stock_disponible ?? (item.cantidad_fisica ?? item.stock ?? 0);
    setForm((prev) => ({
      ...prev,
      producto: item.producto,
      lote: item.lote || "",
      descripcion: item.glosa || "",
      unidad: item.inventario_um || item.unidad || "UND",
      stock_actual_disponible: currentStock,
      ubicacion_destino: item.rack || item.ubicacion_actual || item.ubicacion || "",
      rack: item.rack || "",
    }));
    setStockResults([]);
    setSearchQuery("");
  }, []);

  const clearForm = useCallback(() => {
    setForm(getDefaultMovimientoForm());
    setSearchQuery("");
    setStockResults([]);
  }, []);

  // Fetch Kardex List
  const loadKardex = useCallback(async () => {
    setLoadingKardex(true);
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
        setTotalMovimientos(data.total || 0);
        if (data.stats) setStats(data.stats);
      } else {
        toast.error(data.error || "Error al cargar Kardex");
      }
    } catch {
      toast.error("Error de conexión al cargar Kardex");
    } finally {
      setLoadingKardex(false);
    }
  }, [filters, token]);

  useEffect(() => {
    loadKardex();
  }, [loadKardex]);

  // Save Movement
  const handleSaveMovimiento = useCallback(async () => {
    if (!form.producto) {
      toast.error("Seleccione o busque un producto primero");
      return false;
    }

    const numCantidad = sanitizeNumeric(form.cantidad);
    if (numCantidad <= 0) {
      toast.error("Ingrese una cantidad válida mayor a cero");
      return false;
    }

    if (form.tipo === "SALIDA" && numCantidad > form.stock_actual_disponible) {
      toast.error(`Stock insuficiente: Disponible (${form.stock_actual_disponible} ${form.unidad}), Intentando retirar (${numCantidad} ${form.unidad})`);
      return false;
    }

    setSaving(true);
    try {
      const body = {
        ...form,
        cantidad: numCantidad,
        usuario_id: user?.id,
      };

      const res = await fetch("/api/movimientos", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(body),
      });

      const data = await res.json();
      if (res.ok) {
        toast.success(data.message || "Movimiento registrado con éxito");
        clearForm();
        loadKardex();
        return true;
      } else {
        toast.error(data.error || "Error al registrar movimiento");
        return false;
      }
    } catch {
      toast.error("Error de conexión al guardar movimiento");
      return false;
    } finally {
      setSaving(false);
    }
  }, [form, user, token, clearForm, loadKardex]);

  return {
    form,
    setForm,
    saving,
    searchQuery,
    setSearchQuery,
    stockResults,
    setStockResults,
    searching,
    changeTipo,
    searchStock,
    selectStockItem,
    clearForm,
    handleSaveMovimiento,
    movimientos,
    totalMovimientos,
    loadingKardex,
    stats,
    filters,
    setFilters,
    loadKardex,
    debounceTimerRef,
  };
}
