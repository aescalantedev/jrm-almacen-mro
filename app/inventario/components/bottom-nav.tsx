"use client";

import { Barcode, ClipboardList, Package } from "lucide-react";
import { Badge } from "@/components/ui/badge";

interface BottomNavProps {
  activeTab: string;
  onTabChange: (tab: string) => void;
  registrosCount: number;
  isEditing: boolean;
}

const tabs = [
  { value: "conteo", label: "Conteo", icon: Barcode },
  { value: "registros", label: "Registros", icon: ClipboardList },
  { value: "catalogo", label: "Catálogo", icon: Package },
];

export function BottomNav({ activeTab, onTabChange, registrosCount, isEditing }: BottomNavProps) {
  return (
    <nav className="fixed bottom-0 inset-x-0 z-50 border-t border-border/60 bg-background/95 backdrop-blur-md">
      <div
        className="flex items-center justify-around h-14 max-w-lg mx-auto"
        style={{ paddingBottom: "env(safe-area-inset-bottom, 0px)" }}
      >
        {tabs.map((tab) => {
          const isActive = activeTab === tab.value;
          const Icon = tab.icon;
          return (
            <button
              key={tab.value}
              type="button"
              onClick={() => onTabChange(tab.value)}
              className={`relative flex flex-col items-center justify-center gap-0.5 flex-1 h-full transition-colors ${
                isActive ? "text-primary" : "text-muted-foreground"
              }`}
            >
              <div className="relative">
                <Icon className="h-5 w-5" />
                {tab.value === "conteo" && isEditing && (
                  <span className="absolute -top-1 -right-1 h-2 w-2 rounded-full bg-amber-500 animate-pulse" />
                )}
                {tab.value === "registros" && registrosCount > 0 && (
                  <Badge
                    variant="secondary"
                    className="absolute -top-2 -right-3 px-1 py-0 text-[9px] font-mono min-w-[16px] h-4 justify-center rounded-full"
                  >
                    {registrosCount > 99 ? "99+" : registrosCount}
                  </Badge>
                )}
              </div>
              <span className={`text-[10px] font-semibold ${isActive ? "text-primary" : ""}`}>
                {tab.label}
              </span>
              {isActive && <span className="absolute top-0 h-0.5 w-6 rounded-full bg-primary" />}
            </button>
          );
        })}
      </div>
    </nav>
  );
}
