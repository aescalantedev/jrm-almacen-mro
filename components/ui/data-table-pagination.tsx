"use client";

import React from "react";
import {
  ChevronLeft,
  ChevronRight,
  ChevronsLeft,
  ChevronsRight,
} from "lucide-react";
import { Table } from "@tanstack/react-table";
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

interface ServerPaginationProps {
  page: number;
  pageSize: number;
  total: number;
  pageSizeOptions?: number[];
  onPageChange: (page: number) => void;
  onPageSizeChange?: (pageSize: number) => void;
  className?: string;
}

interface TablePaginationProps<TData> {
  table: Table<TData>;
  pageSizeOptions?: number[];
  className?: string;
}

export function DataTablePagination<TData>(
  props: ServerPaginationProps | TablePaginationProps<TData>
) {
  // Manejo de TanStack Table
  if ("table" in props) {
    const { table, pageSizeOptions = [10, 25, 50, 100], className = "" } = props;
    const pageIndex = table.getState().pagination.pageIndex;
    const pageSize = table.getState().pagination.pageSize;
    const total = table.getFilteredRowModel().rows.length;
    const pageCount = table.getPageCount();

    const from = total === 0 ? 0 : pageIndex * pageSize + 1;
    const to = Math.min((pageIndex + 1) * pageSize, total);

    return (
      <div
        className={`flex flex-col sm:flex-row items-center justify-between gap-3 px-3 py-3 border-t border-border/50 bg-secondary/10 text-xs text-muted-foreground ${className}`}
      >
        {/* CONTEO */}
        <div className="flex items-center gap-2 text-[11px] font-semibold">
          <span>
            Mostrando <strong className="text-foreground font-mono">{from}</strong> a{" "}
            <strong className="text-foreground font-mono">{to}</strong> de{" "}
            <strong className="text-foreground font-mono">{total.toLocaleString()}</strong> registros
          </span>
        </div>

        {/* CONTROLES DE PÁGINA */}
        <div className="flex items-center gap-3 sm:gap-6">
          {/* SELECTOR DE FILAS POR PÁGINA */}
          <div className="flex items-center gap-2">
            <span className="text-[11px] font-medium hidden sm:inline">Filas por pág.</span>
            <Select
              value={String(pageSize)}
              onValueChange={(value) => {
                table.setPageSize(Number(value));
              }}
            >
              <SelectTrigger className="h-8 w-18 text-xs font-semibold rounded-lg bg-background border-border/60">
                <SelectValue placeholder={String(pageSize)} />
              </SelectTrigger>
              <SelectContent side="top" className="min-w-18">
                {pageSizeOptions.map((size) => (
                  <SelectItem key={size} value={String(size)} className="text-xs">
                    {size}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          {/* INDICADOR Y BOTONES DE NAVEGACIÓN */}
          <div className="flex items-center gap-1">
            <span className="text-[11px] font-semibold mr-1">
              Pág. <strong className="text-foreground font-mono">{pageIndex + 1}</strong> de{" "}
              <strong className="text-foreground font-mono">{Math.max(1, pageCount)}</strong>
            </span>

            <Button
              variant="outline"
              size="icon"
              className="h-8 w-8 rounded-lg border-border/60"
              onClick={() => table.setPageIndex(0)}
              disabled={!table.getCanPreviousPage()}
              title="Primera página"
            >
              <ChevronsLeft className="h-4 w-4" />
            </Button>
            <Button
              variant="outline"
              size="icon"
              className="h-8 w-8 rounded-lg border-border/60"
              onClick={() => table.previousPage()}
              disabled={!table.getCanPreviousPage()}
              title="Página anterior"
            >
              <ChevronLeft className="h-4 w-4" />
            </Button>
            <Button
              variant="outline"
              size="icon"
              className="h-8 w-8 rounded-lg border-border/60"
              onClick={() => table.nextPage()}
              disabled={!table.getCanNextPage()}
              title="Página siguiente"
            >
              <ChevronRight className="h-4 w-4" />
            </Button>
            <Button
              variant="outline"
              size="icon"
              className="h-8 w-8 rounded-lg border-border/60"
              onClick={() => table.setPageIndex(pageCount - 1)}
              disabled={!table.getCanNextPage()}
              title="Última página"
            >
              <ChevronsRight className="h-4 w-4" />
            </Button>
          </div>
        </div>
      </div>
    );
  }

  // Manejo Server-Side (API)
  const {
    page,
    pageSize,
    total,
    pageSizeOptions = [10, 25, 50, 100],
    onPageChange,
    onPageSizeChange,
    className = "",
  } = props;

  const totalPages = Math.max(1, Math.ceil(total / pageSize));
  const from = total === 0 ? 0 : (page - 1) * pageSize + 1;
  const to = Math.min(page * pageSize, total);

  return (
    <div
      className={`flex flex-col sm:flex-row items-center justify-between gap-3 px-3 py-3 border-t border-border/50 bg-secondary/10 text-xs text-muted-foreground ${className}`}
    >
      {/* CONTEO */}
      <div className="flex items-center gap-2 text-[11px] font-semibold">
        <span>
          Mostrando <strong className="text-foreground font-mono">{from}</strong> a{" "}
          <strong className="text-foreground font-mono">{to}</strong> de{" "}
          <strong className="text-foreground font-mono">{total.toLocaleString()}</strong> registros
        </span>
      </div>

      {/* CONTROLES DE PÁGINA */}
      <div className="flex items-center gap-3 sm:gap-6">
        {/* SELECTOR DE FILAS POR PÁGINA */}
        {onPageSizeChange && (
          <div className="flex items-center gap-2">
            <span className="text-[11px] font-medium hidden sm:inline">Filas por pág.</span>
            <Select
              value={String(pageSize)}
              onValueChange={(value) => {
                onPageSizeChange(Number(value));
              }}
            >
              <SelectTrigger className="h-8 w-18 text-xs font-semibold rounded-lg bg-background border-border/60">
                <SelectValue placeholder={String(pageSize)} />
              </SelectTrigger>
              <SelectContent side="top" className="min-w-18">
                {pageSizeOptions.map((size) => (
                  <SelectItem key={size} value={String(size)} className="text-xs">
                    {size}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>
        )}

        {/* INDICADOR Y BOTONES DE NAVEGACIÓN */}
        <div className="flex items-center gap-1">
          <span className="text-[11px] font-semibold mr-1">
            Pág. <strong className="text-foreground font-mono">{page}</strong> de{" "}
            <strong className="text-foreground font-mono">{totalPages}</strong>
          </span>

          <Button
            type="button"
            variant="outline"
            size="icon"
            className="h-8 w-8 rounded-lg border-border/60"
            onClick={() => onPageChange(1)}
            disabled={page <= 1}
            title="Primera página"
          >
            <ChevronsLeft className="h-4 w-4" />
          </Button>
          <Button
            type="button"
            variant="outline"
            size="icon"
            className="h-8 w-8 rounded-lg border-border/60"
            onClick={() => onPageChange(page - 1)}
            disabled={page <= 1}
            title="Página anterior"
          >
            <ChevronLeft className="h-4 w-4" />
          </Button>
          <Button
            type="button"
            variant="outline"
            size="icon"
            className="h-8 w-8 rounded-lg border-border/60"
            onClick={() => onPageChange(page + 1)}
            disabled={page >= totalPages}
            title="Página siguiente"
          >
            <ChevronRight className="h-4 w-4" />
          </Button>
          <Button
            type="button"
            variant="outline"
            size="icon"
            className="h-8 w-8 rounded-lg border-border/60"
            onClick={() => onPageChange(totalPages)}
            disabled={page >= totalPages}
            title="Última página"
          >
            <ChevronsRight className="h-4 w-4" />
          </Button>
        </div>
      </div>
    </div>
  );
}
