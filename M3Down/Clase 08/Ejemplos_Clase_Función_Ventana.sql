use henry_m3;
-- Ejemplos:
SELECT 	Fecha, 
		AVG(Precio * Cantidad) AS Promedio_Ventas
FROM venta
GROUP BY Fecha;

SELECT 	v.Fecha,
		v.Precio * v.Cantidad AS Venta,
        v2.Promedio_Ventas
FROM 	venta v JOIN (	SELECT 	Fecha, 
						AVG(Precio * Cantidad) AS Promedio_Ventas
						FROM venta 
                        GROUP BY Fecha) v2
ON (v.Fecha = v2.Fecha);

SELECT 	v.Fecha,
		v.Precio * v.Cantidad AS Venta,
		AVG(v.Precio * v.Cantidad) OVER (PARTITION BY v.Fecha) AS Promedio_Ventas
FROM venta v;

SELECT 	v.Fecha,
		v.Precio * v.Cantidad AS Venta,
		SUM(v.Precio * v.Cantidad) OVER (PARTITION BY v.Fecha ORDER BY v.IdVenta) AS Total_Ventas
FROM venta v;

SELECT 	v.Fecha,
		v.Precio * v.Cantidad AS Venta,
		SUM(v.Precio * v.Cantidad) OVER (PARTITION BY v.Fecha ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Total_Ventas
FROM venta v;

SELECT 	v.Fecha,
		v.Precio * v.Cantidad AS Venta,
		SUM(v.Precio * v.Cantidad) OVER (PARTITION BY v.Fecha ORDER BY v.IdVenta) AS Total_Ventas
FROM venta v;

SELECT RANK() OVER (PARTITION BY v.Fecha ORDER BY v.Precio * v.Cantidad DESC) AS Ranking_Venta,
		v.Fecha,
        v.IdCliente,
        v.Precio,
        v.Cantidad,
        (v.Precio * Cantidad) as Venta
FROM venta v
WHERE Outlier = 1;

SELECT  DENSE_RANK() OVER (PARTITION BY v.Fecha ORDER BY v.Precio * v.Cantidad DESC) AS Ranking_Venta,
		PERCENT_RANK() OVER (PARTITION BY v.Fecha ORDER BY v.Precio * v.Cantidad DESC) AS Ranking_Venta_Porcentaje,
		v.Fecha,
        v.IdCliente,
        v.Precio,
        v.Cantidad,
        (v.Precio * Cantidad) as Venta
FROM venta v
WHERE IdSucursal = 12
AND Outlier = 1;

SELECT *
FROM (	SELECT DENSE_RANK() OVER (PARTITION BY v.Fecha ORDER BY v.Precio * v.Cantidad DESC) AS Ranking_Venta,
			v.Fecha,
			v.IdCliente,
			v.Precio,
			v.Cantidad,
			(v.Precio * Cantidad) as Venta
	FROM venta v
	WHERE Outlier = 1) ventas
WHERE Ranking_Venta < 4;

SELECT ROW_NUMBER() OVER() AS row_id, cliente.* FROM cliente;

SELECT ROW_NUMBER() OVER(PARTITION BY c.IdLocalidad) AS row_id, 
		c.Nombre_Y_Apellido,
        c.Domicilio,
        c.Edad,
        c.IdLocalidad
FROM cliente c;

SELECT ROW_NUMBER() OVER(PARTITION BY c.IdLocalidad) AS row_id, 
		FIRST_VALUE(Nombre_Y_Apellido) OVER(PARTITION BY c.IdLocalidad) AS primer_nombre, 
		LAST_VALUE(Nombre_Y_Apellido) OVER(PARTITION BY c.IdLocalidad) AS ultimo_nombre, 
		c.Nombre_Y_Apellido,
        c.Domicilio,
        c.Edad,
        c.IdLocalidad
FROM cliente c;

SELECT ROW_NUMBER() OVER(PARTITION BY c.IdLocalidad) AS row_id, 
		FIRST_VALUE(Nombre_Y_Apellido) OVER(PARTITION BY c.IdLocalidad) AS primer_nombre, 
		LAST_VALUE(Nombre_Y_Apellido) OVER(PARTITION BY c.IdLocalidad) AS ultimo_nombre, 
		NTH_VALUE(Nombre_Y_Apellido, 3) OVER(PARTITION BY c.IdLocalidad) AS ultimo_nombre, 
		c.Nombre_Y_Apellido,
        c.Domicilio,
        c.Edad,
        c.IdLocalidad
FROM cliente c;

SELECT 	NTH_VALUE(Nombre_Y_Apellido, 3) OVER(PARTITION BY Rango_Etario ORDER BY Rango_Etario, Edad) AS Enesimo_Edad, 
		ROW_NUMBER() OVER(PARTITION BY Rango_Etario ORDER BY Rango_Etario, Edad) AS Row_Edad,
		cliente.* 
FROM cliente;

SELECT 	RANK() OVER(PARTITION BY Rango_Etario ORDER BY Edad DESC) AS Ranking_Edad, -- Posee un salto
		DENSE_RANK() OVER(PARTITION BY Rango_Etario ORDER BY Edad DESC) AS Ranking_Denso_Edad,
		PERCENT_RANK() OVER(PARTITION BY Rango_Etario ORDER BY Edad DESC) AS Ranking_Porcentaje_Edad,
		ROW_NUMBER() OVER(PARTITION BY Rango_Etario ORDER BY Edad DESC) AS Row_Edad,
		cliente.* 
FROM cliente
WHERE IdLocalidad = 55
ORDER BY Rango_Etario, Ranking_Edad;

SELECT 	RANK() OVER w AS Ranking_Edad, -- Posee un salto
		DENSE_RANK() OVER w AS Ranking_Denso_Edad,
		PERCENT_RANK() OVER w AS Ranking_Porcentaje_Edad,
		ROW_NUMBER() OVER w AS Row_Edad,
		cliente.* 
FROM cliente
WHERE IdLocalidad = 55
WINDOW w AS (PARTITION BY Rango_Etario ORDER BY Edad DESC)
ORDER BY Rango_Etario, Ranking_Edad;

SELECT 	LAG(IdCliente) OVER() AS Id_Anterior,
		LEAD(IdCliente) OVER() AS Id_Siguiente,
		cliente.* 
FROM cliente
WHERE IdLocalidad = 55;

SELECT	ROW_NUMBER() OVER(PARTITION BY v.IdCliente ORDER BY v.Fecha) AS operacion,
		v.IdCliente,
		LAG(v.Fecha) OVER(PARTITION BY v.IdCliente ORDER BY v.Fecha) AS Fecha_Anterior,
        v.Fecha,
		LEAD(v.Fecha) OVER(PARTITION BY v.IdCliente ORDER BY v.Fecha) AS Fecha_Siguiente,
        DATEDIFF(LEAD(v.Fecha) OVER(PARTITION BY v.IdCliente ORDER BY v.Fecha), v.Fecha) AS Diferencia_Ste_Venta,
        (v.Precio * v.Cantidad) AS Venta
FROM venta v;

SELECT 	IdCliente, 
		ROUND(AVG(Diferencia_Ste_Venta),0) AS Promedio_Dias
FROM (
	SELECT	v.IdCliente,
			DATEDIFF(LEAD(v.Fecha) OVER(PARTITION BY v.IdCliente ORDER BY v.Fecha), v.Fecha) AS Diferencia_Ste_Venta
	FROM venta v) vta
GROUP BY IdCliente;

SELECT 	IdCliente, 
		ROUND(AVG(Diferencia_Ste_Venta),0) AS Promedio_Dias
FROM (
	SELECT	v.IdCliente,
			DATEDIFF(LEAD(v.Fecha) OVER w, v.Fecha) AS Diferencia_Ste_Venta
	FROM venta v
    WINDOW w AS (PARTITION BY v.IdCliente ORDER BY v.Fecha)) vta
GROUP BY IdCliente;