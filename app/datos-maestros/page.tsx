"use client";

import * as React from "react";
import {
  Database,
  Search,
  Plus,
  Edit3,
  Trash2,
  Package,
  Layers,
  Ruler,
  Warehouse,
  Boxes,
  Loader2,
  AlertTriangle,
  CheckCircle2,
  X,
  Building2,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogFooter,
} from "@/components/ui/dialog";
import { useAuth } from "@/app/inventario/hooks/use-auth";
import { toast } from "sonner";

interface Bodega {
  id: number;
  codigo: string;
  nombre: string;
  empresa_codigo: string;
  direccion: string;
  total_contenedores: number;
  total_materiales: number;
}

interface GrupoArticulo {
  id: number;
  codigo: string;
  nombre: string;
  descripcion: string;
  total_materiales: number;
}

interface UnidadMedida {
  codigo_unidad: string;
  codigo_sap: string;
  nombre: string;
  simbolo: string;
  permite_decimales: number;
  total_materiales: number;
}

interface Contenedor {
  id: number;
  bodega_id?: number;
  bodega_nombre?: string;
  bodega_codigo?: string;
  codigo_contenedor: string;
  nombre: string;
  zona: string;
  descripcion: string;
  total_materiales: number;
}

interface TipoAlmacenamiento {
  id: number;
  codigo: string;
  nombre: string;
  descripcion: string;
  total_materiales: number;
}

type TabType = "bodegas" | "grupos" | "unidades" | "contenedores" | "almacenamiento";

