"use client";

import { usePathname, useSearchParams } from "next/navigation";
import {
  Sun,
  Moon,
  ClipboardCheck,
  ArrowDownCircle,
  ArrowUpCircle,
  History,
  LayoutDashboard,
  Package,
  Users,
  Settings,
  RefreshCw,
  Warehouse,
  CircleDollarSign,
  Database,
  LucideIcon,
  LogOut,
  User,
} from "lucide-react";
import { useTheme } from "@teispace/next-themes";
import { SidebarTrigger } from "@/components/ui/sidebar";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";
import { ThemeColorToggle } from "@/components/theme-color-toggle";
import { useAuth } from "@/app/inventario/hooks/use-auth";

interface RouteInfo {
  title: string;
  subtitle?: string;
  badge?: string;
  icon: LucideIcon;
}

const ROUTE_CONFIG: Record<string, RouteInfo> = {
  "/productos": {
    title: "Productos",
    subtitle: "Catálogo general y operaciones",
    badge: "2,755 SKUs",
    icon: Package,
  },
  "/inventario": {
    title: "Inventario",
    subtitle: "Conteo físico en bodega",
    badge: "ALM MRO CHILCA",
    icon: ClipboardCheck,
  },
  "/movimientos/kardex": {
    title: "Kardex",
    subtitle: "Historial y auditoría de movimientos",
    badge: "ALM MRO CHILCA",
    icon: History,
  },
  "/movimientos/ingreso": {
    title: "Ingreso",
    subtitle: "Compras y recepciones",
    badge: "+ ENTRADA",
    icon: ArrowDownCircle,
  },
  "/movimientos/salida": {
    title: "Despacho",
    subtitle: "Despachos a OT y mantenimiento",
    badge: "- SALIDA",
    icon: ArrowUpCircle,
  },
  "/movimientos": {
    title: "Movimientos",
    subtitle: "Control de inventario",
    icon: History,
  },
  "/dashboard": {
    title: "Dashboard",
    subtitle: "Métricas ejecutivas y control de existencias",
    badge: "ALM MRO CHILCA",
    icon: LayoutDashboard,
  },
  "/datos-maestros": {
    title: "Datos Maestros",
    subtitle: "Parametrización MM / WM",
    badge: "SAP MM",
    icon: Database,
  },
  "/costos": {
    title: "Costos",
    subtitle: "Mantenimiento de precios",
    badge: "ADMIN",
    icon: CircleDollarSign,
  },
  "/users": {
    title: "Usuarios",
    subtitle: "Cuentas y roles del personal",
    icon: Users,
  },
  "/settings": {
    title: "Configuración",
    subtitle: "Ajustes del sistema",
    icon: Settings,
  },
};

