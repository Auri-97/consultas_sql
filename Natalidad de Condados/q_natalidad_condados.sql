/* Se seleccionan todas las columnas presentes en la tabla "county_natality". Se añaden cláusulas para ordenar los datos 
por la cantidad de nacimientos de manera descendente y limitarlos a las diez primeras filas. En resumen, se muestran todas 
las columnas de los diez condados con mayor natalidad en cualquier año.*/
SELECT 
  *
FROM 
  county_natality
ORDER BY
  Births
DESC
LIMIT 
  10;
-- A la consulta anterior se le añade una cláusula para que solo se consideren las natalidades del año 2018.
SELECT 
  *
FROM 
  county_natality
WHERE 
  Year = '2018-01-01'
ORDER BY
  Births
DESC
LIMIT 
  10;
/* Se modifica la primera consulta para obtener todas las columnas de los diez condados con menor natalidad 
en cualquier año. */ 
SELECT 
  *
FROM 
  county_natality
ORDER BY
  Births
ASC
LIMIT 
  10;
