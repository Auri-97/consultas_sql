-- Se inserta una nueva fila en la tabla "customer_data".
INSERT INTO customer_data
  (id_cliente,nombre,direccion,ciudad,estado,codigo_postal,pais)
VALUES
  (2645,"John Thompson", "333 SQL Road","Jackson","MI",49202,"US");

-- De la misma manera que se insertó la nueva fila, puede eliminarse.
DELETE FROM customer_data
WHERE nombre = "John Thompson";

-- Se seleccionan los id de cliente sin repetición.
SELECT  
DISTINCT id_cliente
FROM 
  customer_data
-- Se selecciona todas las filas en las que se tenga el código "OH" como dos primeras letras de la columna  
WHERE
  SUBSTR(estado,1,2)="OH";

-- La consulta indica la longitud de los valores en la columna estado, para asegurar que solo sean dos.
SELECT  
  LENGTH (estado) AS letras_estado
FROM 
  customer_data