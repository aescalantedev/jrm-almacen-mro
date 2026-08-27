"use client";

import React, { useState, useEffect, useCallback } from "react";
import {
  ArrowDownCircle,
  ArrowUpCircle,
  ArrowLeftRight,
  TrendingUp,
  Package,
  Layers,
  User,
  FileText,
  Loader2,
  RefreshCw,
} from "lucide-react";
import {
  AreaChart,
  Area,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  PieChart,
  Pie,
  Cell,
  Legend,
} from "recharts";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";

interface TendenciaItem {
  fecha: string;
  ingresos: number;
  salidas: number;
  total_movimientos: number;
}

interface MotivoItem {
  name: string;
  count: number;
  value: number;
}

interface TopSalidaItem {
  producto: string;
  glosa: string;
  unidad: string;
  total_despachado: number;
  frecuencia: number;
}

interface TopSolicitanteItem {
  solicitante: string;
  despachos: number;
  unidades: number;
}

const COLORS = ["#F43F5E", "#3B82F6", "#10B981", "#F59E0B", "#8B5CF6", "#EC4899", "#06B6D4", "#64748B"];

export function KardexAnalytics({ token }: { token: string }) {
  const [loading, setLoading] = useState(true);
  const [tendencia, setTendencia] = useState<TendenciaItem[]>([]);
  const [motivos, setMotivos] = useState<MotivoItem[]>([]);
  const [topSalidas, setTopSalidas] = useState<TopSalidaItem[]>([]);
  const [topSolicitantes, setTopSolicitantes] = useState<TopSolicitanteItem[]>([]);

  const loadStats = useCallback(async () => {
    setLoading(true);
    try {
      const raw = typeof window !== "undefined" ? localStorage.getItem("mro_auth") : null;
      const currentToken = token || (raw ? JSON.parse(raw).token : "");
      const res = await fetch("/api/movimientos/stats", {
        headers: currentToken ? { Authorization: `Bearer ${currentToken}` } : {},
      });
      const data = await res.json();
      if (res.ok) {
        setTendencia(data.tendencia || []);
        setMotivos(data.motivos_salida || []);
        setTopSalidas(data.top_salidas || []);
        setTopSolicitantes(data.top_solicitantes || []);
      }
    } catch {
      // error handling
    } finally {
      setLoading(false);
    }
  }, [token]);

  useEffect(() => {
    loadStats();
  }, [loadStats]);

  const totalIngresos = tendencia.reduce((acc, t) => acc + (t.ingresos || 0), 0);
  const totalSalidas = tendencia.reduce((acc, t) => acc + (t.salidas || 0), 0);
  const totalMovs = tendencia.reduce((acc, t) => acc + (t.total_movimientos || 0), 0);

  if (loading) {
    return (
      <div className="p-16 text-center text-muted-foreground">
        <Loader2 className="animate-spin h-8 w-8 mx-auto mb-3 text-primary" />
        Cargando métricas y analítica de Kardex...
      </div>
    );
  }

  return (
    <div className="space-y-6">
      {/* KPIS HEADER */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <Card className="border-border/60 bg-emerald-500/5 shadow-xs">
          <CardContent className="p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-emerald-600 dark:text-emerald-400">
              <span>Ingresos Totales (30d)</span>
              <ArrowDownCircle className="h-4 w-4" />
            </div>
            <div className="mt-2">
              <span className="text-2xl font-black font-mono text-foreground">
                {totalIngresos.toLocaleString()}
              </span>
              <span className="text-xs text-muted-foreground ml-1">unidades</span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 bg-rose-500/5 shadow-xs">
          <CardContent className="p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-rose-600 dark:text-rose-400">
              <span>Despachos Totales (30d)</span>
              <ArrowUpCircle className="h-4 w-4" />
            </div>
            <div className="mt-2">
              <span className="text-2xl font-black font-mono text-foreground">
                {totalSalidas.toLocaleString()}
              </span>
              <span className="text-xs text-muted-foreground ml-1">unidades</span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 bg-primary/5 shadow-xs">
          <CardContent className="p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-primary">
              <span>Balance Neto de Stock</span>
              <TrendingUp className="h-4 w-4" />
            </div>
            <div className="mt-2">
              <span className={`text-2xl font-black font-mono ${totalIngresos - totalSalidas >= 0 ? "text-emerald-600 dark:text-emerald-400" : "text-rose-600 dark:text-rose-400"}`}>
                {totalIngresos - totalSalidas > 0 ? `+${(totalIngresos - totalSalidas).toLocaleString()}` : (totalIngresos - totalSalidas).toLocaleString()}
              </span>
              <span className="text-xs text-muted-foreground ml-1">unidades</span>
            </div>
          </CardContent>
        </Card>

        <Card className="border-border/60 bg-secondary/30 shadow-xs">
          <CardContent className="p-4">
            <div className="flex items-center justify-between text-xs font-semibold text-muted-foreground">
              <span>Transacciones Registradas</span>
              <ArrowLeftRight className="h-4 w-4" />
            </div>
            <div className="mt-2 flex items-baseline justify-between">
              <span className="text-2xl font-black font-mono text-foreground">
                {totalMovs}
              </span>
              <Button type="button" variant="ghost" size="sm" onClick={loadStats} className="h-7 text-xs gap-1">
                <RefreshCw className="h-3 w-3" /> Actualizar
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* CHARTS ROW 1: TENDENCIA & MOTIVOS */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* GRÁFICO 1: TENDENCIA TEMPORAL (8 Cols) */}
        <Card className="lg:col-span-8 border-border/60 shadow-xs">
          <CardHeader className="p-4 border-b border-border/40">
            <CardTitle className="text-sm font-bold flex items-center gap-2">
              <TrendingUp className="h-4 w-4 text-primary" />
              Tendencia de Movimientos: Ingresos vs Despachos
            </CardTitle>
            <CardDescription className="text-xs">
              Evolución diaria de cantidades ingresadas y retiradas de almacén
            </CardDescription>
          </CardHeader>
          <CardContent className="p-4">
            {tendencia.length > 0 ? (
              <div className="h-72 w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <AreaChart data={tendencia} margin={{ top: 10, right: 10, left: -20, bottom: 0 }}>
                    <defs>
                      <linearGradient id="colorIngresos" x1="0" y1="0" x2="0" y2="1">
                        <stop offset="5%" stopColor="#10B981" stopOpacity={0.4} />
                        <stop offset="95%" stopColor="#10B981" stopOpacity={0.0} />
                      </linearGradient>
                      <linearGradient id="colorSalidas" x1="0" y1="0" x2="0" y2="1">
                        <stop offset="5%" stopColor="#F43F5E" stopOpacity={0.4} />
                        <stop offset="95%" stopColor="#F43F5E" stopOpacity={0.0} />
                      </linearGradient>
                    </defs>
                    <CartesianGrid strokeDasharray="3 3" opacity={0.15} />
                    <XAxis dataKey="fecha" tick={{ fontSize: 11 }} />
                    <YAxis tick={{ fontSize: 11 }} />
                    <Tooltip contentStyle={{ backgroundColor: "#0F172A", color: "#FFF", borderRadius: 8, fontSize: 12 }} />
                    <Legend />
                    <Area type="monotone" dataKey="ingresos" name="Ingresos (+)" stroke="#10B981" fillOpacity={1} fill="url(#colorIngresos)" strokeWidth={2} />
                    <Area type="monotone" dataKey="salidas" name="Salidas (-)" stroke="#F43F5E" fillOpacity={1} fill="url(#colorSalidas)" strokeWidth={2} />
                  </AreaChart>
                </ResponsiveContainer>
              </div>
            ) : (
              <div className="h-72 flex items-center justify-center text-xs text-muted-foreground">
                No hay movimientos registrados en los últimos 30 días para graficar.
              </div>
            )}
          </CardContent>
        </Card>

        {/* GRÁFICO 2: DISTRIBUCIÓN DE MOTIVOS (4 Cols) */}
        <Card className="lg:col-span-4 border-border/60 shadow-xs">
          <CardHeader className="p-4 border-b border-border/40">
            <CardTitle className="text-sm font-bold flex items-center gap-2">
              <Layers className="h-4 w-4 text-primary" />
              Destino de las Salidas
            </CardTitle>
            <CardDescription className="text-xs">
              Distribución por motivo de despacho
            </CardDescription>
          </CardHeader>
          <CardContent className="p-4">
            {motivos.length > 0 ? (
              <div className="h-72 w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <PieChart>
                    <Pie
                      data={motivos}
                      cx="50%"
                      cy="50%"
                      innerRadius={50}
                      outerRadius={80}
                      paddingAngle={4}
                      dataKey="value"
                    >
                      {motivos.map((entry, index) => (
                        <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                      ))}
                    </Pie>
                    <Tooltip contentStyle={{ backgroundColor: "#0F172A", color: "#FFF", borderRadius: 8, fontSize: 12 }} />
                    <Legend wrapperStyle={{ fontSize: 10 }} />
                  </PieChart>
                </ResponsiveContainer>
              </div>
            ) : (
              <div className="h-72 flex items-center justify-center text-xs text-muted-foreground">
                Aún no hay salidas registradas.
              </div>
            )}
          </CardContent>
        </Card>
      </div>

      {/* CHARTS ROW 2: TOP PRODUCTOS & TOP SOLICITANTES */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-6">
        {/* TOP 10 REPUESTOS MÁS DESPACHADOS (7 Cols) */}
        <Card className="lg:col-span-7 border-border/60 shadow-xs">
          <CardHeader className="p-4 border-b border-border/40">
            <CardTitle className="text-sm font-bold flex items-center gap-2">
              <Package className="h-4 w-4 text-primary" />
              Top 10 Repuestos con Mayor Rotación
            </CardTitle>
            <CardDescription className="text-xs">
              Materiales con mayor volumen de salida
            </CardDescription>
          </CardHeader>
          <CardContent className="p-4">
            {topSalidas.length > 0 ? (
              <div className="h-72 w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <BarChart
                    data={topSalidas}
                    layout="vertical"
                    margin={{ top: 5, right: 20, left: 40, bottom: 5 }}
                  >
                    <CartesianGrid strokeDasharray="3 3" opacity={0.15} />
                    <XAxis type="number" tick={{ fontSize: 11 }} />
                    <YAxis dataKey="producto" type="category" tick={{ fontSize: 10, fontFamily: "monospace" }} width={80} />
                    <Tooltip
                      formatter={(val, name, item) => [`${val} ${item.payload.unidad || "UND"} (${item.payload.glosa})`, "Despachado"]}
                      contentStyle={{ backgroundColor: "#0F172A", color: "#FFF", borderRadius: 8, fontSize: 12 }}
                    />
                    <Bar dataKey="total_despachado" fill="#F43F5E" radius={[0, 4, 4, 0]} />
                  </BarChart>
                </ResponsiveContainer>
              </div>
            ) : (
              <div className="h-72 flex items-center justify-center text-xs text-muted-foreground">
                Sin datos de rotación aún.
              </div>
            )}
          </CardContent>
        </Card>

        {/* TOP SOLICITANTES / ÁREAS (5 Cols) */}
        <Card className="lg:col-span-5 border-border/60 shadow-xs">
          <CardHeader className="p-4 border-b border-border/40">
            <CardTitle className="text-sm font-bold flex items-center gap-2">
              <User className="h-4 w-4 text-primary" />
              Top Solicitantes / Cuadrillas
            </CardTitle>
            <CardDescription className="text-xs">
              Personal o áreas con mayor frecuencia de retiro
            </CardDescription>
          </CardHeader>
          <CardContent className="p-4">
            {topSolicitantes.length > 0 ? (
              <div className="space-y-3">
                {topSolicitantes.map((s, idx) => (
                  <div key={idx} className="flex items-center justify-between p-2 rounded-xl bg-secondary/20 hover:bg-secondary/40 transition-colors">
                    <div className="flex items-center gap-2.5 min-w-0">
                      <span className="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-primary/10 text-primary font-mono font-bold text-xs">
                        {idx + 1}
                      </span>
                      <span className="text-xs font-semibold text-foreground truncate">
                        {s.solicitante}
                      </span>
                    </div>
                    <div className="text-right shrink-0">
                      <span className="text-xs font-mono font-bold text-foreground block">
                        {s.despachos} despachos
                      </span>
                      <span className="text-[10px] text-muted-foreground">
                        ({s.unidades} unds)
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="h-72 flex items-center justify-center text-xs text-muted-foreground">
                Sin datos de solicitantes aún.
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
