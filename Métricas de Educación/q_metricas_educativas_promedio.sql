-- Se seleccionan las columnas correspondientes al nombre del país, código, indicador educativo y valor de la métrica.
SELECT 
  education.country_name, 
  summary.country_code, 
  indicator_name,
  education.value
-- Se selecciona la tabla de educación internacional y se le da un alias.
FROM  
  international_education AS education
-- Se unen las tablas a partir del código del país en cuestión.
INNER JOIN 
  education_country_summary AS summary ON 
    education.country_code = summary.country_code;


-- Se selecciona la columna región de la tabla "education_country_summary" y se promedian los valores de todos los indicadores.
SELECT  
  AVG(educacion.value) AS average_value, 
  summary.region
FROM  
  international_education AS educacion
 -- Se unen las tablas "education_country_summary" y "education_country_summary" mediante el código del país. Se da un alias a la segunda tabla.
INNER JOIN  
  education_country_summary AS summary ON 
  educacion.country_code = summary.country_code
-- Se seleccionan solo las filas que tengan regiones asociadas.
WHERE 
  summary.region IS NOT null
-- Los resultados se agrupan por región y se ordenan de acuerdo al promedio obtenido.
GROUP BY 
  summary.region
ORDER BY 
  average_value DESC  