-- Solución de Homework.
use adventureworks;
-- 1)
DROP PROCEDURE totalOrdenes;
DELIMITER $$
CREATE PROCEDURE totalOrdenes(IN fechaOrden DATE)
BEGIN
	SELECT COUNT(*)
	FROM salesorderheader
	WHERE OrderDate = fechaOrden;
END $$

DELIMITER ;

CALL totalOrdenes('2002-01-01');

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

-- 3)
SELECT 	ProductID,
		Name,
        ProductNumber,
        ListPrice,
        margenBruto(StandardCost, 1.2) as ListPriceMargenPropuesto,
        ListPrice - margenBruto(StandardCost, 1.2) as Diferencia
FROM product
ORDER BY Name;

-- 4) 
DROP PROCEDURE gastoTransporte;
DELIMITER $$
CREATE PROCEDURE gastoTransporte(IN fechaDesde DATE, IN fechaHasta DATE)
BEGIN
	SELECT CustomerID, SUM(Freight) AS TotalTransporte
	FROM salesorderheader
	WHERE OrderDate BETWEEN fechaDesde AND fechaHasta
    GROUP BY CustomerID
    ORDER BY TotalTransporte DESC
    LIMIT 10;
END $$

DELIMITER ;

CALL gastoTransporte('2002-01-01','2002-01-31');

-- 5)
DROP PROCEDURE cargarShipmethod;

DELIMITER $$
CREATE PROCEDURE cargarShipmethod(IN nombre VARCHAR(50), IN base DOUBLE, IN rate DOUBLE)
BEGIN
    INSERT INTO shipmethod (Name, ShipBase, ShipRate, ModifiedDate)
	VALUES (nombre,base,rate,NOW());
END $$
DELIMITER ;

CALL cargarShipmethod('Prueba', 1.5, 3.5);

SELECT * FROM shipmethod;