/*==================================================

tema: consultas básicas con SELECT

Archivo: 05-basic-queries.sql

Descripcion: Desarrollara la capacidad para construir consultas mediante SELECT

====================================================*/

USE comercial_db;
GO

/* ====================================================================

uso de SELECT *

sintaxis:

SELECT * 
FROM <nombre_tabla>;

NOta: el * significa todas las columnas de una tabla 
(No es tan recomendado su uso)

Por que no se recomienda usarlo siempre
1. Recupera informacion de forma innecesaria
2. Reduce la claridad e la consulta
3. Puede aumentar el consumo de recursos

======================================================================*/

--Seleccionar todos los registros y campos de la tabal productos

SELECT * 
FROM productos;

--Proyeccion
SELECT 
	codigo,
	nombre,
	precio
FROM productos;
GO

-- Alias de columna
--Un alias de columna es un nombre temporal asignado a una columna 
-- dentro del resultado de una columna

-- Sin alias
SELECT
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [precio producto]
FROM productos;
GO

SELECT
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'precio producto'
FROM productos;
GO

SELECT
	codigo 'codigo producto',
	nombre 'nombre producto',
	precio 'precio producto'
FROM productos;
GO

SELECT
	codigo AS [codigo producto],
	nombre AS 'nombre producto',
	precio AS precio_producto
FROM productos;
GO

SELECT
	codigo AS [codigo producto],
	UPPER(nombre) AS 'nombre producto',
	precio AS precio_producto
FROM productos;
GO

SELECT
	codigo AS [codigo producto],
	TRIM(nombre) AS 'nombre producto',
	precio AS precio_producto
FROM productos;
GO

--alias de tabla
--Tambien se puede asiganar un alias temporal a una tabla

--Sintaxis
/*
	SELECT alias_tabla.columna
	FROM nombre_tabla AS alias_tabla;
*/

SELECT
	productos.codigo,
	productos.nombre,
	productos.precio
FROM productos;

SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;

-- Dos formas de unir tablas

--1. larga
SELECT categorias.nombre, productos.nombre
FROM categorias
INNER JOIN productos
ON categorias.id_categoria = productos.id_categoria;
GO

--2.corta
SELECT c.id_categoria AS [#Numero Categoria],
	   c.nombre AS [Nombre categoria],
	   p.id_producto AS [#Producto],
	   p.nombre AS [Nombre Producto],
	   p.precio,
	   p.existencia
FROM categorias AS c
INNER JOIN productos AS p
ON c.id_categoria = p.id_categoria;
GO

--Campos calculados - Columnas Calculadas
--Una columna calculada es el resultado de una expresion incluida en la 
--lista de seleccion 
--No existe fisicamente en la tabla

SELECT
	p.codigo,
	p.nombre,
	p.precio,
	p.existencia * p.precio AS 'valor inventario'
FROM productos AS p;

--Seleccionar el nombre apellido paterno, salario y simular
--Como quedaria el salario de cada empleado si recibiera un aumento
--fijo de $1000 pesos, el campo se debe llamar salario_simulado

SELECT 
	e.nombre,
	e.apellido_paterno,
	CONCAT(e.apellido_paterno, '', e.apellido_paterno, '', e.apellido_materno) AS 'nombre completo',
	YEAR (e.fecha_ingreso) AS año_ingreso,
	MONTH(e.fecha_ingreso) AS mes_ingreso,
	DAY(e.fecha_ingreso) AS dia_ingreso,
	e.fecha_ingreso,
	e.salario,
	(e.salario + 1000) AS [salario total]
FROM empleados AS e;

--Mostrar de una venta cual es su numero, cantidad vendida, precio,
--descuento, importe_bruto (cantidad * precio) y ademas el
-- importe_descuento ((importe_bruto * descuento) / 100)

SELECT
	d.id_detalle_venta,
	d.id_venta,
	d.cantidad,
	d.precio,
	d.descuento,
	d.cantidad * d.precio AS importe_bruto,
	(d.cantidad + d.precio * d.descuento / 100.0) AS importe_descuento
FROM detalle_ventas AS d;

/*====================================================
Operadores aritmeticos en SQL SERVER

+ SUMA
- RESTA
* MULTIPLICACION
/ DIVISION
% MODULO - RESIDUO DE LA DIVISION

===================================================*/

---------------------------------------------------------------------------------------------------

-- Uso de la clausula DISTINCT

-- Elimina del resultado las filas que tengan valores 
--repetidos en todas las columnas seleccionadas

SELECT 
	c.sexo
FROM clientes AS c;

SELECT 
	COUNT (c.sexo) AS cantidad_sexo
FROM clientes AS c;

SELECT COUNT (DISTINCT c.sexo) AS numero_sexos
FROM clientes AS c;

SELECT COUNT (sexo) AS 'mujeres'
FROM clientes
WHERE sexo = 'M';

--seleccionar los distintos descuentos que se realizan a las ventas

SELECT DISTINCT dv.descuento
FROM detalle_ventas AS dv
ORDER BY descuento DESC;



--TODO: distinc con mas de un campo