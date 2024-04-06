/* Se busca encontrar las bicicletas más usadas. Comenzamos seleccionando el id de la bicicleta y la suma del tiempo de los distintos 
viajes */
SELECT
  bikeid AS most_used_bikes,
  SUM(tripduration) AS trip_duration
FROM
  citibike_trips
-- Se agrupan las filas por id de la bicicleta.
GROUP BY
  bikeid
-- Las filas se ordenan de acuerdo con los minutos de uso.
ORDER BY
  trip_duration DESC
LIMIT
  5;
  
/* En esta segunda consulta, se busca encontrar las cinco estaciones dónde más viajes se inician. Comenzamos seleccionando el id 
de estación y el conteo de filas para obtener la cantidad de viajes */
SELECT  
  start_station_id,
  COUNT(*) AS trip_count
FROM
  citibike_trips
-- Los resultados se agrupan por id de estación.
GROUP BY
  start_station_id
-- Los resultados se ordenan de mayor a menor cantidad de viajes.
ORDER BY
  trip_count DESC
LIMIT 5;

/* En esta consulta se busca hallar las estaciones de inicio con mayor cantidad de viajes de larga duración por las biciletas más 
utilizadas. Se seleccionan las columnas a mostrar: estación de inicio, cantidad de viajes, id de la bicileta y duraci{on del viaje */
SELECT  
  trips.start_station_id,
  COUNT(*) AS trip_count,
  most.bikeid,
  tripduration
-- Se realiza la subconsulta para hallar las cinco bicicletas más utilizadas.
FROM
  (SELECT
    bikeid, 
    SUM(tripduration) AS trip_duration
  FROM
    citibike_trips
  GROUP BY
    bikeid
  ORDER BY
    trip_duration DESC
  LIMIT 5
  ) AS most
-- Se asocian las bicicletas más utilizadas con la información de los respectivos viajes.
INNER JOIN
  citibike_trips AS trips
ON
  most.bikeid = trips.bikeid
-- Se agrupan los resultados por estación de inicio, id de las bicicletas más utilizadas y duración del viaje.
GROUP BY
  trips.start_station_id,
  most.bikeid,
  tripduration
-- Los resultados se ordenan de mayor a menor conteo y duración de viajes.
ORDER BY
  trip_count DESC,
  tripduration DESC
-- Se limitan a los cinco primeros resultados.
LIMIT 5;