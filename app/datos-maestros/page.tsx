"use client";

import * as React from "react";
import { useSearchParams } from "next/navigation";
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
  MapPin,
  Map
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";
import { Table, TableHeader, TableRow, TableHead, TableBody, TableCell } from "@/components/ui/table";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogDescription,
  DialogFooter,
} from "@/components/ui/dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { useAuth } from "@/app/inventario/hooks/use-auth";
import { toast } from "sonner";

interface Local {
  id: number;
  codigo: string;
  nombre: string;
  descripcion: string;
  total_bodegas: number;
}

interface Bodega {
  id: number;
  local_id?: number;
  local_nombre?: string;
  codigo: string;
  nombre: string;
  empresa_codigo: string;
  direccion: string;
  total_zonas: number;
  total_contenedores: number;
  total_materiales: number;
}

interface Zona {
  id: number;
  bodega_id?: number;
  bodega_nombre?: string;
  codigo: string;
  nombre: string;
  descripcion: string;
  total_contenedores: number;
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
  zona_id?: number;
  zona_nombre?: string;
  tipo_estructura?: string;
  codigo_contenedor: string;
  nombre: string;
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

type TabType = "locales" | "bodegas" | "zonas" | "contenedores" | "grupos" | "unidades" | "almacenamiento";

function DatosMaestrosPageContent() {
  const { user, token } = useAuth();
  const searchParams = useSearchParams();
  const [activeTab, setActiveTab] = React.useState<TabType>("locales");
  const [loading, setLoading] = React.useState(true);

  // Data State
  const [locales, setLocales] = React.useState<Local[]>([]);
  const [bodegas, setBodegas] = React.useState<Bodega[]>([]);
  const [zonas, setZonas] = React.useState<Zona[]>([]);
  const [grupos, setGrupos] = React.useState<GrupoArticulo[]>([]);
  const [unidades, setUnidades] = React.useState<UnidadMedida[]>([]);
  const [contenedores, setContenedores] = React.useState<Contenedor[]>([]);
  const [tiposAlmacenamiento, setTiposAlmacenamiento] = React.useState<TipoAlmacenamiento[]>([]);

  // Search Filter
  const [searchTerm, setSearchTerm] = React.useState("");
  const [selectedLocalId, setSelectedLocalId] = React.useState<string>("all");
  const [selectedBodegaId, setSelectedBodegaId] = React.useState<string>("all");
  const [selectedZonaId, setSelectedZonaId] = React.useState<string>("all");

  // Modal State
  const [modalOpen, setModalOpen] = React.useState(false);
  const [modalMode, setModalMode] = React.useState<"create" | "edit">("create");
  const [modalEntity, setModalEntity] = React.useState<TabType>("locales");
  const [formData, setFormData] = React.useState<Record<string, any>>({});
  const [saving, setSaving] = React.useState(false);

  const handleDrillDown = (nextTab: TabType, parentKey: string, parentId: string) => {
    setActiveTab(nextTab);
    setSearchTerm("");
    const url = new URL(window.location.href);
    url.searchParams.set("tab", nextTab);
    url.searchParams.delete("local_id");
    url.searchParams.delete("bodega_id");
    url.searchParams.delete("zona_id");
    url.searchParams.set(parentKey, parentId);
    window.history.pushState({}, "", url.toString());
    
    if (parentKey === "local_id") setSelectedLocalId(parentId);
    if (parentKey === "bodega_id") setSelectedBodegaId(parentId);
    if (parentKey === "zona_id") setSelectedZonaId(parentId);
  };

  // Handle Tab Change
  const handleTabChange = (tab: TabType) => {
    setActiveTab(tab);
    setSearchTerm("");
    if (typeof window !== "undefined") {
      const url = new URL(window.location.href);
      url.searchParams.set("tab", tab);
      window.history.pushState({}, "", url.toString());
    }
  };

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
        setLocales(data.locales || []);
        setBodegas(data.bodegas || []);
        setZonas(data.zonas || []);
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

  React.useEffect(() => {
    const tabParam = searchParams.get("tab") as TabType;
    if (tabParam) {
      setActiveTab(tabParam);
    }
    
    const localId = searchParams.get("local_id");
    if (localId) setSelectedLocalId(localId);
    
    const bodegaId = searchParams.get("bodega_id");
    if (bodegaId) setSelectedBodegaId(bodegaId);
    
    const zonaId = searchParams.get("zona_id");
    if (zonaId) setSelectedZonaId(zonaId);
  }, [searchParams]);

  // Open Modal Helpers
  const handleOpenCreate = (entity: TabType) => {
    setModalEntity(entity);
    setModalMode("create");
    let initialData: Record<string, any> = {};
    if (entity === "bodegas") initialData = { local_id: locales[0]?.id || "" };
    if (entity === "zonas") initialData = { bodega_id: bodegas[0]?.id || "" };
    if (entity === "contenedores") initialData = { zona_id: zonas[0]?.id || "", tipo_estructura: "Rack Metálico Pesado" };
    setFormData(initialData);
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
        locales: "locales",
        bodegas: "bodegas",
        zonas: "zonas",
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
        locales: "locales",
        bodegas: "bodegas",
        zonas: "zonas",
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
            Solo administradores tienen privilegios para parametrizar datos maestros.
          </p>
        </div>
      </div>
    );
  }

