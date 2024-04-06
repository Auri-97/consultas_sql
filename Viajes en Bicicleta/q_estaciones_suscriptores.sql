-- Se seleccionan las columnas para los id y nombres de las estaciones que cumplan los criterios de la subconsulta.
SELECT 
  station_id,
  name
FROM 
  citibike_stations
WHERE
  station_id IN
  -- En la tabla "citibike_trips" se seleccionan las id de estaciones donde se inicio un viaje por parte de un suscriptor.
  (
    SELECT
      start_station_id
    FROM 
      citibike_trips
    WHERE
      usertype = "subscriber"
  );
  
-- En esta segunda consulta, se seleccionan las id de las estaciones, el número de bibicletas disponibles y, mediante una subconsulta, su promedio.
SELECT
  station_id,
  num_bikes_available, 
-- Mediante una subconsulta se obtiene el  promedio de bicicletas disponibles, lo que generará una nueva columna, y se le dá un alias.
  (SELECT 
    AVG(num_bikes_available) 
  FROM citibike_stations) AS avg_num_bikes_available
FROM
  citibike_stations