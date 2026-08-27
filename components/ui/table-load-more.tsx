"use client";

import React from "react";
import { Plus, Loader2 } from "lucide-react";
import { Button } from "@/components/ui/button";

interface TableLoadMoreProps {
  currentCount: number;
  totalCount: number;
  hasMore: boolean;
  loadingMore: boolean;
  onLoadMore: () => void;
  itemName?: string;
  className?: string;
}

export function TableLoadMore({
  currentCount,
  totalCount,
  hasMore,
  loadingMore,
  onLoadMore,
  itemName = "registros",
  className = "",
}: TableLoadMoreProps) {
  if (totalCount === 0) return null;

  return (
    <div
      className={`border-t border-border/50 bg-secondary/15 px-4 py-3 flex flex-col sm:flex-row items-center justify-between gap-2.5 text-xs text-muted-foreground ${className}`}
    >
      <div className="text-[11px] font-semibold">
        Mostrando <strong className="text-foreground font-mono">{currentCount}</strong> de{" "}
        <strong className="text-foreground font-mono">{totalCount.toLocaleString()}</strong> {itemName}
      </div>

      <div>
        {hasMore ? (
          <Button
            type="button"
            variant="outline"
            size="sm"
            onClick={onLoadMore}
            disabled={loadingMore}
            className="h-8.5 px-4 text-xs font-bold gap-2 rounded-xl border-primary/30 text-primary hover:bg-primary/10 shadow-2xs"
          >
            {loadingMore ? (
              <>
                <Loader2 className="h-3.5 w-3.5 animate-spin" />
                Cargando más...
              </>
            ) : (
              <>
                <Plus className="h-3.5 w-3.5" />
                Cargar 50 más
              </>
            )}
          </Button>
        ) : (
          <span className="text-[11px] font-medium text-muted-foreground/80">
            ✓ Todos los {itemName} cargados
          </span>
        )}
      </div>
    </div>
  );
}
