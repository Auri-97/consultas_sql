-- Se seleccionan las fechas, regiones y ganancias por tipo de bolsa.
SELECT 
  date,
  region,
  small_bags,
  large_bags,
  xlarge_bags,
  total_bags,
  -- Se realiza la suma de todas las ganancias por bolsa para comprobar los valores previamente calculados.
  small_bags + large_bags + xlarge_bags AS total_bags_calc
FROM
  avocado;
  
-- En la segunda consulta se seleccionan la fecha, región, ingresos por bolsas pequeñas y totales, y se opera el porcentaje que reprresentan las bolsa pequeñas. 
SELECT
  date,
  region,
  total_bags,
  small_bags,
  (small_bags / total_bags)*100 AS small_bags_percent
FROM
 avocado
 -- Se asegura que en todos los resultados la cantidad de bolsas totales sea distintas a cero.
WHERE
  total_bags <> 0