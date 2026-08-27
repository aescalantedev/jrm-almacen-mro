"use client";

import { useState, useEffect, useCallback } from "react";
import { toast } from "sonner";

export interface CartItem {
  producto: string;
  glosa: string;
  unidad: string;
  stock_actual: number;
  cantidad: number;
  rack?: string;
  lote?: string;
}

export type MovementCartType = "INGRESO" | "SALIDA" | "INVENTARIO" | null;

const STORAGE_KEY = "mro_movement_cart";

export function useMovementCart() {
  const [tipo, setTipo] = useState<MovementCartType>(null);
  const [items, setItems] = useState<CartItem[]>([]);
  const [inventarioCount, setInventarioCount] = useState<number>(0);

  // Load from sessionStorage on mount
  useEffect(() => {
    try {
      const raw = sessionStorage.getItem(STORAGE_KEY);
      if (raw) {
        const parsed = JSON.parse(raw);
        if (parsed.tipo) setTipo(parsed.tipo);
        if (Array.isArray(parsed.items)) setItems(parsed.items);
        if (typeof parsed.inventarioCount === "number") setInventarioCount(parsed.inventarioCount);
      }
    } catch {
      // ignore
    }
  }, []);

  // Save to sessionStorage on change
  useEffect(() => {
    try {
      if (tipo) {
        sessionStorage.setItem(STORAGE_KEY, JSON.stringify({ tipo, items, inventarioCount }));
      } else {
        sessionStorage.removeItem(STORAGE_KEY);
      }
    } catch {
      // ignore
    }
  }, [tipo, items, inventarioCount]);

  const startMovement = useCallback((movementType: "INGRESO" | "SALIDA" | "INVENTARIO") => {
    if (tipo && tipo !== movementType && items.length > 0) {
      const currentName = tipo === "SALIDA" ? "Salida" : tipo === "INGRESO" ? "Ingreso" : "Inventario";
      toast.error(`Ya tienes un modo de ${currentName} en curso. Finalízalo o límpialo primero.`);
      return false;
    }
    setTipo(movementType);
    if (movementType === "INVENTARIO" && tipo !== "INVENTARIO") {
      setInventarioCount(0);
    }
    return true;
  }, [tipo, items.length]);

  const incrementInventarioCount = useCallback(() => {
    setInventarioCount((prev) => prev + 1);
  }, []);

  const addItem = useCallback(
    (
      product: {
        producto: string;
        glosa: string;
        unidad: string;
        stock_actual: number;
        rack?: string;
        lote?: string;
      },
      cantidad: number,
      targetTipo?: "INGRESO" | "SALIDA"
    ) => {
      const currentTipo = targetTipo || (tipo === "INVENTARIO" ? "SALIDA" : tipo) || "SALIDA";
      if (!tipo || tipo === "INVENTARIO") {
        setTipo(currentTipo);
      } else if (tipo !== currentTipo) {
        toast.error(`No puedes mezclar ítems de Ingreso y Salida en el mismo vale.`);
        return false;
      }

      const numCant = Number(cantidad);
      if (isNaN(numCant) || numCant <= 0) {
        toast.error("La cantidad debe ser mayor a 0");
        return false;
      }

      if (currentTipo === "SALIDA" && numCant > product.stock_actual) {
        toast.error(
          `Stock insuficiente para ${product.producto}: Disponible (${product.stock_actual} ${product.unidad}), Intentando retirar (${numCant} ${product.unidad})`
        );
        return false;
      }

      setItems((prev) => {
        const index = prev.findIndex((it) => it.producto === product.producto);
        if (index >= 0) {
          const updated = [...prev];
          const newQty = updated[index].cantidad + numCant;
          if (currentTipo === "SALIDA" && newQty > product.stock_actual) {
            toast.error(`El total de ${product.producto} en el vale (${newQty}) excede el stock disponible (${product.stock_actual})`);
            return prev;
          }
          updated[index] = { ...updated[index], cantidad: newQty };
          toast.success(`Se agregaron ${numCant} ${product.unidad} a ${product.producto}`);
          return updated;
        } else {
          toast.success(`${product.producto} agregado al vale (${numCant} ${product.unidad})`);
          return [
            ...prev,
            {
              producto: product.producto,
              glosa: product.glosa,
              unidad: product.unidad,
              stock_actual: product.stock_actual,
              cantidad: numCant,
              rack: product.rack,
              lote: product.lote,
            },
          ];
        }
      });

      return true;
    },
    [tipo]
  );

  const updateItemQty = useCallback(
    (producto: string, newQty: number) => {
      if (newQty <= 0) {
        removeItem(producto);
        return;
      }
      setItems((prev) =>
        prev.map((it) => {
          if (it.producto === producto) {
            if (tipo === "SALIDA" && newQty > it.stock_actual) {
              toast.error(`Stock insuficiente (${it.stock_actual} disponible)`);
              return it;
            }
            return { ...it, cantidad: newQty };
          }
          return it;
        })
      );
    },
    [tipo]
  );

  const removeItem = useCallback((producto: string) => {
    setItems((prev) => prev.filter((it) => it.producto !== producto));
    toast.info("Ítem removido del vale");
  }, []);

  // Solo vacía los items, manteniendo el modo activo
  const clearItems = useCallback(() => {
    setItems([]);
    toast.info("Vale vaciado");
  }, []);

  // Cancela completamente el modo y limpia items
  const cancelMovement = useCallback(() => {
    setItems([]);
    setTipo(null);
    setInventarioCount(0);
    try {
      sessionStorage.removeItem(STORAGE_KEY);
    } catch {
      // ignore
    }
    toast.info("Modo cancelado");
  }, []);

  const totalItemsCount = items.length;
  const totalUnitsCount = items.reduce((acc, it) => acc + (it.cantidad || 0), 0);

  return {
    tipo,
    items,
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
    clearCart: cancelMovement,
  };
}
