-- Solución de Homework.
use henry_m3;
-- 1)
DROP PROCEDURE listaProductos;
DELIMITER $$
CREATE PROCEDURE listaProductos(IN fechaVenta DATE)
BEGIN
	Select distinct tp.TipoProducto, p.Producto
	From fact_venta v join dim_producto p
			On (v.IdProducto = p.IdProducto
				And v.Fecha = fechaVenta)
		join tipo_producto tp
			On (p.idTipoProducto = tp.IdTipoProducto)
	Order by tp.TipoProducto, p.Producto;
END $$
DELIMITER;

CALL listaProductos('2020-01-01');

-- 2)
SET GLOBAL log_bin_trust_function_creators = 1;

DROP FUNCTION margenBruto;

DELIMITER $$
CREATE FUNCTION margenBruto(precio DECIMAL(15,3), margen DECIMAL (9,2)) RETURNS DECIMAL (15,3)
BEGIN
	DECLARE margenBruto DECIMAL (15,3);
    
    SET margenBruto = precio * margen;
    
    RETURN margenBruto;
END$$

DELIMITER ;

Select margenBruto(100.50, 1.2);

Select 	c.Fecha,
		pr.Nombre					as Proveedor,
		p.Producto,
		c.Precio 					as PrecioCompra,
        margenBruto(c.Precio, 1.3)	as PrecioMargen
From 	compra c Join producto p
			On (c.IdProducto = p.IdProducto)
		Join proveedor pr
			On (c.IdProveedor = pr.IdProveedor);

SELECT 	Producto, 
		margenBruto(Precio, 1.30) AS Margen
FROM producto;

-- 3)
SELECT 	p.IdProducto, 
		p.Producto,
        p.Precio,
        margenBruto(Precio, 1.3) AS PrecioMargen
FROM producto p join tipo_producto tp
	On (p.IdTipoProducto = tp.IdTipoProducto
		And TipoProducto = 'Impresión');
     
SELECT 	IdProducto, 
		precio as PrecioVenta, 
        ROUND(precio * ( (100 + 10) /100 ), 2) AS PrecioFinal
FROM compra;

DELIMITER $$
CREATE PROCEDURE MargenbrutoJ(IN porcent int)
BEGIN
    /*SELECT IdProducto, precio as PrecioVenta, ROUND(precio /((100 - porcent)/100),2) AS PrecioFinal
    FROM compra;
    */
    SELECT IdProducto, precio as PrecioVenta, ROUND(precio * ( (100 + porcent) /100 ), 2) AS PrecioFinal
    FROM compra;
END $$
DELIMITER ;

CALL MargenbrutoJ(30);
-- 4)
DROP PROCEDURE listaCategoria;

DELIMITER $$
CREATE PROCEDURE listaCategoria(IN categoria VARCHAR (25))
BEGIN
	SELECT 	v.Fecha,
			v.Fecha_Entrega,
			v.IdCliente,
			v.IdCanal,
			v.IdSucursal,
			tp.TipoProducto,
			p.Producto,
			v.Precio,
			v.Cantidad
	FROM venta v join producto p
			On (v.IdProducto = p.idProducto
				And v.Outlier = 1)
		Join tipo_producto tp
			On (p.IdTipoProducto = tp.IdTipoProducto
				And TipoProducto collate utf8mb4_spanish_ci LIKE Concat('%', categoria, '%'));
                -- And TipoProducto = categoria);
END $$
DELIMITER ;

CALL listaCategoria('i');

-- 5)
DROP PROCEDURE cargarFact_venta;

DELIMITER $$
CREATE PROCEDURE cargarFact_venta()
BEGIN
	TRUNCATE table fact_venta;

    INSERT INTO fact_venta (IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad)
    SELECT	IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad
    FROM 	venta
    WHERE  	Outlier = 1;
END $$
DELIMITER ;

CALL cargarFact_venta();

SHOW TRIGGERS;
-- DROP TRIGGER henry_m3.fact_venta_registros;
-- 6)

SELECT 	c.Rango_Etario, 
		sum(v.Precio*v.Cantidad) 	AS Total_Ventas
FROM fact_venta v
	INNER JOIN dim_cliente c
		ON (v.IdCliente = c.IdCliente
			and c.Rango_Etario collate utf8mb4_spanish_ci = '2_De 31 a 40 años')
GROUP BY c.Rango_Etario;
    
DROP PROCEDURE ventasGrupoEtario; 

DELIMITER $$
CREATE PROCEDURE ventasGrupoEtario(IN grupo VARCHAR(25))
BEGIN
	SELECT 	c.Rango_Etario, 
			sum(v.Precio*v.Cantidad) 	AS Total_Ventas
	FROM fact_venta v
		INNER JOIN dim_cliente c
			ON (v.IdCliente = c.IdCliente
				and c.Rango_Etario collate utf8mb4_spanish_ci like Concat('%', grupo, '%'))
	GROUP BY c.Rango_Etario;
END $$
DELIMITER ;

SELECT DISTINCT Rango_Etario FROM dim_cliente;

CALL ventasGrupoEtario('31%40');

-- 7)

SET @grupo = '2_De 31 a 40 años';

SELECT *
FROM dim_cliente
WHERE Rango_Etario collate utf8mb4_spanish_ci = @grupo
LIMIT 10;