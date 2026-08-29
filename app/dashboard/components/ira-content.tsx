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
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";

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

const CustomTooltip = ({ active, payload, label }: any) => {
  if (active && payload && payload.length) {
    return (
      <div className="bg-popover text-popover-foreground border border-border/50 shadow-md rounded-xl p-3 flex flex-col gap-1 z-50">
        <span className="text-[10px] font-bold uppercase tracking-wider opacity-70">
          {label || payload[0].payload.name || payload[0].name}
        </span>
        {payload.map((entry: any, index: number) => (
          <span key={index} className="font-black font-mono text-sm" style={{ color: entry.color }}>
            {entry.name}: {entry.value.toLocaleString()}
          </span>
        ))}
      </div>
    );
  }
  return null;
};

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
                  <Tooltip content={<CustomTooltip />} cursor={{fill: 'transparent'}} />
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
                  <Tooltip content={<CustomTooltip />} />
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
          <div className="overflow-x-auto rounded-xl border border-border/50 m-3">
            <Table>
              <TableHeader className="bg-secondary/30">
                <TableRow className="hover:bg-transparent border-border/50">
                  <TableHead className="font-black text-[10px] uppercase tracking-widest text-primary">SKU</TableHead>
                  <TableHead className="font-black text-[10px] uppercase tracking-widest">Descripcion</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">Sis.</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">Fis.</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">DIF</TableHead>
                  <TableHead className="text-right font-black text-[10px] uppercase tracking-widest">Impacto ($)</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {topImpacto.map((item, i) => (
                  <TableRow key={item.producto} className={`h-12 border-border/30 hover:bg-muted/50 ${i % 2 === 1 ? 'bg-secondary/10' : ''}`}>
                    <TableCell className="font-black text-xs">{item.producto}</TableCell>
                    <TableCell className="max-w-[200px] truncate text-xs font-medium" title={item.descripcion}>
                      {item.descripcion}
                    </TableCell>
                    <TableCell className="text-center text-xs font-mono">{item.stock_sistema}</TableCell>
                    <TableCell className="text-center text-xs font-mono font-bold text-primary">{item.cantidad_fisica}</TableCell>
                    <TableCell className="text-center">
                      <Badge variant="outline" className={`font-mono font-black text-[10px] border-none shadow-none ${
                        item.dif > 0
                          ? "bg-amber-500/10 text-amber-600"
                          : "bg-rose-500/10 text-rose-600"
                      }`}>
                        {item.dif > 0 ? `+${item.dif}` : item.dif}
                      </Badge>
                    </TableCell>
                    <TableCell className="text-right text-xs font-mono font-black">
                      <span className={item.impacto_monetario >= 0 ? "text-amber-600" : "text-rose-600"}>
                        {item.impacto_monetario >= 0 ? "+" : ""}S/ {item.impacto_monetario.toLocaleString("es-PE", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}
                      </span>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
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
          <div className="overflow-x-auto rounded-xl border border-border/50 m-3">
            <Table>
              <TableHeader className="bg-secondary/30">
                <TableRow className="hover:bg-transparent border-border/50">
                  <TableHead className="font-black text-[10px] uppercase tracking-widest text-primary">Clase</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">Total</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">Conformes</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">Con Error</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">Pendientes</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">IRA %</TableHead>
                  <TableHead className="text-center font-black text-[10px] uppercase tracking-widest">Estado</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {porFamilia.filter((f) => f.total > 0).map((f, i) => {
                  const auditados = f.total - f.pendientes;
                  const ira = auditados > 0 ? Math.round((f.conformes / auditados) * 1000) / 10 : 0;
                  const status = ira >= 95 ? "OK" : ira >= 90 ? "Revisar" : "Critico";
                  return (
                    <TableRow key={f.familia} className={`h-12 border-border/30 hover:bg-muted/50 ${i % 2 === 1 ? 'bg-secondary/10' : ''}`}>
                      <TableCell className="font-black text-xs">{f.familia}</TableCell>
                      <TableCell className="text-center text-xs font-mono">{f.total}</TableCell>
                      <TableCell className="text-center text-xs font-mono text-emerald-600">{f.conformes}</TableCell>
                      <TableCell className="text-center text-xs font-mono text-rose-600">{f.con_error}</TableCell>
                      <TableCell className="text-center text-xs font-mono text-muted-foreground">{f.pendientes}</TableCell>
                      <TableCell className="text-center text-xs font-mono font-black">{ira}%</TableCell>
                      <TableCell className="text-center">
                        <Badge
                          variant="outline"
                          className={`text-[10px] uppercase tracking-wider font-black shadow-none border-none ${
                            status === "OK"
                              ? "bg-emerald-500/10 text-emerald-600"
                              : status === "Revisar"
                                ? "bg-amber-500/10 text-amber-600"
                                : "bg-rose-500/10 text-rose-600"
                          }`}
                        >
                          {status}
                        </Badge>
                      </TableCell>
                    </TableRow>
                  );
                })}
              </TableBody>
            </Table>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
