import { useState, useCallback } from "react";
import { toast } from "sonner";
import type { StockItem } from "../types";

const PAGE_SIZE = 50;

export function useCatalogo(token: string) {
  const [catalogItems, setCatalogItems] = useState<StockItem[]>([]);
  const [loadingCatalog, setLoadingCatalog] = useState(false);
  const [loadingMore, setLoadingMore] = useState(false);
  const [page, setPage] = useState(1);
  const [total, setTotal] = useState(0);
  const [catalogSearch, setCatalogSearch] = useState("");

  const hasMore = catalogItems.length < total;

  const loadPage = useCallback(
    async (q: string, pageNum: number, append: boolean) => {
      if (!token) return;
      if (append) setLoadingMore(true);
      else setLoadingCatalog(true);
      try {
        const params = new URLSearchParams({ page: String(pageNum), limit: String(PAGE_SIZE) });
        if (q) params.set("q", q);
        const res = await fetch(`/api/stock?${params}`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        const data = await res.json();
        setCatalogItems((prev) => (append ? [...prev, ...(data.stock || [])] : data.stock || []));
        setTotal(data.total || 0);
        setPage(pageNum);
      } catch {
        toast.error("Error al cargar catálogo");
      } finally {
        setLoadingCatalog(false);
        setLoadingMore(false);
      }
    },
    [token]
  );

  const loadCatalog = useCallback(
    (q?: string) => {
      const query = q !== undefined ? q : catalogSearch;
      if (q !== undefined) setCatalogSearch(q);
      return loadPage(query, 1, false);
    },
    [loadPage, catalogSearch]
  );

  const loadMore = useCallback(() => {
    return loadPage(catalogSearch, page + 1, true);
  }, [loadPage, catalogSearch, page]);

  return {
    catalogItems,
    loadingCatalog,
    loadingMore,
    hasMore,
    total,
    catalogSearch,
    setCatalogSearch,
    loadCatalog,
    loadMore,
  };
}
