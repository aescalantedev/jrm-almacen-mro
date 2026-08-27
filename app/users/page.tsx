"use client";

import * as React from "react";
import { 
  Search, 
  UserMinus, 
  Filter,
  AlertTriangle,
  Users,
  ShieldCheck,
  Package,
  Plus,
  Loader2,
  CheckCircle2,
} from "lucide-react";

import { 
  Table, 
  TableBody, 
  TableCell, 
  TableHead, 
  TableHeader, 
  TableRow 
} from "@/components/ui/table";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent } from "@/components/ui/card";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Checkbox } from "@/components/ui/checkbox";
import { Switch } from "@/components/ui/switch";
import { Badge } from "@/components/ui/badge";
import { TableLoadMore } from "@/components/ui/table-load-more";
import { cn } from "@/lib/utils";

import { useAuth } from "../inventario/hooks/use-auth";
import { toast } from "sonner";

export default function UserListPage() {
  const [searchTerm, setSearchTerm] = React.useState("");
  const [selectedUsers, setSelectedUsers] = React.useState<number[]>([]);
  const [users, setUsers] = React.useState<any[]>([]);
  const [loading, setLoading] = React.useState(true);

  // Progressive 50 en 50 State
  const [displayCount, setDisplayCount] = React.useState(50);

  const { user, token, logout } = useAuth();

  const loadUsers = React.useCallback(async () => {
    if (!token) return;
    try {
      const res = await fetch('/api/users', {
        headers: { Authorization: `Bearer ${token}` }
      });
      if (res.status === 401) {
        toast.error("Sesión expirada o no autorizada");
        logout();
        return;
      }
      const data = await res.json();
      if (data.users) {
        setUsers(data.users);
      }
    } catch (e) {
      toast.error("Error al cargar usuarios");
    } finally {
      setLoading(false);
    }
  }, [token, logout]);

  React.useEffect(() => {
    loadUsers();
  }, [loadUsers]);

  if (!user) return null;

  if (user.rol !== 'admin') {
    return (
      <div className="flex flex-col items-center justify-center min-h-[50vh] space-y-4">
        <AlertTriangle className="h-12 w-12 text-rose-500" />
        <h2 className="text-xl font-bold">Acceso Denegado</h2>
        <p className="text-muted-foreground text-sm">No tienes permisos para ver o administrar usuarios.</p>
        <Button onClick={() => window.location.href = '/inventario'} className="rounded-xl font-bold">Ir a Inventario</Button>
      </div>
    );
  }

  // Filtrado de usuarios
  const filteredUsers = users.filter(u => 
    u.nombre.toLowerCase().includes(searchTerm.toLowerCase()) ||
    u.usuario.toLowerCase().includes(searchTerm.toLowerCase())
  );

  // Paginación Progresiva (50 en 50)
  const total = filteredUsers.length;
  const paginatedUsers = filteredUsers.slice(0, displayCount);

  const handleLoadMore = () => {
    setDisplayCount((prev) => prev + 50);
  };

  // Lógica de Selección Masiva
  const isAllSelected = filteredUsers.length > 0 && selectedUsers.length === filteredUsers.length;
  
  const toggleSelectAll = () => {
    if (isAllSelected) {
      setSelectedUsers([]);
    } else {
      setSelectedUsers(filteredUsers.map(u => u.id));
    }
  };

  const deleteUser = async (id: number) => {
    if (!token || !confirm("¿Seguro que deseas desactivar este usuario?")) return;
    try {
      const res = await fetch(`/api/users?id=${id}`, {
        method: 'DELETE',
        headers: { Authorization: `Bearer ${token}` }
      });
      if (res.ok) {
        toast.success("Usuario desactivado");
        loadUsers();
      } else {
        const d = await res.json();
        toast.error(d.error || "Error al suspender");
      }
    } catch {
      toast.error("Error de conexión");
    }
  };

  const updateUserField = async (id: number, updates: any) => {
    if (!token) return;
    try {
      const res = await fetch(`/api/users`, {
        method: 'PUT',
        headers: { 
          'Content-Type': 'application/json',
          Authorization: `Bearer ${token}` 
        },
        body: JSON.stringify({ id, ...updates })
      });
      if (res.ok) {
        toast.success("Usuario actualizado");
        loadUsers();
      } else {
        const d = await res.json();
        toast.error(d.error || "Error al actualizar");
      }
    } catch {
      toast.error("Error de conexión");
    }
  };

  const toggleSelectUser = (userId: number) => {
    setSelectedUsers(prev => 
      prev.includes(userId) 
        ? prev.filter(id => id !== userId) 
        : [...prev, userId]
    );
  };

  return (
    <div className="flex flex-col gap-4 w-full animate-in fade-in duration-300 pb-12">
      {/* TOOLBAR */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-3 bg-card p-3 rounded-2xl border border-border/60 shadow-xs">
        <div className="relative flex-1 sm:max-w-md">
          <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
          <Input 
            placeholder="Buscar por nombre o nombre de usuario..." 
            value={searchTerm}
            onChange={(e) => {
              setSearchTerm(e.target.value);
              setDisplayCount(50);
            }}
            className="pl-10 h-10 rounded-xl bg-background text-xs border-border/60"
          />
        </div>
        
        <div className="flex items-center gap-2">
          {selectedUsers.length > 0 && (
            <Button variant="destructive" size="sm" className="rounded-xl h-10 px-4 font-bold text-xs">
               Desactivar ({selectedUsers.length})
            </Button>
          )}
        </div>
      </div>

      {/* DATA TABLE PRO ESTANDARIZADA */}
      <Card className="border-border/60 shadow-xs overflow-hidden">
        <CardContent className="p-0">
          {loading ? (
            <div className="p-12 text-center text-muted-foreground">
              <Loader2 className="h-7 w-7 animate-spin mx-auto mb-2 text-primary" />
              <p className="text-xs font-semibold">Cargando directorio de usuarios...</p>
            </div>
          ) : filteredUsers.length === 0 ? (
            <div className="p-12 text-center space-y-2">
              <Users className="h-10 w-10 text-muted-foreground/40 mx-auto" />
              <p className="text-sm font-semibold text-foreground">No se encontraron usuarios</p>
              <p className="text-xs text-muted-foreground">Prueba con otro término de búsqueda</p>
            </div>
          ) : (
            <>
              {/* VISTA MÓVIL (CARDS INTERACTIVAS) */}
              <div className="block sm:hidden divide-y divide-border/40">
                {paginatedUsers.map((u) => (
                  <div key={u.id} className="p-3.5 space-y-3 hover:bg-secondary/20 transition-colors">
                    <div className="flex items-center justify-between gap-2">
                      <div className="flex items-center gap-3 min-w-0">
                        <Avatar className="h-10 w-10 border border-border/50 shrink-0">
                          <AvatarImage src={`https://api.dicebear.com/7.x/initials/svg?seed=${u.nombre}`} />
                          <AvatarFallback className="bg-primary/10 text-primary text-xs font-bold">
                            {u.nombre.substring(0, 2).toUpperCase()}
                          </AvatarFallback>
                        </Avatar>
                        <div className="min-w-0">
                          <div className="font-bold text-xs text-foreground truncate">{u.nombre}</div>
                          <div className="text-[11px] font-mono text-muted-foreground truncate">{u.usuario}</div>
                        </div>
                      </div>

                      <div className="flex items-center gap-2 shrink-0">
                        <Switch 
                          checked={u.activo === 1}
                          onCheckedChange={(val) => updateUserField(u.id, { activo: val ? 1 : 0 })}
                          className="data-[state=checked]:bg-emerald-600 scale-90"
                        />
                      </div>
                    </div>

                    <div className="flex items-center justify-between pt-1 text-xs">
                      <Select value={u.rol} onValueChange={(val) => updateUserField(u.id, { rol: val })}>
                        <SelectTrigger className={cn(
                          "h-7 rounded-lg px-2.5 text-[10px] font-bold uppercase tracking-wider border-none shadow-none",
                          u.rol === "admin" && "bg-primary/10 text-primary",
                          u.rol === "auditor" && "bg-blue-500/10 text-blue-600",
                          u.rol === "almacenero" && "bg-emerald-500/10 text-emerald-600",
                          u.rol === "contador" && "bg-slate-500/10 text-slate-600 dark:text-slate-400"
                        )}>
                          <SelectValue />
                        </SelectTrigger>
                        <SelectContent className="rounded-xl z-[100]">
                          <SelectItem value="admin" className="text-xs font-bold">Admin</SelectItem>
                          <SelectItem value="auditor" className="text-xs font-bold">Auditor</SelectItem>
                          <SelectItem value="almacenero" className="text-xs font-bold">Almacenero</SelectItem>
                          <SelectItem value="contador" className="text-xs font-bold">Contador</SelectItem>
                        </SelectContent>
                      </Select>

                      <Button 
                        variant="ghost" 
                        size="icon" 
                        className="h-7 w-7 text-rose-500 hover:bg-rose-500/10 hover:text-rose-600 rounded-lg" 
                        onClick={() => deleteUser(u.id)}
                        title="Desactivar usuario"
                      >
                        <UserMinus className="h-4 w-4" />
                      </Button>
                    </div>
                  </div>
                ))}
              </div>

              {/* VISTA DESKTOP (TABLA CORPORATIVA) */}
              <div className="hidden sm:block overflow-x-auto">
                <Table>
                  <TableHeader className="bg-secondary/30">
                    <TableRow className="border-border/50">
                      <TableHead className="w-[50px] px-4">
                        <Checkbox 
                          checked={isAllSelected}
                          onCheckedChange={toggleSelectAll}
                          className="rounded-sm border-muted-foreground/30" 
                        />
                      </TableHead>
                      <TableHead className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground py-3 px-4">
                        Usuario / Personal
                      </TableHead>
                      <TableHead className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground px-3">
                        Rol Asignado
                      </TableHead>
                      <TableHead className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground px-3 text-center">
                        Estado
                      </TableHead>
                      <TableHead className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground px-3">
                        Fecha Alta
                      </TableHead>
                      <TableHead className="text-[10px] font-bold uppercase tracking-wider text-muted-foreground px-4 text-center">
                        Acciones
                      </TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody className="divide-y divide-border/40 font-medium">
                    {paginatedUsers.map((u) => (
                      <TableRow 
                        key={u.id} 
                        className={cn(
                          "hover:bg-secondary/20 transition-colors border-border/30",
                          selectedUsers.includes(u.id) && "bg-primary/5 hover:bg-primary/10"
                        )}
                      >
                        <TableCell className="px-4">
                          <Checkbox 
                            checked={selectedUsers.includes(u.id)}
                            onCheckedChange={() => toggleSelectUser(u.id)}
                            className="rounded-sm border-muted-foreground/30" 
                          />
                        </TableCell>
                        <TableCell className="py-2.5 px-4">
                          <div className="flex items-center gap-3">
                            <Avatar className="h-9 w-9 border border-border/50 shrink-0">
                              <AvatarImage src={`https://api.dicebear.com/7.x/initials/svg?seed=${u.nombre}`} />
                              <AvatarFallback className="bg-primary/10 text-primary text-xs font-bold">
                                {u.nombre.substring(0, 2).toUpperCase()}
                              </AvatarFallback>
                            </Avatar>
                            <div className="flex flex-col min-w-0">
                              <span className="font-bold text-xs text-foreground truncate">{u.nombre}</span>
                              <span className="text-[11px] font-mono text-muted-foreground font-medium truncate">{u.usuario}</span>
                            </div>
                          </div>
                        </TableCell>
                        <TableCell className="px-3">
                          <Select value={u.rol} onValueChange={(val) => updateUserField(u.id, { rol: val })}>
                            <SelectTrigger className={cn(
                              "h-7 rounded-lg px-2.5 text-[10px] font-bold uppercase tracking-wider border-none shadow-none focus:ring-0 w-32",
                              u.rol === "admin" && "bg-primary/10 text-primary",
                              u.rol === "auditor" && "bg-blue-500/10 text-blue-600",
                              u.rol === "almacenero" && "bg-emerald-500/10 text-emerald-600",
                              u.rol === "contador" && "bg-slate-500/10 text-slate-600 dark:text-slate-400"
                            )}>
                              <SelectValue />
                            </SelectTrigger>
                            <SelectContent className="rounded-xl z-[100]">
                              <SelectItem value="admin" className="text-xs font-bold">Admin</SelectItem>
                              <SelectItem value="auditor" className="text-xs font-bold">Auditor</SelectItem>
                              <SelectItem value="almacenero" className="text-xs font-bold">Almacenero</SelectItem>
                              <SelectItem value="contador" className="text-xs font-bold">Contador</SelectItem>
                            </SelectContent>
                          </Select>
                        </TableCell>
                        <TableCell className="px-3 text-center">
                          <div className="flex items-center justify-center gap-2">
                            <Switch 
                              checked={u.activo === 1}
                              onCheckedChange={(val) => updateUserField(u.id, { activo: val ? 1 : 0 })}
                              className="data-[state=checked]:bg-emerald-600 scale-75"
                            />
                            <span className={cn(
                              "text-[10px] font-bold uppercase tracking-wider",
                              u.activo === 1 ? "text-emerald-600 dark:text-emerald-400" : "text-muted-foreground"
                            )}>
                              {u.activo === 1 ? "Activo" : "Inactivo"}
                            </span>
                          </div>
                        </TableCell>
                        <TableCell className="px-3 font-mono text-[11px] text-muted-foreground">
                          {new Date(u.created_at).toLocaleDateString()}
                        </TableCell>
                        <TableCell className="text-center px-4">
                          <Button 
                            variant="ghost" 
                            size="icon" 
                            className="h-7 w-7 text-rose-500 hover:bg-rose-500/10 hover:text-rose-600 rounded-lg" 
                            onClick={() => deleteUser(u.id)}
                            title="Desactivar usuario"
                          >
                            <UserMinus className="h-3.5 w-3.5" />
                          </Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>

              {/* PIE DE TABLA UNIFICADO (CARGAR 50 MÁS) */}
              <TableLoadMore
                currentCount={paginatedUsers.length}
                totalCount={total}
                hasMore={paginatedUsers.length < total}
                loadingMore={false}
                onLoadMore={handleLoadMore}
                itemName="usuarios"
              />
            </>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
