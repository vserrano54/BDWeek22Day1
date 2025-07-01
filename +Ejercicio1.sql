USE empleadoss_departamentoss;
-- EJERCICIOS
-- 1. Obtener los datos completos de los empleados.

SELECT * 
FROM empleados;

-- 2. Obtener los datos completos de los departamentos.

SELECT * 
FROM departamentos;

-- 3. Obtener los datos de los empleados con cargo ‘Secretaria’.
SELECT * 
FROM empleados
WHERE upper(cargoE) = 'SECRETARIA';

-- 4. Obtener el nombre y salario de los empleados.

SELECT nomEmp, salEmp
FROM empleados;

-- 5. Obtener los datos de los empleados vendedores, ordenado por nombre.
SELECT * 
FROM empleados
WHERE UPPER(cargoE) = 'VENDEDOR'
ORDER BY nomEmp;

-- 6. Listar el nombre de los departamentos.
SELECT nombreDpto
FROM departamentos;

-- 7. Obtener el nombre y cargo de todos los empleados, ordenado por salario.
SELECT nomEmp, cargoE, salEmp
FROM empleados
ORDER BY salEmp;

-- 8. Listar los salarios y comisiones de los empleados del departamento 2000, ordenado por comisión.

SELECT salEmp, comisionE
FROM empleados
WHERE codDepto = 2000
ORDER BY comisionE;

-- 9. Listar todas las comisiones.
SELECT comisionE
FROM empleados
ORDER BY comisionE ASC;

-- 10. Obtener el valor total a pagar que resulta de sumar a los empleados 
-- del departamento 3000 una bonificación de 500.000, en orden alfabético del empleado

SELECT nomEmp, salEmp, (salEmp + 500000) AS 'pago estimado'
FROM empleados
ORDER BY nomEmp ASC;

-- 11. Obtener la lista de los empleados que ganan una comisión superior a su sueldo.

SELECT nomEmp, salEmp, comisionE
FROM empleados
WHERE comisionE > salEmp;


-- 12. Listar los empleados cuya comisión es menor o igual que el 30% de su sueldo.
SELECT nomEmp, salEmp, comisionE
FROM empleados
WHERE comisionE <= salEmp * 0.30;

-- 13.Elabore un listado donde para cada fila, figure ‘Nombre’ y ‘Cargo’ 
-- antes del valor respectivo para cada empleado.
SELECT nomEmp, cargoE
FROM empleados;

-- 14. Hallar el salario y la comisión de aquellos empleados cuyo número de 
-- documento de identidad es superior al ‘19.709.802’.
SELECT nDIEmp, salEmp, comisionE
FROM empleados
WHERE nDIEmp > '19.709.802';

-- 15. Muestra los empleados cuyo nombre empiece entre las letras J y Z (rango).
-- Liste estos empleados y su cargo por orden alfabético.
SELECT nomEmp,cargoE
FROM empleados
WHERE UPPER(nomEmp) > 'J' AND UPPER(nomEmp) < 'Z'
ORDER BY nomEmp;

-- 16. Listar el salario, la comisión, el salario total (salario + comisión), 
-- documento de identidad del empleado y nombre, de aquellos empleados que 
-- tienen comisión superior a 1.000.000, ordenar el informe por el número del documento de identidad

SELECT salEmp, comisionE, (salEmp + comisionE) AS 'salario total', nomEmp, nDIEmp
FROM empleados
WHERE comisionE > 1000000
ORDER BY nDIEmp;


-- 17. Obtener un listado similar al anterior, pero de aquellos empleados que NO tienen comisión

SELECT salEmp, comisionE, (salEmp + comisionE) AS 'salario total', nomEmp, nDIEmp
FROM empleados
WHERE comisionE = 0
ORDER BY nDIEmp;

-- 18. Hallar los empleados cuyo nombre no contiene la cadena «MA»
SELECT nomEmp
FROM empleados
WHERE UPPER(nomEmp) NOT LIKE '%MA%';

-- 19. Obtener los nombres de los departamentos que no sean “Ventas” ni “Investigación” NI
-- ‘MANTENIMIENTO’.
SELECT *
FROM departamentos
WHERE UPPER(nombreDpto) NOT IN ('VENTAS','INVESTIGACIÓN','MANTENIMIENTO');

-- 20. Obtener el nombre y el departamento de los empleados con cargo ‘Secretaria’ 
-- o ‘Vendedor’, que no trabajan en el departamento de “PRODUCCION”, 
-- cuyo salario es superior a $1.000.000, ordenados por fecha de incorporación.
SELECT e.nomEmp,d.nombreDpto        
FROM empleados e
INNER JOIN departamentos d ON d.codDepto = e.codDepto
WHERE UPPER(e.cargoE) IN ('SECRETARIA', 'VENDEDOR')
AND UPPER(d.nombreDpto) <> 'PRODUCCIÓN'
AND e.salEmp > 1000000
ORDER BY e.fecIncorporacion;

