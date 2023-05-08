use henry_m3;
-- 1
SELECT DISTINCT Nombre_y_Apellido, IdProducto, Precio 
FROM fact_venta
LEFT JOIN dim_cliente
ON fact_venta.IdCliente = dim_cliente.IdCliente;

-- 2
-- select count(*) from (
SELECT c.IdCliente, c.Nombre_y_Apellido, SUM(ifnull(v.Cantidad,0)) AS Q_Productos_Adquiridos, SUM(v.Cantidad) as q2
FROM cliente c
LEFT JOIN venta v
	ON (v.IdCliente = c.IdCliente)
GROUP BY c.IdCliente, c.Nombre_y_Apellido
ORDER BY SUM(ifnull(v.Cantidad,0));
 -- ) as a;

select count(*) from cliente;
select Nombre_y_Apellido, count(*) from cliente group by Nombre_y_Apellido having count(*) > 1;
select ifnull(null, 0);
select * from cliente where nombre_y_apellido = 'Rodolfo Horacio Silveira';

-- 3
-- select count(*) from (
SELECT c.IdCliente, c.Nombre_y_Apellido, YEAR(v.Fecha), COUNT(v.IdVenta) AS Total_compras
FROM venta v
	/*INNER JOIN canal_venta cv
		ON (v.idCanal = cv.IdCanal
			And cv.Canal like '%OnLine%')*/
	INNER JOIN cliente c
		ON (c.IdCliente = v.IdCliente)
GROUP BY c.Nombre_y_Apellido, YEAR(v.Fecha)
ORDER BY YEAR(v.Fecha) DESC, c.IdCliente;
-- ) as c;
-- 10409 registros

SELECT c.IdCliente, c.Nombre_y_Apellido, YEAR(v.Fecha), COUNT(v.IdVenta) AS Total_compras
FROM venta v
	INNER JOIN cliente c
		ON (c.IdCliente = v.IdCliente)
	INNER JOIN canal_venta cv
		ON (v.idCanal = cv.IdCanal
			And cv.Canal like '%OnLine%')
GROUP BY c.Nombre_y_Apellido, YEAR(v.Fecha)
ORDER BY YEAR(v.Fecha) DESC, c.IdCliente;
select * from canal_venta;

-- 4
SELECT 	c.IdCliente, 
		c.Nombre_y_Apellido, 
		p.IdProducto, 
        p.Producto,
        SUM(v.Cantidad) 		AS Q_productos, 
        ROUND(AVG(v.Precio),2) 	AS precio_promedio 
FROM venta v
	INNER JOIN producto p
		ON (v.IdProducto = p.IdProducto)
	INNER JOIN cliente c
		ON (v.IdCliente = c.IdCliente)
GROUP BY c.IdCliente, 
		c.Nombre_y_Apellido, 
		p.IdProducto, 
        p.Producto;

-- 5
SELECT 	p.Provincia, 
		l.Localidad, 
        sum(v.Cantidad) 			as Q_Productos_Vendidos, 
        sum(v.Precio*v.Cantidad) 	AS Total_Ventas,
        count(v.IdVenta)			as Volumen_Ventas
FROM venta v 
-- LEFT JOIN sucursal cl ON (v.IdSucursal = cl.IdSucursal)
LEFT JOIN cliente cl ON (v.IdCliente = cl.IdCliente)
LEFT JOIN localidad l
	ON (l.IdLocalidad = cl.IdLocalidad)
LEFT JOIN provincia p
	ON (l.IdProvincia = p.IdProvincia)
WHERE v.Outlier = 1
-- AND l.Localidad = 'Malvinas Argentinas'
GROUP BY p.IdProvincia, p.Provincia, l.IdLocalidad, l.Localidad
ORDER BY p.Provincia, l.Localidad;

select * from venta where IdVenta = 47878;
select * from sucursal where idSucursal = 25;
select * from localidad where IdLocalidad = 346;
select * from provincia where IdProvincia = 2;

SELECT Localidad FROM localidad group by localidad having count(*) > 1;
select * from localidad where Localidad = 'San Roque';

-- 6
SELECT 	p.Provincia, 
        sum(v.Cantidad) 			as Q_Productos_Vendidos, 
        sum(v.Precio*v.Cantidad) 	AS Total_Ventas,
        count(v.IdVenta)			as Volumen_Ventas
FROM venta v 
-- LEFT JOIN sucursal cl ON (v.IdSucursal = cl.IdSucursal)
LEFT JOIN cliente cl ON (v.IdCliente = cl.IdCliente)
LEFT JOIN localidad l
	ON (l.IdLocalidad = cl.IdLocalidad)
LEFT JOIN provincia p
	ON (l.IdProvincia = p.IdProvincia)
WHERE v.Outlier = 1
GROUP BY p.IdProvincia, p.Provincia
HAVING sum(v.Precio*v.Cantidad) > 100000
ORDER BY p.Provincia;
/*
Buenos Aires	68048	92363138.430	33840
Córdoba	3457	4536321.210	1740
Entre Ríos	173	177748.980	88
Mendoza	9834	12867893.370	4942
Neuquén	1311	1714441.440	656
Santa Fe	2898	4671396.980	1464
Sin Dato	1137	1273153.010	578
Tucumán	3548	4995035.050	1761
*/

-- 7
SELECT 	c.Rango_Etario, 
		SUM(v.Cantidad) 					AS Q_productos, 
        ROUND(SUM(v.Precio*v.Cantidad),2) 	AS Total_Ventas
FROM venta v
	INNER JOIN cliente c
		ON (v.IdCliente = c.IdCliente
			and v.Outlier = 1)
GROUP BY c.Rango_Etario
ORDER BY c.Rango_Etario;

-- 8
SELECT	p.IdProvincia,
		p.Provincia,
		COUNT(cl.IdCliente)	as Q_Clientes
FROM 	provincia p 
	LEFT JOIN localidad l
		ON (p.IdProvincia = l.IdProvincia)
	LEFT JOIN cliente cl
		ON (l.IdLocalidad = cl.IdLocalidad)
GROUP BY p.IdProvincia, p.Provincia
ORDER BY p.Provincia;

select * from provincia;

select * from cliente
where idlocalidad in (select 	l.IdLocalidad
						from 	localidad l join provincia p
							on (l.IdProvincia = p.idProvincia and p.Provincia = 'Santa Fé'));

select 	l.IdLocalidad
from 	localidad l join provincia p
	on (l.IdProvincia = p.idProvincia and p.Provincia = 'Santa Fé');
    
ALTER VIEW v_Provincias_Q_Clientes AS
SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia;
    
SELECT * FROM v_Provincias_Q_Clientes;

SELECT * FROM 
(SELECT	p.IdProvincia,
			p.Provincia,
			COUNT(cl.IdCliente)	as Q_Clientes
	FROM 	provincia p 
		LEFT JOIN localidad l
			ON (p.IdProvincia = l.IdProvincia)
		LEFT JOIN cliente cl
			ON (l.IdLocalidad = cl.IdLocalidad)
	GROUP BY p.IdProvincia, p.Provincia
	ORDER BY p.Provincia) AS c;