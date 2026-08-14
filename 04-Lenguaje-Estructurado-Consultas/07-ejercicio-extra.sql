--Seleccionar la base de datos
USE NORTHWND;
GO

--Mostrar los clientes de mexico y alemania ademas que sean solo de
-- Stuttgart

SELECT
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.Country,
	c.City
FROM Customers AS c
WHERE Country = 'Mexico'
	  OR 
	  c.Country = 'Germany'
	  AND 
	  c.City = 'Stuttgart';

--
SELECT
	c.CustomerID,
	c.CompanyName,
	c.Region,
	c.Country,
	c.City
FROM Customers AS c
WHERE c.Country IN ('Mexico', 'Germany')
	  OR c.city = 'Stuttgart'

-- Mostrar las ventas realizadas en francia, brasil, Belgica
-- de 10 de Julio de 1996 a 31 de diciembre de 1998 pero que tengan region de envio
--para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de las ,as
--cercana a las mas antigua
SELECT
	o.OrderID AS 'numero de orden', 
	o.CustomerID AS 'cliente',
	o.ShipCountry AS 'pais de envio',
	o.OrderDate AS 'fecha pedido',
	UPPER (FORMAT(o.OrderDate, 'MMMM', 'es-ES')) AS 'mes pedido',
	UPPER (FORMAT(o.OrderDate, 'dddd', 'es-ES')) AS 'dia pedido',
	DATEPART (YEAR, o.OrderDate) AS 'año pedido' 
FROM Orders AS o
WHERE o.ShipCountry IN ('France', 'Brazil', 'Belgium')
	  AND 
	  o.OrderDate BETWEEN '1996-07-10' AND '1998-12-31'
	  AND 
	  ShipRegion IS NOT NULL
	  AND 
	  o.CustomerID IN ('VICTE', 'HANAR', 'SUPRD')
ORDER BY o.OrderDate DESC;
