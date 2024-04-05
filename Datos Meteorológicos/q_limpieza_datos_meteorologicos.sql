/* Se seleccionan las columnas de estación, fecha, temperatura, velocidad del viento y precipitación. Además, de las últimas tres, 
se crean nuevas columnas en las que de dejaran vacíos los posibles datos anómalos */
SELECT
  stn, 
  date, 
  temp,
  wdsp,
  prcp,
IF (temp=9999.9,NULL,temp) AS temperature,
IF (wdsp="999.9",NULL, CAST(wdsp AS FLOAT)) AS wind_speed,
IF (prcp=99.9,0,prcp) AS precipitation
FROM 
  noaa_weather_data_2020
-- Se seleccionan dos estaciones de interés, una de la que se eliminarán datos y otra de las que no.
WHERE 
  stn ="725846" OR stn="761220"
-- Se ordenan los resultados de mayor a menor fecha y de menor a mayor número de estación.
ORDER BY 
  date DESC,
  stn ASC