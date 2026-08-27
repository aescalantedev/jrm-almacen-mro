"use client";

import { useState, useEffect, useCallback } from "react";
import { toast } from "sonner";
import {
  Target,
  DollarSign,
  TrendingDown,
  TrendingUp,
  BarChart3,
  AlertTriangle,
  CheckCircle2,
  XCircle,
  Loader2,
  Package,
} from "lucide-react";
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip,
  ResponsiveContainer, PieChart, Pie, Cell, Legend
} from "recharts";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Progress } from "@/components/ui/progress";

interface IRAKPIs {
  iraSKU: number;
  iraFinanciera: number;
  metaIRA: number;
  metaFinanciera: number;
  descalceNeto: number;
  descalceBruto: number;
  descalceNetoUnid: number;
  valorFisico: number;
  valorSistema: number;
  totalSKU: number;
  totalAuditados: number;
  totalConformes: number;
  totalConError: number;
  totalFaltantes: number;
  totalSobrantes: number;
  porcentajeAuditado: number;
}

interface FamiliaIRA {
  familia: string;
  total: number;
  conformes: number;
  con_error: number;
  pendientes: number;
}

interface TopImpacto {
  producto: string;
  descripcion: string;
  familia: string;
  stock_sistema: number;
  cantidad_fisica: number;
  dif: number;
  costo_unitario: number;
  impacto_monetario: number;
}

interface CausaRaiz {
  observacion: string;
  cantidad: number;
  porcentaje: number;
}

const COLORS = ["#10B981", "#F43F5E", "#F59E0B", "#94A3B8"];

function KPICard({
  label,
  value,
  sub,
  icon: Icon,
  color,
  trend,
}: {
  label: string;
  value: string;
  sub: string;
  icon: React.ElementType;
  color: string;
  trend?: "up" | "down" | "neutral";
}) {
  return (
    <Card className="border-border/60 shadow-xs">
      <CardContent className="p-3 sm:p-4 space-y-1">
        <div className="flex items-center justify-between text-muted-foreground">
          <span className="text-[10px] font-bold uppercase tracking-wider">{label}</span>
          <Icon className={`h-4 w-4 ${color}`} />
        </div>
        <div className={`text-xl sm:text-2xl font-black font-mono ${color}`}>{value}</div>
        <div className="text-[10px] text-muted-foreground flex items-center gap-1">
          {trend === "up" && <TrendingUp className="h-3 w-3 text-emerald-500" />}
          {trend === "down" && <TrendingDown className="h-3 w-3 text-rose-500" />}
          {sub}
        </div>
      </CardContent>
    </Card>
  );
}

