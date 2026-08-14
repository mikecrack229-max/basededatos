/*

INNER JOIN

¿Que es un JOIN?

Un join permite combinar informacion de dos o mas tablas utilizando una
relacion entre ellas

*/
USE NORTHWND

SELECT
	ProductID 'numero producto', 
	ProductName 'nombre producto',
	UnitPrice 'precio',
	UnitsInStock 'existencia',
	c.CategoryID 'numero Categoria',
	c.CategoryName 'nombre Categoria',
	s.CompanyName 'nombre del proveedor',
	(p.UnitPrice * p.UnitsInStock) AS 'valor de inventario'
FROM Products AS p
INNER JOIN
Categories AS c
ON c.CategoryID = p.CategoryID
INNER JOIN Suppliers AS s
ON s.SupplierID = p.SupplierID
WHERE p.UnitsInStock <> 0
AND
c.CategoryName IN ('Seafood', 'Confections', 'Beverages')
AND
P.ProductName LIKE 'C%'
ORDER BY [valor de inventario] ASC;

SELECT
*
FROM Categories

--Seleccionar los datos de los clientes que han hecho pedidos (orders) mostrando
--el numero de cliente, elnombre del cliente (companyName)
--numero de orden y la fecha de orden

SELECT
	o.OrderID,
	o.OrderDate,
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS 'mes orden',
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS 'dia orden',
	DATEPART(YEAR, o.OrderDate) AS 'año orden',
	o.CustomerID AS 'nombre cliente',
	UPPER (c.CompanyName) AS 'nombre cliente'
FROM Orders AS o
INNER JOIN
Customers AS c
ON c.CustomerID = o.CustomerID;
GO

--Seleccionar ademas del cliente al que se le vendieron los productos,
--queremos saber el nombre del empleado en formato de fullnam que atendio
--el pedido

SELECT
	o.OrderID,
	o.OrderDate,
	UPPER(FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS 'mes orden',
	UPPER(FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS 'dia orden',
	DATEPART(YEAR, o.OrderDate) AS 'año orden',
	o.CustomerID AS 'nombre cliente',
	UPPER (c.CompanyName) AS 'nombre cliente',
	CONCAT (e.FirstName, ' ', e.LastName) AS 'nombre completo'
FROM Orders AS o
INNER JOIN
Customers AS c
ON c.CustomerID = o.CustomerID
INNER JOIN
Employees AS e
ON o.EmployeeID = e.EmployeeID;

GO