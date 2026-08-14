/*==================================================

tema: Filtrado de registros con WHERE

Archivo: 06-filtrado-where.sql

Descripcion: En este tema se filtraran registros mediante condiciones ,
comparaciones, operadores logicos y busqueda por patrones

====================================================*/

--seleccionar columnas y filtrar filas

USE comercial_db;
GO

SELECT
	codigo,
	nombre,
	precio
FROM productos
WHERE precio > 400 ;
GO

--mostrar el producto cuyo precio es exactamente $200

SELECT TOP (10)
	p.codigo AS 'Codigo',
	p.nombre,
	p.precio
FROM productos AS p
WHERE precio = 200;
GO

--Seleccionar los datos del cliente 25
SELECT
	c.id_cliente,
	c.nombre,
	c.apellido_paterno,
	c.correo
FROM clientes AS c
WHERE id_cliente = 25;
GO

--Comparacion de cadenas de texto

--Los valores de texto deben escribirse entre comillas simples

--Seleccionar todas las categorias donde el nombre sea computo
SELECT
	c.id_categoria,
	c.nombre
FROM categorias AS c
WHERE c.nombre = 'Cómputo';

--Mostar los datos de los empleados que no pertenezacan
--al departamento 1 (numero de empleado, salario, nombre y numero de departamento)

SELECT
	e.id_empleado,
	e.nombre,
	e.salario, 
	e.id_departamento
FROM empleados AS e
WHERE e.id_departamento <> 1;

--Seleccionar los productos cuyo precuio sea superior a 450,
-- codigo, nombre, precio, existencia, utilizar alias de columnas
--y de tabla
SELECT 
	p.codigo AS 'Código',
	p.nombre AS 'nombre producto',
	p.precio,
	p.existencia
FROM productos AS p
WHERE precio > 450;


SELECT 
	p.codigo AS 'Código',
	p.nombre AS 'nombre producto',
	p.precio,
	p.existencia
FROM productos AS p
WHERE precio <= 450;

SELECT 
	p.codigo AS 'Código',
	p.nombre AS 'nombre producto',
	p.precio,
	p.existencia
FROM productos AS p
WHERE precio <> 450;
--FILTRAR FECHAS
--las fechas deben escribirse entre comillas simples
--se recomienda utilizar el formato AAAA-MM-DD

--SELECCIONAR TODAS LAS VENTAS REALIZADAS el 24 de diciembre de 2024
--mostrar numero de venta, fecha de venta, cliente al que se le vendio,
--y el empleado al que lo vendio

SELECT
	v.id_venta AS 'numero de venta',
	v.fecha AS 'fecha venta',
	v.id_cliente AS 'cliente',
	v.id_empleado AS 'empleado'
FROM ventas AS v
WHERE fecha = '2025-12-24';

SELECT
	v.id_venta AS 'numero de venta',
	v.fecha AS 'fecha venta',
	c.nombre AS 'cliente',
	e.nombre AS 'empleado'
FROM ventas AS v
INNER JOIN 
clientes AS c
ON v.id_cliente = c.id_cliente
INNER JOIN
empleados AS e
ON v.id_empleado = e.id_empleado
WHERE fecha = '2025-12-24';

-- seleccionar todas las ventas anteriores al 1 de febrero de 2025

SELECT
	v.id_venta AS 'numero venta',
	v.fecha AS 'fecha de venta',
	v.id_cliente AS cliente
FROM ventas AS v
WHERE v.fecha < '2025-02-01';

-- seleccionar todas la ventas desde el primero de octubre de 2025 en adelante

SELECT
v.id_venta AS 'numero venta',
	v.fecha AS 'fecha de venta',
	v.id_cliente AS cliente
FROM ventas AS v
WHERE v.fecha >= '2025-10-01';
GO

--COMPARACIONES CON EXPRESIONES CALCULADAS

--Seleccionar los productos cuyo valor del inventario sea mayor a $50000

--valor_inventario = precio * existencia
--NOTA: SQL server no reconoce el valor del alias dentro del 
--where en el mismo nivel de consulta, esto ocurre
-- por el orden logico en que sql server procesa las partes de una consulta

