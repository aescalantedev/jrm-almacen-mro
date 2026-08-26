"use client";

import { useState } from "react";
import { 
  User, 
  Settings, 
  ShieldCheck, 
  AtSign,
  Package,
  KeyRound,
  LogOut
} from "lucide-react";

import { 
  Avatar, 
  AvatarFallback, 
  AvatarImage 
} from "@/components/ui/avatar";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Separator } from "@/components/ui/separator";
import { Badge } from "@/components/ui/badge";
import { cn } from "@/lib/utils";

import { useAuth } from "../inventario/hooks/use-auth";

const sidebarNavItems = [
  { title: "Perfil", icon: User },
  { title: "Cuenta", icon: Settings },
];

export default function SettingsProfilePage() {
  const { user, logout } = useAuth();
  const [activeTab, setActiveTab] = useState("Perfil");

  if (!user) return null;

  return (
    <div className="p-6 md:p-10 space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-700 pb-20">
      
      {/* PAGE HEADER */}
      <div className="space-y-1">
        <h1 className="text-3xl font-black tracking-tight text-foreground uppercase">Configuración</h1>
        <p className="text-sm text-muted-foreground font-medium">
          Administra los datos de tu cuenta personal y seguridad.
        </p>
      </div>

      <Separator className="bg-border/50" />

      <div className="flex flex-col space-y-8 lg:flex-row lg:space-x-12 lg:space-y-0">
        
        {/* LEFT NAV BAR */}
        <aside className="lg:w-1/5 shrink-0">
          <nav className="flex flex-col space-y-1">
            {sidebarNavItems.map((item) => (
              <Button
                key={item.title}
                variant="ghost"
                onClick={() => setActiveTab(item.title)}
                className={cn(
                  "justify-start h-10 px-4 rounded-xl font-bold text-xs uppercase tracking-widest transition-all",
                  activeTab === item.title 
                    ? "bg-primary/10 text-primary hover:bg-primary/15 hover:text-primary" 
                    : "text-muted-foreground hover:bg-muted hover:text-foreground"
                )}
              >
                <item.icon className="mr-3 h-4 w-4" />
                {item.title}
              </Button>
            ))}
          </nav>
        </aside>

        {/* TAB CONTENT */}
        {activeTab === "Perfil" ? (
          <div className="flex-1 lg:max-w-2xl space-y-8 animate-in fade-in slide-in-from-right-4 duration-300">
            <div>
              <h2 className="text-lg font-black uppercase tracking-tight">Perfil de Usuario</h2>
              <p className="text-sm text-muted-foreground font-medium mt-1">
                Esta es tu información personal y nivel de acceso dentro de la plataforma MRO.
              </p>
            </div>
            
            <Separator className="bg-border/50" />

            <div className="space-y-10">
              {/* AVATAR SECTION */}
              <div className="space-y-4">
                <Label className="text-[10px] font-black uppercase tracking-[0.2em] text-muted-foreground/60 ml-1">Foto de Perfil</Label>
                <div className="flex items-center gap-6 p-6 rounded-2xl bg-secondary/10 border border-border/50 border-dashed">
                  <Avatar className="h-20 w-20 border-2 border-background shadow-xl">
                    <AvatarImage src={`https://api.dicebear.com/7.x/initials/svg?seed=${user.nombre}`} />
                    <AvatarFallback className="bg-primary/5 text-primary font-black text-xl">
                      {user.nombre.substring(0, 2).toUpperCase()}
                    </AvatarFallback>
                  </Avatar>
                  <div className="flex flex-col gap-2">
                    <Badge className={cn(
                      "rounded-lg px-3 py-1 w-fit text-[10px] font-black uppercase tracking-tighter border-none shadow-none",
                      user.rol === "admin" && "bg-primary/10 text-primary",
                      user.rol === "auditor" && "bg-blue-500/10 text-blue-600",
                      user.rol === "almacenero" && "bg-emerald-500/10 text-emerald-600",
                      user.rol === "contador" && "bg-slate-500/10 text-slate-600 dark:text-slate-400"
                    )}>
                      {user.rol === "admin" && <ShieldCheck className="w-3 h-3 mr-1 inline-block" />}
                      {user.rol === "almacenero" && <Package className="w-3 h-3 mr-1 inline-block" />}
                      Rol: {user.rol}
                    </Badge>
                    <p className="text-[10px] text-muted-foreground font-medium uppercase tracking-tighter mt-1">El rol y permisos de acceso son asignados por el administrador.</p>
                  </div>
                </div>
              </div>

              {/* FORM FIELDS */}
              <div className="grid gap-6">
                <div className="grid gap-2">
                  <Label htmlFor="nombre" className="text-[10px] font-black uppercase tracking-[0.2em] text-muted-foreground/60 ml-1 flex items-center gap-2">
                    <User className="h-3 w-3" /> Nombre Completo
                  </Label>
                  <Input
                    id="nombre"
                    value={user.nombre}
                    readOnly
                    className="h-11 rounded-xl border-border bg-muted focus-visible:ring-primary/20 transition-all font-medium"
                  />
                  <p className="text-[10px] text-muted-foreground font-medium uppercase tracking-tight ml-1">
                    Tu nombre registrado en el sistema.
                  </p>
                </div>

                <div className="grid gap-2">
                  <Label htmlFor="usuario" className="text-[10px] font-black uppercase tracking-[0.2em] text-muted-foreground/60 ml-1 flex items-center gap-2">
                    <AtSign className="h-3 w-3" /> Nombre de Usuario
                  </Label>
                  <Input
                    id="usuario"
                    value={user.usuario}
                    readOnly
                    className="h-11 rounded-xl border-border bg-muted font-medium"
                  />
                  <p className="text-[10px] text-muted-foreground font-medium uppercase tracking-tight ml-1">
                    Este es tu identificador único para iniciar sesión en la aplicación.
                  </p>
                </div>
              </div>
            </div>
          </div>
        ) : (
          <div className="flex-1 lg:max-w-2xl space-y-8 animate-in fade-in slide-in-from-right-4 duration-300">
            <div>
              <h2 className="text-lg font-black uppercase tracking-tight">Seguridad de la Cuenta</h2>
              <p className="text-sm text-muted-foreground font-medium mt-1">
                Administra la seguridad de tu sesión y actualiza tus credenciales.
              </p>
            </div>
            
            <Separator className="bg-border/50" />

            <div className="space-y-10">
              
              <div className="grid gap-6">
                <div className="grid gap-2">
                  <Label htmlFor="old-password" className="text-[10px] font-black uppercase tracking-[0.2em] text-muted-foreground/60 ml-1 flex items-center gap-2">
                    <KeyRound className="h-3 w-3" /> Contraseña Actual
                  </Label>
                  <Input
                    id="old-password"
                    type="password"
                    placeholder="••••••••"
                    className="h-11 rounded-xl border-border bg-background focus-visible:ring-primary/20 transition-all font-medium"
                  />
                </div>

                <div className="grid gap-2">
                  <Label htmlFor="new-password" className="text-[10px] font-black uppercase tracking-[0.2em] text-muted-foreground/60 ml-1 flex items-center gap-2">
                    <KeyRound className="h-3 w-3 text-primary" /> Nueva Contraseña
                  </Label>
                  <Input
                    id="new-password"
                    type="password"
                    placeholder="••••••••"
                    className="h-11 rounded-xl border-border bg-background focus-visible:ring-primary/20 transition-all font-medium"
                  />
                </div>
                
                <div className="pt-2">
                  <Button className="h-11 px-8 rounded-xl bg-primary text-primary-foreground font-black uppercase tracking-widest text-[10px] transition-all active:scale-95">
                    Actualizar Contraseña
                  </Button>
                </div>
              </div>

              <Separator className="bg-border/50" />
              
              <div className="space-y-4">
                <Label className="text-[10px] font-black uppercase tracking-[0.2em] text-destructive ml-1 flex items-center gap-2">
                  Sesión Activa
                </Label>
                <div className="flex flex-col sm:flex-row gap-4 items-start sm:items-center justify-between p-6 rounded-2xl bg-secondary/10 border border-border/50">
                  <div className="space-y-1">
                    <p className="text-sm font-bold">Cerrar Sesión</p>
                    <p className="text-[11px] text-muted-foreground font-medium">Finaliza tu sesión de forma segura en este dispositivo.</p>
                  </div>
                  <Button 
                    variant="outline"
                    onClick={() => logout()}
                    className="h-11 px-6 rounded-xl border-destructive/20 text-destructive hover:bg-destructive/5 hover:text-destructive font-black uppercase tracking-widest text-[10px]"
                  >
                    <LogOut className="h-3.5 w-3.5 mr-2" />
                    Cerrar Sesión
                  </Button>
                </div>
              </div>

            </div>
          </div>
        )}

      </div>
    </div>
  );
}
