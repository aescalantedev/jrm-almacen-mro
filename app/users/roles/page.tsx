"use client";

import { useEffect, useState, useCallback } from "react";
import { 
  ShieldCheck, 
  Shield, 
  Plus, 
  Lock,
  ChevronRight,
  Package,
  ClipboardList
} from "lucide-react";

import { 
  Card, 
  CardContent, 
  CardDescription, 
  CardHeader, 
  CardTitle 
} from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { cn } from "@/lib/utils";
import { useAuth } from "../../inventario/hooks/use-auth";
import { toast } from "sonner";

export default function RolesPage() {
  const [users, setUsers] = useState<any[]>([]);
  const { token, user } = useAuth();

  const loadUsers = useCallback(async () => {
    if (!token) return;
    try {
      const res = await fetch('/api/users', {
        headers: { Authorization: `Bearer ${token}` }
      });
      const data = await res.json();
      if (data.users) {
        setUsers(data.users);
      }
    } catch {
      toast.error("Error al cargar usuarios");
    }
  }, [token]);

  useEffect(() => {
    loadUsers();
  }, [loadUsers]);

  if (!user) return null;

  const getCount = (rol: string) => users.filter(u => u.rol === rol).length;

  const roleCards = [
    {
      name: "Admin",
      users: getCount('admin'),
      description: "Acceso total a estadísticas, usuarios y ajustes del sistema.",
      icon: ShieldCheck,
      colorClass: "bg-primary/10 text-primary",
      borderColor: "hover:border-primary/50"
    },
    {
      name: "Auditor",
      users: getCount('auditor'),
      description: "Puede visualizar inventario y dashboards, pero no alterar la configuración global.",
      icon: Shield,
      colorClass: "bg-blue-500/10 text-blue-600 dark:text-blue-400",
      borderColor: "hover:border-blue-500/50"
    },
    {
      name: "Almacenero",
      users: getCount('almacenero'),
      description: "Encargado de operaciones de stock diarias y gestión de lotes.",
      icon: Package,
      colorClass: "bg-emerald-500/10 text-emerald-600 dark:text-emerald-400",
      borderColor: "hover:border-emerald-500/50"
    },
    {
      name: "Contador",
      users: getCount('contador'),
      description: "Realiza inventarios físicos desde la aplicación móvil.",
      icon: ClipboardList,
      colorClass: "bg-slate-500/10 text-slate-600 dark:text-slate-400",
      borderColor: "hover:border-slate-500/50"
    }
  ];

  return (
    <div className="flex flex-col gap-8 w-full animate-in fade-in slide-in-from-bottom-4 duration-1000">
      
      {/* SECTION A: PAGE HEADER */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
        <div className="space-y-1">
          <h1 className="text-3xl font-black tracking-tight bg-gradient-to-br from-foreground to-foreground/70 bg-clip-text text-transparent uppercase">
            Roles de Usuario
          </h1>
          <p className="text-sm text-muted-foreground font-medium">
            Define y administra los niveles de acceso para tu equipo.
          </p>
        </div>
        
        <Button className="rounded-xl shadow-sm h-10 gap-2 bg-primary hover:bg-primary/90 text-primary-foreground text-[10px] font-black uppercase tracking-[0.1em] px-5 transition-all active:scale-95 shrink-0" disabled>
          <Plus className="h-4 w-4" />
          Crear Nuevo Rol
        </Button>
      </div>

      {/* SECTION B: ROLES GRID */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        {roleCards.map((role) => (
          <Card 
            key={role.name} 
            className={cn(
              "group border-border/40 shadow-sm rounded-2xl overflow-hidden transition-all duration-300 bg-card/50 backdrop-blur-sm",
              role.borderColor,
              "hover:shadow-xl hover:shadow-primary/5 hover:-translate-y-1"
            )}
          >
            <CardHeader className="pb-4">
              <div className="flex items-center justify-between mb-4">
                 <div className={cn("p-2.5 rounded-xl transition-colors", role.colorClass)}>
                    <role.icon className="h-6 w-6" />
                 </div>
                 <Badge variant="outline" className="rounded-lg text-[10px] font-black uppercase tracking-tighter border-border/50 px-2 py-0.5">
                   {role.users} Usuarios
                 </Badge>
              </div>
              <CardTitle className="text-lg font-black uppercase tracking-tight group-hover:text-primary transition-colors">
                {role.name}
              </CardTitle>
              <CardDescription className="text-xs font-medium leading-relaxed min-h-[40px] line-clamp-2">
                {role.description}
              </CardDescription>
            </CardHeader>
            
            <CardContent className="p-0">
               <div className="px-6 py-4 border-t border-border/30 flex items-center justify-between group-hover:bg-secondary/20 transition-colors">
                 <span className="text-[10px] font-black text-muted-foreground uppercase tracking-widest flex items-center gap-2">
                   <Lock className="h-3 w-3" />
                   Nivel Base
                 </span>
                 <Button variant="ghost" size="sm" className="h-8 gap-1 text-[10px] font-black uppercase tracking-widest hover:text-primary" onClick={() => window.location.href = '/users'}>
                   Ver Usuarios <ChevronRight className="h-3 w-3" />
                 </Button>
               </div>
            </CardContent>
          </Card>
        ))}
      </div>

      {/* SECTION C: ROLE INSIGHTS (EXTRA TOUCH) */}
      <div className="mt-4 p-6 rounded-2xl bg-secondary/10 border border-border/30 flex flex-col md:flex-row md:items-center gap-6">
         <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center shrink-0">
            <ShieldCheck className="h-6 w-6 text-primary" />
         </div>
         <div className="flex-1 space-y-1">
            <h4 className="text-sm font-black uppercase tracking-tight">Security Hardening active</h4>
            <p className="text-xs text-muted-foreground font-medium">Your current role distribution follows industry best practices. We recommend keeping the number of Administrators below 5 for security reasons.</p>
         </div>
         <Button variant="ghost" className="text-[10px] font-black uppercase tracking-widest text-primary hover:bg-primary/5 rounded-lg px-4 gap-2">
            Security Audit
            <ChevronRight className="h-3 w-3" />
         </Button>
      </div>
    </div>
  );
}
