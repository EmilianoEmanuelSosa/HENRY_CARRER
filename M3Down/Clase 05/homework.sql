use henry_m3;
-- SHOW GLOBAL VARIABLES LIKE 'local_infile';
-- SET GLOBAL local_infile=1;

DROP TABLE IF EXISTS sucursal;





-- SET SQL_SAFE_UPDATES = 0;
ALTER TABLE calendario CHANGE IdCalendario IdCalendario INT(11) NOT NULL;
ALTER TABLE calendario CHANGE IDEmpleado IdEmpleado INT(11) NULL DEFAULT NULL;
ALTER TABLE calendario CHANGE fecha Fecha DATE NOT NULL UNIQUE;
ALTER TABLE calendario CHANGE anio Anio INT(11) NOT NULL;
ALTER TABLE calendario CHANGE mes Mes INT(11) NOT NULL;
ALTER TABLE calendario CHANGE dia Dia INT(11) NOT NULL;
ALTER TABLE calendario CHANGE anio Anio INT(11) NOT NULL;
ALTER TABLE calendario CHANGE trimestre Trimestre INT(11) NOT NULL;
ALTER TABLE calendario CHANGE semana Semana INT(11) NOT NULL;
ALTER TABLE calendario CHANGE dia_nombre Dia_Nombre VARCHAR(11) NOT NULL;
ALTER TABLE calendario CHANGE  mes_nombre Mes_Nombre VARCHAR(11) NULL DEFAULT NULL;
ALTER TABLE cliente CHANGE  Domicilo Domicilio VARCHAR(255) NULL DEFAULT NULL;
ALTER TABLE calendario CHANGE Id Semana INT(11) NOT NULL;
RENAME TABLE Cliente TO cliente;
desc cliente;
-- TABLE Cliente
ALTER TABLE Cliente DROP COLUMN Marca_Baja;
ALTER TABLE Cliente ADD Logitud DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Y,
					ADD Latitud DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER X;
UPDATE Cliente SET Y = '0' WHERE Y = '';
UPDATE Cliente SET X = '0' WHERE X = '';
UPDATE Cliente SET Latitud = REPLACE(Y,',','.');
UPDATE Cliente SET Logitud = REPLACE(X,',','.');

ALTER TABLE Cliente CHANGE Logitud Longitud DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Y;
desc calendario;







-- tipos de datos

ALTER TABLE cliente 	ADD Latitud DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Y,
 					ADD Longitud DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Latitud;
UPDATE cliente SET Y = '0' WHERE Y = '';
UPDATE cliente SET X = '0' WHERE X = '';
UPDATE cliente SET Latitud = REPLACE(Y,',','.');
UPDATE cliente SET Longitud = REPLACE(X,',','.');
SELECT * FROM cliente;
ALTER TABLE cliente DROP Y;
ALTER TABLE cliente DROP X;
RENAME TABLE empleados TO empleado;

RENAME TABLE products TO producto;
ALTER TABLE producto ADD Precio DECIMAL(15,3) NOT NULL DEFAULT '0' AFTER Precio2;
UPDATE producto SET Precio = REPLACE(Precio2,',','.');
ALTER TABLE producto DROP Precio2;
RENAME TABLE sucurlsal TO sucursal;
ALTER TABLE sucursal 	ADD Latitud DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Longitud2, 
						ADD Longitud DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER Latitud;
UPDATE sucursal SET Latitud = REPLACE(Latitud2,',','.');
UPDATE sucursal SET Longitud = REPLACE(Longitud2,',','.');
-- SELECT * FROM `sucursal`;
ALTER TABLE sucursal DROP Latitud2;
ALTER TABLE sucursal DROP Longitud2;

UPDATE venta set Precio = 0 WHERE Precio = '';
ALTER TABLE venta CHANGE Precio Precio DECIMAL(15,3) NOT NULL DEFAULT '0';




-- Imputar valores faltantes
UPDATE cliente SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE cliente SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
UPDATE cliente SET Nombre_y_Apellido = 'Sin Dato' WHERE TRIM(Nombre_y_Apellido) = "" OR ISNULL(Nombre_y_Apellido);
UPDATE cliente SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);

UPDATE empleado SET Apellido = 'Sin Dato' WHERE TRIM(Apellido) = "" OR ISNULL(Apellido);
UPDATE empleado SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE empleado SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE empleado SET Sector = 'Sin Dato' WHERE TRIM(Sector) = "" OR ISNULL(Sector);
UPDATE empleado SET Cargo = 'Sin Dato' WHERE TRIM(Cargo) = "" OR ISNULL(Cargo);

UPDATE producto SET Producto = 'Sin Dato' WHERE TRIM(Producto) = "" OR ISNULL(Producto);
UPDATE producto SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = "" OR ISNULL(Tipo);

UPDATE proveedor SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE proveedor SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE proveedor SET Ciudad = 'Sin Dato' WHERE TRIM(Ciudad) = "" OR ISNULL(Ciudad);
UPDATE proveedor SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE proveedor SET Pais = 'Sin Dato' WHERE TRIM(Pais) = "" OR ISNULL(Pais);
UPDATE proveedor SET Departamento = 'Sin Dato' WHERE TRIM(Departamento) = "" OR ISNULL(Departamento);

UPDATE sucursal SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE sucursal SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE sucursal SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE sucursal SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);




