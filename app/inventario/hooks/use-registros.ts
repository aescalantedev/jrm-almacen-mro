import { useState, useCallback } from "react";
import { toast } from "sonner";
import type { InventarioItem } from "../types";

const PAGE_SIZE = 50;

export function useRegistros(token: string) {
  const [registros, setRegistros] = useState<InventarioItem[]>([]);
  const [loadingRegistros, setLoadingRegistros] = useState(false);
  const [loadingMore, setLoadingMore] = useState(false);
  const [page, setPage] = useState(1);
  const [total, setTotal] = useState(0);
  const [recordFilterStatus, setRecordFilterStatus] = useState("TODOS");
  const [recordSearchQuery, setRecordSearchQuery] = useState("");

  const hasMore = registros.length < total;

  const loadPage = useCallback(
    async (pageNum: number, q: string, observacion: string, append: boolean) => {
      if (!token) return;
      if (append) setLoadingMore(true);
      else setLoadingRegistros(true);
      try {
        const params = new URLSearchParams({ page: String(pageNum), limit: String(PAGE_SIZE) });
        if (q) params.set("q", q);
        if (observacion && observacion !== "TODOS") params.set("observacion", observacion);
        const res = await fetch(`/api/inventario?${params}`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        const data = await res.json();
        setRegistros((prev) => (append ? [...prev, ...(data.items || [])] : data.items || []));
        setTotal(data.total || 0);
        setPage(pageNum);
      } catch {
        toast.error("Error al cargar los registros");
      } finally {
        setLoadingRegistros(false);
        setLoadingMore(false);
      }
    },
    [token]
  );

  const loadRegistros = useCallback(() => {
    return loadPage(1, recordSearchQuery, recordFilterStatus, false);
  }, [loadPage, recordSearchQuery, recordFilterStatus]);

  const loadMore = useCallback(() => {
    return loadPage(page + 1, recordSearchQuery, recordFilterStatus, true);
  }, [loadPage, page, recordSearchQuery, recordFilterStatus]);

  const resetAndSearch = useCallback(
    (q: string, obs: string) => {
      setRegistros([]);
      return loadPage(1, q, obs, false);
    },
    [loadPage]
  );

  const setRecordFilterStatusWrapper = useCallback(
    (status: string) => {
      setRecordFilterStatus(status);
      resetAndSearch(recordSearchQuery, status);
    },
    [recordSearchQuery, resetAndSearch]
  );

  const setRecordSearchQueryWrapper = useCallback(
    (q: string) => {
      setRecordSearchQuery(q);
      resetAndSearch(q, recordFilterStatus);
    },
    [recordFilterStatus, resetAndSearch]
  );

  const deleteRecord = useCallback(
    async (id: number) => {
      if (!confirm("¿Deseas eliminar este registro de inventario?")) return;
      try {
        const res = await fetch(`/api/inventario/${id}`, {
          method: "DELETE",
          headers: { Authorization: `Bearer ${token}` },
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
    },
    [token, loadRegistros]
  );

  return {
    registros,
    loadingRegistros,
    loadingMore,
    hasMore,
    total,
    recordFilterStatus,
    setRecordFilterStatus: setRecordFilterStatusWrapper,
    recordSearchQuery,
    setRecordSearchQuery: setRecordSearchQueryWrapper,
    loadRegistros,
    loadMore,
    deleteRecord,
  };
}
