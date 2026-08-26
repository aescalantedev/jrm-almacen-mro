"use client";

import React, { useState, useEffect, useCallback } from "react";
import { Wrench, RefreshCw, HardHat, ShieldCheck, Clock } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";

interface MaintenanceScreenProps {
  message?: string;
  onResolved?: () => void;
}

export function MaintenanceScreen({ message, onResolved }: MaintenanceScreenProps) {
  const [countdown, setCountdown] = useState(8);
  const [checking, setChecking] = useState(false);

  const checkStatus = useCallback(async () => {
    setChecking(true);
    try {
      const res = await fetch("/api/system/maintenance", {
        cache: "no-store",
      });
      if (res.ok) {
        const data = await res.json();
        if (!data.inMaintenance) {
          if (onResolved) {
            onResolved();
          } else {
            window.location.reload();
          }
          return;
        }
      }
    } catch {
      // Server might be restarting (502 / network error)
    } finally {
      setChecking(false);
      setCountdown(8);
    }
  }, [onResolved]);

  useEffect(() => {
    const timer = setInterval(() => {
      setCountdown((prev) => {
        if (prev <= 1) {
          checkStatus();
          return 8;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, [checkStatus]);

  return (
    <div className="fixed inset-0 z-[99999] flex items-center justify-center bg-background/98 backdrop-blur-xl p-4 sm:p-6 select-none animate-in fade-in duration-300">
      <Card className="w-full max-w-md border-border/60 shadow-2xl bg-card/90 overflow-hidden relative">
        {/* Top Warning Strip */}
        <div className="h-2 w-full bg-gradient-to-r from-amber-500 via-orange-500 to-amber-500 animate-pulse" />

        <CardContent className="p-6 sm:p-8 text-center space-y-6">
          {/* Animated Icon */}
          <div className="relative mx-auto w-20 h-20 flex items-center justify-center">
            <div className="absolute inset-0 rounded-3xl bg-amber-500/15 border-2 border-amber-500/30 animate-pulse" />
            <div className="relative z-10 flex items-center justify-center">
              <HardHat className="h-10 w-10 text-amber-500" />
            </div>
            <div className="absolute -bottom-1 -right-1 p-1.5 rounded-full bg-background border border-amber-500/40 shadow-sm">
              <Wrench className="h-4 w-4 text-amber-600 dark:text-amber-400 animate-spin" style={{ animationDuration: '4s' }} />
            </div>
          </div>

          {/* Heading */}
          <div className="space-y-1.5">
            <span className="text-[11px] font-mono font-bold tracking-widest text-amber-600 dark:text-amber-400 uppercase bg-amber-500/10 border border-amber-500/20 px-3 py-0.5 rounded-full">
              Bodega ALM MRO CHILCA
            </span>
            <h2 className="text-xl sm:text-2xl font-black tracking-tight text-foreground pt-1">
              Actualización en Progreso
            </h2>
            <p className="text-xs sm:text-sm text-muted-foreground leading-relaxed pt-1">
              {message || "Estamos aplicando mejoras en el sistema de inventario. Por favor espera unos momentos mientras se completa la instalación."}
            </p>
          </div>

          {/* Auto Refresh Indicator */}
          <div className="p-3.5 rounded-2xl bg-secondary/30 border border-border/50 space-y-2">
            <div className="flex items-center justify-between text-xs text-muted-foreground">
              <span className="flex items-center gap-1.5 font-medium">
                <Clock className="h-3.5 w-3.5 text-primary" /> Auto-reconexión
              </span>
              <span className="font-mono font-bold text-foreground">
                en {countdown}s
              </span>
            </div>
            <div className="w-full bg-secondary rounded-full h-1.5 overflow-hidden">
              <div
                className="bg-primary h-full transition-all duration-1000 ease-linear rounded-full"
                style={{ width: `${((8 - countdown) / 8) * 100}%` }}
              />
            </div>
          </div>

          {/* Action Button */}
          <Button
            type="button"
            onClick={checkStatus}
            disabled={checking}
            className="w-full h-11 text-xs font-bold gap-2 rounded-xl shadow-md"
          >
            <RefreshCw className={`h-4 w-4 ${checking ? "animate-spin" : ""}`} />
            {checking ? "Comprobando servidor..." : "Comprobar Conexión Ahora"}
          </Button>

          {/* Security / Safe Data Note */}
          <div className="flex items-center justify-center gap-1.5 text-[11px] text-muted-foreground/80">
            <ShieldCheck className="h-3.5 w-3.5 text-emerald-500" />
            <span>Tus datos y registros están seguros en la base de datos</span>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
