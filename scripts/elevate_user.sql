-- Script para promover tu usuario a Super Admin en Supabase
-- Ejecuta este código en el SQL Editor de tu panel de Supabase.

UPDATE usuarios 
SET rol = 'superadmin', activo = 1 
WHERE id = (
    SELECT id 
    FROM auth.users 
    WHERE email = 'juan@aescalante.dev'
);

-- Si deseas verificar que se actualizó correctamente, puedes correr:
-- SELECT id, nombre, rol, activo FROM usuarios WHERE id = (SELECT id FROM auth.users WHERE email = 'juan@aescalante.dev');
