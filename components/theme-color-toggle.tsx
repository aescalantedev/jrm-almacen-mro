"use client";

import * as React from "react";
import { Check, Palette, Sparkles } from "lucide-react";
import { cn } from "@/lib/utils";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
  DropdownMenuSeparator,
} from "@/components/ui/dropdown-menu";
import { Button } from "@/components/ui/button";

const themes = [
  { 
    name: "SAP Fiori / UI5", 
    value: "sap", 
    color: "bg-[#0070F2]",
    badge: "Enterprise",
    desc: "SAP Horizon Blue"
  },
  { 
    name: "Titanium Slate", 
    value: "slate", 
    color: "bg-neutral-800 dark:bg-neutral-200",
    desc: "Minimalista neutro"
  },
  { 
    name: "Industrial Amber", 
    value: "orange", 
    color: "bg-[#f59e0b]",
    desc: "Maquinaria pesada & MRO"
  },
  { 
    name: "Emerald Precision", 
    value: "green", 
    color: "bg-[#10b981]",
    desc: "Auditoría & Exactitud IRA"
  },
];

export function ThemeColorToggle() {
  const [activeTheme, setActiveTheme] = React.useState<string>("");

  React.useEffect(() => {
    // Sincronizar el estado local con el atributo del DOM (puesto por el servidor o cookie)
    const currentTheme = document.documentElement.getAttribute("data-color-theme") || "";
    setActiveTheme(currentTheme);
  }, []);

  const applyTheme = (themeValue: string) => {
    const root = document.documentElement;
    
    if (themeValue) {
      root.setAttribute("data-color-theme", themeValue);
      // Guardar en cookie para que el servidor lo lea (expira en 1 año)
      document.cookie = `strix-color-theme=${themeValue}; path=/; max-age=31536000`;
    } else {
      root.removeAttribute("data-color-theme");
      document.cookie = `strix-color-theme=; path=/; max-age=0`;
    }

    setActiveTheme(themeValue);
  };

  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button 
          variant="ghost" 
          size="icon" 
          className="rounded-xl h-9 w-9 text-muted-foreground hover:text-foreground hover:bg-secondary/60 transition-colors"
          title="Personalizar Tema y Paleta de Colores"
        >
          <Palette className="h-4 w-4" />
          <span className="sr-only">Cambiar paleta visual</span>
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent align="end" className="w-56 rounded-2xl p-2 z-[100] border-border/60 shadow-xl">
        <div className="flex items-center gap-1.5 px-2 py-1.5 text-[10px] font-bold text-muted-foreground uppercase tracking-wider">
          <Sparkles className="h-3 w-3 text-primary" />
          <span>Paleta Visual del Sistema</span>
        </div>
        <DropdownMenuSeparator className="my-1 bg-border/40" />
        
        {themes.map((theme) => {
          const isSelected = activeTheme === theme.value;
          return (
            <DropdownMenuItem
              key={theme.name}
              className={cn(
                "flex items-center justify-between cursor-pointer rounded-xl px-2.5 py-2 transition-all",
                isSelected ? "bg-primary/10 text-primary font-bold" : "hover:bg-secondary/50"
              )}
              onClick={() => applyTheme(theme.value)}
            >
              <div className="flex items-center gap-2.5 min-w-0">
                <div className={cn("h-3.5 w-3.5 rounded-full shadow-2xs shrink-0 ring-1 ring-border/40", theme.color)} />
                <div className="flex flex-col min-w-0">
                  <div className="flex items-center gap-1.5">
                    <span className="text-xs font-semibold truncate">{theme.name}</span>
                    {theme.badge && (
                      <span className="text-[9px] font-mono font-bold bg-[#0070F2]/10 text-[#0070F2] dark:text-[#38a3ff] px-1.5 py-0.2 rounded-md">
                        {theme.badge}
                      </span>
                    )}
                  </div>
                  <span className="text-[10px] text-muted-foreground/80 font-normal truncate">
                    {theme.desc}
                  </span>
                </div>
              </div>
              {isSelected && (
                <Check className="h-4 w-4 text-primary shrink-0 ml-1" />
              )}
            </DropdownMenuItem>
          );
        })}
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
