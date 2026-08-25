"use client";

import { useState, useEffect, useCallback } from "react";
import { toast } from "sonner";
import {
  RefreshCw,
  Database,
  CheckCircle2,
  XCircle,
  Loader2,
  Clock,
  ArrowUpDown,
  Layers,
  History
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Switch } from "@/components/ui/switch";
import { Label } from "@/components/ui/label";

interface SyncLogEntry {
  id: number;
  tipo: string;
  registros_sync: number;
  fecha: string;
  estado: string;
  detalle: string;
}

export default function SyncPage() {
  const [syncing, setSyncing] = useState(false);
  const [logs, setLogs] = useState<SyncLogEntry[]>([]);
  const [lastSync, setLastSync] = useState<SyncLogEntry | null>(null);
  const [loading, setLoading] = useState(true);
  const [autoSync, setAutoSync] = useState(true);

  const loadSyncInfo = useCallback(async () => {
    try {
      const raw = localStorage.getItem("mro_auth");
      const token = raw ? JSON.parse(raw).token : "";
      const res = await fetch("/api/sync", {
        headers: { Authorization: `Bearer ${token}` }
      });
      const data = await res.json();
      setLogs(data.log || []);
      setLastSync(data.lastSync || null);
    } catch {
      toast.error("Error al cargar información de sincronización");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    loadSyncInfo();
  }, [loadSyncInfo]);

  useEffect(() => {
    if (!autoSync) return;
    const interval = setInterval(() => {
      handleSync(false);
    }, 3 * 60 * 1000);
    return () => clearInterval(interval);
  }, [autoSync]);

  const handleSync = async (showToast = true) => {
    setSyncing(true);
    try {
      const raw = localStorage.getItem("mro_auth");
      const token = raw ? JSON.parse(raw).token : "";
      const res = await fetch("/api/sync", {
        method: "POST",
        headers: { Authorization: `Bearer ${token}` }
      });
      const data = await res.json();
      if (data.success) {
        if (showToast) {
          const nuevos = data.nuevos ? `, ${data.nuevos} nuevos pendientes` : "";
          toast.success(`Sincronización completada: ${data.registros} registros actualizados${nuevos}`);
        }
        loadSyncInfo();
      } else {
        if (showToast) {
          toast.error(`Error al sincronizar: ${data.error}`);
        }
      }
    } catch (err: unknown) {
      if (showToast) {
        toast.error(`Error de conexión: ${err instanceof Error ? err.message : String(err)}`);
      }
    } finally {
      setSyncing(false);
    }
  };

  return (
    <div className="w-full space-y-6">
      {/* Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold tracking-tight text-foreground flex items-center gap-2">
            <RefreshCw className="h-6 w-6 text-primary" />
            Sincronización de Stock
          </h1>
          <p className="text-sm text-muted-foreground mt-1">
            Actualización de existencias e inventario desde SQL Server (Flexline — ALM MRO CHILCA)
          </p>
        </div>
        <div className="flex items-center gap-2">
          <Badge variant="outline" className="px-3 py-1.5 gap-1.5 text-xs font-semibold bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 border-emerald-500/20">
            <span className="h-2 w-2 rounded-full bg-emerald-500 animate-pulse" />
            Servicio Flexline Activo
          </Badge>
        </div>
      </div>

      {/* Control Panel Grid */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
        {/* Main Sync Trigger Card */}
        <Card className="md:col-span-2 border-border/60 shadow-xs">
          <CardHeader className="pb-3">
            <CardTitle className="text-base font-bold flex items-center gap-2">
              <Database className="h-4 w-4 text-primary" />
              Sincronización en Demanda
            </CardTitle>
            <CardDescription className="text-xs">
              Descarga y actualiza inmediatamente la tabla local de stock con la base de datos central.
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-3 p-3.5 bg-secondary/30 rounded-xl border border-border/40">
              <div className="flex items-center gap-3">
                <div className="h-10 w-10 rounded-xl bg-primary/10 flex items-center justify-center shrink-0">
                  <ArrowUpDown className="h-5 w-5 text-primary" />
                </div>
                <div>
                  <div className="text-xs text-muted-foreground font-medium">Última sincronización exitosa</div>
                  <div className="text-sm font-bold text-foreground">
                    {lastSync
                      ? new Date(lastSync.fecha).toLocaleString("es-PE", {
                          dateStyle: "medium",
                          timeStyle: "short",
                          timeZone: "America/Lima",
                        })
                      : "Sin registros previos"}
                  </div>
                </div>
              </div>
              <Button
                onClick={() => handleSync(true)}
                disabled={syncing}
                size="lg"
                className="w-full sm:w-auto font-bold h-11 px-6 shadow-sm"
              >
                {syncing ? (
                  <>
                    <Loader2 className="animate-spin mr-2 h-4 w-4" />
                    Sincronizando...
                  </>
                ) : (
                  <>
                    <RefreshCw className="mr-2 h-4 w-4" />
                    Sincronizar Ahora
                  </>
                )}
              </Button>
            </div>
          </CardContent>
        </Card>

        {/* Auto Sync Toggle Card */}
        <Card className="border-border/60 shadow-xs flex flex-col justify-between">
          <CardHeader className="pb-3">
            <CardTitle className="text-base font-bold flex items-center gap-2">
              <Clock className="h-4 w-4 text-primary" />
              Sync Automático
            </CardTitle>
            <CardDescription className="text-xs">
              Mantiene los datos actualizados periódicamente en segundo plano.
            </CardDescription>
          </CardHeader>
          <CardContent className="pt-0">
            <div className="flex items-center justify-between p-3.5 bg-secondary/30 rounded-xl border border-border/40">
              <div className="space-y-0.5">
                <Label htmlFor="auto-sync-switch" className="text-xs font-bold cursor-pointer">
                  Intervalo cada 3 min
                </Label>
                <div className="text-[11px] text-muted-foreground">
                  {autoSync ? "Activo en segundo plano" : "Desactivado"}
                </div>
              </div>
              <Switch
                id="auto-sync-switch"
                checked={autoSync}
                onCheckedChange={setAutoSync}
              />
            </div>
          </CardContent>
        </Card>
      </div>

      {/* History Card (Responsive: Table on Desktop, Cards on Mobile) */}
      <Card className="border-border/60 shadow-xs">
        <CardHeader className="pb-3 flex flex-row items-center justify-between">
          <div>
            <CardTitle className="text-base font-bold flex items-center gap-2">
              <History className="h-4 w-4 text-primary" />
              Historial de Sincronizaciones
            </CardTitle>
            <CardDescription className="text-xs">
              Registro de las últimas ejecuciones manuales y automáticas
            </CardDescription>
          </div>
          <Badge variant="secondary" className="font-mono text-xs">
            {logs.length} eventos
          </Badge>
        </CardHeader>
        <CardContent className="p-0">
          {loading ? (
            <div className="py-12 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
              <Loader2 className="animate-spin h-6 w-6 text-primary" />
              <span className="text-xs">Cargando registros...</span>
            </div>
          ) : logs.length === 0 ? (
            <div className="py-12 text-center text-muted-foreground flex flex-col items-center justify-center gap-2">
              <Layers className="h-8 w-8 opacity-30" />
              <span className="text-xs">No hay historial de sincronizaciones registrado</span>
            </div>
          ) : (
            <>
              {/* Mobile View: Cards (< 768px) */}
              <div className="md:hidden divide-y divide-border/40">
                {logs.map((log) => (
                  <div key={log.id} className="p-3.5 space-y-2 hover:bg-secondary/20 transition">
                    <div className="flex items-center justify-between">
                      <div className="flex items-center gap-1.5">
                        {log.estado === "ok" ? (
                          <Badge className="bg-emerald-500/10 text-emerald-600 dark:text-emerald-400 border-emerald-500/20 text-[11px] gap-1 py-0.5">
                            <CheckCircle2 className="h-3 w-3" />
                            Exitoso
                          </Badge>
                        ) : (
                          <Badge variant="destructive" className="text-[11px] gap-1 py-0.5">
                            <XCircle className="h-3 w-3" />
                            Error
                          </Badge>
                        )}
                        <Badge variant="outline" className="text-[10px] uppercase font-mono">
                          {log.tipo}
                        </Badge>
                      </div>
                      <span className="text-[11px] text-muted-foreground">
                        {new Date(log.fecha).toLocaleTimeString("es-PE", { hour: "2-digit", minute: "2-digit", timeZone: "America/Lima" })}
                      </span>
                    </div>

                    <div className="flex items-center justify-between text-xs">
                      <span className="text-muted-foreground font-medium">Registros procesados:</span>
                      <span className="font-mono font-bold text-foreground bg-secondary/80 px-2 py-0.5 rounded">
                        {log.registros_sync}
                      </span>
                    </div>

                    <div className="text-xs text-muted-foreground bg-secondary/20 p-2 rounded-lg break-all">
                      {log.detalle || "Sin detalle adicional"}
                    </div>

                    <div className="text-[10px] text-muted-foreground text-right">
                      {new Date(log.fecha).toLocaleDateString("es-PE", { dateStyle: "medium", timeZone: "America/Lima" })}
                    </div>
                  </div>
                ))}
              </div>

              {/* Desktop View: Full Width Table (>= 768px) */}
              <div className="hidden md:block overflow-x-auto">
                <table className="w-full text-xs">
                  <thead className="bg-secondary/50 border-b border-border/50">
                    <tr>
                      <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Fecha y Hora</th>
                      <th className="text-center py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Tipo</th>
                      <th className="text-center py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Registros</th>
                      <th className="text-center py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Estado</th>
                      <th className="text-left py-3 px-4 font-bold text-muted-foreground uppercase tracking-wider">Detalle del Proceso</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-border/30">
                    {logs.map((log) => (
                      <tr key={log.id} className="hover:bg-secondary/20 transition">
                        <td className="py-2.5 px-4 font-medium text-foreground whitespace-nowrap">
                          {new Date(log.fecha).toLocaleString("es-PE", { timeZone: "America/Lima" })}
                        </td>
                        <td className="py-2.5 px-4 text-center">
                          <Badge variant="outline" className="text-[10px] uppercase font-mono">
                            {log.tipo}
                          </Badge>
                        </td>
                        <td className="py-2.5 px-4 text-center font-mono font-bold text-sm">
                          {log.registros_sync}
                        </td>
                        <td className="py-2.5 px-4 text-center">
                          {log.estado === "ok" ? (
                            <span className="inline-flex items-center gap-1 text-emerald-600 dark:text-emerald-400 font-semibold">
                              <CheckCircle2 size={15} /> OK
                            </span>
                          ) : (
                            <span className="inline-flex items-center gap-1 text-red-600 dark:text-red-400 font-semibold">
                              <XCircle size={15} /> Error
                            </span>
                          )}
                        </td>
                        <td className="py-2.5 px-4 text-muted-foreground">
                          {log.detalle}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