export default function DatosMaestrosPage() {
  const { user, token } = useAuth();
  const [activeTab, setActiveTab] = React.useState<TabType>("bodegas");
  const [loading, setLoading] = React.useState(true);

  // Data State
  const [bodegas, setBodegas] = React.useState<Bodega[]>([]);
  const [grupos, setGrupos] = React.useState<GrupoArticulo[]>([]);
  const [unidades, setUnidades] = React.useState<UnidadMedida[]>([]);
  const [contenedores, setContenedores] = React.useState<Contenedor[]>([]);
  const [tiposAlmacenamiento, setTiposAlmacenamiento] = React.useState<TipoAlmacenamiento[]>([]);

  // Search Filter
  const [searchTerm, setSearchTerm] = React.useState("");

  // Modal State
  const [modalOpen, setModalOpen] = React.useState(false);
  const [modalMode, setModalMode] = React.useState<"create" | "edit">("create");
  const [modalEntity, setModalEntity] = React.useState<TabType>("bodegas");
  const [formData, setFormData] = React.useState<Record<string, any>>({});
  const [saving, setSaving] = React.useState(false);

  // Fetch Master Data
  const fetchData = React.useCallback(async () => {
    if (!token) return;
    setLoading(true);
    try {
      const res = await fetch("/api/maestros", {
        headers: { Authorization: `Bearer ${token}` },
      });

      if (res.status === 401 || res.status === 403) {
        toast.error("Acceso restringido a administradores");
        return;
      }

      const data = await res.json();
      if (data) {
        setBodegas(data.bodegas || []);
        setGrupos(data.grupos || []);
        setUnidades(data.unidades || []);
        setContenedores(data.contenedores || []);
        setTiposAlmacenamiento(data.tiposAlmacenamiento || []);
      }
    } catch {
      toast.error("Error al cargar datos maestros");
    } finally {
      setLoading(false);
    }
  }, [token]);

  React.useEffect(() => {
    fetchData();
  }, [fetchData]);

  // Open Modal Helpers
  const handleOpenCreate = (entity: TabType) => {
    setModalEntity(entity);
    setModalMode("create");
    setFormData(entity === "contenedores" ? { bodega_id: bodegas[0]?.id || 1 } : {});
    setModalOpen(true);
  };

  const handleOpenEdit = (entity: TabType, item: any) => {
    setModalEntity(entity);
    setModalMode("edit");
    setFormData({ ...item });
    setModalOpen(true);
  };

  // Submit Modal
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!token) return;

    setSaving(true);
    try {
      const entityMap: Record<TabType, string> = {
        bodegas: "bodegas",
        grupos: "grupos_articulos",
        unidades: "unidades_medida",
        contenedores: "contenedores",
        almacenamiento: "tipos_almacenamiento",
      };

      const res = await fetch("/api/maestros", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          entity: entityMap[modalEntity],
          action: modalMode === "create" ? "create" : "update",
          data: formData,
        }),
      });

      const result = await res.json();
      if (!res.ok) throw new Error(result.error || "Error al procesar solicitud");

      toast.success(result.message || "Operación completada con éxito");
      setModalOpen(false);
      fetchData();
    } catch (err: any) {
      toast.error(err.message || "Error al guardar");
    } finally {
      setSaving(false);
    }
  };

  // Delete / Deactivate
  const handleDelete = async (entity: TabType, id: any) => {
    if (!token || !confirm("¿Estás seguro de desactivar este registro maestro?")) return;

    try {
      const entityMap: Record<TabType, string> = {
        bodegas: "bodegas",
        grupos: "grupos_articulos",
        unidades: "unidades_medida",
        contenedores: "contenedores",
        almacenamiento: "tipos_almacenamiento",
      };

      const res = await fetch("/api/maestros", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          Authorization: `Bearer ${token}`,
        },
        body: JSON.stringify({
          entity: entityMap[entity],
          action: "delete",
          data: { id, codigo_unidad: id },
        }),
      });

      const result = await res.json();
      if (!res.ok) throw new Error(result.error || "Error al desactivar");

      toast.success(result.message || "Registro desactivado");
      fetchData();
    } catch (err: any) {
      toast.error(err.message || "Error al procesar eliminación");
    }
  };

  // Restrict to Admin
  if (user && user.rol !== "admin" && user.rol !== "superadmin") {
    return (
      <div className="flex flex-col items-center justify-center min-h-[60vh] space-y-4 text-center p-6">
        <div className="p-4 rounded-3xl bg-rose-500/10 border border-rose-500/20 text-rose-500">
          <AlertTriangle className="h-12 w-12" />
        </div>
        <div className="space-y-1">
          <h2 className="text-xl font-bold">Acceso Restringido</h2>
          <p className="text-sm text-muted-foreground max-w-sm">
            Solo administradores tienen privilegios para parametrizar datos maestros SAP.
          </p>
        </div>
      </div>
    );
  }

  // Filter Data according to Search
  const q = searchTerm.toLowerCase();
  const filteredBodegas = bodegas.filter(
    (b) => b.codigo.toLowerCase().includes(q) || b.nombre.toLowerCase().includes(q)
  );
  const filteredGrupos = grupos.filter(
    (g) => g.codigo.toLowerCase().includes(q) || g.nombre.toLowerCase().includes(q)
  );
  const filteredUnidades = unidades.filter(
    (u) =>
      u.codigo_unidad.toLowerCase().includes(q) ||
      u.nombre.toLowerCase().includes(q) ||
      u.codigo_sap.toLowerCase().includes(q)
  );
  const filteredContenedores = contenedores.filter(
    (c) =>
      c.codigo_contenedor.toLowerCase().includes(q) ||
      c.nombre.toLowerCase().includes(q) ||
      c.zona.toLowerCase().includes(q) ||
      (c.bodega_nombre && c.bodega_nombre.toLowerCase().includes(q))
  );
  const filteredTiposAlmacen = tiposAlmacenamiento.filter(
    (t) => t.codigo.toLowerCase().includes(q) || t.nombre.toLowerCase().includes(q)
  );

  return (
    <div className="space-y-4 animate-in fade-in duration-300 pb-10">
      {/* Navigation Tabs Header */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-3 border-b border-border/60 pb-3">
        <div className="flex items-center gap-1.5 overflow-x-auto scrollbar-none">
          <button
            type="button"
            onClick={() => {
              setActiveTab("bodegas");
              setSearchTerm("");
            }}
            className={`flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-bold transition-all shrink-0 ${
              activeTab === "bodegas"
                ? "bg-primary text-primary-foreground shadow-sm"
                : "text-muted-foreground hover:text-foreground hover:bg-secondary/60"
            }`}
          >
            <Building2 className="h-4 w-4" />
            Bodegas / Almacenes
            <Badge variant="secondary" className="ml-1 text-[10px] font-mono h-4 px-1.5">
              {bodegas.length}
            </Badge>
          </button>

          <button
            type="button"
            onClick={() => {
              setActiveTab("grupos");
              setSearchTerm("");
            }}
            className={`flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-bold transition-all shrink-0 ${
              activeTab === "grupos"
                ? "bg-primary text-primary-foreground shadow-sm"
                : "text-muted-foreground hover:text-foreground hover:bg-secondary/60"
            }`}
          >
            <Layers className="h-4 w-4" />
            Grupos de Artículos
            <Badge variant="secondary" className="ml-1 text-[10px] font-mono h-4 px-1.5">
              {grupos.length}
            </Badge>
          </button>

          <button
            type="button"
            onClick={() => {
              setActiveTab("unidades");
              setSearchTerm("");
            }}
            className={`flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-bold transition-all shrink-0 ${
              activeTab === "unidades"
                ? "bg-primary text-primary-foreground shadow-sm"
                : "text-muted-foreground hover:text-foreground hover:bg-secondary/60"
            }`}
          >
            <Ruler className="h-4 w-4" />
            Unidades de Medida
            <Badge variant="secondary" className="ml-1 text-[10px] font-mono h-4 px-1.5">
              {unidades.length}
            </Badge>
          </button>

          <button
            type="button"
            onClick={() => {
              setActiveTab("contenedores");
              setSearchTerm("");
            }}
            className={`flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-bold transition-all shrink-0 ${
              activeTab === "contenedores"
                ? "bg-primary text-primary-foreground shadow-sm"
                : "text-muted-foreground hover:text-foreground hover:bg-secondary/60"
            }`}
          >
            <Warehouse className="h-4 w-4" />
            Contenedores & Zonas
            <Badge variant="secondary" className="ml-1 text-[10px] font-mono h-4 px-1.5">
              {contenedores.length}
            </Badge>
          </button>

          <button
            type="button"
            onClick={() => {
              setActiveTab("almacenamiento");
              setSearchTerm("");
            }}
            className={`flex items-center gap-2 px-3.5 py-2 rounded-xl text-xs font-bold transition-all shrink-0 ${
              activeTab === "almacenamiento"
                ? "bg-primary text-primary-foreground shadow-sm"
                : "text-muted-foreground hover:text-foreground hover:bg-secondary/60"
            }`}
          >
            <Boxes className="h-4 w-4" />
            Tipos de Almacenamiento
            <Badge variant="secondary" className="ml-1 text-[10px] font-mono h-4 px-1.5">
              {tiposAlmacenamiento.length}
            </Badge>
          </button>
        </div>

        <Button
          size="sm"
          onClick={() => handleOpenCreate(activeTab)}
          className="h-9 text-xs font-bold gap-1.5 rounded-xl shadow-sm shrink-0"
        >
          <Plus className="h-3.5 w-3.5" />
          {activeTab === "bodegas" && "Nueva Bodega"}
          {activeTab === "grupos" && "Nuevo Grupo"}
          {activeTab === "unidades" && "Nueva Unidad"}
          {activeTab === "contenedores" && "Nuevo Contenedor/Zona"}
          {activeTab === "almacenamiento" && "Nuevo Formato"}
        </Button>
      </div>

      {/* Search Toolbar */}
      <div className="flex items-center gap-2 bg-card p-2.5 rounded-xl border border-border/60 max-w-md">
        <Search className="h-4 w-4 text-muted-foreground shrink-0 ml-1" />
        <Input
          type="text"
          placeholder={`Buscar en ${activeTab}...`}
          value={searchTerm}
          onChange={(e) => setSearchTerm(e.target.value)}
          className="h-8 text-xs border-0 bg-transparent focus-visible:ring-0 shadow-none px-1"
        />
        {searchTerm && (
          <button
            type="button"
            onClick={() => setSearchTerm("")}
            className="text-muted-foreground hover:text-foreground mr-1"
          >
            <X className="h-4 w-4" />
          </button>
        )}
      </div>

      {/* Content Cards / Tables */}
      {loading ? (
        <div className="flex items-center justify-center p-16">
          <Loader2 className="h-8 w-8 animate-spin text-primary" />
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3.5">
          {/* 0. BODEGAS */}
          {activeTab === "bodegas" &&
            filteredBodegas.map((b) => (
              <Card key={b.id} className="border-border/60 hover:border-primary/40 transition-colors shadow-xs">
                <CardContent className="p-4 space-y-3">
                  <div className="flex items-start justify-between gap-2">
                    <div className="space-y-0.5">
                      <div className="flex items-center gap-1.5">
                        <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                          {b.codigo}
                        </span>
                        <Badge variant="outline" className="text-[10px]">
                          Empresa {b.empresa_codigo}
                        </Badge>
                      </div>
                      <h3 className="text-sm font-bold text-foreground line-clamp-1">{b.nombre}</h3>
                    </div>
                    <div className="flex items-center gap-1">
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-foreground"
                        onClick={() => handleOpenEdit("bodegas", b)}
                      >
                        <Edit3 className="h-3.5 w-3.5" />
                      </Button>
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-rose-500"
                        onClick={() => handleDelete("bodegas", b.id)}
                      >
                        <Trash2 className="h-3.5 w-3.5" />
                      </Button>
                    </div>
                  </div>

                  <p className="text-xs text-muted-foreground line-clamp-2">
                    {b.direccion || "Sin dirección especificada"}
                  </p>

                  <div className="pt-2 border-t border-border/40 flex items-center justify-between text-xs text-muted-foreground">
                    <span className="flex items-center gap-1">
                      <Warehouse className="h-3.5 w-3.5 text-primary" /> {b.total_contenedores || 0} contenedores
                    </span>
                    <span className="flex items-center gap-1 font-mono">
                      <Package className="h-3.5 w-3.5 text-primary" /> {b.total_materiales || 0} repuestos
                    </span>
                  </div>
                </CardContent>
              </Card>
            ))}

          {/* 1. GRUPOS DE ARTÍCULOS */}
          {activeTab === "grupos" &&
            filteredGrupos.map((g) => (
              <Card key={g.id} className="border-border/60 hover:border-primary/40 transition-colors shadow-xs">
                <CardContent className="p-4 space-y-3">
                  <div className="flex items-start justify-between gap-2">
                    <div className="space-y-0.5">
                      <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                        {g.codigo}
                      </span>
                      <h3 className="text-sm font-bold text-foreground line-clamp-1">{g.nombre}</h3>
                    </div>
                    <div className="flex items-center gap-1">
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-foreground"
                        onClick={() => handleOpenEdit("grupos", g)}
                      >
                        <Edit3 className="h-3.5 w-3.5" />
                      </Button>
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-rose-500"
                        onClick={() => handleDelete("grupos", g.id)}
                      >
                        <Trash2 className="h-3.5 w-3.5" />
                      </Button>
                    </div>
                  </div>

                  <p className="text-xs text-muted-foreground line-clamp-2">
                    {g.descripcion || "Sin descripción adicional"}
                  </p>

                  <div className="pt-2 border-t border-border/40 flex items-center justify-between text-xs text-muted-foreground">
                    <span>Materiales vinculados:</span>
                    <span className="font-mono font-bold text-foreground flex items-center gap-1">
                      <Package className="h-3.5 w-3.5 text-primary" />
                      {g.total_materiales}
                    </span>
                  </div>
                </CardContent>
              </Card>
            ))}

          {/* 2. UNIDADES DE MEDIDA */}
          {activeTab === "unidades" &&
            filteredUnidades.map((u) => (
              <Card key={u.codigo_unidad} className="border-border/60 hover:border-primary/40 transition-colors shadow-xs">
                <CardContent className="p-4 space-y-3">
                  <div className="flex items-start justify-between gap-2">
                    <div className="space-y-0.5">
                      <div className="flex items-center gap-1.5">
                        <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                          {u.codigo_unidad}
                        </span>
                        {u.codigo_sap && (
                          <Badge variant="outline" className="text-[10px] font-mono">
                            SAP: {u.codigo_sap}
                          </Badge>
                        )}
                      </div>
                      <h3 className="text-sm font-bold text-foreground line-clamp-1">{u.nombre}</h3>
                    </div>
                    <div className="flex items-center gap-1">
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-foreground"
                        onClick={() => handleOpenEdit("unidades", u)}
                      >
                        <Edit3 className="h-3.5 w-3.5" />
                      </Button>
                    </div>
                  </div>

                  <div className="grid grid-cols-2 gap-2 text-xs text-muted-foreground pt-1">
                    <div>
                      Símbolo: <span className="font-mono font-bold text-foreground">{u.simbolo || "-"}</span>
                    </div>
                    <div>
                      Decimales:{" "}
                      <span className="font-semibold text-foreground">
                        {u.permite_decimales ? "Permitido" : "Enteros"}
                      </span>
                    </div>
                  </div>

                  <div className="pt-2 border-t border-border/40 flex items-center justify-between text-xs text-muted-foreground">
                    <span>Materiales activos:</span>
                    <span className="font-mono font-bold text-foreground flex items-center gap-1">
                      <Package className="h-3.5 w-3.5 text-primary" />
                      {u.total_materiales}
                    </span>
                  </div>
                </CardContent>
              </Card>
            ))}

          {/* 3. CONTENEDORES */}
          {activeTab === "contenedores" &&
            filteredContenedores.map((c) => (
              <Card key={c.id} className="border-border/60 hover:border-primary/40 transition-colors shadow-xs">
                <CardContent className="p-4 space-y-3">
                  <div className="flex items-start justify-between gap-2">
                    <div className="space-y-0.5">
                      <div className="flex items-center gap-1.5">
                        <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                          {c.codigo_contenedor}
                        </span>
                        <Badge variant="outline" className="text-[10px]">
                          {c.zona || "PATIO"}
                        </Badge>
                      </div>
                      <h3 className="text-sm font-bold text-foreground line-clamp-1">{c.nombre}</h3>
                      {c.bodega_nombre && (
                        <div className="text-[10px] text-muted-foreground flex items-center gap-1">
                          <Building2 className="h-3 w-3 text-primary" /> {c.bodega_nombre}
                        </div>
                      )}
                    </div>
                    <div className="flex items-center gap-1">
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-foreground"
                        onClick={() => handleOpenEdit("contenedores", c)}
                      >
                        <Edit3 className="h-3.5 w-3.5" />
                      </Button>
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-rose-500"
                        onClick={() => handleDelete("contenedores", c.id)}
                      >
                        <Trash2 className="h-3.5 w-3.5" />
                      </Button>
                    </div>
                  </div>

                  <p className="text-xs text-muted-foreground line-clamp-2">
                    {c.descripcion || "Sin observaciones"}
                  </p>

                  <div className="pt-2 border-t border-border/40 flex items-center justify-between text-xs text-muted-foreground">
                    <span>Repuestos almacenados:</span>
                    <span className="font-mono font-bold text-foreground flex items-center gap-1">
                      <Package className="h-3.5 w-3.5 text-primary" />
                      {c.total_materiales}
                    </span>
                  </div>
                </CardContent>
              </Card>
            ))}

          {/* 4. TIPOS DE ALMACENAMIENTO */}
          {activeTab === "almacenamiento" &&
            filteredTiposAlmacen.map((t) => (
              <Card key={t.id} className="border-border/60 hover:border-primary/40 transition-colors shadow-xs">
                <CardContent className="p-4 space-y-3">
                  <div className="flex items-start justify-between gap-2">
                    <div className="space-y-0.5">
                      <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                        {t.codigo}
                      </span>
                      <h3 className="text-sm font-bold text-foreground line-clamp-1">{t.nombre}</h3>
                    </div>
                    <div className="flex items-center gap-1">
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-foreground"
                        onClick={() => handleOpenEdit("almacenamiento", t)}
                      >
                        <Edit3 className="h-3.5 w-3.5" />
                      </Button>
                      <Button
                        type="button"
                        variant="ghost"
                        size="icon"
                        className="h-7 w-7 text-muted-foreground hover:text-rose-500"
                        onClick={() => handleDelete("almacenamiento", t.id)}
                      >
                        <Trash2 className="h-3.5 w-3.5" />
                      </Button>
                    </div>
                  </div>

                  <p className="text-xs text-muted-foreground line-clamp-2">
                    {t.descripcion || "Formato de estiba física"}
                  </p>

                  <div className="pt-2 border-t border-border/40 flex items-center justify-between text-xs text-muted-foreground">
                    <span>Ítems con este formato:</span>
                    <span className="font-mono font-bold text-foreground flex items-center gap-1">
                      <Package className="h-3.5 w-3.5 text-primary" />
                      {t.total_materiales}
                    </span>
                  </div>
                </CardContent>
              </Card>
            ))}
        </div>
      )}

      {/* CRUD MODAL DIALOG */}
      <Dialog open={modalOpen} onOpenChange={setModalOpen}>
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle>
              {modalMode === "create" ? "Nuevo Registro" : "Modificar Registro"}
            </DialogTitle>
            <DialogDescription>
              Parametrización oficial en tablas maestras SAP MM / WM.
            </DialogDescription>
          </DialogHeader>

          <form onSubmit={handleSubmit} className="space-y-4 py-2">
            {/* BODEGAS FORM */}
            {modalEntity === "bodegas" && (
              <>
                <div className="space-y-1.5">
                  <Label>Código Bodega / Almacén (LGORT)</Label>
                  <Input
                    value={formData.codigo || ""}
                    onChange={(e) => setFormData({ ...formData, codigo: e.target.value })}
                    placeholder="Ej: MRO-CHILCA, ALM-CENTRAL"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre de la Bodega</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: ALM MRO CHILCA"
                    required
                  />
                </div>
                <div className="grid grid-cols-2 gap-3">
                  <div className="space-y-1.5">
                    <Label>Código Empresa</Label>
                    <Input
                      value={formData.empresa_codigo || "001"}
                      onChange={(e) => setFormData({ ...formData, empresa_codigo: e.target.value })}
                      placeholder="001"
                    />
                  </div>
                  <div className="space-y-1.5">
                    <Label>Dirección / Planta</Label>
                    <Input
                      value={formData.direccion || ""}
                      onChange={(e) => setFormData({ ...formData, direccion: e.target.value })}
                      placeholder="Planta Chilca"
                    />
                  </div>
                </div>
              </>
            )}

            {/* GRUPOS ARTICULOS FORM */}
            {modalEntity === "grupos" && (
              <>
                <div className="space-y-1.5">
                  <Label>Código Grupo (MATKL)</Label>
                  <Input
                    value={formData.codigo || ""}
                    onChange={(e) => setFormData({ ...formData, codigo: e.target.value })}
                    placeholder="Ej: EPP, HERR, REP_MEC"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre del Grupo / Familia</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: HERRAMIENTAS INDUSTRIALES"
                    required
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Descripción</Label>
                  <Input
                    value={formData.descripcion || ""}
                    onChange={(e) => setFormData({ ...formData, descripcion: e.target.value })}
                    placeholder="Opcional..."
                  />
                </div>
              </>
            )}

            {/* UNIDADES MEDIDA FORM */}
            {modalEntity === "unidades" && (
              <>
                <div className="space-y-1.5">
                  <Label>Código Interno (MEINS)</Label>
                  <Input
                    value={formData.codigo_unidad || ""}
                    onChange={(e) => setFormData({ ...formData, codigo_unidad: e.target.value })}
                    placeholder="Ej: UND, PAR, CJA, GL"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="grid grid-cols-2 gap-3">
                  <div className="space-y-1.5">
                    <Label>Código SAP / ISO</Label>
                    <Input
                      value={formData.codigo_sap || ""}
                      onChange={(e) => setFormData({ ...formData, codigo_sap: e.target.value })}
                      placeholder="Ej: ST, PA, BX"
                    />
                  </div>
                  <div className="space-y-1.5">
                    <Label>Símbolo</Label>
                    <Input
                      value={formData.simbolo || ""}
                      onChange={(e) => setFormData({ ...formData, simbolo: e.target.value })}
                      placeholder="Ej: und, pz"
                    />
                  </div>
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre Comercial</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: Unidades, Galones, Cajas"
                    required
                  />
                </div>
              </>
            )}

            {/* CONTENEDORES FORM */}
            {modalEntity === "contenedores" && (
              <>
                <div className="space-y-1.5">
                  <Label>Bodega / Almacén Perteneciente</Label>
                  <select
                    value={formData.bodega_id || 1}
                    onChange={(e) => setFormData({ ...formData, bodega_id: parseInt(e.target.value, 10) })}
                    className="w-full h-10 px-3 rounded-lg border border-border bg-background text-xs"
                  >
                    {bodegas.map((b) => (
                      <option key={b.id} value={b.id}>
                        {b.codigo} - {b.nombre}
                      </option>
                    ))}
                  </select>
                </div>
                <div className="space-y-1.5">
                  <Label>Código Contenedor / Zona (LGTYP)</Label>
                  <Input
                    value={formData.codigo_contenedor || ""}
                    onChange={(e) => setFormData({ ...formData, codigo_contenedor: e.target.value })}
                    placeholder="Ej: CONT-01, CONT-02, C.C.01"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre / Descripción</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: Contenedor 1 - EPPs"
                    required
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Zona / Patio</Label>
                  <Input
                    value={formData.zona || ""}
                    onChange={(e) => setFormData({ ...formData, zona: e.target.value })}
                    placeholder="Ej: PATIO NORTE, NAVE PRINCIPAL"
                  />
                </div>
              </>
            )}

            {/* TIPOS ALMACENAMIENTO FORM */}
            {modalEntity === "almacenamiento" && (
              <>
                <div className="space-y-1.5">
                  <Label>Código Formato (LETYP)</Label>
                  <Input
                    value={formData.codigo || ""}
                    onChange={(e) => setFormData({ ...formData, codigo: e.target.value })}
                    placeholder="Ej: SUELTO, GAVETA, CAJA, PALLET"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre del Formato</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: Almacenamiento en Gaveta"
                    required
                  />
                </div>
              </>
            )}

            <DialogFooter className="pt-3">
              <Button
                type="button"
                variant="outline"
                onClick={() => setModalOpen(false)}
                disabled={saving}
              >
                Cancelar
              </Button>
              <Button type="submit" disabled={saving}>
                {saving ? <Loader2 className="h-4 w-4 animate-spin mr-1" /> : <CheckCircle2 className="h-4 w-4 mr-1" />}
                Guardar
              </Button>
            </DialogFooter>
          </form>
        </DialogContent>
      </Dialog>
    </div>
  );
}
