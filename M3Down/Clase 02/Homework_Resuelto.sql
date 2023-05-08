use adventureworks;
-- 1) 
SELECT DISTINCT c.LastName, c.FirstName
FROM salesorderheader h
	JOIN contact c
		ON (h.ContactID = c.ContactID)
	JOIN salesorderdetail d
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN product p
		ON (d.ProductID = p.ProductID)
	JOIN productsubcategory s
		ON (p.ProductSubcategoryID = s.ProductCategoryID)
	JOIN shipmethod e
		ON (e.ShipMethodID = h.ShipMethodID)
WHERE YEAR(h.OrderDate) BETWEEN 2002 AND 2003
AND s.Name = 'Mountain Bikes'
AND e.Name = 'CARGO TRANSPORT 5';

-- 2) 
SELECT c.LastName, c.FirstName, SUM(d.OrderQty) as Cantidad
FROM salesorderheader h
	JOIN contact c
		ON (h.ContactID = c.ContactID)
	JOIN salesorderdetail d
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN product p
		ON (d.ProductID = p.ProductID)
	JOIN productsubcategory s
		ON (p.ProductSubcategoryID = s.ProductCategoryID)
WHERE YEAR(h.OrderDate) BETWEEN 2002 AND 2003
AND s.Name = 'Mountain Bikes'
GROUP BY c.LastName, c.FirstName
ORDER BY Cantidad DESC;

-- 3) 
SELECT YEAR(h.OrderDate) as Año, e.Name AS MetodoEnvio, SUM(d.OrderQty) as Cantidad
FROM salesorderheader h
	JOIN salesorderdetail d
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN shipmethod e
		ON (e.ShipMethodID = h.ShipMethodID)
GROUP BY YEAR(h.OrderDate), e.Name
ORDER BY YEAR(h.OrderDate), e.Name;

-- 4) 
SELECT c.Name AS Categoria, SUM(d.OrderQty) as Cantidad, SUM(d.LineTotal) as Total
FROM salesorderheader h
	JOIN salesorderdetail d
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN product p
		ON (d.ProductID = p.ProductID)
	JOIN productsubcategory s
		ON (p.ProductSubcategoryID = s.ProductCategoryID)
	JOIN productcategory c
		ON (s.ProductCategoryID = c.ProductCategoryID)
GROUP BY c.Name
ORDER BY c.Name;

-- 5) 
SELECT cr.Name as Pais, SUM(d.OrderQty) as Cantidad, SUM(d.LineTotal) as Total
FROM salesorderheader h
	JOIN salesorderdetail d
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN address a
		ON (h.ShipToAddressID = a.AddressID)
	JOIN stateprovince sp
		ON (a.StateProvinceID = sp.StateProvinceID)
	JOIN countryregion cr
		ON (sp.CountryRegionCode = cr.CountryRegionCode)
GROUP BY cr.Name
HAVING SUM(d.OrderQty) > 15000
ORDER BY cr.Name;