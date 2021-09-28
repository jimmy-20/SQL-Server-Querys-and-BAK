SELECT * FROM Employees

SELECT EmployeeID,FirstName,ReportsTo FROM Employees

---------------------
--Seleccionar todos los registros de la tabla orders
SELECT * FROM Orders

--Seleccionar todos los registros de la tabla orders cuando
--el EmployeeID sea 5 y 6
SELECT * FROM Orders WHERE EmployeeID = 5 or EmployeeID = 6
SELECT * FROM Orders WHERE EmployeeID in (5,6)

--Seleccionar todos los registros de la tabla orders cuando
--el EmployeeID sea 5 y 6 y ademas el costo de transporte
--(Freight) sea mayor a 50
SELECT * FROM Orders WHERE EmployeeID in(5,6) and Freight > 50
SELECT * FROM Orders WHERE (EmployeeID = 5 or EmployeeID = 6) and Freight > 50

--Operaciones con cadenas de texto
/*
Mostrar todos los Customers ID de la tabla Orders cuando empiecen con H
*/
SELECT * FROM Orders WHERE CustomerID like 'H%'

--Campos Calculados
SELECT od.OrderID, 
od.ProductID as[Id del producto],
od.UnitPrice as [Precio Unitario],
od.Quantity as [Cantidad],
od.Discount as [Descuento],
(od.UnitPrice * od.Quantity) as SubTotal,
(od.UnitPrice * od.Quantity) - (od.UnitPrice * od.Quantity * od.Discount)
as SubTotalDescuento
FROM [Order Details] od
WHERE
(od.UnitPrice * od.Quantity) - 
(od.UnitPrice * od.Quantity * od.Discount) > 150

/*
Mostrar todos los productos cuyo proveedor sea 4,5 y 9
Mostrar las ordenes del año 1997 y que sean del mes de mayo
Mostrar las ordenes en entre las fechas de 1997/05/10 - 1997/12/10
Mostrar los productos descontinuados
*/

SELECT * FROM Products WHERE 
SupplierID = 4 or SupplierID = 5 or SupplierID = 9

SELECT * FROM Orders WHERE YEAR(OrderDate) = 1997 and MONTH(OrderDate) = 5

SELECT * FROM Orders WHERE OrderDate between '1997/05/10' and '1997/12/10'

SELECT * FROM Products where Discontinued = 1
SELECT * FROM Products p WHERE p.Discontinued <> 0
SELECT * FROM Products p WHERE p.Discontinued = 1

/*
Mostrar las ordenes realizas por los empleados 5 y 8, 
cuyo costo de transporte sea mayor a 50 
y hallan sido realizadas en el año 1998
*/

SELECT * FROM Orders o WHERE 
(o.EmployeeID = 5 or o.EmployeeID = 8) and (o.Freight > 50 and YEAR(o.OrderDate) = 1998)

SELECT * FROM Orders WHERE
EmployeeID in (5,8) and Freight > 50 and YEAR(OrderDate) = 1998

/*
Diferencia de dias con la fecha de envio del 
producto respecto a la fecha en la que el cliente requiere el producto
*/
SELECT 
o.OrderID,
o.RequiredDate,
o.ShippedDate,
DATEDIFF(DAY, o.ShippedDate, o.RequiredDate)
as (Diferencia de dias)
FROM Orders o
WHERE
DATEDIFF (DAY, o.ShipAddress, o.RequiredDate) < 0
ORDERS BY [Diferencia de dias] ass
