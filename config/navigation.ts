import {
  LayoutDashboard,
  ClipboardCheck,
  Package,
  Settings,
  Users,
  History,
  CircleDollarSign,
  Database,
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
      { title: "Datos Maestros", url: "/datos-maestros", icon: Database, roles: ["admin"] },
      { title: "Costos y Precios", url: "/costos", icon: CircleDollarSign, roles: ["admin"] },
      { title: "Usuarios", url: "/users", icon: Users, roles: ["admin"] },
      { title: "Configuración", url: "/settings", icon: Settings },
    ],
  },
];
