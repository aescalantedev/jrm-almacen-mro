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
}

export interface NavGroup {
  label: string;
  items: NavItem[];
}

export const navigationGroups: NavGroup[] = [
  {
    label: "Principal",
    items: [
      { title: "Dashboard", url: "/dashboard", icon: LayoutDashboard },
    ],
  },
  {
    label: "Operaciones",
    items: [
      { title: "Inventario", url: "/inventario", icon: ClipboardCheck },
      { title: "Productos", url: "/productos", icon: Package },
      { title: "Sincronizar Stock", url: "/sync", icon: RefreshCw },
    ],
  },
  {
    label: "Sistema",
    items: [
      {
        title: "Usuarios",
        icon: Users,
        url: "#",
        items: [
          { title: "Lista", url: "/users", icon: Users },
          { title: "Roles", url: "/users/roles", icon: ShieldCheck },
          { title: "Agregar", url: "/users/add", icon: UserPlus },
        ]
      },
      { title: "Configuracion", url: "/settings", icon: Settings },
    ],
  },
];
