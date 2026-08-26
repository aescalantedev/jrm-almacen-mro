import { useState, useCallback } from "react";
import { toast } from "sonner";
import type { User, ConteoForm, StockItem, InventarioItem } from "../types";
import { getDefaultForm } from "../constants";

export function useConteoForm(
  token: string,
  user: User | null,
  onAfterSave: () => void,
  setActiveTab: (tab: string) => void
) {
  const [form, setForm] = useState<ConteoForm>(() => getDefaultForm());
  const [isEditing, setIsEditing] = useState<number | null>(null);
  const [saving, setSaving] = useState(false);
  const [showAdvanced, setShowAdvanced] = useState(true);

  const [searchQuery, setSearchQuery] = useState("");
  const [stockResults, setStockResults] = useState<StockItem[]>([]);
  const [searching, setSearching] = useState(false);

  const dif = (form.cantidad_fisica || 0) - (form.stock_sistema || 0);
  const pesoTotal = (form.cantidad_fisica || 0) * (form.peso_aprox_unitario || 0);

  const updateQuantity = useCallback(
    (newQty: number) => {
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
    },
    [form.stock_sistema, form.observacion]
  );

  const clearForm = useCallback(() => {
    setForm(getDefaultForm());
    setIsEditing(null);
    setStockResults([]);
    setSearchQuery("");
  }, []);

  const searchStock = useCallback(async () => {
    if (!searchQuery.trim()) return;
    setSearching(true);
    try {
      const res = await fetch(`/api/stock?q=${encodeURIComponent(searchQuery)}&limit=30`, {
        headers: { Authorization: `Bearer ${token}` },
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
  }, [searchQuery, token]);

  const selectStock = useCallback(
    (item: StockItem) => {
      const defaultObs = "OK";
      const baseUM = item.unidad || "UND";
      let defaultFam2 = "REPUESTO";
      if (item.familia === "HERRAMIENTAS") defaultFam2 = "HERRAMIENTAS";
      else if (item.familia === "CONSUMIBLES") defaultFam2 = "CONSUMIBLE";
      else if (item.familia === "EPP") defaultFam2 = "EPP";

      setForm({
        ...getDefaultForm(),
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
      });
      setStockResults([]);
      setSearchQuery("");
      setIsEditing(null);
      setActiveTab("conteo");
      toast.info(`Producto ${item.producto} cargado`);
    },
    [setActiveTab]
  );

  const handleSave = useCallback(async () => {
    if (!form.producto) {
      toast.error("Seleccione o busque un producto primero");
      return;
    }
    setSaving(true);
    try {
      const body = {
        ...form,
        usuario_id: user?.id,
      };
      const url = isEditing ? `/api/inventario/${isEditing}` : "/api/inventario";
      const method = isEditing ? "PUT" : "POST";
      const res = await fetch(url, {
        method,
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(isEditing ? { id: isEditing, ...body } : body),
      });
      if (res.ok) {
        toast.success(isEditing ? "Registro actualizado con éxito" : "Conteo guardado exitosamente");
        setForm(getDefaultForm());
        setIsEditing(null);
        onAfterSave();
      } else {
        const d = await res.json();
        toast.error(d.error || "Error al guardar registro");
      }
    } catch {
      toast.error("Error de conexión al guardar");
    } finally {
      setSaving(false);
    }
  }, [form, isEditing, token, user, onAfterSave]);

  const editRecord = useCallback(
    (item: InventarioItem) => {
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
        foto_path: item.foto_path,
      });
      setIsEditing(item.id);
      setActiveTab("conteo");
      window.scrollTo({ top: 0, behavior: "smooth" });
      toast.info(`Editando registro #${item.id} (${item.producto})`);
    },
    [setActiveTab]
  );

  return {
    form,
    setForm,
    isEditing,
    saving,
    showAdvanced,
    setShowAdvanced,
    searchQuery,
    setSearchQuery,
    stockResults,
    setStockResults,
    searching,
    dif,
    pesoTotal,
    updateQuantity,
    clearForm,
    searchStock,
    selectStock,
    handleSave,
    editRecord,
  };
}