export function AppTopbar() {
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const { setTheme, theme } = useTheme();
  const { user, logout } = useAuth();

  let pageInfo: RouteInfo = ROUTE_CONFIG[pathname] || {
    title: "MRO Inventario",
    subtitle: "ALM MRO CHILCA",
    icon: Warehouse,
  };

  if (pathname === "/datos-maestros") {
    const tab = searchParams.get("tab");
    if (tab === "locales") pageInfo = { ...pageInfo, title: "Datos Maestros > Locales" };
    if (tab === "bodegas") pageInfo = { ...pageInfo, title: "Datos Maestros > Bodegas" };
    if (tab === "zonas") pageInfo = { ...pageInfo, title: "Datos Maestros > Zonas" };
    if (tab === "contenedores") pageInfo = { ...pageInfo, title: "Datos Maestros > Estructuras" };
    if (tab === "grupos") pageInfo = { ...pageInfo, title: "Datos Maestros > Grupos" };
    if (tab === "unidades") pageInfo = { ...pageInfo, title: "Datos Maestros > Unidades" };
    if (tab === "almacenamiento") pageInfo = { ...pageInfo, title: "Datos Maestros > Formatos" };
  }

  const PageIcon = pageInfo.icon;

  return (
    <header className="sticky top-0 z-40 w-full border-b border-border/40 bg-background/80 backdrop-blur-xl supports-[backdrop-filter]:bg-background/60">
      <div className="flex h-16 items-center gap-3 px-4 sm:px-6 lg:px-8">
        <SidebarTrigger className="hover:bg-secondary/80 rounded-lg shrink-0 md:hidden" />
        <div className="h-6 w-[1px] bg-border/50 hidden sm:block md:hidden shrink-0" />

        {/* TÍTULO DINÁMICO DE LA PÁGINA EN EL NAVBAR */}
        <div className="flex items-center gap-2.5 min-w-0 flex-1">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-primary/10 text-primary border border-primary/20 shrink-0">
            <PageIcon className="h-4.5 w-4.5" />
          </div>
          <div className="min-w-0">
            <div className="flex items-center gap-2">
              <h1 className="text-sm sm:text-base font-bold tracking-tight text-foreground truncate">
                {pageInfo.title}
              </h1>
              {pageInfo.badge && (
                <Badge
                  variant="outline"
                  className="text-[10px] font-bold py-0 h-4 shrink-0 hidden sm:inline-flex bg-secondary/30"
                >
                  {pageInfo.badge}
                </Badge>
              )}
            </div>
            {pageInfo.subtitle && (
              <p className="text-[11px] text-muted-foreground truncate hidden md:block leading-none mt-0.5">
                {pageInfo.subtitle}
              </p>
            )}
          </div>
        </div>

        {/* ACCIONES DE LA DERECHA */}
        <div className="ml-auto flex items-center gap-1.5 sm:gap-2 shrink-0">
          <ThemeColorToggle />

          <Button
            variant="ghost"
            size="icon"
            className="rounded-full h-9 w-9"
            onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
            title="Cambiar tema claro/oscuro"
          >
            <Sun className="h-4.5 w-4.5 text-muted-foreground rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
            <Moon className="absolute h-4.5 w-4.5 text-muted-foreground rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100" />
            <span className="sr-only">Cambiar tema</span>
          </Button>

          {/* DROPDOWN AVATAR USUARIO */}
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <Button
                variant="ghost"
                className="relative h-9 w-9 rounded-full p-0 overflow-hidden ring-offset-background transition-all hover:ring-2 hover:ring-primary/20 cursor-pointer"
              >
                <Avatar className="h-9 w-9 border border-border/60">
                  <AvatarFallback
                    className="bg-primary/10 text-primary text-xs font-bold"
                    suppressHydrationWarning
                  >
                    {user?.nombre
                      ?.split(" ")
                      .map((n: string) => n[0])
                      .join("")
                      .slice(0, 2)
                      .toUpperCase() || "U"}
                  </AvatarFallback>
                </Avatar>
              </Button>
            </DropdownMenuTrigger>
            <DropdownMenuContent
              className="w-56 mt-2 rounded-2xl shadow-xl border-border/60 p-1.5 z-50"
              align="end"
            >
              <DropdownMenuLabel className="font-normal p-2">
                <div className="flex flex-col space-y-1">
                  <p
                    className="text-sm font-bold leading-none text-foreground"
                    suppressHydrationWarning
                  >
                    {user?.nombre || "Usuario"}
                  </p>
                  <p
                    className="text-xs leading-none text-muted-foreground capitalize"
                    suppressHydrationWarning
                  >
                    {user?.rol || "almacenero"} — ALM MRO CHILCA
                  </p>
                </div>
              </DropdownMenuLabel>
              <DropdownMenuSeparator />
              <DropdownMenuItem
                onClick={() => (window.location.href = "/settings")}
                className="cursor-pointer rounded-xl text-xs gap-2 py-2"
              >
                <User className="h-3.5 w-3.5 text-muted-foreground" />
                Mi Perfil
              </DropdownMenuItem>
              <DropdownMenuItem
                onClick={() => (window.location.href = "/settings")}
                className="cursor-pointer rounded-xl text-xs gap-2 py-2"
              >
                <Settings className="h-3.5 w-3.5 text-muted-foreground" />
                Configuración
              </DropdownMenuItem>
              <DropdownMenuSeparator />
              <DropdownMenuItem
                onClick={logout}
                className="cursor-pointer rounded-xl text-xs gap-2 py-2 text-rose-500 focus:text-rose-500 focus:bg-rose-50/10"
              >
                <LogOut className="h-3.5 w-3.5 text-rose-500" />
                Cerrar Sesión
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </div>
    </header>
  );
}
