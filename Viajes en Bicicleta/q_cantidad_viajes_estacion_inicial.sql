-- Se selecciona el id de la estación, su nombre y se cambia el nombre del conteo generado en la subconsulta por uno más descriptivo
SELECT
  station_id,
  name,
  number_of_rides AS number_of_rides_starting_at_station
/* Se crea una subconsulta para realizar el conteo de la cantidad de veces que aparece cada id de estación en la tabla "citibike_trips",
se le da el alias de "station_num_trips" */
FROM (
  SELECT
    start_station_id,
    COUNT(*) AS number_of_rides
  FROM
    citibike_trips
  GROUP BY
    start_station_id
) AS station_num_trips
/* Se establece la relación entre la tabla con información de los viajes, establecida en la subconsulta, y la tabla con la información 
de identificación de cada estación*/
INNER JOIN citibike_stations 
ON station_num_trips.start_station_id = citibike_stations.station_id
-- Los resultados se ordenan de mayor a menor número de viajes.
ORDER BY
  number_of_rides DESC;