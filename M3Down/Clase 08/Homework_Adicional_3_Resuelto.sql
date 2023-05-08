-- 1) 
SELECT 	co.TipoProducto,
		co.PromedioVentaConOutliers,
        so.PromedioVentaSinOutliers
FROM
	(	SELECT 	tp.TipoProducto, AVG(v.Precio * v.Cantidad) as PromedioVentaConOutliers
		FROM 	venta v 
		JOIN producto p
		ON (v.IdProducto = p.IdProducto)
		JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
		GROUP BY tp.TipoProducto
	) co
JOIN
	(	SELECT 	tp.TipoProducto, AVG(v.Precio * v.Cantidad) as PromedioVentaSinOutliers
		FROM 	venta v 
		JOIN producto p
		ON (v.IdProducto = p.IdProducto and v.Outlier = 1)
		JOIN tipo_producto tp
		ON (p.IdTipoProducto = tp.IdTipoProducto)
		GROUP BY tp.TipoProducto
	) so
ON co.TipoProducto = so.TipoProducto;

-- 2)
SELECT Precio * Cantidad AS Total_Ventas
FROM fact_venta
LEFT JOIN dim_prodcuto
	ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MAX(Fecha)
				FROM fact_venta );

SELECT Precio * Cantidad AS Total_Ventas
FROM fact_venta
LEFT JOIN dim_prodcuto
ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MIN(Fecha)
				FROM fact_venta );

-- 3) 
SELECT fact_venta.IdProducto, Producto, Precio * Cantidad AS Total_Ventas
FROM fact_venta
	LEFT JOIN dim_prodcuto
ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MAX(Fecha)
				FROM fact_venta )
GROUP BY fact_venta.IdProducto, Producto;

SELECT fact_venta.IdProducto, Producto, Precio * Cantidad AS Total_Ventas
FROM fact_venta
LEFT JOIN dim_prodcuto
ON fact_venta.IdProducto = dim_prodcuto.IdProducto
WHERE Fecha = (	SELECT MIN(Fecha)
				FROM fact_venta )
GROUP BY fact_venta.IdProducto, Producto;

-- 4)
SELECT Fecha, Precio * Cantidad AS Total_Ventas
FROM fact_venta
GROUP BY Fecha;

SELECT Fecha, MAX(Total_Ventas)
FROM (	SELECT Fecha, Precio * Cantidad AS Total_Ventas
		FROM fact_venta
		GROUP BY Fecha) AS ventas
GROUP BY Fecha;

-- 5)
SELECT	c1.IdProvincia,
		c1.Provincia,
        c1.Q_Clientes,
        c2.Q_Clientes,
        ROUND(c1.Q_Clientes / c2.Q_Clientes * 100, 2) AS Porcentaje        
FROM
	(SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(DISTINCT cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
		INNER JOIN venta v
			ON (cl.IdCliente = v.IdCliente
				AND Outlier = 1)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia) c1
JOIN
	(SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia) c2
ON	(c1.IdProvincia = c2.IdProvincia);

-- 6)
SELECT 	IdProducto, 
		ROUND(AVG(Diferencia_Ste_Venta),0) AS Promedio_Dias
FROM (
	SELECT	v.IdProducto,
			DATEDIFF(LEAD(v.Fecha) OVER(PARTITION BY v.IdCliente ORDER BY v.Fecha), v.Fecha) AS Diferencia_Ste_Venta
	FROM venta v) vta
GROUP BY IdProducto;

-- 7)
SELECT	IdVenta,
		Precio,
        ROW_NUMBER() OVER w AS Pos,
        COUNT(*) OVER () AS Total
FROM venta
WHERE YEAR(Fecha) = 2020
	WINDOW w AS (ORDER BY Precio);

SELECT IdProducto, AVG(Precio) AS Mediana_Producto, Cnt
FROM (
		SELECT 	IdProducto,
				Precio, 
				COUNT(*) OVER (PARTITION BY IdProducto) AS Cnt,
				ROW_NUMBER() OVER (PARTITION BY IdProducto ORDER BY Precio) AS RowNum
		FROM venta
	-- WHERE YEAR(Fecha) = 2020
	) v
WHERE 	(FLOOR(Cnt/2) = CEILING(Cnt/2) AND (RowNum = FLOOR(Cnt/2) OR RowNum = FLOOR(Cnt/2) + 1))
	OR
		(FLOOR(Cnt/2) <> CEILING(Cnt/2) AND RowNum = CEILING(Cnt/2))
GROUP BY IdProducto;

-- 8)
SELECT Rango_Etario, AVG(Edad) AS Mediana_Edad, Cnt
FROM (
		SELECT 	Rango_Etario,
				Edad, 
				COUNT(*) OVER (PARTITION BY Rango_Etario) AS Cnt,
				ROW_NUMBER() OVER (PARTITION BY Rango_Etario ORDER BY Edad) AS RowNum
		FROM cliente
	) c
WHERE 	(FLOOR(Cnt/2) = CEILING(Cnt/2) AND (RowNum = FLOOR(Cnt/2) OR RowNum = FLOOR(Cnt/2) + 1))
	OR
		(FLOOR(Cnt/2) <> CEILING(Cnt/2) AND RowNum = CEILING(Cnt/2))
GROUP BY Rango_Etario;