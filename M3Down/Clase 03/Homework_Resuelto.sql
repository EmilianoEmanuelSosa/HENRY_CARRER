use adventureworks;

-- 1) 
SELECT 	YEAR(h.OrderDate) as Año, 
		e.Name AS MetodoEnvio, 
		SUM(d.OrderQty) as Cantidad,
        ROUND(SUM(d.OrderQty) / t.CantidadTotalAño * 100, 2) AS PorcentajeTotalAño
FROM salesorderheader h
	JOIN salesorderdetail d
		ON (h.SalesOrderID = d.SalesOrderID)
	JOIN shipmethod e
		ON (e.ShipMethodID = h.ShipMethodID)
	JOIN (	SELECT YEAR(h.OrderDate) as Año, SUM(d.OrderQty) as CantidadTotalAño
			FROM salesorderheader h	JOIN salesorderdetail d
				ON (h.SalesOrderID = d.SalesOrderID)
                GROUP BY YEAR(h.OrderDate)) t
		ON (YEAR(h.OrderDate) = t.Año)
GROUP BY YEAR(h.OrderDate), e.Name
ORDER BY YEAR(h.OrderDate), e.Name;
-- 0.8 segundos

SELECT	Año,
		MetodoEnvio,
        Cantidad,
        ROUND(Cantidad / SUM(Cantidad) OVER (PARTITION BY Año) * 100, 2) AS PorcentajeTotalAño
FROM (
	SELECT 	YEAR(h.OrderDate) as Año, 
			e.Name AS MetodoEnvio, 
			SUM(d.OrderQty) as Cantidad
	FROM salesorderheader h
		JOIN salesorderdetail d
			ON (h.SalesOrderID = d.SalesOrderID)
		JOIN shipmethod e
			ON (e.ShipMethodID = h.ShipMethodID)
	GROUP BY YEAR(h.OrderDate), e.Name
	ORDER BY YEAR(h.OrderDate), e.Name) AS v;
-- 0.3 segundos

-- 2) 
SELECT	Categoria,
		Cantidad,
        Total AS TotalCategoria,
        ROUND(Cantidad / SUM(Cantidad) OVER () * 100, 2) AS PorcentajeCantidad,
        ROUND(Total / SUM(Total) OVER () * 100, 2) AS PorcentajeVenta
FROM (
	SELECT 	c.Name AS Categoria, 
			SUM(d.OrderQty) as Cantidad, 
            SUM(d.LineTotal) as Total
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
	ORDER BY c.Name) v;

-- 3) 
SELECT	Pais,
		Cantidad,
        Venta,
        ROUND(Cantidad / SUM(Cantidad) OVER () * 100, 2) AS PorcentajeCantidad,
        ROUND(Venta / SUM(Venta) OVER () * 100, 2) AS PorcentajeVenta
FROM (
	SELECT 	cr.Name as Pais, 
			SUM(d.OrderQty) as Cantidad, 
			SUM(d.LineTotal) as Venta
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
	ORDER BY cr.Name) v;
    
-- 4)
SELECT ProductID, AVG(LineTotal) AS Mediana_Producto, Cnt
FROM (
	SELECT	d.ProductID,
			d.LineTotal, 
			COUNT(*) OVER (PARTITION BY d.ProductID) AS Cnt,
			ROW_NUMBER() OVER (PARTITION BY d.ProductID ORDER BY d.LineTotal) AS RowNum
	FROM	salesorderheader h
		JOIN salesorderdetail d
			ON (h.SalesOrderID = d.SalesOrderID)) v
WHERE 	(FLOOR(Cnt/2) = CEILING(Cnt/2) AND (RowNum = FLOOR(Cnt/2) OR RowNum = FLOOR(Cnt/2) + 1))
	OR
		(FLOOR(Cnt/2) <> CEILING(Cnt/2) AND RowNum = CEILING(Cnt/2))
GROUP BY ProductID;