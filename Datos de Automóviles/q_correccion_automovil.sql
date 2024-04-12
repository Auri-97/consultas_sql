-- Para corregir los datos se arreglan los errores de tipado en la columna "num_of_cylinders" de la tabla "car_info".
UPDATE car_info
SET num_of_cylinders = "two" 
WHERE num_of_cylinders = "tow";

-- En la misma tabla "car_info", pero en la columna "compression_ratio" se eliminan los datos anómalos.
DELETE FROM car_info
WHERE compression_ratio = 70