  // Filter Data according to Search
  const q = searchTerm.toLowerCase();
  
  const filteredLocales = locales.filter(
    (l) => l.codigo.toLowerCase().includes(q) || l.nombre.toLowerCase().includes(q)
  );

  const filteredBodegas = bodegas.filter((b) => {
    const matchesQ = b.codigo.toLowerCase().includes(q) || b.nombre.toLowerCase().includes(q) || (b.local_nombre && b.local_nombre.toLowerCase().includes(q));
    const matchesLocal = selectedLocalId === "all" || b.local_id?.toString() === selectedLocalId;
    return matchesQ && matchesLocal;
  });

  const filteredZonas = zonas.filter((z) => {
    const matchesQ = z.codigo.toLowerCase().includes(q) || z.nombre.toLowerCase().includes(q) || (z.bodega_nombre && z.bodega_nombre.toLowerCase().includes(q));
    const matchesBodega = selectedBodegaId === "all" || z.bodega_id?.toString() === selectedBodegaId;
    return matchesQ && matchesBodega;
  });

  const filteredContenedores = contenedores.filter(
    (c) => {
      const matchesQ = c.codigo_contenedor.toLowerCase().includes(q) ||
        c.nombre.toLowerCase().includes(q) ||
        (c.zona_nombre && c.zona_nombre.toLowerCase().includes(q)) ||
        (c.bodega_nombre && c.bodega_nombre.toLowerCase().includes(q));
      const matchesZona = selectedZonaId === "all" || c.zona_id?.toString() === selectedZonaId;
      return matchesQ && matchesZona;
    }
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
  
  const filteredTiposAlmacen = tiposAlmacenamiento.filter(
    (t) => t.codigo.toLowerCase().includes(q) || t.nombre.toLowerCase().includes(q)
  );

  return (
    <div className="space-y-4 animate-in fade-in duration-300 pb-10">
      {/* BARRA SUPERIOR STICKY (BÚSQUEDA, FILTROS Y BOTONES) */}
      <div className="sticky top-0 z-30 bg-background/95 backdrop-blur-md py-2.5 -mx-3 px-3 sm:-mx-6 sm:px-6 border-b border-border/40 shadow-2xs space-y-2">
        <div className="flex items-center gap-2">
          
          <div className="relative flex-1">
            <Search className="absolute left-3.5 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
            <Input
              type="text"
              placeholder={`Buscar en ${activeTab}...`}
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
              className="pl-10 pr-9 h-10 text-xs sm:text-sm rounded-xl bg-card border-border/60"
            />
            {searchTerm && (
              <button
                type="button"
                onClick={() => setSearchTerm("")}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground p-1"
              >
                <X className="h-4 w-4" />
              </button>
            )}
          </div>

          <Button
            type="button"
            onClick={() => handleOpenCreate(activeTab)}
            className="h-10 w-10 sm:w-auto text-xs font-bold sm:gap-1.5 rounded-xl sm:px-3.5 shrink-0 shadow-xs p-0 sm:p-auto flex items-center justify-center"
          >
            <Plus className="h-4 w-4" />
            <span className="hidden sm:inline">
              {activeTab === "locales" && "Nuevo Local"}
              {activeTab === "bodegas" && "Nueva Bodega"}
              {activeTab === "zonas" && "Nueva Zona"}
              {activeTab === "contenedores" && "Nueva Estructura"}
              {activeTab === "grupos" && "Nuevo Grupo"}
              {activeTab === "unidades" && "Nueva Unidad"}
              {activeTab === "almacenamiento" && "Nuevo Tipo"}
            </span>
          </Button>
        </div>

        {/* Fila secundaria para filtros (solo se muestra si hay dropdown) */}
        {(activeTab === "bodegas" || activeTab === "zonas" || activeTab === "contenedores") && (
          <div className="flex items-center gap-2">
            {activeTab === "bodegas" && (
              <Select value={selectedLocalId} onValueChange={setSelectedLocalId}>
                <SelectTrigger className="h-10 rounded-xl bg-card border-border/60 w-full sm:w-48 text-xs shrink-0">
                  <SelectValue placeholder="Todos los Locales" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">Todos los Locales</SelectItem>
                  {locales.map(l => (
                    <SelectItem key={l.id} value={l.id.toString()}>{l.nombre}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
            )}

            {activeTab === "zonas" && (
              <Select value={selectedBodegaId} onValueChange={setSelectedBodegaId}>
                <SelectTrigger className="h-10 rounded-xl bg-card border-border/60 w-full sm:w-48 text-xs shrink-0">
                  <SelectValue placeholder="Todas las Bodegas" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">Todas las Bodegas</SelectItem>
                  {bodegas.map(b => (
                    <SelectItem key={b.id} value={b.id.toString()}>{b.nombre}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
            )}

            {activeTab === "contenedores" && (
              <Select value={selectedZonaId} onValueChange={setSelectedZonaId}>
                <SelectTrigger className="h-10 rounded-xl bg-card border-border/60 w-full sm:w-48 text-xs shrink-0">
                  <SelectValue placeholder="Todas las Zonas" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">Todas las Zonas</SelectItem>
                  {zonas.map(z => (
                    <SelectItem key={z.id} value={z.id.toString()}>{z.nombre}</SelectItem>
                  ))}
                </SelectContent>
              </Select>
            )}
          </div>
        )}
      </div>

      {/* Content Cards / Tables */}
      {loading ? (
        <div className="flex items-center justify-center p-16">
          <Loader2 className="h-8 w-8 animate-spin text-primary" />
        </div>
      ) : (
        <div className="w-full">
          
          {/* LOCALES */}
          {activeTab === "locales" && (
            <>
              <div className="md:hidden bg-card rounded-xl border border-border/60 divide-y divide-border/60 overflow-hidden">
                {filteredLocales.map((l) => (
                  <div key={l.id} className="p-4 cursor-pointer hover:bg-muted/50 transition-colors" onClick={() => handleDrillDown("bodegas", "local_id", l.id.toString())}>
                    <div className="space-y-3">
                      <div className="flex items-start justify-between gap-2">
                        <div className="space-y-0.5">
                          <div className="flex items-center gap-1.5">
                            <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                              {l.codigo}
                            </span>
                          </div>
                          <h3 className="text-sm font-bold text-foreground line-clamp-1">{l.nombre}</h3>
                        </div>
                        <div className="flex items-center gap-1">
                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            className="h-7 w-7 text-muted-foreground hover:text-foreground"
                            onClick={(e) => { e.stopPropagation(); handleOpenEdit("locales", l); }}
                          >
                            <Edit3 className="h-3.5 w-3.5" />
                          </Button>
                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            className="h-7 w-7 text-muted-foreground hover:text-rose-500"
                            onClick={(e) => { e.stopPropagation(); handleDelete("locales", l.id); }}
                          >
                            <Trash2 className="h-3.5 w-3.5" />
                          </Button>
                        </div>
                      </div>

                      <p className="text-xs text-muted-foreground line-clamp-2">
                        {l.descripcion || "Sin descripción"}
                      </p>

                      <div className="pt-2 border-t border-border/40 flex items-center justify-between text-xs text-muted-foreground">
                        <span className="flex items-center gap-1">
                          <Building2 className="h-3.5 w-3.5 text-primary" /> {l.total_bodegas || 0} bodegas
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <div className="hidden md:block rounded-xl border border-border/60 bg-card overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Código</TableHead>
                      <TableHead>Nombre</TableHead>
                      <TableHead>Descripción</TableHead>
                      <TableHead>Bodegas</TableHead>
                      <TableHead className="text-right">Acciones</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredLocales.map((l) => (
                      <TableRow key={l.id} className="cursor-pointer hover:bg-muted/50" onClick={() => handleDrillDown("bodegas", "local_id", l.id.toString())}>
                        <TableCell className="font-mono text-xs font-bold text-primary">{l.codigo}</TableCell>
                        <TableCell className="font-medium">{l.nombre}</TableCell>
                        <TableCell className="text-muted-foreground">{l.descripcion || "Sin descripción"}</TableCell>
                        <TableCell><Badge variant="secondary">{l.total_bodegas || 0} bodegas</Badge></TableCell>
                        <TableCell className="text-right">
                          <Button type="button" variant="ghost" size="icon" onClick={(e) => { e.stopPropagation(); handleOpenEdit("locales", l); }}><Edit3 className="h-4 w-4" /></Button>
                          <Button type="button" variant="ghost" size="icon" className="text-rose-500 hover:text-rose-600" onClick={(e) => { e.stopPropagation(); handleDelete("locales", l.id); }}><Trash2 className="h-4 w-4" /></Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </>
          )}

          {/* BODEGAS */}
          {activeTab === "bodegas" && (
            <>
              <div className="md:hidden bg-card rounded-xl border border-border/60 divide-y divide-border/60 overflow-hidden">
                {filteredBodegas.map((b) => (
                  <div key={b.id} className="p-4 cursor-pointer hover:bg-muted/50 transition-colors" onClick={() => handleDrillDown("zonas", "bodega_id", b.id.toString())}>
                    <div className="space-y-3">
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
                          {b.local_nombre && (
                            <div className="text-[10px] text-muted-foreground flex items-center gap-1">
                              <MapPin className="h-3 w-3 text-primary" /> Local: {b.local_nombre}
                            </div>
                          )}
                        </div>
                        <div className="flex items-center gap-1">
                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            className="h-7 w-7 text-muted-foreground hover:text-foreground"
                            onClick={(e) => { e.stopPropagation(); handleOpenEdit("bodegas", b); }}
                          >
                            <Edit3 className="h-3.5 w-3.5" />
                          </Button>
                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            className="h-7 w-7 text-muted-foreground hover:text-rose-500"
                            onClick={(e) => { e.stopPropagation(); handleDelete("bodegas", b.id); }}
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
                          <Map className="h-3.5 w-3.5 text-primary" /> {b.total_zonas || 0} zonas
                        </span>
                        <span className="flex items-center gap-1">
                          <Warehouse className="h-3.5 w-3.5 text-primary" /> {b.total_contenedores || 0} est.
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <div className="hidden md:block rounded-xl border border-border/60 bg-card overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Código</TableHead>
                      <TableHead>Empresa</TableHead>
                      <TableHead>Nombre</TableHead>
                      <TableHead>Local</TableHead>
                      <TableHead>Dirección</TableHead>
                      <TableHead>Zonas / Est.</TableHead>
                      <TableHead className="text-right">Acciones</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredBodegas.map((b) => (
                      <TableRow key={b.id} className="cursor-pointer hover:bg-muted/50" onClick={() => handleDrillDown("zonas", "bodega_id", b.id.toString())}>
                        <TableCell className="font-mono text-xs font-bold text-primary">{b.codigo}</TableCell>
                        <TableCell><Badge variant="outline">{b.empresa_codigo}</Badge></TableCell>
                        <TableCell className="font-medium">{b.nombre}</TableCell>
                        <TableCell className="text-muted-foreground">{b.local_nombre || "-"}</TableCell>
                        <TableCell className="text-muted-foreground">{b.direccion || "-"}</TableCell>
                        <TableCell>
                          <div className="flex flex-col text-xs">
                            <span>{b.total_zonas || 0} zonas</span>
                            <span className="text-muted-foreground">{b.total_contenedores || 0} est.</span>
                          </div>
                        </TableCell>
                        <TableCell className="text-right">
                          <Button type="button" variant="ghost" size="icon" onClick={(e) => { e.stopPropagation(); handleOpenEdit("bodegas", b); }}><Edit3 className="h-4 w-4" /></Button>
                          <Button type="button" variant="ghost" size="icon" className="text-rose-500 hover:text-rose-600" onClick={(e) => { e.stopPropagation(); handleDelete("bodegas", b.id); }}><Trash2 className="h-4 w-4" /></Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </>
          )}

          {/* ZONAS */}
          {activeTab === "zonas" && (
            <>
              <div className="md:hidden bg-card rounded-xl border border-border/60 divide-y divide-border/60 overflow-hidden">
                {filteredZonas.map((z) => (
                  <div key={z.id} className="p-4 cursor-pointer hover:bg-muted/50 transition-colors" onClick={() => handleDrillDown("contenedores", "zona_id", z.id.toString())}>
                    <div className="space-y-3">
                      <div className="flex items-start justify-between gap-2">
                        <div className="space-y-0.5">
                          <div className="flex items-center gap-1.5">
                            <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                              {z.codigo}
                            </span>
                          </div>
                          <h3 className="text-sm font-bold text-foreground line-clamp-1">{z.nombre}</h3>
                          {z.bodega_nombre && (
                            <div className="text-[10px] text-muted-foreground flex items-center gap-1">
                              <Building2 className="h-3 w-3 text-primary" /> {z.bodega_nombre}
                            </div>
                          )}
                        </div>
                        <div className="flex items-center gap-1">
                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            className="h-7 w-7 text-muted-foreground hover:text-foreground"
                            onClick={(e) => { e.stopPropagation(); handleOpenEdit("zonas", z); }}
                          >
                            <Edit3 className="h-3.5 w-3.5" />
                          </Button>
                          <Button
                            type="button"
                            variant="ghost"
                            size="icon"
                            className="h-7 w-7 text-muted-foreground hover:text-rose-500"
                            onClick={(e) => { e.stopPropagation(); handleDelete("zonas", z.id); }}
                          >
                            <Trash2 className="h-3.5 w-3.5" />
                          </Button>
                        </div>
                      </div>

                      <p className="text-xs text-muted-foreground line-clamp-2">
                        {z.descripcion || "Sin descripción"}
                      </p>

                      <div className="pt-2 border-t border-border/40 flex items-center justify-between text-xs text-muted-foreground">
                        <span className="flex items-center gap-1">
                          <Warehouse className="h-3.5 w-3.5 text-primary" /> {z.total_contenedores || 0} estructuras
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <div className="hidden md:block rounded-xl border border-border/60 bg-card overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Código</TableHead>
                      <TableHead>Nombre</TableHead>
                      <TableHead>Bodega</TableHead>
                      <TableHead>Descripción</TableHead>
                      <TableHead>Estructuras</TableHead>
                      <TableHead className="text-right">Acciones</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredZonas.map((z) => (
                      <TableRow key={z.id} className="cursor-pointer hover:bg-muted/50" onClick={() => handleDrillDown("contenedores", "zona_id", z.id.toString())}>
                        <TableCell className="font-mono text-xs font-bold text-primary">{z.codigo}</TableCell>
                        <TableCell className="font-medium">{z.nombre}</TableCell>
                        <TableCell className="text-muted-foreground">{z.bodega_nombre || "-"}</TableCell>
                        <TableCell className="text-muted-foreground">{z.descripcion || "Sin descripción"}</TableCell>
                        <TableCell><Badge variant="secondary">{z.total_contenedores || 0} estructuras</Badge></TableCell>
                        <TableCell className="text-right">
                          <Button type="button" variant="ghost" size="icon" onClick={(e) => { e.stopPropagation(); handleOpenEdit("zonas", z); }}><Edit3 className="h-4 w-4" /></Button>
                          <Button type="button" variant="ghost" size="icon" className="text-rose-500 hover:text-rose-600" onClick={(e) => { e.stopPropagation(); handleDelete("zonas", z.id); }}><Trash2 className="h-4 w-4" /></Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </>
          )}

          {/* CONTENEDORES (ESTRUCTURAS) */}
          {activeTab === "contenedores" && (
            <>
              <div className="md:hidden bg-card rounded-xl border border-border/60 divide-y divide-border/60 overflow-hidden">
                {filteredContenedores.map((c) => (
                  <div key={c.id} className="p-4 cursor-pointer hover:bg-muted/50 transition-colors">
                    <div className="space-y-3">
                      <div className="flex items-start justify-between gap-2">
                        <div className="space-y-0.5">
                          <div className="flex items-center gap-1.5">
                            <span className="font-mono text-xs font-bold text-primary bg-primary/10 px-2 py-0.5 rounded-md">
                              {c.codigo_contenedor}
                            </span>
                            <Badge variant="outline" className="text-[10px]">
                              {c.zona_nombre || "Sin Zona"}
                            </Badge>
                          </div>
                          <h3 className="text-sm font-bold text-foreground line-clamp-1">{c.nombre}</h3>
                          {c.tipo_estructura && (
                            <div className="text-[10px] text-muted-foreground flex items-center gap-1">
                              <Boxes className="h-3 w-3 text-primary" /> {c.tipo_estructura}
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
                          {c.total_materiales || 0}
                        </span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <div className="hidden md:block rounded-xl border border-border/60 bg-card overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Código</TableHead>
                      <TableHead>Nombre</TableHead>
                      <TableHead>Zona</TableHead>
                      <TableHead>Tipo Estructura</TableHead>
                      <TableHead>Descripción</TableHead>
                      <TableHead>Repuestos</TableHead>
                      <TableHead className="text-right">Acciones</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredContenedores.map((c) => (
                      <TableRow key={c.id}>
                        <TableCell className="font-mono text-xs font-bold text-primary">{c.codigo_contenedor}</TableCell>
                        <TableCell className="font-medium">{c.nombre}</TableCell>
                        <TableCell><Badge variant="outline">{c.zona_nombre || "Sin Zona"}</Badge></TableCell>
                        <TableCell className="text-muted-foreground">{c.tipo_estructura || "-"}</TableCell>
                        <TableCell className="text-muted-foreground">{c.descripcion || "Sin observaciones"}</TableCell>
                        <TableCell>
                          <div className="flex items-center gap-1 font-mono">
                            <Package className="h-3.5 w-3.5 text-primary" />
                            {c.total_materiales || 0}
                          </div>
                        </TableCell>
                        <TableCell className="text-right">
                          <Button type="button" variant="ghost" size="icon" onClick={() => handleOpenEdit("contenedores", c)}><Edit3 className="h-4 w-4" /></Button>
                          <Button type="button" variant="ghost" size="icon" className="text-rose-500 hover:text-rose-600" onClick={() => handleDelete("contenedores", c.id)}><Trash2 className="h-4 w-4" /></Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </>
          )}

          {/* GRUPOS DE ARTÍCULOS */}
          {activeTab === "grupos" && (
            <>
              <div className="md:hidden bg-card rounded-xl border border-border/60 divide-y divide-border/60 overflow-hidden">
                {filteredGrupos.map((g) => (
                  <div key={g.id} className="p-4 cursor-pointer hover:bg-muted/50 transition-colors">
                    <div className="space-y-3">
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
                    </div>
                  </div>
                ))}
              </div>
              <div className="hidden md:block rounded-xl border border-border/60 bg-card overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Código</TableHead>
                      <TableHead>Nombre</TableHead>
                      <TableHead>Descripción</TableHead>
                      <TableHead>Materiales</TableHead>
                      <TableHead className="text-right">Acciones</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredGrupos.map((g) => (
                      <TableRow key={g.id}>
                        <TableCell className="font-mono text-xs font-bold text-primary">{g.codigo}</TableCell>
                        <TableCell className="font-medium">{g.nombre}</TableCell>
                        <TableCell className="text-muted-foreground">{g.descripcion || "Sin descripción"}</TableCell>
                        <TableCell>
                          <div className="flex items-center gap-1 font-mono">
                            <Package className="h-3.5 w-3.5 text-primary" />
                            {g.total_materiales || 0}
                          </div>
                        </TableCell>
                        <TableCell className="text-right">
                          <Button type="button" variant="ghost" size="icon" onClick={() => handleOpenEdit("grupos", g)}><Edit3 className="h-4 w-4" /></Button>
                          <Button type="button" variant="ghost" size="icon" className="text-rose-500 hover:text-rose-600" onClick={() => handleDelete("grupos", g.id)}><Trash2 className="h-4 w-4" /></Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </>
          )}

          {/* UNIDADES DE MEDIDA */}
          {activeTab === "unidades" && (
            <>
              <div className="md:hidden bg-card rounded-xl border border-border/60 divide-y divide-border/60 overflow-hidden">
                {filteredUnidades.map((u) => (
                  <div key={u.codigo_unidad} className="p-4 cursor-pointer hover:bg-muted/50 transition-colors">
                    <div className="space-y-3">
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
                    </div>
                  </div>
                ))}
              </div>
              <div className="hidden md:block rounded-xl border border-border/60 bg-card overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Código</TableHead>
                      <TableHead>SAP</TableHead>
                      <TableHead>Nombre</TableHead>
                      <TableHead>Símbolo</TableHead>
                      <TableHead>Decimales</TableHead>
                      <TableHead>Materiales</TableHead>
                      <TableHead className="text-right">Acciones</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredUnidades.map((u) => (
                      <TableRow key={u.codigo_unidad}>
                        <TableCell className="font-mono text-xs font-bold text-primary">{u.codigo_unidad}</TableCell>
                        <TableCell><Badge variant="outline">{u.codigo_sap || "-"}</Badge></TableCell>
                        <TableCell className="font-medium">{u.nombre}</TableCell>
                        <TableCell className="text-muted-foreground">{u.simbolo || "-"}</TableCell>
                        <TableCell className="text-muted-foreground">{u.permite_decimales ? "Sí" : "No"}</TableCell>
                        <TableCell>
                          <div className="flex items-center gap-1 font-mono">
                            <Package className="h-3.5 w-3.5 text-primary" />
                            {u.total_materiales || 0}
                          </div>
                        </TableCell>
                        <TableCell className="text-right">
                          <Button type="button" variant="ghost" size="icon" onClick={() => handleOpenEdit("unidades", u)}><Edit3 className="h-4 w-4" /></Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </>
          )}

          {/* TIPOS DE ALMACENAMIENTO */}
          {activeTab === "almacenamiento" && (
            <>
              <div className="md:hidden bg-card rounded-xl border border-border/60 divide-y divide-border/60 overflow-hidden">
                {filteredTiposAlmacen.map((t) => (
                  <div key={t.id} className="p-4 cursor-pointer hover:bg-muted/50 transition-colors">
                    <div className="space-y-3">
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
                    </div>
                  </div>
                ))}
              </div>
              <div className="hidden md:block rounded-xl border border-border/60 bg-card overflow-hidden">
                <Table>
                  <TableHeader>
                    <TableRow>
                      <TableHead>Código</TableHead>
                      <TableHead>Nombre</TableHead>
                      <TableHead>Descripción</TableHead>
                      <TableHead>Ítems</TableHead>
                      <TableHead className="text-right">Acciones</TableHead>
                    </TableRow>
                  </TableHeader>
                  <TableBody>
                    {filteredTiposAlmacen.map((t) => (
                      <TableRow key={t.id}>
                        <TableCell className="font-mono text-xs font-bold text-primary">{t.codigo}</TableCell>
                        <TableCell className="font-medium">{t.nombre}</TableCell>
                        <TableCell className="text-muted-foreground">{t.descripcion || "Formato de estiba física"}</TableCell>
                        <TableCell>
                          <div className="flex items-center gap-1 font-mono">
                            <Package className="h-3.5 w-3.5 text-primary" />
                            {t.total_materiales || 0}
                          </div>
                        </TableCell>
                        <TableCell className="text-right">
                          <Button type="button" variant="ghost" size="icon" onClick={() => handleOpenEdit("almacenamiento", t)}><Edit3 className="h-4 w-4" /></Button>
                          <Button type="button" variant="ghost" size="icon" className="text-rose-500 hover:text-rose-600" onClick={() => handleDelete("almacenamiento", t.id)}><Trash2 className="h-4 w-4" /></Button>
                        </TableCell>
                      </TableRow>
                    ))}
                  </TableBody>
                </Table>
              </div>
            </>
          )}
        </div>
      )}

      {/* CRUD MODAL DIALOG */}
      <Dialog open={modalOpen} onOpenChange={setModalOpen}>
        <DialogContent className="w-full h-[100dvh] max-w-none sm:max-w-md sm:h-auto max-h-[100dvh] sm:max-h-[85vh] rounded-none sm:rounded-xl flex flex-col p-4 sm:p-6 overflow-hidden">
          <DialogHeader>
            <DialogTitle>
              {modalMode === "create" ? "Nuevo Registro" : "Modificar Registro"}
            </DialogTitle>
            <DialogDescription>
              Parametrización oficial en tablas maestras.
            </DialogDescription>
          </DialogHeader>

          <form onSubmit={handleSubmit} className="space-y-4 py-2 flex-1 overflow-y-auto">
            
            {/* LOCALES FORM */}
            {modalEntity === "locales" && (
              <>
                <div className="space-y-1.5">
                  <Label>Código de Local</Label>
                  <Input
                    value={formData.codigo || ""}
                    onChange={(e) => setFormData({ ...formData, codigo: e.target.value })}
                    placeholder="Ej: LOC-01"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre del Local</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: Sede Principal"
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

            {/* BODEGAS FORM */}
            {modalEntity === "bodegas" && (
              <>
                <div className="space-y-1.5">
                  <Label>Local Perteneciente</Label>
                  <Select value={formData.local_id?.toString() || ""} onValueChange={(val) => setFormData({...formData, local_id: parseInt(val, 10)})}>
                    <SelectTrigger className="w-full h-10 px-3 rounded-lg border border-border bg-background text-xs">
                      <SelectValue placeholder="Seleccione un local" />
                    </SelectTrigger>
                    <SelectContent>
                      {locales.map((l) => (
                        <SelectItem key={l.id} value={l.id.toString()}>
                          {l.codigo} - {l.nombre}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
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

            {/* ZONAS FORM */}
            {modalEntity === "zonas" && (
              <>
                <div className="space-y-1.5">
                  <Label>Bodega Perteneciente</Label>
                  <Select value={formData.bodega_id?.toString() || ""} onValueChange={(val) => setFormData({...formData, bodega_id: parseInt(val, 10)})}>
                    <SelectTrigger className="w-full h-10 px-3 rounded-lg border border-border bg-background text-xs">
                      <SelectValue placeholder="Seleccione una bodega" />
                    </SelectTrigger>
                    <SelectContent>
                      {bodegas.map((b) => (
                        <SelectItem key={b.id} value={b.id.toString()}>
                          {b.codigo} - {b.nombre}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-1.5">
                  <Label>Código Zona</Label>
                  <Input
                    value={formData.codigo || ""}
                    onChange={(e) => setFormData({ ...formData, codigo: e.target.value })}
                    placeholder="Ej: ZON-A"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre de la Zona</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: Nave Principal"
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

            {/* CONTENEDORES (ESTRUCTURAS) FORM */}
            {modalEntity === "contenedores" && (
              <>
                <div className="space-y-1.5">
                  <Label>Zona Perteneciente</Label>
                  <Select value={formData.zona_id?.toString() || ""} onValueChange={(val) => setFormData({...formData, zona_id: parseInt(val, 10)})}>
                    <SelectTrigger className="w-full h-10 px-3 rounded-lg border border-border bg-background text-xs">
                      <SelectValue placeholder="Seleccione una zona" />
                    </SelectTrigger>
                    <SelectContent>
                      {zonas.map((z) => (
                        <SelectItem key={z.id} value={z.id.toString()}>
                          {z.codigo} - {z.nombre}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-1.5">
                  <Label>Código Estructura (LGTYP)</Label>
                  <Input
                    value={formData.codigo_contenedor || ""}
                    onChange={(e) => setFormData({ ...formData, codigo_contenedor: e.target.value })}
                    placeholder="Ej: CONT-01, EST-02, RACK-A"
                    required
                    disabled={modalMode === "edit"}
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Nombre / Descripción</Label>
                  <Input
                    value={formData.nombre || ""}
                    onChange={(e) => setFormData({ ...formData, nombre: e.target.value })}
                    placeholder="Ej: Rack Metálico Pesado A1"
                    required
                  />
                </div>
                <div className="space-y-1.5">
                  <Label>Tipo de Estructura</Label>
                  <Select value={formData.tipo_estructura || "Rack Metálico Pesado"} onValueChange={(val) => setFormData({...formData, tipo_estructura: val})}>
                    <SelectTrigger className="w-full h-10 px-3 rounded-lg border border-border bg-background text-xs">
                      <SelectValue placeholder="Tipo de Estructura" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="Rack Metálico Pesado">Rack Metálico Pesado</SelectItem>
                      <SelectItem value="Estantería Cajas">Estantería Cajas</SelectItem>
                      <SelectItem value="Piso/Patio">Piso/Patio</SelectItem>
                    </SelectContent>
                  </Select>
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

export default function DatosMaestrosPage() {
  return (
    <React.Suspense fallback={<div className="p-8 text-center text-muted-foreground animate-pulse">Cargando módulos...</div>}>
      <DatosMaestrosPageContent />
    </React.Suspense>
  );
}
