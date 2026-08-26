"use client";

import { useState, useEffect, useCallback } from "react";
import { toast } from "sonner";
import {
  Package, CheckCircle2, XCircle, AlertTriangle, Clock,
  Users, BarChart3, DollarSign, RefreshCw, Loader2, Database,
  TrendingUp, PieChart as PieIcon, FileSpreadsheet, Target
} from "lucide-react";
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer, PieChart, Pie, Cell, Legend
} from "recharts";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";
import { IRAContent } from "./components/ira-content";
import { useAuth } from "../inventario/hooks/use-auth";

interface DashboardStats {
  totalRegistros: number;
  totalAuditados: number;
  totalOk: number;
  totalFaltante: number;
  totalSobrante: number;
  totalStockSistema: number;
  totalCantFisica: number;
  totalValor: number;
  totalValorSistema: number;
  totalDiferenciaValor: number;
  stockTotal: number;
  porcentajeCompletado: number;
}

interface FamiliaStats {
  name: string;
  total_items: number;
  ok_count: number;
  faltante_count: number;
  sobrante_count: number;
  cant_fisica: number;
  stock_sistema: number;
  valor_total: number;
}

interface EstadoItem {
  name: string;
  value: number;
  color: string;
}

interface TopDifItem {
  id: number;
  producto: string;
  descripcion: string;
  stock_sistema: number;
  cantidad_fisica: number;
  dif: number;
  s_dif: number;
  observacion: string;
  rack: string;
  ubicacion_actual: string;
  familia2: string;
}

interface UsuarioStats {
  nombre: string;
  usuario: string;
  registros: number;
  auditados: number;
}

interface Registro {
  id: number;
  producto: string;
  descripcion: string;
  lote: string;
  stock_sistema: number;
  cantidad_fisica: number;
  dif: number;
  observacion: string;
  usuario_nombre: string;
  updated_at: string;
}

