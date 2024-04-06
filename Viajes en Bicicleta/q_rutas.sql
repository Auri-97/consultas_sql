/* Se selecciona el tipo de usuario, se crea la ruta concatenando la estación inicial y final,
y se calcula la duración promedio del viaje en horas */
SELECT 
  usertype,
  CONCAT(start_station_name, " to ", end_station_name) AS route,
  COUNT(*) AS num_trips,
  ROUND(AVG(tripduration / 60), 2) AS duration
FROM
  citibike_trips
-- Los resultados se agrupan de acuerdo a las estaciones de inicio y fin del viaje, así como el tipo de usuario.
GROUP BY
  start_station_name,
  end_station_name,
  usertype
-- Todo esto se ordena para que aparezcan las diez rutas con mayor número de viajes, aunque en este caso son nueve al no desear eliminar registros.
ORDER BY
  num_trips DESC
LIMIT 10
