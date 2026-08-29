CREATE OR REPLACE FUNCTION get_stock_anterior(p_sku TEXT)
RETURNS NUMERIC AS $$
DECLARE
  v_stock NUMERIC;
BEGIN
  SELECT 
    COALESCE(SUM(CASE WHEN tipo = 'INGRESO' THEN cantidad ELSE 0 END), 0) -
    COALESCE(SUM(CASE WHEN tipo = 'SALIDA' THEN cantidad ELSE 0 END), 0)
  INTO v_stock
  FROM movimientos
  WHERE producto = p_sku;
  
  RETURN v_stock;
END;
$$ LANGUAGE plpgsql SECURITY INVOKER;
