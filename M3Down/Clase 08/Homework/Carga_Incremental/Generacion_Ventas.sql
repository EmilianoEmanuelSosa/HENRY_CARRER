SELECT Fecha, count(*) FROM venta GROUP BY Fecha;

SET @fecha = '2021-01-01';

SELECT COUNT(*) FROM (
SELECT 	@fecha as Fecha,
		DATE_ADD(@fecha, INTERVAL ROUND(RAND() * 5, 0) DAY) AS Fecha_Entrega,
        1 + ROUND(RAND() * 2, 0) AS IdCanal,
        c.IdCliente,
        e.IdSucursal,
        e.CodigoEmpleado As IdEmpleado,
        p.IdProducto,
        p.Precio,
        1 + ROUND(RAND() * 2, 0) AS Cantidad
FROM 	cliente c, producto p, empleado e
WHERE 	RAND() <0.003) V;
