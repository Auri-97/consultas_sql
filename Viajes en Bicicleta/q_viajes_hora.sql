-- Se crea una tabla temporal para almacenar los viajes de más de una hora. Se utiliza la cláusula "WHERE" para filtrarlos.
WITH trips_over_1_hour AS (
  SELECT *
  FROM
    citibike_trips
  WHERE
    tripduration >= 60
)

-- Se cuentan la cantidad de viajes con una duración mayor a una hora
SELECT
  COUNT(*) AS cnt
FROM
  trips_over_1_hour