--ORDEN DE EJECUCION;
/*========================
	FROM/JOIN
	WHERE
	GROUP BY
	HAVING
	SELECT
	DISTINC
	ORDER BY
	TOP
==========================*/

--ORDEN DE ESCRITURA;
/*========================
	SELECT / TOP
	FROM / JOIN
	WHERE
	GROUP BY
	HAVING
	ORDER BY
==========================*/

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(precio * existencia) AS 'valor inventario'
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY 'valor inventario' DESC;
GO

--version 2

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(precio * existencia) AS 'valor inventario'
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY (precio * existencia) DESC;
GO

--version 3
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(precio * existencia) AS 'valor inventario'
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY 5 DESC;
GO

--desde el precio mas bajo
SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia,
	(precio * existencia) AS 'valor inventario'
FROM productos AS p
WHERE (precio * existencia) > 50000
ORDER BY p.precio DESC;
GO

--OPERADORES LOGICOS
/* Consultas con Operadores Logicos (NOT AND OR) */

-- Operador Logico AND
/*
	condicion 1 | condicion 2 | Resultado
	TRUE			TRUE		TRUE
	TRUE			FALSE		FALSE
	FALSE			TRUE		FALSE
	FALSE			FALSE		FALSE
*/

--mostrar productos con precio entre $200 y $300 que ademas
--tengan menos de 50 unidades

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE p.precio >= 200.0
	AND p.precio <= 300.0 
	AND p.existencia < 50.0;
GO

-- LO MISMO PERO DA LO CONTTRARIO EN LOS DATOS

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia
FROM productos AS p
WHERE NOT(p.precio >= 200.0
	AND p.precio <= 300.0 
	AND p.existencia < 50.0);
GO

------SELECCIONAR los empleados del deptoo 1
-- cuyo salio sea superior a $25

SELECT 
	e.nombre,
	e.id_empleado,
	e.id_departamento AS Departamento,
	e.salario,
	CONCAT(e.nombre, ' ', 
	e.apellido_paterno, '', 
	e.apellido_materno) AS nombre_completo
FROM empleados AS e
WHERE e.salario > 25.0
AND e.id_departamento=1;
GO

--OPERADOR LOGICO OR

/*========================
	OR requiere que al menos una condicion sea verdadera

	condicion 1 | condicion 2 | Resultado
	TRUE			TRUE		TRUE
	TRUE			FALSE		TRUE
	FALSE			TRUE		TRUE
	FALSE			FALSE		FALSE
==============================*/

--seleccionar los productos con existencia inferior a 10 o superior a 190

SELECT TOP 15
	p.codigo,
	p.nombre,
	P.precio,
	p.existencia
FROM productos AS p
WHERE p.existencia < 10 OR p.precio > 190
ORDER BY 4 DESC;
GO

--OPERADOR LOGICO NOT

/*========================
	NOT niega una condicion

	condicion 1 | Resultado
	TRUE			FALSE
	FALSE			TRUE


==============================*/

--seleccionar los productos no sea mayor a $400

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS P
WHERE NOT (p.precio > 400)
ORDER BY 1;
GO

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS P
WHERE (p.precio <= 400)
ORDER BY 1 DESC;
GO

--mostrar los productos que no se encuentran dentro del rango
-- de $100 a $400

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p
WHERE NOT (p.precio >= 100 AND p.precio <= 400);
GO

--mostrar los empleados de los departamentos 1 o 2 que tengan
--salario mayor a $25,000

SELECT
	e.nombre,
	e.id_departamento,
	e.salario
FROM empleados AS e
WHERE (e.id_departamento = 1
	OR e.id_departamento = 2)
	AND e.salario > 25000;


-- Operador BETEWEEN 
-- permite comprobar si un valor se encuentra dentro de un rango inclusivo

--SINTAXIS
--WHERE columna BETWEEN limite_inferior AND limite_superior;

--Mostrar empleados con salario entre $15000 y $20000

SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario BETWEEN 15000 AND 20000;
GO

SELECT
	e.id_empleado,
	e.nombre,
	e.salario
