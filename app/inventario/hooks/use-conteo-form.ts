"use client";

import { useState, useCallback, useMemo } from "react";
import { toast } from "sonner";
import { sanitizeNumeric } from "../utils";
import type { ConteoForm, StockItem, InventarioItem, User } from "../types";

export function getDefaultForm(): ConteoForm {
  return {
    producto: "",
    lote: "",
    descripcion: "",
    stock_sistema: 0,
    unidad: "UND",
    familia: "",
    familia2: "REPUESTO",
    cantidad_fisica: "",
    um: "UND",
    presentacion: "SUELTO",
    n_cajas_bultos: "1 UND",
    largo: 0,
    ancho: 0,
    alto: 0,
    peso_aprox_unitario: 0,
    observacion: "PENDIENTE",
    comentario: "",
    rack: "",
    ubicacion_actual: "",
    almacenamiento: "C.C.01",
    contenedor: "1",
    foto_path: undefined,
  };
}

export function useConteoForm(
  token: string,
  user: User | null,
  loadRegistros: () => Promise<void>,
  setActiveTab: (tab: string) => void
) {
  const [form, setForm] = useState<ConteoForm>(getDefaultForm());
  const [isEditing, setIsEditing] = useState<number | null>(null);
  const [saving, setSaving] = useState(false);
  const [showAdvanced, setShowAdvanced] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [stockResults, setStockResults] = useState<StockItem[]>([]);
  const [searching, setSearching] = useState(false);

  const updateQuantity = useCallback(
    (newQty: number | string) => {
      let val: number | string = newQty;
      let numVal = 0;
      if (typeof newQty === "number") {
        numVal = Math.max(0, newQty);
        val = numVal;
      } else if (typeof newQty === "string") {
        if (newQty === "") {
          val = "";
          numVal = 0;
        } else {
          val = newQty;
          numVal = sanitizeNumeric(newQty);
        }
      }

      const newDif = numVal - form.stock_sistema;
      let autoObs = "PENDIENTE";
      if (val === "" || val === undefined) {
        autoObs = "PENDIENTE";
      } else if (newDif === 0) {
        autoObs = "OK";
      } else if (newDif > 0) {
        autoObs = "SOBRANTE";
      } else if (newDif < 0) {
        autoObs = "FALTANTE";
      }

      setForm((prev) => ({
        ...prev,
        cantidad_fisica: val,
        observacion: autoObs,
      }));
    },
    [form.stock_sistema]
  );

  const clearForm = useCallback(() => {
    setForm(getDefaultForm());
    setIsEditing(null);
    setStockResults([]);
    setSearchQuery("");
  }, []);

  const selectStock = useCallback(
    (item: StockItem) => {
      const baseUM = item.unidad || "UND";
      let defaultFam2 = "REPUESTO";
      if (item.familia === "HERRAMIENTAS") defaultFam2 = "HERRAMIENTAS";
      else if (item.familia === "CONSUMIBLES") defaultFam2 = "CONSUMIBLE";
      else if (item.familia === "EPP") defaultFam2 = "EPP";

      const isAlreadyCounted = Boolean(
        item.ya_contado ||
        (item.inventario_id && (
          (item.cantidad_fisica !== undefined && item.cantidad_fisica !== 0) ||
          item.usuario_id ||
          item.comentario ||
          item.foto_path ||
          (item.inventario_observacion && item.inventario_observacion !== "PENDIENTE")
        ))
      );

      const stockTeoricoEfectivo = item.stock_disponible !== undefined ? Number(item.stock_disponible) : Number(item.stock || 0);

      if (isAlreadyCounted) {
        const cantFis = item.cantidad_fisica ?? stockTeoricoEfectivo;
        const difCalc = cantFis - stockTeoricoEfectivo;
        const obsCalc = item.inventario_observacion || (difCalc === 0 ? "OK" : difCalc > 0 ? "SOBRANTE" : "FALTANTE");

        setForm({
          producto: item.producto,
          lote: item.lote || "",
          descripcion: item.glosa || "",
          stock_sistema: stockTeoricoEfectivo,
          unidad: item.unidad || baseUM,
          familia: item.familia || "",
          familia2: item.familia2 || defaultFam2,
          cantidad_fisica: cantFis,
          um: item.inventario_um || item.unidad || baseUM,
          presentacion: item.presentacion || "SUELTO",
          n_cajas_bultos: item.n_cajas_bultos || "1 UND",
          largo: item.largo ?? 0,
          ancho: item.ancho ?? 0,
          alto: item.alto ?? 0,
          peso_aprox_unitario: item.peso ?? 0,
          observacion: obsCalc,
          comentario: item.comentario || "",
          rack: item.rack || "",
          ubicacion_actual: item.ubicacion_actual || item.rack || "",
          almacenamiento: item.almacenamiento || "C.C.01",
          contenedor: item.contenedor || "1",
          foto_path: item.foto_path || undefined,
        });
        setIsEditing(item.inventario_id || null);
      } else {
        // NUEVO CONTEO: Estado inicial PENDIENTE
        setForm({
          producto: item.producto,
          lote: item.lote || "",
          descripcion: item.glosa || "",
          stock_sistema: stockTeoricoEfectivo,
          unidad: item.unidad || baseUM,
          familia: item.familia || "",
          familia2: defaultFam2,
          cantidad_fisica: "",
          um: baseUM,
          presentacion: "SUELTO",
          n_cajas_bultos: "1 UND",
          largo: 0,
          ancho: 0,
          alto: 0,
          peso_aprox_unitario: item.peso ?? 0,
          observacion: "PENDIENTE",
          comentario: "",
          rack: item.rack || "",
          ubicacion_actual: item.rack || "",
          almacenamiento: "C.C.01",
          contenedor: "1",
          foto_path: undefined,
        });
        setIsEditing(null);
      }

      setStockResults([]);
      setSearchQuery("");
      setShowAdvanced(false);
    },
    []
  );

  const searchStock = useCallback(
    async (queryOverride?: string, autoSelectExact = false) => {
      const q = queryOverride !== undefined ? queryOverride : searchQuery;
      if (!q.trim()) return;

      setSearching(true);
      try {
        const res = await fetch(`/api/inventario/search?q=${encodeURIComponent(q.trim())}`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        const data = await res.json();
        const results: StockItem[] = data.items || [];
        setStockResults(results);

        if (autoSelectExact && results.length > 0) {
          const exact = results.find(
            (r) => r.producto.toUpperCase() === q.trim().toUpperCase()
          );
          if (exact) {
            selectStock(exact);
          } else if (results.length === 1) {
            selectStock(results[0]);
          }
        }
      } catch {
        toast.error("Error al buscar stock");
      } finally {
        setSearching(false);
      }
    },
    [searchQuery, token, selectStock]
  );

  const numFisica = useMemo(() => {
    if (form.cantidad_fisica === "") return 0;
    return typeof form.cantidad_fisica === "number"
      ? form.cantidad_fisica
      : sanitizeNumeric(form.cantidad_fisica);
  }, [form.cantidad_fisica]);

  const dif = useMemo(() => numFisica - form.stock_sistema, [numFisica, form.stock_sistema]);

  const pesoTotal = useMemo(() => {
    const pesoUnit = typeof form.peso_aprox_unitario === "number"
      ? form.peso_aprox_unitario
      : sanitizeNumeric(form.peso_aprox_unitario || 0);
    return numFisica * pesoUnit;
  }, [numFisica, form.peso_aprox_unitario]);

  const handleSave = useCallback(async () => {
    if (!form.producto) {
      toast.error("Seleccione un producto");
      return;
    }
    if (form.cantidad_fisica === "") {
      toast.error("Ingrese la cantidad física contada");
      return;
    }

    setSaving(true);
    try {
      const payload = {
        ...form,
        cantidad_fisica: numFisica,
        dif,
        peso_total_cant_fisica: pesoTotal,
        usuario_id: user?.id,
        fecha_conteo: new Date().toISOString().split("T")[0],
      };

      const res = await fetch("/api/inventario", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify(payload),
      });

      if (res.ok) {
        toast.success(isEditing ? "Registro actualizado" : "Conteo guardado exitosamente");
        clearForm();
        await loadRegistros();
      } else {
        const err = await res.json();
        toast.error(err.error || "Error al guardar");
      }
    } catch {
      toast.error("Error de conexión");
    } finally {
      setSaving(false);
    }
  }, [form, numFisica, dif, pesoTotal, user?.id, token, isEditing, clearForm, loadRegistros]);

  const editRecord = useCallback(
    (record: InventarioItem) => {
      setForm({
        producto: String(record.producto || ""),
        lote: String(record.lote || ""),
        descripcion: String(record.descripcion || ""),
        stock_sistema: Number(record.stock_sistema || 0),
        unidad: String(record.unidad || record.um || "UND"),
        familia: String(record.familia || ""),
        familia2: String(record.familia2 || "REPUESTO"),
        cantidad_fisica: Number(record.cantidad_fisica || 0),
        um: String(record.um || "UND"),
        presentacion: String(record.presentacion || "SUELTO"),
        n_cajas_bultos: String(record.n_cajas_bultos || "1 UND"),
        largo: Number(record.largo || 0),
        ancho: Number(record.ancho || 0),
        alto: Number(record.alto || 0),
        peso_aprox_unitario: Number(record.peso_aprox_unitario || 0),
        observacion: String(record.observacion || "OK"),
        comentario: String(record.comentario || ""),
        rack: String(record.rack || ""),
        ubicacion_actual: String(record.ubicacion_actual || ""),
        almacenamiento: String(record.almacenamiento || "C.C.01"),
        contenedor: String(record.contenedor || "1"),
        foto_path: record.foto_path ? String(record.foto_path) : undefined,
      });
      setIsEditing(Number(record.id));
      setActiveTab("conteo");
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