-- Normalizar a letra capital
desc empleado;
ALTER TABLE empleado CHANGE ID_empleado IdEmpleado INT(11) NUll DEFAULT NULL;
ALTER TABLE producto CHANGE ID_PRODUCTO idProducto INT(11) NULL DEFAULT NULL;
ALTER TABLE producto CHANGE Concepto Producto VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NULL DEFAULT NULL;
UPDATE cliente SET  Domicilio = UC_Words(TRIM(Domicilio)),
                    Nombre_y_Apellido = UC_Words(TRIM(Nombre_y_Apellido));
UPDATE sucursal SET Domicilio = UC_Words(TRIM(Domicilio)),
                    Sucursal = UC_Words(TRIM(Sucursal));
UPDATE proveedor SET Nombre = UC_Words(TRIM(Nombre)),
                    Domicilio = UC_Words(TRIM(Domicilio));
UPDATE producto SET Producto = UC_Words(TRIM(Producto));

-- Chequeo de las claves duplicadas
select * from empleado;
SELECT IdEmpleado, COUNT(*) FROM empleado GROUP BY IdEmpleado HAVING COUNT(*) > 1;

-- Modificacion  de ka ckave firabea de empleado en venta 
UPDATE venta SET IdEmpleado = (IdSucursal * 1000000) + IdEmpleado;

-- Normalizacion Tabla empleados 
DROP TABLE IF EXISTS cargo;
CREATE TABLE IF NOT EXISTS cargo (
  IdCargo integer NOT NULL AUTO_INCREMENT, 
  Cargo varchar(50) NOT NULL,
  PRIMARY KEY (IdCargo)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

SELECT * FROM cargo WHERE IdCargo IS NOT NULL OR Cargo IS NOT NULL;

DELETE FROM empleado WHERE IdEmpleado BETWEEN 1 AND 31;


-- chequeo de duplicados
SELECT IdCliente, COUNT(*) as Quantity FROM Cliente GROUP BY IdCliente having Quantity > 1;
SELECT IDsucursales, COUNT(*) as Quantity FROM sucursales GROUP BY IDsucursales HAVING Quantity > 1;
SELECT IDProveedor, COUNT(*) as Quantity FROM proveedor GROUP BY IDProveedor HAVING Quantity > 1;
SELECT ID_PRODUCTO, COUNT(*) as Quantity FROM products GROUP BY ID_PRODUCTO HAVING Quantity > 1;
SELECT ID_empleado, COUNT(*) as Quantity FROM empleados GROUP BY ID_empleado HAVING Quantity >1;
SELECT count(*) as Quantity_of_repetitions
FROM ( SELECT ID_empleado,COUNT(*) as Quantity 
		FROM empleados
        GROUP BY ID_empleado
        HAVING Quantity>1
)as Subconsulta
having Quantity_of_repetitions < 18; -- For practice is soo goddd..

/*Generacion de clave única tabla empleado mediante creacion de clave subrogada*/
UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';
-- UPDATE empleado SET Sucursal = 'Córdoba Quiroz' WHERE Sucursal = 'Cordoba Quiroz';

ALTER TABLE `empleado` ADD `IdSucursal` INT NULL DEFAULT '0' AFTER `Sucursal`;
ALTER TABLE `empleado` ADD `CodigoEmpleado` INT NULL DEFAULT '0' AFTER `IdEmpleado`;
UPDATE empleado e JOIN sucursal s
	ON (e.Sucursal = s.Sucursal)
SET e.IdSucursal = s.IdSucursal;

ALTER TABLE `empleado` DROP `Sucursal`;
UPDATE empleado SET CodigoEmpleado = IdEmpleado;
UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado;
-- 
DROP TABLE IF EXISTS sector;
CREATE TABLE IF NOT EXISTS sector (
  IdSector integer NOT NULL AUTO_INCREMENT,
  Sector varchar(50) NOT NULL,
  PRIMARY KEY (IdSector)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
INSERT INTO cargo (Cargo) SELECT DISTINCT Cargo FROM empleado ORDER BY 1;
INSERT INTO sector (Sector) SELECT DISTINCT Sector FROM empleado ORDER BY 1;
DELETE FROM cargo WHERE IdCargo BETWEEN 1 AND 31;

ALTER TABLE `empleado` 	ADD `IdSector` INT NOT NULL DEFAULT '0' AFTER `IdSucursal`,
						ADD `IdCargo` INT NOT NULL DEFAULT '0' AFTER `IdSector`;
UPDATE empleado e JOIN cargo c ON (c.Cargo = e.Cargo) SET e.IdCargo = c.IdCargo;
UPDATE empleado e JOIN sector s ON (s.Sector = e.Sector) SET e.IdSector = s.IdSector;
ALTER TABLE `empleado` DROP `Cargo`;
ALTER TABLE `empleado` DROP `Sector`;

ALTER TABLE `producto` ADD `IdTipoProducto` INT NOT NULL DEFAULT '0' AFTER `Precio`;
DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `IdTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `TipoProducto` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
INSERT INTO tipo_producto (TipoProducto) SELECT DISTINCT Tipo FROM producto ORDER BY 1;
UPDATE producto p JOIN tipo_producto t ON (p.Tipo = t.TipoProducto) SET p.IdTipoProducto = t.IdTipoProducto;
ALTER TABLE `producto`
  DROP `Tipo`;
-- ALTER TABLE Cliente CHANGE IDClientes IdCliente INT(11) NULL DEFAULT NULL;
-- desc Cliente;