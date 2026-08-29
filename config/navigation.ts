import {
  LayoutDashboard,
  ClipboardCheck,
  Package,
  Settings,
  Users,
  History,
  CircleDollarSign,
  Database,
  Building2,
  Warehouse,
  Map,
  Boxes,
  Layers,
  Ruler,
  LucideIcon
} from "lucide-react";

export interface NavItem {
  title: string;
  url: string;
  icon: LucideIcon;
  items?: NavItem[];
  roles?: string[];
}

export interface NavGroup {
  label: string;
  items: NavItem[];
  roles?: string[];
}

export const navigationGroups: NavGroup[] = [
  {
    label: "Operaciones",
    items: [
      { title: "Productos", url: "/productos", icon: Package },
      { title: "Inventario", url: "/inventario", icon: ClipboardCheck },
      { title: "Kardex", url: "/movimientos/kardex", icon: History },
    ],
  },
  {
    label: "Gestión",
    roles: ["admin", "auditor"],
    items: [
      { title: "Dashboard", url: "/dashboard", icon: LayoutDashboard },
      { 
        title: "Datos Maestros", 
        url: "/datos-maestros", 
        icon: Database, 
        roles: ["admin"],
        items: [
          { title: "Locales", url: "/datos-maestros?tab=locales", icon: Building2 },
          { title: "Bodegas", url: "/datos-maestros?tab=bodegas", icon: Warehouse },
          { title: "Zonas", url: "/datos-maestros?tab=zonas", icon: Map },
          { title: "Contenedores", url: "/datos-maestros?tab=contenedores", icon: Boxes },
          { title: "Grupos", url: "/datos-maestros?tab=grupos", icon: Layers },
          { title: "Unidades", url: "/datos-maestros?tab=unidades", icon: Ruler }
        ]
      },
      { title: "Costos y Precios", url: "/costos", icon: CircleDollarSign, roles: ["admin"] },
      { title: "Usuarios", url: "/users", icon: Users, roles: ["admin"] },
      { title: "Configuración", url: "/settings", icon: Settings },
    ],
  },
];
