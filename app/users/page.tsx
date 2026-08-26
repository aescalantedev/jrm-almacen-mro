"use client";

import * as React from "react";
import { 
  Search, 
  UserMinus, 
  ChevronLeft, 
  ChevronRight,
  Filter,
  AlertTriangle
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
import { cn } from "@/lib/utils";

import { useAuth } from "../inventario/hooks/use-auth";
import { toast } from "sonner";

export default function UserListPage() {
  const [searchTerm, setSearchTerm] = React.useState("");
  const [selectedUsers, setSelectedUsers] = React.useState<number[]>([]);
  const [users, setUsers] = React.useState<any[]>([]);
  const [loading, setLoading] = React.useState(true);

  const { user, token } = useAuth();

  const loadUsers = React.useCallback(async () => {
    if (!token) return;
    try {
      const res = await fetch('/api/users', {
        headers: { Authorization: `Bearer ${token}` }
      });
      const data = await res.json();
      if (data.users) {
        setUsers(data.users);
      }
    } catch (e) {
      toast.error("Error al cargar usuarios");
    } finally {
      setLoading(false);
    }
  }, [token]);

  React.useEffect(() => {
    loadUsers();
  }, [loadUsers]);

  if (!user) return null;

  if (user.rol !== 'admin') {
    return (
      <div className="flex flex-col items-center justify-center min-h-[50vh] space-y-4">
        <AlertTriangle className="h-12 w-12 text-rose-500" />
        <h2 className="text-xl font-bold">Acceso Denegado</h2>
        <p className="text-muted-foreground">No tienes permisos para ver usuarios.</p>
        <Button onClick={() => window.location.href = '/inventario'}>Ir a Inventario</Button>
      </div>
    );
  }

  // Filtrado de usuarios
  const filteredUsers = users.filter(u => 
    u.nombre.toLowerCase().includes(searchTerm.toLowerCase()) ||
    u.usuario.toLowerCase().includes(searchTerm.toLowerCase())
  );

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
    if (!token) return;
    try {
      const res = await fetch(`/api/users?id=${id}`, {
        method: 'DELETE',
        headers: { Authorization: `Bearer ${token}` }
      });
      if (res.ok) {
        toast.success("Usuario suspendido");
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
    <div className="flex flex-col gap-8 w-full animate-in fade-in slide-in-from-bottom-4 duration-1000">
      
      {/* SECTION A: PAGE HEADER */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-6">
        <div className="space-y-1">
          <h1 className="text-3xl font-black tracking-tight bg-gradient-to-br from-foreground to-foreground/70 bg-clip-text text-transparent uppercase">
            User Management
          </h1>
          <p className="text-sm text-muted-foreground font-medium">
            Manage your workspace members and their access levels.
          </p>
        </div>
        
        <div className="flex items-center gap-3">
          <div className="relative group w-full md:w-64">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground group-focus-within:text-primary transition-colors" />
            <Input 
              placeholder="Search users..." 
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10 h-10 rounded-xl border-border/50 bg-secondary/20 focus-visible:ring-primary/20 transition-all"
            />
          </div>
          
          {selectedUsers.length > 0 && (
            <Button variant="destructive" className="rounded-xl h-10 px-4 animate-in zoom-in-95 duration-200 font-bold text-xs">
               Delete ({selectedUsers.length})
            </Button>
          )}

          <Button variant="outline" className="rounded-xl border-border/50 h-10 gap-2 text-[10px] font-black uppercase tracking-widest px-4">
             <Filter className="h-3.5 w-3.5" />
             Filters
          </Button>
        </div>
      </div>

      {/* SECTION B: DATA TABLE PRO */}
      <div className="rounded-2xl border border-border/40 bg-card shadow-sm overflow-hidden">
        <Table>
          <TableHeader className="bg-secondary/30">
            <TableRow className="hover:bg-transparent border-border/50">
              <TableHead className="w-[50px] px-6">
                 <Checkbox 
                   checked={isAllSelected}
                   onCheckedChange={toggleSelectAll}
                   className="rounded-sm border-muted-foreground/30" 
                 />
              </TableHead>
              <TableHead className="font-black text-[10px] uppercase tracking-widest py-4">User</TableHead>
              <TableHead className="font-black text-[10px] uppercase tracking-widest">Role</TableHead>
              <TableHead className="font-black text-[10px] uppercase tracking-widest">Status</TableHead>
              <TableHead className="font-black text-[10px] uppercase tracking-widest">Created At</TableHead>
              <TableHead className="text-right px-6"></TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {filteredUsers.map((u) => (
              <TableRow 
                key={u.id} 
                className={cn(
                  "hover:bg-muted/50 transition-colors border-border/30 group",
                  selectedUsers.includes(u.id) && "bg-primary/5 hover:bg-primary/10"
                )}
              >
                <TableCell className="px-6">
                   <Checkbox 
                     checked={selectedUsers.includes(u.id)}
                     onCheckedChange={() => toggleSelectUser(u.id)}
                     className="rounded-sm border-muted-foreground/30" 
                   />
                </TableCell>
                <TableCell className="py-4">
                  <div className="flex items-center gap-4">
                    <Avatar className="h-10 w-10 border border-border/50 ring-2 ring-transparent group-hover:ring-primary/20 transition-all">
                      <AvatarImage src={`https://api.dicebear.com/7.x/initials/svg?seed=${u.nombre}`} />
                      <AvatarFallback className="bg-primary/5 text-primary text-xs font-black">
                        {u.nombre.substring(0, 2).toUpperCase()}
                      </AvatarFallback>
                    </Avatar>
                    <div className="flex flex-col">
                      <span className="font-black text-sm tracking-tight">{u.nombre}</span>
                      <span className="text-[11px] text-muted-foreground font-medium">{u.usuario}</span>
                    </div>
                  </div>
                </TableCell>
                <TableCell>
                  <Select value={u.rol} onValueChange={(val) => updateUserField(u.id, { rol: val })}>
                    <SelectTrigger className={cn(
                      "h-6 rounded-lg px-2 text-[10px] font-black uppercase tracking-tighter border-none shadow-none focus:ring-0",
                      u.rol === "admin" && "bg-primary/10 text-primary",
                      u.rol === "auditor" && "bg-blue-500/10 text-blue-600",
                      u.rol === "almacenero" && "bg-emerald-500/10 text-emerald-600",
                      u.rol === "contador" && "bg-slate-500/10 text-slate-600 dark:text-slate-400"
                    )}>
                      <SelectValue />
                    </SelectTrigger>
                    <SelectContent className="border-border/50 shadow-xl rounded-xl z-[100]">
                      <SelectItem value="admin" className="text-xs font-bold rounded-lg cursor-pointer">Admin</SelectItem>
                      <SelectItem value="auditor" className="text-xs font-bold rounded-lg cursor-pointer">Auditor</SelectItem>
                      <SelectItem value="almacenero" className="text-xs font-bold rounded-lg cursor-pointer">Almacenero</SelectItem>
                      <SelectItem value="contador" className="text-xs font-bold rounded-lg cursor-pointer">Contador</SelectItem>
                    </SelectContent>
                  </Select>
                </TableCell>
                <TableCell>
                  <div className="flex items-center gap-2">
                    <Switch 
                      checked={u.activo === 1}
                      onCheckedChange={(val) => updateUserField(u.id, { activo: val ? 1 : 0 })}
                      className="data-[state=checked]:bg-emerald-500 h-5 w-9 scale-75"
                    />
                    <span className={cn(
                      "text-[10px] font-bold uppercase tracking-wider",
                      u.activo === 1 ? "text-foreground" : "text-muted-foreground"
                    )}>
                      {u.activo === 1 ? "Active" : "Inactive"}
                    </span>
                  </div>
                </TableCell>
                <TableCell>
                  <span className="text-[11px] font-bold text-muted-foreground uppercase opacity-70 tracking-tight">
                    {new Date(u.created_at).toLocaleDateString()}
                  </span>
                </TableCell>
                <TableCell className="text-right px-6">
                  <Button variant="ghost" size="icon" className="h-8 w-8 text-rose-500 hover:bg-rose-500/10 hover:text-rose-600 rounded-full" onClick={() => deleteUser(u.id)}>
                    <UserMinus className="h-4 w-4" />
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </div>

      {/* SECTION C: PAGINATION */}
      <div className="flex flex-col md:flex-row items-center justify-between gap-4 px-2">
        <p className="text-[10px] font-black text-muted-foreground uppercase tracking-[0.2em] opacity-50">
          Showing {filteredUsers.length} of {users.length} system users
        </p>
        <div className="flex items-center gap-2">
          <Button 
            variant="outline" 
            size="sm" 
            className="rounded-xl border-border/50 h-9 px-4 gap-1 text-[10px] font-black uppercase tracking-widest disabled:opacity-30"
            disabled
          >
            <ChevronLeft className="h-3 w-3" />
            Prev
          </Button>
          <div className="flex items-center gap-1 mx-2">
             <div className="h-8 w-8 rounded-lg bg-primary flex items-center justify-center text-primary-foreground text-[10px] font-black shadow-sm">1</div>
          </div>
          <Button 
            variant="outline" 
            size="sm" 
            className="rounded-xl border-border/50 h-9 px-4 gap-1 text-[10px] font-black uppercase tracking-widest disabled:opacity-30"
            disabled
          >
            Next
            <ChevronRight className="h-3 w-3" />
          </Button>
        </div>
      </div>
    </div>
  );
}
