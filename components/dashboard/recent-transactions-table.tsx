"use client";

import * as React from "react";
import {
  ColumnDef,
  ColumnFiltersState,
  SortingState,
  flexRender,
  getCoreRowModel,
  getFilteredRowModel,
  getPaginationRowModel,
  getSortedRowModel,
  useReactTable,
} from "@tanstack/react-table";
import { 
  ArrowUpDown, 
  Search,
  ArrowDownCircle,
  ArrowUpCircle,
  Package,
} from "lucide-react";

import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { DataTablePagination } from "@/components/ui/data-table-pagination";

export type MovimientoDashboard = {
  id: number | string;
  producto: string;
  glosa: string;
  tipo: "INGRESO" | "SALIDA" | string;
  cantidad: number;
  unidad?: string;
  motivo?: string;
  documento_referencia?: string;
  usuario_nombre?: string;
  created_at: string;
};

const columns: ColumnDef<MovimientoDashboard>[] = [
  {
    accessorKey: "producto",
    header: ({ column }) => (
      <Button
        variant="ghost"
        className="hover:bg-transparent p-0 text-[10px] font-bold uppercase tracking-wider text-muted-foreground"
        onClick={() => column.toggleSorting(column.getIsSorted() === "asc")}
      >
        SKU / Material
        <ArrowUpDown className="ml-1.5 h-3 w-3" />
      </Button>
    ),
    cell: ({ row }) => (
      <div className="flex flex-col py-0.5">
        <span className="font-mono font-bold text-xs text-primary">{row.getValue("producto")}</span>
        <span className="text-xs text-foreground font-medium max-w-xs truncate" title={row.original.glosa}>
          {row.original.glosa}
        </span>
      </div>
    ),
  },
  {
    accessorKey: "tipo",
    header: "Tipo",
    cell: ({ row }) => {
      const tipo = row.getValue("tipo") as string;
      const isIngreso = tipo === "INGRESO";
      return (
        <Badge
          className={`rounded-md px-2 py-0.5 text-[10px] font-bold uppercase border-none gap-1 ${
            isIngreso
              ? "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400"
              : "bg-rose-500/10 text-rose-600 dark:text-rose-400"
          }`}
        >
          {isIngreso ? <ArrowDownCircle className="h-3 w-3" /> : <ArrowUpCircle className="h-3 w-3" />}
          {tipo}
        </Badge>
      );
    },
  },
  {
    accessorKey: "cantidad",
    header: () => <div className="text-right">Cantidad</div>,
    cell: ({ row }) => {
      const cant = Number(row.getValue("cantidad") || 0);
      const isIngreso = row.original.tipo === "INGRESO";
      return (
        <div className="text-right font-mono font-bold text-xs">
          <span className={isIngreso ? "text-emerald-600 dark:text-emerald-400" : "text-foreground"}>
            {isIngreso ? `+${cant}` : `-${cant}`}{" "}
            <span className="text-[10px] font-normal text-muted-foreground">
              {row.original.unidad || "UND"}
            </span>
          </span>
        </div>
      );
    },
  },
  {
    accessorKey: "motivo",
    header: "Motivo / Referencia",
    cell: ({ row }) => (
      <div className="text-xs text-muted-foreground truncate max-w-[150px]">
        {row.original.motivo || row.original.documento_referencia || "Movimiento general"}
      </div>
    ),
  },
  {
    accessorKey: "created_at",
    header: "Fecha / Hora",
    cell: ({ row }) => (
      <div className="text-[11px] font-mono text-muted-foreground whitespace-nowrap">
        {new Date(row.getValue("created_at")).toLocaleString("es-PE", {
          day: "2-digit",
          month: "2-digit",
          year: "numeric",
          hour: "2-digit",
          minute: "2-digit",
        })}
      </div>
    ),
  },
];

interface RecentTransactionsTableProps {
  data: MovimientoDashboard[];
}

export function RecentTransactionsTable({ data }: RecentTransactionsTableProps) {
  const [sorting, setSorting] = React.useState<SortingState>([]);
  const [columnFilters, setColumnFilters] = React.useState<ColumnFiltersState>([]);

  const table = useReactTable({
    data,
    columns,
    onSortingChange: setSorting,
    onColumnFiltersChange: setColumnFilters,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
    state: {
      sorting,
      columnFilters,
    },
    initialState: {
      pagination: {
        pageSize: 10,
      },
    },
  });

  return (
    <div className="space-y-3">
      {/* TOOLBAR */}
      <div className="flex items-center justify-between gap-3">
        <div className="relative flex-1 max-w-sm">
          <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-3.5 w-3.5 text-muted-foreground" />
          <Input
            placeholder="Buscar por SKU o descripción..."
            value={(table.getColumn("producto")?.getFilterValue() as string) ?? ""}
            onChange={(event) =>
              table.getColumn("producto")?.setFilterValue(event.target.value)
            }
            className="pl-9 h-9 rounded-xl bg-background text-xs border-border/60"
          />
        </div>
      </div>

      {/* TABLE */}
      <div className="rounded-xl border border-border/60 overflow-hidden bg-card shadow-xs">
        <div className="overflow-x-auto">
          <Table>
            <TableHeader className="bg-secondary/30">
              {table.getHeaderGroups().map((headerGroup) => (
                <TableRow key={headerGroup.id} className="border-border/50">
                  {headerGroup.headers.map((header) => (
                    <TableHead key={header.id} className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground py-2.5 px-3">
                      {header.isPlaceholder
                        ? null
                        : flexRender(
                            header.column.columnDef.header,
                            header.getContext()
                          )}
                    </TableHead>
                  ))}
                </TableRow>
              ))}
            </TableHeader>
            <TableBody className="divide-y divide-border/40 font-medium">
              {table.getRowModel().rows?.length ? (
                table.getRowModel().rows.map((row) => (
                  <TableRow
                    key={row.id}
                    className="hover:bg-secondary/20 transition-colors border-border/30"
                  >
                    {row.getVisibleCells().map((cell) => (
                      <TableCell key={cell.id} className="py-2.5 px-3">
                        {flexRender(cell.column.columnDef.cell, cell.getContext())}
                      </TableCell>
                    ))}
                  </TableRow>
                ))
              ) : (
                <TableRow>
                  <TableCell colSpan={columns.length} className="h-24 text-center text-xs text-muted-foreground">
                    No se registran movimientos recientes.
                  </TableCell>
                </TableRow>
              )}
            </TableBody>
          </Table>
        </div>

        {/* PAGINACIÓN ESTANDARIZADA */}
        <DataTablePagination table={table} pageSizeOptions={[5, 10, 25]} />
      </div>
    </div>
  );
}