export default function DashboardPage() {
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [porFamilia, setPorFamilia] = useState<FamiliaStats[]>([]);
  const [porEstado, setPorEstado] = useState<EstadoItem[]>([]);
  const [topDiferencias, setTopDiferencias] = useState<TopDifItem[]>([]);
  const [porUsuario, setPorUsuario] = useState<UsuarioStats[]>([]);
  const [ultimos, setUltimos] = useState<Registro[]>([]);
  const [lastSync, setLastSync] = useState<{ fecha: string; registros_sync: number } | null>(null);
  const [loading, setLoading] = useState(true);
  const [syncing, setSyncing] = useState(false);
  const [exporting, setExporting] = useState(false);
  const [activeTab, setActiveTab] = useState<"general" | "ira">("general");

  const { user, token, isLoading: authLoading } = useAuth();

  const loadDashboard = useCallback(async () => {
    if (!token) return;
    try {
      const [dashRes, syncRes] = await Promise.all([
        fetch("/api/admin", { headers: { Authorization: `Bearer ${token}` } }),
        fetch("/api/sync", { headers: { Authorization: `Bearer ${token}` } }),
      ]);
      const dashData = await dashRes.json();
      const syncData = await syncRes.json();
      setStats(dashData.stats);
      setPorFamilia(dashData.porFamilia || []);
      setPorEstado(dashData.porEstado || []);
      setTopDiferencias(dashData.topDiferencias || []);
      setPorUsuario(dashData.porUsuario || []);
      setUltimos(dashData.ultimosRegistros || []);
      setLastSync(syncData.lastSync || null);
    } catch {
      toast.error("Error al cargar dashboard");
    } finally {
      setLoading(false);
    }
  }, [token]);

  useEffect(() => {
    loadDashboard();
  }, [loadDashboard]);

  const handleSync = async () => {
    setSyncing(true);
    try {
      const raw = localStorage.getItem("mro_auth");
      const token = raw ? JSON.parse(raw).token : "";
      const res = await fetch("/api/sync", {
        method: "POST",
        headers: { Authorization: `Bearer ${token}` },
      });
      const data = await res.json();
      if (data.success) {
        toast.success(`Sincronización completada: ${data.registros} registros`);
        loadDashboard();
      } else {
        toast.error(`Error: ${data.error}`);
      }
    } catch {
      toast.error("Error de conexión al sincronizar");
    } finally {
      setSyncing(false);
    }
  };

  const handleExportExcel = async () => {
    setExporting(true);
    try {
      const link = document.createElement("a");
      link.href = "/api/inventario/export";
      link.setAttribute("download", `Inventario_MRO_${new Date().toLocaleDateString("sv-SE")}.xlsx`);
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      toast.success("Descargando archivo Excel (.xlsx)");
    } catch {
      toast.error("Error al exportar a Excel");
    } finally {
      setExporting(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[50vh] flex-col gap-4">
        <Loader2 className="animate-spin text-primary" size={48} />
      </div>
    );
  }

  if (!user) return null;

  if (user?.rol !== 'admin') {
    return (
      <div className="flex flex-col items-center justify-center min-h-[50vh] space-y-4">
        <AlertTriangle className="h-12 w-12 text-rose-500" />
        <h2 className="text-xl font-bold">Acceso Denegado</h2>
        <p className="text-muted-foreground">No tienes permisos para ver el dashboard.</p>
        <Button onClick={() => window.location.href = '/inventario'}>Ir a Inventario</Button>
      </div>
    );
  }

  const getObsBadge = (obs: string) => {
    switch (obs) {
      case "OK":
        return (
          <Badge className="bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 border-emerald-500/30 text-[10px] gap-1">
            <CheckCircle2 className="h-3 w-3" /> OK
          </Badge>
        );
      case "FALTANTE":
        return (
          <Badge className="bg-rose-500/10 text-rose-600 dark:text-rose-400 border-rose-500/30 text-[10px] gap-1">
            <XCircle className="h-3 w-3" /> Faltante
          </Badge>
        );
      case "SOBRANTE":
        return (
          <Badge className="bg-amber-500/10 text-amber-600 dark:text-amber-400 border-amber-500/30 text-[10px] gap-1">
            <AlertTriangle className="h-3 w-3" /> Sobrante
          </Badge>
        );
      default:
        return (
          <Badge variant="secondary" className="text-[10px] gap-1">
            <Clock className="h-3 w-3" /> Pendiente
          </Badge>
        );
    }
  };

  return (
    <div className="w-full space-y-6">
      {/* Header Banner & Global Actions */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl sm:text-3xl font-black tracking-tight flex items-center gap-2">
            <Package className="h-7 w-7 text-primary" />
            Dashboard de Inventario
          </h1>
          <p className="text-xs sm:text-sm text-muted-foreground mt-0.5">
            Métricas ejecutivas y control de existencias en tiempo real (ALM MRO CHILCA)
          </p>
        </div>

        <div className="flex flex-wrap items-center gap-2">
          <Button
            type="button"
            variant="outline"
            onClick={handleExportExcel}
            disabled={exporting}
            className="h-10 text-xs font-bold gap-2 rounded-xl border-emerald-500/40 text-emerald-600 dark:text-emerald-400 hover:bg-emerald-500/10"
          >
            {exporting ? (
              <Loader2 className="h-4 w-4 animate-spin" />
            ) : (
              <FileSpreadsheet className="h-4 w-4" />
            )}
            Exportar Excel (.xlsx)
          </Button>

          <Button
            type="button"
            onClick={handleSync}
            disabled={syncing}
            className="h-10 text-xs font-bold gap-2 rounded-xl shadow-sm"
          >
            {syncing ? (
              <Loader2 className="h-4 w-4 animate-spin" />
            ) : (
              <RefreshCw className="h-4 w-4" />
            )}
            {syncing ? "Sincronizando..." : "Sincronizar Stock"}
          </Button>
        </div>
      </div>

      {/* Tab Navigation */}
      <div className="flex gap-1 bg-secondary/30 p-1 rounded-xl border border-border/40 w-fit">
        <button
          type="button"
          onClick={() => setActiveTab("general")}
          className={`flex items-center gap-1.5 px-4 py-2 rounded-lg text-xs font-bold transition-all ${
            activeTab === "general"
              ? "bg-primary text-primary-foreground shadow-sm"
              : "text-muted-foreground hover:text-foreground hover:bg-secondary/50"
          }`}
        >
          <Package className="h-3.5 w-3.5" />
          General
        </button>
        <button
          type="button"
          onClick={() => setActiveTab("ira")}
          className={`flex items-center gap-1.5 px-4 py-2 rounded-lg text-xs font-bold transition-all ${
            activeTab === "ira"
              ? "bg-primary text-primary-foreground shadow-sm"
              : "text-muted-foreground hover:text-foreground hover:bg-secondary/50"
          }`}
        >
          <Target className="h-3.5 w-3.5" />
          IRA
        </button>
      </div>

      {/* Tab Content */}
      {activeTab === "ira" ? (
        <IRAContent />
      ) : (
        <>
      {/* KPI METRIC CARDS */}
      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-7 gap-3 sm:gap-4">
        {/* SKUs Sistema */}
        <Card className="border-border/60 shadow-xs">
          <CardContent className="p-4 space-y-1">
            <div className="flex items-center justify-between text-muted-foreground">
              <span className="text-[10px] font-bold uppercase tracking-wider">SKUs Sistema</span>
              <Package className="h-4 w-4 text-primary" />
            </div>
            <div className="text-xl sm:text-2xl font-black font-mono">
              {(stats?.stockTotal || 0).toLocaleString()}
            </div>
            <div className="text-[10px] text-muted-foreground">Catálogo Flexline</div>
          </CardContent>
        </Card>

        {/* Auditados */}
        <Card className="border-border/60 shadow-xs">
          <CardContent className="p-4 space-y-1">
            <div className="flex items-center justify-between text-muted-foreground">
              <span className="text-[10px] font-bold uppercase tracking-wider">Auditados</span>
              <BarChart3 className="h-4 w-4 text-indigo-500" />
            </div>
            <div className="text-xl sm:text-2xl font-black font-mono text-indigo-600 dark:text-indigo-400">
              {(stats?.totalAuditados || 0).toLocaleString()}
            </div>
            <div className="text-[10px] text-muted-foreground font-semibold">
              {stats?.porcentajeCompletado || 0}% del total
            </div>
          </CardContent>
        </Card>

        {/* Pendientes */}
        <Card className="border-border/60 shadow-xs">
          <CardContent className="p-4 space-y-1">
            <div className="flex items-center justify-between text-muted-foreground">
              <span className="text-[10px] font-bold uppercase tracking-wider">Pendientes</span>
              <Clock className="h-4 w-4 text-slate-500" />
            </div>
            <div className="text-xl sm:text-2xl font-black font-mono text-slate-600 dark:text-slate-400">
              {((stats?.stockTotal || 0) - (stats?.totalAuditados || 0)).toLocaleString()}
            </div>
            <div className="text-[10px] text-slate-600/80 font-medium">Falta contar</div>
          </CardContent>
        </Card>

        {/* Conteo OK */}
        <Card className="border-border/60 shadow-xs">
          <CardContent className="p-4 space-y-1">
            <div className="flex items-center justify-between text-muted-foreground">
              <span className="text-[10px] font-bold uppercase tracking-wider">Exactos (OK)</span>
              <CheckCircle2 className="h-4 w-4 text-emerald-500" />
            </div>
            <div className="text-xl sm:text-2xl font-black font-mono text-emerald-600 dark:text-emerald-400">
              {(stats?.totalOk || 0).toLocaleString()}
            </div>
            <div className="text-[10px] text-emerald-600/80 font-medium">Sin discrepancia</div>
          </CardContent>
        </Card>

        {/* Faltantes */}
        <Card className="border-border/60 shadow-xs">
          <CardContent className="p-4 space-y-1">
            <div className="flex items-center justify-between text-muted-foreground">
              <span className="text-[10px] font-bold uppercase tracking-wider">Faltantes</span>
              <XCircle className="h-4 w-4 text-rose-500" />
            </div>
            <div className="text-xl sm:text-2xl font-black font-mono text-rose-600 dark:text-rose-400">
              {(stats?.totalFaltante || 0).toLocaleString()}
            </div>
            <div className="text-[10px] text-rose-600/80 font-medium">Requiere ajuste</div>
          </CardContent>
        </Card>

        {/* Sobrantes */}
        <Card className="border-border/60 shadow-xs">
          <CardContent className="p-4 space-y-1">
            <div className="flex items-center justify-between text-muted-foreground">
              <span className="text-[10px] font-bold uppercase tracking-wider">Sobrantes</span>
              <AlertTriangle className="h-4 w-4 text-amber-500" />
            </div>
            <div className="text-xl sm:text-2xl font-black font-mono text-amber-600 dark:text-amber-400">
              {(stats?.totalSobrante || 0).toLocaleString()}
            </div>
            <div className="text-[10px] text-amber-600/80 font-medium">Exceso físico</div>
          </CardContent>
        </Card>

        {/* Valor Total Físico */}
        <Card className="border-border/60 shadow-xs">
          <CardContent className="p-4 space-y-1">
            <div className="flex items-center justify-between text-muted-foreground">
              <span className="text-[10px] font-bold uppercase tracking-wider">Valor Físico</span>
              <DollarSign className="h-4 w-4 text-emerald-500" />
            </div>
            <div className="text-base sm:text-lg font-black font-mono text-emerald-700 dark:text-emerald-400 truncate">
              S/ {(stats?.totalValor || 0).toLocaleString("es-PE", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}
            </div>
            <div className="text-[10px] text-muted-foreground">Valorizado actual</div>
          </CardContent>
        </Card>
      </div>

      {/* Progress Bar Strip */}
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-4 sm:p-5 space-y-2">
          <div className="flex items-center justify-between text-xs font-bold">
            <span className="flex items-center gap-2">
              <TrendingUp className="h-4 w-4 text-primary" />
              Avance Global del Inventario Físico
            </span>
            <span className="text-primary font-mono text-sm">{stats?.porcentajeCompletado || 0}%</span>
          </div>
          <Progress value={stats?.porcentajeCompletado || 0} className="h-3 rounded-full" />
          <div className="flex items-center justify-between text-[11px] text-muted-foreground pt-1 font-mono">
            <span>{stats?.totalAuditados || 0} productos contados</span>
            <span>{stats?.totalRegistros || 0} total en almacén</span>
          </div>
        </CardContent>
      </Card>

      {/* CHARTS GRID */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* CHART 1: INVENTORY BY FAMILIA2 (BAR CHART - 2 COLS) */}
        <Card className="lg:col-span-2 border-border/60 shadow-xs">
          <CardHeader className="p-4 pb-2">
            <div className="flex items-center justify-between">
              <div>
                <CardTitle className="text-sm sm:text-base font-bold flex items-center gap-2">
                  <BarChart3 className="h-4 w-4 text-primary" />
                  Existencias por Familia 2 (Físico vs Sistema)
                </CardTitle>
                <CardDescription className="text-xs">
                  Comparativa de unidades físicas registradas vs stock teórico
                </CardDescription>
              </div>
            </div>
          </CardHeader>
          <CardContent className="p-2 sm:p-4">
            <div className="h-[280px] w-full">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart
                  data={porFamilia}
                  margin={{ top: 10, right: 10, left: -20, bottom: 25 }}
                >
                  <CartesianGrid strokeDasharray="3 3" opacity={0.15} vertical={false} />
                  <XAxis
                    dataKey="name"
                    tick={{ fontSize: 10 }}
                    angle={-25}
                    textAnchor="end"
                    interval={0}
                    height={45}
                  />
                  <YAxis tick={{ fontSize: 10 }} />
                  <Tooltip
                    contentStyle={{
                      backgroundColor: "hsl(var(--popover))",
                      borderColor: "hsl(var(--border))",
                      borderRadius: "0.75rem",
                      fontSize: "11px",
                      color: "hsl(var(--popover-foreground))",
                    }}
                    formatter={(value: any, name: any) => [
                      `${Number(value).toLocaleString()} und`,
                      name === "cant_fisica" ? "Cant. Física" : "Stock Sistema",
                    ]}
                  />
                  <Legend
                    wrapperStyle={{ fontSize: "11px", paddingTop: "10px" }}
                    formatter={(val) => (val === "cant_fisica" ? "Físico Contado" : "Stock Sistema")}
                  />
                  <Bar dataKey="stock_sistema" fill="#94A3B8" radius={[4, 4, 0, 0]} />
                  <Bar dataKey="cant_fisica" fill="#0EA5E9" radius={[4, 4, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </div>
          </CardContent>
        </Card>

        {/* CHART 2: AUDIT STATUS DONUT CHART (1 COL) */}
        <Card className="border-border/60 shadow-xs">
          <CardHeader className="p-4 pb-2">
            <CardTitle className="text-sm sm:text-base font-bold flex items-center gap-2">
              <PieIcon className="h-4 w-4 text-primary" />
              Estado de Conteos
            </CardTitle>
            <CardDescription className="text-xs">
              Proporción de concordancia física
            </CardDescription>
          </CardHeader>
          <CardContent className="p-2 sm:p-4">
            <div className="h-[280px] w-full flex items-center justify-center">
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={porEstado}
                    cx="50%"
                    cy="50%"
                    innerRadius={55}
                    outerRadius={85}
                    paddingAngle={4}
                    dataKey="value"
                  >
                    {porEstado.map((entry, index) => (
                      <Cell key={`cell-${index}`} fill={entry.color} />
                    ))}
                  </Pie>
                  <Tooltip
                    contentStyle={{
                      backgroundColor: "hsl(var(--popover))",
                      borderColor: "hsl(var(--border))",
                      borderRadius: "0.75rem",
                      fontSize: "11px",
                      color: "hsl(var(--popover-foreground))",
                    }}
                  />
                  <Legend
                    wrapperStyle={{ fontSize: "11px" }}
                    layout="horizontal"
                    verticalAlign="bottom"
                    align="center"
                  />
                </PieChart>
              </ResponsiveContainer>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* TOP DISCREPANCIES TABLE & AUDITOR PERFORMANCE */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* TOP DISCREPANCIES (2 COLS) */}
        <Card className="lg:col-span-2 border-border/60 shadow-xs">
          <CardHeader className="p-4 pb-2">
            <div className="flex items-center justify-between">
              <div>
                <CardTitle className="text-sm sm:text-base font-bold flex items-center gap-2">
                  <AlertTriangle className="h-4 w-4 text-amber-500" />
                  Principales Discrepancias Detectadas
                </CardTitle>
                <CardDescription className="text-xs">
                  SKUs con mayor variación entre cantidad física y stock de sistema
                </CardDescription>
              </div>
            </div>
          </CardHeader>
          <CardContent className="p-0">
            <div className="overflow-x-auto max-h-[360px]">
              <table className="w-full text-xs">
                <thead className="bg-secondary/40 border-b border-border/40 sticky top-0 z-10 backdrop-blur-sm">
                  <tr>
                    <th className="text-left py-2.5 px-3 font-bold text-muted-foreground uppercase">SKU</th>
                    <th className="text-left py-2.5 px-3 font-bold text-muted-foreground uppercase">Descripción</th>
                    <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Sis.</th>
                    <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Fís.</th>
                    <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">DIF</th>
                    <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Ubicación</th>
                    <th className="text-center py-2.5 px-3 font-bold text-muted-foreground uppercase">Estado</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-border/30">
                  {topDiferencias.length === 0 ? (
                    <tr>
                      <td colSpan={7} className="py-8 text-center text-muted-foreground">
                        No se han registrado discrepancias. Todo el inventario coincide.
                      </td>
                    </tr>
                  ) : (
                    topDiferencias.map((item) => (
                      <tr key={item.id} className="hover:bg-secondary/20 transition">
                        <td className="py-2 px-3 font-mono font-bold">{item.producto}</td>
                        <td className="py-2 px-3 max-w-[180px] truncate font-medium" title={item.descripcion}>
                          {item.descripcion}
                        </td>
                        <td className="py-2 px-2 text-center font-mono">{item.stock_sistema}</td>
                        <td className="py-2 px-2 text-center font-mono font-bold text-primary">{item.cantidad_fisica}</td>
                        <td className="py-2 px-2 text-center font-mono font-bold">
                          <span
                            className={`px-1.5 py-0.5 rounded ${
                              item.dif > 0
                                ? "text-amber-600 bg-amber-500/10"
                                : "text-rose-600 bg-rose-500/10"
                            }`}
                          >
                            {item.dif > 0 ? `+${item.dif}` : item.dif}
                          </span>
                        </td>
                        <td className="py-2 px-2 text-center text-[10px] font-mono text-muted-foreground">
                          {item.rack ? `R:${item.rack} ` : ""}{item.ubicacion_actual || "-"}
                        </td>
                        <td className="py-2 px-3 text-center">{getObsBadge(item.observacion)}</td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>
          </CardContent>
        </Card>

        {/* AUDITORS & LAST SYNC INFO (1 COL) */}
        <div className="space-y-4">
          {/* Auditors Card */}
          <Card className="border-border/60 shadow-xs">
            <CardHeader className="p-4 pb-2">
              <CardTitle className="text-sm font-bold flex items-center gap-2">
                <Users className="h-4 w-4 text-primary" />
                Auditoría por Contador
              </CardTitle>
              <CardDescription className="text-xs">
                Rendimiento de los operadores
              </CardDescription>
            </CardHeader>
            <CardContent className="p-4 space-y-2.5">
              {porUsuario.length === 0 ? (
                <div className="text-center py-6 text-xs text-muted-foreground">
                  Sin registros de auditores
                </div>
              ) : (
                porUsuario.map((u) => (
                  <div
                    key={u.usuario}
                    className="flex items-center justify-between p-2.5 bg-secondary/30 rounded-xl border border-border/40"
                  >
                    <div>
                      <p className="text-xs font-bold text-foreground">{u.nombre}</p>
                      <p className="text-[10px] text-muted-foreground font-mono">@{u.usuario}</p>
                    </div>
                    <div className="text-right">
                      <p className="text-xs font-mono font-bold text-primary">
                        {u.auditados} / {u.registros}
                      </p>
                      <p className="text-[10px] text-muted-foreground">contados</p>
                    </div>
                  </div>
                ))
              )}
            </CardContent>
          </Card>

          {/* Sync Status Card */}
          <Card className="border-border/60 shadow-xs">
            <CardContent className="p-4 flex items-center gap-3">
              <div className="h-10 w-10 rounded-xl bg-primary/10 text-primary flex items-center justify-center shrink-0">
                <Database className="h-5 w-5" />
              </div>
              <div className="space-y-0.5">
                <p className="text-xs font-bold text-foreground">Sincronización Flexline</p>
                <p className="text-[11px] text-muted-foreground">
                  {lastSync
                    ? `${new Date(lastSync.fecha).toLocaleString("es-PE")} (${lastSync.registros_sync} SKUs)`
                    : "Base de datos local actualizada"}
                </p>
              </div>
            </CardContent>
          </Card>
        </div>
      </div>
        </>
      )}
    </div>
  );
}
