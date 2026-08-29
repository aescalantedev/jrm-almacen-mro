CREATE OR REPLACE FUNCTION get_dashboard_ira_stats()
RETURNS JSON AS $$
DECLARE
  v_result JSON;
  v_auditados INT;
  v_conformes INT;
  v_total_sku INT;
  v_valor_fisico NUMERIC;
  v_descalce_bruto NUMERIC;
  v_total_faltantes INT;
  v_total_sobrantes INT;
BEGIN
  -- 1. Calcular KPIs base
  SELECT 
    COUNT(*),
    COUNT(*) FILTER (WHERE cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL),
    COUNT(*) FILTER (WHERE observacion = 'OK' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)),
    COUNT(*) FILTER (WHERE observacion = 'FALTANTE' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)),
    COUNT(*) FILTER (WHERE observacion = 'SOBRANTE' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)),
    COALESCE(SUM(cantidad_fisica * costo_unitario), 0),
    COALESCE(SUM(ABS(dif)), 0)
  INTO 
    v_total_sku, v_auditados, v_conformes, v_total_faltantes, v_total_sobrantes, v_valor_fisico, v_descalce_bruto
  FROM v_inventario;

  -- 2. Construir el JSON completo
  SELECT json_build_object(
    'kpis', json_build_object(
      'iraSKU', CASE WHEN v_auditados > 0 THEN ROUND((v_conformes::NUMERIC / v_auditados) * 100, 1) ELSE 0 END,
      'iraFinanciera', 100.0, -- Simplificado (Requiere historial real de precios si se quiere varianza real)
      'metaIRA', 95.0,
      'metaFinanciera', 98.0,
      'descalceNeto', 0.0,
      'descalceBruto', ROUND(v_descalce_bruto, 2),
      'descalceNetoUnid', 0,
      'valorFisico', ROUND(v_valor_fisico, 2),
      'valorSistema', ROUND(v_valor_fisico, 2),
      'totalSKU', v_total_sku,
      'totalAuditados', v_auditados,
      'totalConformes', v_conformes,
      'totalConError', v_auditados - v_conformes,
      'totalFaltantes', v_total_faltantes,
      'totalSobrantes', v_total_sobrantes,
      'porcentajeAuditado', CASE WHEN v_total_sku > 0 THEN ROUND((v_auditados::NUMERIC / v_total_sku) * 100, 1) ELSE 0 END
    ),
    'porFamilia2', (
      SELECT COALESCE(json_agg(f), '[]'::json)
      FROM (
        SELECT 
          COALESCE(familia, 'GENERAL') as familia,
          COUNT(*) as total,
          COUNT(*) FILTER (WHERE observacion = 'OK' AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)) as conformes,
          COUNT(*) FILTER (WHERE observacion IN ('FALTANTE', 'SOBRANTE') AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)) as con_error,
          COUNT(*) FILTER (WHERE cantidad_fisica IS NULL AND usuario_nombre IS NULL) as pendientes
        FROM v_inventario
        GROUP BY COALESCE(familia, 'GENERAL')
        ORDER BY total DESC
      ) f
    ),
    'causaRaiz', (
      SELECT COALESCE(json_agg(c), '[]'::json)
      FROM (
        SELECT 
          observacion,
          COUNT(*) as cantidad,
          CASE WHEN v_auditados > 0 THEN ROUND((COUNT(*)::NUMERIC / v_auditados) * 100, 1) ELSE 0 END as porcentaje
        FROM v_inventario
        WHERE cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL
        GROUP BY observacion
        ORDER BY cantidad DESC
      ) c
    ),
    'topImpacto', (
      SELECT COALESCE(json_agg(t), '[]'::json)
      FROM (
        SELECT 
          producto,
          descripcion,
          familia,
          COALESCE(cantidad_fisica, 0) - COALESCE(dif, 0) as stock_sistema,
          cantidad_fisica,
          dif,
          costo_unitario,
          (dif * costo_unitario) as impacto_monetario
        FROM v_inventario
        WHERE dif != 0 AND (cantidad_fisica IS NOT NULL OR usuario_nombre IS NOT NULL)
        ORDER BY ABS(dif * costo_unitario) DESC
        LIMIT 10
      ) t
    )
  ) INTO v_result;

  RETURN v_result;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;
