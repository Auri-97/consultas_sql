-- En esta primera consulta, se seleccionan la fecha máxima y mínima de las ventas para obtener el rango de tiempo.
SELECT
  MIN(date) AS min_date,
  MAX(date) AS max_date
FROM
  sales;

/* Se selecciona la columna de id del producto. Además, se crean columnas: de año y mes a partir de la fecha, de precio máximo 
por unidad y cantidad de unidades vendidas. */
SELECT 
  EXTRACT(YEAR FROM date) AS Year,
  EXTRACT(MONTH FROM date) AS Month,
  product_id AS ProductId,
  ROUND(MAX(unit_price),2) AS UnitaryPrice,
  SUM(Quantity) AS UnitsSold 
FROM
  sales
-- Se agrupan los resultados de acuerdo con el año, mes e id del producto.
GROUP BY 
  Year,
  Month,
  ProductId
-- Los resultados se ordenan por los mismos criterios que se agruparon.
ORDER BY 
  Year,
  Month,
  ProductId;