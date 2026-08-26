import {
  LayoutDashboard,
  ClipboardCheck,
  RefreshCw,
  Warehouse,
  Package,
  Settings,
  Lock,
  UserCircle,
  UserPlus,
  ShieldCheck,
  Users,
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
    label: "Principal",
    roles: ["admin", "auditor"],
    items: [
      { title: "Dashboard", url: "/dashboard", icon: LayoutDashboard },
    ],
  },
  {
    label: "Operaciones",
    items: [
      { title: "Inventario", url: "/inventario", icon: ClipboardCheck },
      { title: "Productos", url: "/productos", icon: Package, roles: ["admin", "auditor"] },
    ],
  },
  {
    label: "Sistema",
    roles: ["admin"],
    items: [
      {
        title: "Usuarios",
        icon: Users,
        url: "/users",
      },
      {
        title: "Configuración",
        icon: Settings,
        url: "#",
        items: [
          { title: "General", url: "/settings", icon: Settings },
          { title: "Sincronizar Stock", url: "/settings/sync", icon: RefreshCw },
        ]
      },
    ],
  },
];
