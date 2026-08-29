CREATE OR REPLACE FUNCTION get_dashboard_stats()
RETURNS JSON AS $$
DECLARE
  v_result JSON;
  v_total_productos INT;
BEGIN
  -- Total de productos activos en el maestro
  SELECT COUNT(*) INTO v_total_productos FROM productos WHERE is_deleted = 0;

  SELECT json_build_object(
    'stats', (
      SELECT json_build_object(
        'totalRegistros', COUNT(*),
        'totalAuditados', COUNT(*) FILTER (WHERE cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL),
        'totalOk', COUNT(*) FILTER (WHERE observacion = 'OK' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)),
        'totalFaltante', COUNT(*) FILTER (WHERE observacion = 'FALTANTE' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)),
        'totalSobrante', COUNT(*) FILTER (WHERE observacion = 'SOBRANTE' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)),
        'totalCantFisica', COALESCE(SUM(cantidad_fisica), 0),
        'totalValor', COALESCE(SUM(cantidad_fisica * costo_unitario), 0),
        'totalDiferenciaValor', COALESCE(SUM(s_dif), 0),
        'stockTotal', v_total_productos
      )
      FROM v_inventario
    ),
    'porFamilia', (
      SELECT COALESCE(json_agg(f), '[]'::json)
      FROM (
        SELECT 
          COALESCE(familia, 'GENERAL') as name,
          COUNT(*) as total_items,
          COUNT(*) FILTER (WHERE observacion = 'OK' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)) as ok_count,
          COUNT(*) FILTER (WHERE observacion = 'FALTANTE' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)) as faltante_count,
          COUNT(*) FILTER (WHERE observacion = 'SOBRANTE' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)) as sobrante_count,
          COALESCE(SUM(cantidad_fisica), 0) as cant_fisica,
          COALESCE(SUM(COALESCE(cantidad_fisica,0) - COALESCE(dif,0)), 0) as stock_sistema,
          COALESCE(SUM(cantidad_fisica * costo_unitario), 0) as valor_total
        FROM v_inventario
        GROUP BY COALESCE(familia, 'GENERAL')
        ORDER BY total_items DESC
        LIMIT 10
      ) f
    ),
    'porRack', (
      SELECT COALESCE(json_agg(r), '[]'::json)
      FROM (
        SELECT 
          COALESCE(rack, 'SIN RACK') as rack,
          COUNT(*) as count,
          COUNT(*) FILTER (WHERE cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL) as auditados
        FROM v_inventario
        GROUP BY COALESCE(rack, 'SIN RACK')
        ORDER BY count DESC
        LIMIT 8
      ) r
    ),
    'porUsuario', (
      SELECT COALESCE(json_agg(u), '[]'::json)
      FROM (
        SELECT 
          usuario_nombre as nombre,
          usuario_nombre as usuario,
          COUNT(*) as registros,
          COUNT(*) FILTER (WHERE cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL) as auditados
        FROM v_inventario
        WHERE usuario_nombre IS NOT NULL
        GROUP BY usuario_nombre
      ) u
    ),
    'topDiferencias', (
      SELECT COALESCE(json_agg(td), '[]'::json)
      FROM (
        SELECT 
          id, producto, descripcion, 
          COALESCE(cantidad_fisica, 0) - COALESCE(dif, 0) as stock_sistema,
          cantidad_fisica, dif, s_dif, observacion, rack, ubicacion_actual,
          familia as familia2
        FROM v_inventario
        WHERE dif != 0 AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)
        ORDER BY ABS(dif) DESC
        LIMIT 10
      ) td
    ),
    'ultimosRegistros', (
      SELECT COALESCE(json_agg(ur), '[]'::json)
      FROM (
        SELECT 
          id, producto, descripcion, lote, 
          COALESCE(cantidad_fisica, 0) - COALESCE(dif, 0) as stock_sistema,
          cantidad_fisica, dif, observacion, usuario_nombre, updated_at
        FROM v_inventario
        ORDER BY updated_at DESC
        LIMIT 15
      ) ur
    )
  ) INTO v_result;

  RETURN v_result;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;
