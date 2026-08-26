import {
  LayoutDashboard,
  ClipboardCheck,
  RefreshCw,
  Package,
  Settings,
  Users,
  History,
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
      { title: "Usuarios", url: "/users", icon: Users, roles: ["admin"] },
      { title: "Sincronizar Stock", url: "/settings/sync", icon: RefreshCw, roles: ["admin"] },
      { title: "Configuración", url: "/settings", icon: Settings },
    ],
  },
];
