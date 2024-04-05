/*Se seleccionan las columnas correspondientes al número de expediente y al estado procesal en cada mes. Además,
se añade una columna para mostrar si existe un cambio en el estatus del proceso.*/
SELECT 
  expediente_mayo,
  expediente_septiembre,
  estado_procesal_mayo,
  estado_procesal_septiembre,
IF(estado_procesal_mayo=estado_procesal_septiembre, 'Sin cambio','Cambio') AS cambio_status
-- Se combinan ambas tablas de acuerdo con el número de expediente.
FROM 
  `enero_septiembre_2023`
INNER JOIN
  `enero_mayo_2023` ON 
  expediente_septiembre = expediente_mayo