-- Se seleccionan las columnas nombre y puesto de la tabla "employees", la columna nombre de la tabla "departments". Se colocan alias descriptivos.
SELECT 
  employees.nombre AS nombre_empleado,
  puesto AS puesto_empleado,
  departments.nombre AS nombre_departamento
FROM 
  employees
-- Se une la tabla "departments" a "employees" de acuerdo al id del departamento
RIGHT JOIN
  departments ON 
   employees.id_departamento = departments.id_departamento