-- 21. Obtener información de los empleados cuyo nombre tiene exactamente 11 caracteres

SELECT *
FROM empleados
WHERE CHAR_LENGTH(nomEmp) = 11;

-- 22. Obtener información de los empleados cuyo nombre tiene al menos 11 caracteres
SELECT *
FROM empleados
WHERE CHAR_LENGTH(nomEmp) >= 11;

-- 23. Listar los datos de los empleados cuyo nombre inicia por la letra ‘M’,
-- su salario es mayor a $800.000 o reciben comisión y trabajan para 
-- el departamento de ‘VENTAS’
SELECT e.nomEmp,d.nombreDpto, e.salEmp, e.comisionE        
FROM empleados e
INNER JOIN departamentos d ON d.codDepto = e.codDepto
WHERE e.salEmp > 800000 OR e.comisionE > 0
AND UPPER(d.nombreDpto) = 'VENTA';

-- 24. Obtener los nombres, salarios y comisiones de los empleados que 
-- reciben un salario situado entre la mitad de la comisión la propia comisión.

SELECT nomEmp, salEmp, comisionE
FROM empleados
WHERE salEmp BETWEEN (comisionE/2) and comisionE;

-- 25. Mostrar el salario más alto de la empresa.
SELECT nomEmp, salEmp
FROM empleados
WHERE salEmp = (SELECT MAX(salEmp) FROM empleados);

SELECT nomEmp, salEmp
FROM empleados
ORDER BY salEmp DESC
LIMIT 1;

-- 26. Mostrar cada una de las comisiones y el número de empleados que las reciben. Solo si tiene comisión.

SELECT comisionE, count(*) as 'Num empleados' 
FROM empleados 
GROUP BY comisionE 
HAVING comisionE > 0; 

-- 27. Mostrar el nombre del último empleado de la lista por orden alfabético.

SELECT max(nomemp) as 'Mayor alfabeticamente' 
from empleados;

-- 28. Hallar el salario más alto, el más bajo y la diferencia entre ellos.

SELECT MAX(salEmp) AS 'salario mayor', MIN(salEmp) AS 'salario menor', MAX(salEmp) - MIN(salEmp) AS 'difrencia'
FROM empleados;

-- 29. Mostrar el número de empleados de sexo femenino y de sexo masculino, por departamento.

SELECT codDepto, sexEmp, COUNT(*)
FROM empleados
GROUP BY codDepto, sexEmp;

-- 30. Hallar el salario promedio por departamento.

SELECT codDepto, AVG(salEmp)
FROM empleados
GROUP BY codDepto;

-- 31. Mostrar la lista de los empleados cuyo salario es mayor o 
-- igual que el promedio de la empresa. Ordenarlo por departamento.

SELECT nDIEmp, salEmp
FROM empleados
WHERE salEmp >= (SELECT AVG(salEmp) FROM empleados)
ORDER BY codDepto DESC;

-- 32. Hallar los departamentos que tienen más de tres empleados.
--  Mostrar el número de empleados de esos departamentos.
SELECT d.codDepto, d.nombreDpto, COUNT(*) AS 'Num empleados'
FROM departamentos d 
INNER JOIN empleados e ON e.codDepto = d.codDepto
GROUP BY d.codDepto
HAVING COUNT(*) >= 3;

-- 33. Mostrar el código y nombre de cada jefe, junto al número de empleados 
-- que dirige. Solo los que tengan mas de dos empleados (2 incluido).

SELECT j.nDIEmp, j.nomEmp, COUNT(*) AS 'Num Empleados'
FROM empleados e
INNER JOIN empleados j ON j.nDIEmp = e.jefeID
GROUP BY j.nDIEmp, j.nomEmp
HAVING COUNT(*) >= 2
ORDER BY COUNT(*) DESC;

-- 34. Hallar los departamentos que no tienen empleados
SELECT d.codDepto, d.nombreDpto
FROM departamentos d
INNER JOIN empleados e ON e.codDepto = d.codDepto
GROUP BY d.codDepto
HAVING COUNT(*) = 0;

-- 35. Mostrar el nombre del departamento cuya suma de salarios sea la más alta, 
-- indicando el valor de la suma.
SELECT d.nombreDpto, SUM(e.salEmp)
FROM departamentos d
INNER JOIN empleados e ON e.codDepto = d.codDepto
GROUP BY d.nombreDpto
ORDER BY SUM(e.salEmp) DESC
LIMIT 1

















