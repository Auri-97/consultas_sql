/* Se seleccionan las columnas necesarias de las tablas "Warehouse" y "Orders", así como las columnas de la subconsulta y el resumen 
de cumplimiento. */
SELECT
  Warehouse.id_deposito,
  CONCAT(Warehouse.estado , ":", Warehouse.id_deposito) AS estado_deposito,
  COUNT(Orders.id_pedido) AS numero_de_ordenes,
  -- Se realiza la subconsulta para contar el total de ordenes.
  (SELECT
    COUNT(*)
  FROM `orders` AS Orders
  )
  AS ordenes_totales,
  -- Se asigna una etiqueta a cada depósito dependiendo del porcentaje de ordenes de las que se encarga.
  CASE
    WHEN COUNT(Orders.id_pedido)/(SELECT COUNT(*) FROM `orders` AS Orders) <= 0.2
    THEN "0-20% de ordenes manejadas"
    WHEN COUNT(Orders.id_pedido)/(SELECT COUNT(*) FROM `orders` AS Orders) > 0.2
    AND COUNT(Orders.id_pedido)/(SELECT COUNT(*) FROM `orders` AS Orders) <= 0.6
    THEN "21-60% de ordenes manejadas"
  ELSE "Más del 60% de ordenes manejadas"
  END AS resumen_de_cumplimiento
FROM `warehouse` AS Warehouse
-- Se unen las tablas "Orders" y "Warehouse" de acuerdo al id del depósito.
LEFT JOIN `orders` AS Orders
  ON Orders.id_deposito = Warehouse.id_deposito
-- Los resultados se ordenan por estado e id del depósito.
GROUP BY
  Warehouse.id_deposito,
  Warehouse.estado
-- Se asegura que todos los resultados mostrados tengan al menos una orden asociada.
HAVING
  COUNT(Orders.id_pedido) > 0;