export function IRAContent() {
  const [kpis, setKpis] = useState<IRAKPIs | null>(null);
  const [porFamilia, setPorFamilia] = useState<FamiliaIRA[]>([]);
  const [topImpacto, setTopImpacto] = useState<TopImpacto[]>([]);
  const [causaRaiz, setCausaRaiz] = useState<CausaRaiz[]>([]);
  const [loading, setLoading] = useState(true);

  const loadIRA = useCallback(async () => {
    setLoading(true);
    try {
      const raw = typeof window !== "undefined" ? localStorage.getItem("mro_auth") : null;
      const token = raw ? JSON.parse(raw).token : "";
      const res = await fetch("/api/dashboard/ira", {
        headers: token ? { Authorization: `Bearer ${token}` } : {},
      });
      const data = await res.json();
      if (data.kpis) {
        setKpis(data.kpis);
        setPorFamilia(data.porFamilia2 || []);
        setTopImpacto(data.topImpacto || []);
        setCausaRaiz(data.causaRaiz || []);
      }
    } catch {
      toast.error("Error al cargar datos IRA");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadIRA();
  }, [loadIRA]);

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[30vh]">
        <Loader2 className="animate-spin text-primary" size={36} />
      </div>
    );
  }

  if (!kpis) {
    return (
      <div className="text-center py-12 text-muted-foreground text-sm">
        No se pudieron cargar los datos IRA
      </div>
    );
  }

  const iraColor = kpis.iraSKU >= kpis.metaIRA
    ? "text-emerald-600 dark:text-emerald-400"
    : "text-rose-600 dark:text-rose-400";

  const iraFinColor = kpis.iraFinanciera >= kpis.metaFinanciera
    ? "text-emerald-600 dark:text-emerald-400"
    : "text-rose-600 dark:text-emerald-400";

  const causaData = causaRaiz.map((c) => ({
    name: c.observacion,
    value: c.cantidad,
  }));

  return (
    <div className="space-y-4">
      {/* Header */}
      <div>
        <h2 className="text-lg sm:text-xl font-black tracking-tight flex items-center gap-2">
          <Target className="h-5 w-5 text-primary" />
          IRA — Exactitud de Inventario
        </h2>
        <p className="text-[11px] sm:text-xs text-muted-foreground mt-0.5">
          Indice de Registro de Inventario — Periodo Actual
        </p>
      </div>

      {/* KPI Cards */}
      <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
        <KPICard
          label="IRA SKU"
          value={`${kpis.iraSKU}%`}
          sub={`Meta: ${kpis.metaIRA}%`}
          icon={Target}
          color={iraColor}
          trend={kpis.iraSKU >= kpis.metaIRA ? "up" : "down"}
        />
        <KPICard
          label="IRA Financiera"
          value={`${kpis.iraFinanciera}%`}
          sub={`Meta: ${kpis.metaFinanciera}%`}
          icon={DollarSign}
          color={iraFinColor}
          trend={kpis.iraFinanciera >= kpis.metaFinanciera ? "up" : "down"}
        />
        <KPICard
          label="Descalce Neto"
          value={`S/ ${Math.abs(kpis.descalceNeto).toLocaleString("es-PE", { maximumFractionDigits: 0 })}`}
          sub={kpis.descalceNeto >= 0 ? "Sobrante financiero" : "Faltante financiero"}
          icon={kpis.descalceNeto >= 0 ? TrendingUp : TrendingDown}
          color={kpis.descalceNeto >= 0 ? "text-amber-600" : "text-rose-600"}
        />
        <KPICard
          label="Descalce Unid."
          value={kpis.descalceNetoUnid.toLocaleString("es-PE", { maximumFractionDigits: 0 })}
          sub={`${kpis.descalceBruto.toLocaleString()} abs total`}
          icon={Package}
          color="text-amber-600"
        />
        <KPICard
          label="SKUs Auditados"
          value={`${kpis.porcentajeAuditado}%`}
          sub={`${kpis.totalAuditados} de ${kpis.totalSKU}`}
          icon={BarChart3}
          color="text-indigo-600"
        />
        <KPICard
          label="Con Error"
          value={String(kpis.totalConError)}
          sub={`${kpis.totalFaltantes} falt. / ${kpis.totalSobrantes} sobr.`}
          icon={AlertTriangle}
          color="text-rose-600"
        />
      </div>

      {/* Progress Bar */}
      <Card className="border-border/60 shadow-xs">
        <CardContent className="p-3 sm:p-4 space-y-2">
          <div className="flex items-center justify-between text-xs font-bold">
            <span>Avance de Auditoria</span>
            <span className="text-primary font-mono">{kpis.porcentajeAuditado}%</span>
          </div>
          <Progress value={kpis.porcentajeAuditado} className="h-2.5 rounded-full" />
          <div className="flex items-center justify-between text-[10px] text-muted-foreground font-mono">
            <span>{kpis.totalAuditados} contados</span>
            <span>{kpis.totalSKU} total</span>
          </div>
        </CardContent>
      </Card>

      {/* Charts Row */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-4">
        {/* IRA por Familia2 */}
        <Card className="lg:col-span-2 border-border/60 shadow-xs">
          <CardHeader className="p-3 pb-2">
            <CardTitle className="text-sm font-bold flex items-center gap-2">
              <BarChart3 className="h-4 w-4 text-primary" />
              Exactitud por Familia
            </CardTitle>
            <CardDescription className="text-[11px]">
              Conformes vs Con Error por clasificacion
            </CardDescription>
          </CardHeader>
          <CardContent className="p-2 sm:p-3">
            <div className="h-[250px] w-full">
              <ResponsiveContainer width="100%" height="100%">
                <BarChart
                  data={porFamilia.filter((f) => f.total > 0)}
                  margin={{ top: 5, right: 10, left: -15, bottom: 20 }}
                >
                  <CartesianGrid strokeDasharray="3 3" opacity={0.15} vertical={false} />
                  <XAxis
                    dataKey="familia"
                    tick={{ fontSize: 9 }}
                    angle={-25}
                    textAnchor="end"
                    interval={0}
                    height={40}
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
                  />
                  <Legend wrapperStyle={{ fontSize: "10px" }} />
                  <Bar dataKey="conformes" name="Conformes" fill="#10B981" radius={[3, 3, 0, 0]} />
                  <Bar dataKey="con_error" name="Con Error" fill="#F43F5E" radius={[3, 3, 0, 0]} />
                  <Bar dataKey="pendientes" name="Pendientes" fill="#94A3B8" radius={[3, 3, 0, 0]} />
                </BarChart>
              </ResponsiveContainer>
            </div>
          </CardContent>
        </Card>

        {/* Causa Raiz Donut */}
        <Card className="border-border/60 shadow-xs">
          <CardHeader className="p-3 pb-2">
            <CardTitle className="text-sm font-bold flex items-center gap-2">
              <AlertTriangle className="h-4 w-4 text-amber-500" />
              Causa Raiz
            </CardTitle>
            <CardDescription className="text-[11px]">
              Distribucion por observacion
            </CardDescription>
          </CardHeader>
          <CardContent className="p-2 sm:p-3">
            <div className="h-[220px] w-full flex items-center justify-center">
              <ResponsiveContainer width="100%" height="100%">
                <PieChart>
                  <Pie
                    data={causaData}
                    cx="50%"
                    cy="50%"
                    innerRadius={45}
                    outerRadius={70}
                    paddingAngle={4}
                    dataKey="value"
                  >
                    {causaData.map((entry, index) => (
                      <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
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
                  <Legend wrapperStyle={{ fontSize: "10px" }} />
                </PieChart>
              </ResponsiveContainer>
            </div>
            <div className="space-y-1.5 mt-2">
              {causaRaiz.map((c) => (
                <div key={c.observacion} className="flex items-center justify-between text-[11px]">
                  <div className="flex items-center gap-1.5">
                    {c.observacion === "OK" && <CheckCircle2 className="h-3 w-3 text-emerald-500" />}
                    {c.observacion === "FALTANTE" && <XCircle className="h-3 w-3 text-rose-500" />}
                    {c.observacion === "SOBRANTE" && <AlertTriangle className="h-3 w-3 text-amber-500" />}
                    <span className="font-medium">{c.observacion}</span>
                  </div>
                  <span className="font-mono font-bold">{c.porcentaje}%</span>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Top Impacto Monetario */}
      <Card className="border-border/60 shadow-xs">
        <CardHeader className="p-3 pb-2">
          <CardTitle className="text-sm font-bold flex items-center gap-2">
            <DollarSign className="h-4 w-4 text-amber-500" />
            Top SKUs — Mayor Impacto Monetario
          </CardTitle>
          <CardDescription className="text-[11px]">
            SKUs con mayor discrepancia en valor (S/)
          </CardDescription>
        </CardHeader>
        <CardContent className="p-0">
          <div className="overflow-x-auto">
            <table className="w-full text-xs">
              <thead className="bg-secondary/40 border-b border-border/40">
                <tr>
                  <th className="text-left py-2.5 px-3 font-bold text-muted-foreground uppercase">SKU</th>
                  <th className="text-left py-2.5 px-3 font-bold text-muted-foreground uppercase">Descripcion</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Sis.</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Fis.</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">DIF</th>
                  <th className="text-right py-2.5 px-3 font-bold text-muted-foreground uppercase">Impacto ($)</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-border/30">
                {topImpacto.map((item) => (
                  <tr key={item.producto} className="hover:bg-secondary/20 transition">
                    <td className="py-2 px-3 font-mono font-bold">{item.producto}</td>
                    <td className="py-2 px-3 max-w-[200px] truncate font-medium" title={item.descripcion}>
                      {item.descripcion}
                    </td>
                    <td className="py-2 px-2 text-center font-mono">{item.stock_sistema}</td>
                    <td className="py-2 px-2 text-center font-mono font-bold text-primary">{item.cantidad_fisica}</td>
                    <td className="py-2 px-2 text-center">
                      <span className={`font-mono font-bold px-1.5 py-0.5 rounded text-[11px] ${
                        item.dif > 0
                          ? "bg-amber-500/10 text-amber-600"
                          : "bg-rose-500/10 text-rose-600"
                      }`}>
                        {item.dif > 0 ? `+${item.dif}` : item.dif}
                      </span>
                    </td>
                    <td className="py-2 px-3 text-right font-mono font-bold">
                      <span className={item.impacto_monetario >= 0 ? "text-amber-600" : "text-rose-600"}>
                        {item.impacto_monetario >= 0 ? "+" : ""}S/ {item.impacto_monetario.toLocaleString("es-PE", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>

      {/* Summary by Familia Table */}
      <Card className="border-border/60 shadow-xs">
        <CardHeader className="p-3 pb-2">
          <CardTitle className="text-sm font-bold flex items-center gap-2">
            <Package className="h-4 w-4 text-primary" />
            Resumen por Clasificacion
          </CardTitle>
        </CardHeader>
        <CardContent className="p-0">
          <div className="overflow-x-auto">
            <table className="w-full text-xs">
              <thead className="bg-secondary/40 border-b border-border/40">
                <tr>
                  <th className="text-left py-2.5 px-3 font-bold text-muted-foreground uppercase">Clase</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Total</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Conformes</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Con Error</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">Pendientes</th>
                  <th className="text-center py-2.5 px-2 font-bold text-muted-foreground uppercase">IRA %</th>
                  <th className="text-center py-2.5 px-3 font-bold text-muted-foreground uppercase">Estado</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-border/30">
                {porFamilia.filter((f) => f.total > 0).map((f) => {
                  const auditados = f.total - f.pendientes;
                  const ira = auditados > 0 ? Math.round((f.conformes / auditados) * 1000) / 10 : 0;
                  const status = ira >= 95 ? "OK" : ira >= 90 ? "Revisar" : "Critico";
                  return (
                    <tr key={f.familia} className="hover:bg-secondary/20 transition">
                      <td className="py-2 px-3 font-bold">{f.familia}</td>
                      <td className="py-2 px-2 text-center font-mono">{f.total}</td>
                      <td className="py-2 px-2 text-center font-mono text-emerald-600">{f.conformes}</td>
                      <td className="py-2 px-2 text-center font-mono text-rose-600">{f.con_error}</td>
                      <td className="py-2 px-2 text-center font-mono text-muted-foreground">{f.pendientes}</td>
                      <td className="py-2 px-2 text-center font-mono font-bold">{ira}%</td>
                      <td className="py-2 px-3 text-center">
                        <Badge
                          variant="outline"
                          className={`text-[10px] ${
                            status === "OK"
                              ? "border-emerald-500/40 text-emerald-600"
                              : status === "Revisar"
                                ? "border-amber-500/40 text-amber-600"
                                : "border-rose-500/40 text-rose-600"
                          }`}
                        >
                          {status}
                        </Badge>
                      </td>
                    </tr>
                  );
                })}
              </tbody>
            </table>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