FROM empleados AS e
WHERE e.salario >= 15000 
AND e.salario <= 20000;
GO

-- Seleccionar las ventas del primero de enero del 2025 al 10 de enero de 2025
SELECT
	v.id_venta,
	v.fecha,
	FORMAT (v.fecha, 'MM') AS 'Mes en digito',
	FORMAT (v.fecha, 'MMMM') AS 'Nombre Mes en ingles',
	FORMAT (v.fecha, 'dd') AS 'Dia en digito',
	FORMAT (v.fecha, 'dddd') AS 'Nombre del dia en ingles',
	UPPER (FORMAT (v.fecha, 'dddd', 'es-ES')) AS 'Nombre del dia en ingles',
	UPPER (FORMAT (v.fecha, 'MMMM', 'es-ES')) AS 'Nombre del mes en español',
	DATEPART (MONTH, v.fecha) AS 'mes del año',
	v.id_cliente
FROM ventas AS v
WHERE v.fecha BETWEEN '2025-01-01' AND '2025-01-10';

--Seleccionar los productos que no se encuentren en el rango de precios
--de $100 a $400
SELECT
	p.id_producto,
	p.nombre,
	p.precio
FROM productos AS p
WHERE precio NOT BETWEEN 100 AND 400;


--OPERADOR IN
--PERMITE comparar un acolumna con una lista de valores
--Sintaxis: WHERE columna IN (valor_ 1, valor_2, valor_n);
--Equivalente a varias condiciones OR conectadas

--Mostrar los productos pertenecientes a las categorias 1,7,12

SELECT 
	TOP (5) *
FROM productos AS p

SELECT
	p.id_producto,
	p.nombre,
	p.precio,
	p.id_categoria
FROM productos AS p
WHERE p.id_categoria IN (1, 7 , 12);

--Seleccionar los datos de los clientes 1, 10, 25, 50, 100
SELECT
	c.id_cliente,
	c.nombre,
	c.correo
FROM clientes AS c
WHERE c.id_cliente IN (1,10,25,50,100);
GO

--Seleccionar los datos de los departamentos de Ventas, TI o Direccion
SELECT
	d.id_departamento,
	d.nombre AS 'nombre departamento'
FROM departamentos AS d
WHERE d.nombre IN ('Ventas', 'TI', 'Dirección');

SELECT
	d.id_departamento,
	d.nombre
FROM departamentos AS d
WHERE
	NOT (d.id_departamento = 1
	OR
	d.id_departamento = 2);

-- Precaucion con NOT IN Y NULL.
-- Cuando una columna contiene NULL, una comparacion con NOT IN puede
-- comportarse de manera diferente a lo esperado

--Seleccionar todos los empleados que no tengan jefe

SELECT
	e.id_empleado,
	e.nombre,
	e.id_jefe
FROM empleados AS e
WHERE (id_jefe IS NOT NULL);
GO


SELECT
	e.id_empleado,
	e.nombre,
	e.id_jefe
FROM empleados AS e
WHERE (id_jefe NOT IN (1,2,3)
	OR e.id_jefe IS NULL);
GO

SELECT
	e.id_empleado,
	e.nombre,
	e.salario,
	e.id_jefe
FROM empleados AS e
WHERE NOT (e.id_jefe = 1
	  OR e.id_jefe IS NOT NULL);


SELECT
    e.id_empleado,
    e.nombre,
    e.salario,
    e.id_jefe
FROM empleados AS e
WHERE e.id_jefe <> 1
   OR e.id_jefe IS NULL;

--Operador like
--permite buscar patrones dentro de valores de texto

--sintaxis

--WHERE columna LIKE 'patron'

-- los patrones son:
--comodin    significado
--%          cero, uno o varios carateres
--_          Exactamente un caracter
-- [abc]     un caracter icluido en la lista
-- [a-f]     un caracter incluido en el rango
-- [^abc]    uno caracter no incluido en la lista

--SELECCIONAR LOS DATOS DE LOS PRODUCTOS DONDE EL CODIGO
--COMIENCE CON P001

SELECT
	*
FROM productos
WHERE codigo LIKE 'P001%'
