-- ─────────────────────────────────────────────────────────────
-- POLÍTICAS DE SEGURIDAD (RLS) PARA MRO_APP
-- ─────────────────────────────────────────────────────────────

-- 1. FUNCIONES AUXILIARES (Para que las políticas sean rápidas y limpias)
-- Función para obtener el rol del usuario logueado
CREATE OR REPLACE FUNCTION public.get_mi_rol()
RETURNS text AS $$
  SELECT rol FROM public.usuarios WHERE id = auth.uid();
$$ LANGUAGE sql SECURITY DEFINER;

-- Función para obtener la lista de bodegas a las que tiene acceso el usuario
CREATE OR REPLACE FUNCTION public.mis_bodegas()
RETURNS SETOF integer AS $$
  SELECT bodega_id FROM public.usuarios_bodegas WHERE usuario_id = auth.uid();
$$ LANGUAGE sql SECURITY DEFINER;


-- ─────────────────────────────────────────────────────────────
-- 2. POLÍTICAS PARA LA TABLA: PRODUCTOS
-- ─────────────────────────────────────────────────────────────
CREATE POLICY "Lectura global o por bodega (Productos)" ON productos FOR SELECT
USING (
  public.get_mi_rol() IN ('superadmin', 'auditor') 
  OR bodega_id IN (SELECT public.mis_bodegas())
);

CREATE POLICY "Modificación por bodega (Productos)" ON productos FOR ALL
USING (
  public.get_mi_rol() = 'superadmin' 
  OR (
    public.get_mi_rol() IN ('admin', 'almacenero') 
    AND bodega_id IN (SELECT public.mis_bodegas())
  )
);


-- ─────────────────────────────────────────────────────────────
-- 3. POLÍTICAS PARA LA TABLA: MOVIMIENTOS (KARDEX)
-- ─────────────────────────────────────────────────────────────
CREATE POLICY "Lectura global o por bodega (Movimientos)" ON movimientos FOR SELECT
USING (
  public.get_mi_rol() IN ('superadmin', 'auditor') 
  OR bodega_id IN (SELECT public.mis_bodegas())
);

-- Los auditores normalmente no deberían crear movimientos, solo superadmin, admin y almacenero
CREATE POLICY "Creación de movimientos por bodega" ON movimientos FOR INSERT
WITH CHECK (
  public.get_mi_rol() = 'superadmin' 
  OR (
    public.get_mi_rol() IN ('admin', 'almacenero') 
    AND bodega_id IN (SELECT public.mis_bodegas())
  )
);


-- ─────────────────────────────────────────────────────────────
-- 4. POLÍTICAS PARA LA TABLA: INVENTARIO (CONTEOS FISICOS)
-- ─────────────────────────────────────────────────────────────
CREATE POLICY "Lectura global o por bodega (Inventario)" ON inventario FOR SELECT
USING (
  public.get_mi_rol() IN ('superadmin', 'auditor') 
  OR bodega_id IN (SELECT public.mis_bodegas())
);

CREATE POLICY "Modificación de inventario por bodega" ON inventario FOR ALL
USING (
  public.get_mi_rol() = 'superadmin' 
  OR (
    public.get_mi_rol() IN ('admin', 'almacenero', 'auditor') -- El auditor podría necesitar ajustar auditorías
    AND bodega_id IN (SELECT public.mis_bodegas())
  )
);


-- ─────────────────────────────────────────────────────────────
-- 5. POLÍTICAS PARA LA TABLA: BODEGAS
-- ─────────────────────────────────────────────────────────────
-- Todos pueden ver las bodegas a las que están asignados (o todas si son superadmin)
CREATE POLICY "Ver bodegas asignadas" ON bodegas FOR SELECT
USING (
  public.get_mi_rol() IN ('superadmin', 'auditor') 
  OR id IN (SELECT public.mis_bodegas())
);

-- Solo el superadmin puede crear, editar o borrar bodegas
CREATE POLICY "Solo superadmin administra bodegas" ON bodegas FOR ALL
USING (public.get_mi_rol() = 'superadmin');


-- ─────────────────────────────────────────────────────────────
-- 6. POLÍTICAS PARA LA TABLA: USUARIOS (PERFILES)
-- ─────────────────────────────────────────────────────────────
-- Todos pueden ver los perfiles (necesario para ver quién hizo un movimiento)
CREATE POLICY "Lectura pública de perfiles" ON usuarios FOR SELECT
USING (true);

-- Solo el propio usuario puede actualizar su nombre (o el superadmin)
CREATE POLICY "Actualizar propio perfil" ON usuarios FOR UPDATE
USING (
  auth.uid() = id OR public.get_mi_rol() = 'superadmin'
);
