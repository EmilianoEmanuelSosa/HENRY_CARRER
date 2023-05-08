USE henry_m3;

DROP TABLE IF EXISTS `venta_novedades`;
CREATE TABLE IF NOT EXISTS `venta_novedades` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCanal`				INTEGER, 
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				VARCHAR(30),
  `Cantidad`			VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Venta_Actualizado.csv' 
INTO TABLE `venta_novedades` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

SELECT * FROM venta_novedades ORDER BY Fecha DESC;

DROP TABLE IF EXISTS cliente_novedades;
CREATE TABLE IF NOT EXISTS cliente_novedades (
	ID					INTEGER,
	Provincia			VARCHAR(50),
	Nombre_y_Apellido	VARCHAR(80),
	Domicilio			VARCHAR(150),
	Telefono			VARCHAR(30),
	Edad				VARCHAR(5),
	Localidad			VARCHAR(80),
	X					VARCHAR(30),
	Y					VARCHAR(30),
    Fecha_Alta			DATE NOT NULL,
    Usuario_Alta		VARCHAR(20),
    Fecha_Ultima_Modificacion		DATE NOT NULL,
    Usuario_Ultima_Modificacion		VARCHAR(20),
    Marca_Baja			TINYINT,
	col10				VARCHAR(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Clientes_Actualizado.csv'
INTO TABLE cliente_novedades
CHARACTER SET latin1
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

SELECT * FROM cliente_novedades Order by ID Desc;

/*Se procede primero, a actualizar el Maestro de Clientes, ya que, debido a que están creadas las restricciones,
no sería posible ingestar registros en la tabla venta que no estén presentes en la tabla cliente*/
        
ALTER TABLE `cliente_novedades` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Y`, 
						ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
                        
UPDATE cliente_novedades SET Y = '0' WHERE Y = '';
UPDATE cliente_novedades SET X = '0' WHERE X = '';

UPDATE `cliente_novedades` SET Latitud = REPLACE(Y,',','.');
UPDATE `cliente_novedades` SET Longitud = REPLACE(X,',','.');
-- SELECT * FROM `cliente_novedades`;
ALTER TABLE `cliente_novedades` DROP `Y`;
ALTER TABLE `cliente_novedades` DROP `X`;

ALTER TABLE `cliente_novedades` DROP `col10`;

UPDATE `cliente_novedades` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `cliente_novedades` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
UPDATE `cliente_novedades` SET Nombre_y_Apellido = 'Sin Dato' WHERE TRIM(Nombre_y_Apellido) = "" OR ISNULL(Nombre_y_Apellido);
UPDATE `cliente_novedades` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);

ALTER TABLE `cliente_novedades` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Localidad`;

UPDATE cliente_novedades c JOIN aux_localidad a
	ON (c.Provincia = a.Provincia_Original AND c.Localidad = a.Localidad_Original)
SET c.IdLocalidad = a.IdLocalidad;

/*Se chequea que no haya localidades nuevas no detectadas, de ser así, debe ser dada de alta en las tablas respectivas*/
SELECT * FROM cliente_novedades WHERE IdLocalidad = 0;

ALTER TABLE `cliente_novedades`
  DROP `Provincia`,
  DROP `Localidad`;
  
ALTER TABLE `cliente_novedades` ADD `Rango_Etario` VARCHAR(20) NOT NULL DEFAULT '-' AFTER `Edad`;

UPDATE cliente_novedades SET Rango_Etario = '1_Hasta 30 años' WHERE Edad <= 30;
UPDATE cliente_novedades SET Rango_Etario = '2_De 31 a 40 años' WHERE Edad <= 40 AND Rango_Etario = '-';
UPDATE cliente_novedades SET Rango_Etario = '3_De 41 a 50 años' WHERE Edad <= 50 AND Rango_Etario = '-';
UPDATE cliente_novedades SET Rango_Etario = '4_De 51 a 60 años' WHERE Edad <= 60 AND Rango_Etario = '-';
UPDATE cliente_novedades SET Rango_Etario = '5_Desde 60 años' WHERE Edad > 60 AND Rango_Etario = '-';

DROP TABLE IF EXISTS aux_cliente;
CREATE TABLE IF NOT EXISTS aux_cliente (
	IdCliente			INTEGER,
	Latitud				DOUBLE,
	Longitud			DOUBLE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO aux_cliente (IdCliente, Latitud, Longitud)
SELECT 	ID, Latitud, Longitud
FROM cliente_novedades WHERE Latitud < -55;

SELECT * FROM aux_cliente;

UPDATE cliente_novedades c JOIN aux_cliente ac
	ON (c.ID = ac.IdCliente)
SET c.Latitud = ac.Longitud, c.Longitud = ac.Latitud;

UPDATE `cliente_novedades` SET Latitud = Latitud * -1 WHERE Latitud > 0;
UPDATE `cliente_novedades` SET Longitud = Longitud * -1 WHERE Longitud > 0;

UPDATE cliente_novedades c JOIN localidad l
	ON (c.IdLocalidad = l.IdLocalidad)
SET c.Latitud = l.Latitud
WHERE c.Latitud = 0;

UPDATE cliente_novedades c JOIN localidad l
	ON (c.IdLocalidad = l.IdLocalidad)
SET c.Longitud = l.Longitud
WHERE c.Longitud = 0; 

/*Validación de Modificaciones:*/
/*(Se puede probar, realizar modificaciones en el archivo Cliente_Actualizado.csv para ver como impactan)*/
SELECT c.*, cn.* 
-- SELECT COUNT(*)
FROM cliente c, cliente_novedades cn
WHERE c.IdCliente = cn.ID
AND (c.Nombre_Y_Apellido <> cn.Nombre_Y_Apellido OR
	c.Domicilio <> cn.Domicilio OR
    c.Telefono <> cn.Telefono OR
    c.Edad <> cn.Edad OR
    c.Rango_Etario <> cn.Rango_Etario OR
    c.IdLocalidad <> cn.IdLocalidad OR
    c.Latitud <> cn.Latitud OR
    c.Longitud <> cn.Longitud OR
    c.Fecha_Ultima_Modificacion <> cn.Fecha_Ultima_Modificacion OR
    c.Usuario_Ultima_Modificacion <> cn.Usuario_Ultima_Modificacion OR
    c.Marca_Baja <> cn.Marca_Baja);

UPDATE cliente c, cliente_novedades cn
SET c.Nombre_Y_Apellido = cn.Nombre_Y_Apellido,
	c.Domicilio = cn.Domicilio,
    c.Telefono = cn.Telefono,
    c.Edad = cn.Edad,
    c.Rango_Etario = cn.Rango_Etario,
    c.IdLocalidad = cn.IdLocalidad,
    c.Latitud = cn.Latitud,
    c.Longitud = cn.Longitud,
    c.Fecha_Ultima_Modificacion = cn.Fecha_Ultima_Modificacion,
    c.Usuario_Ultima_Modificacion = cn.Usuario_Ultima_Modificacion,
    c.Marca_Baja = cn.Marca_Baja
WHERE c.IdCliente = cn.ID
AND (c.Nombre_Y_Apellido <> cn.Nombre_Y_Apellido OR
	c.Domicilio <> cn.Domicilio OR
    c.Telefono <> cn.Telefono OR
    c.Edad <> cn.Edad OR
    c.Rango_Etario <> cn.Rango_Etario OR
    c.IdLocalidad <> cn.IdLocalidad OR
    c.Latitud <> cn.Latitud OR
    c.Longitud <> cn.Longitud OR
    c.Fecha_Ultima_Modificacion <> cn.Fecha_Ultima_Modificacion OR
    c.Usuario_Ultima_Modificacion <> cn.Usuario_Ultima_Modificacion OR
    c.Marca_Baja <> cn.Marca_Baja);

DELETE FROM cliente_novedades cn WHERE cn.ID IN (SELECT c.IdCliente FROM cliente c);

/*Se cargan las novedades en la tabla de Clientes:*/
INSERT INTO cliente (IdCliente, 
					Nombre_Y_Apellido, 
                    Domicilio, 
                    Telefono, 
                    Edad, 
                    Rango_Etario, 
                    IdLocalidad, 
                    Latitud, 
                    Longitud,
					Fecha_Alta,
					Usuario_Alta,
					Fecha_Ultima_Modificacion,
					Usuario_Ultima_Modificacion,
					Marca_Baja)
SELECT	ID, 
		Nombre_Y_Apellido, 
		Domicilio, 
		Telefono, 
		Edad, 
		Rango_Etario, 
		IdLocalidad, 
		Latitud, 
		Longitud,
		Fecha_Alta,
		Usuario_Alta,
		Fecha_Ultima_Modificacion,
		Usuario_Ultima_Modificacion,
		Marca_Baja
FROM 	cliente_novedades;

/*Se procede con el procesado de los datos de la tabla venta_novedades que no hayan sido cargados con anterioridad:*/
DELETE FROM venta_novedades WHERE IdVenta IN (SELECT IdVenta FROM venta);

SELECT * FROM venta_novedades;

UPDATE `venta_novedades` set `Precio` = 0 WHERE `Precio` = '';
ALTER TABLE `venta_novedades` CHANGE `Precio` `Precio` DECIMAL(15,3) NOT NULL DEFAULT '0';

UPDATE venta_novedades v JOIN producto p ON (v.IdProducto = p.IdProducto) 
SET v.Precio = p.Precio
WHERE v.Precio = 0;

UPDATE venta_novedades SET Cantidad = REPLACE(Cantidad, '\r', '');

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, 0, 1
FROM venta_novedades WHERE Cantidad = '' or Cantidad is null;

UPDATE venta_novedades SET Cantidad = '1' WHERE Cantidad = '' or Cantidad is null;
ALTER TABLE `venta_novedades` CHANGE `Cantidad` `Cantidad` INTEGER NOT NULL DEFAULT '0';

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT v.IdVenta, v.Fecha, v.Fecha_Entrega, v.IdCliente, v.IdSucursal, v.IdEmpleado, v.IdProducto, v.Precio, v.Cantidad, 2
FROM venta_novedades v 
JOIN (SELECT IdProducto, AVG(Cantidad) As Promedio, STDDEV(Cantidad) as Desv FROM venta_novedades GROUP BY IdProducto) v2
	on (v.IdProducto = v2.IdProducto)
WHERE v.Cantidad > (v2.Promedio + (3 * v2.Desv)) OR v.Cantidad < 0;

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT v.IdVenta, v.Fecha, v.Fecha_Entrega, v.IdCliente, v.IdSucursal, v.IdEmpleado, v.IdProducto, v.Precio, v.Cantidad, 3
FROM venta_novedades v 
JOIN (SELECT IdProducto, AVG(Precio) As Promedio, STDDEV(Precio) as Desv FROM venta_novedades GROUP BY IdProducto) v2
	on (v.IdProducto = v2.IdProducto)
WHERE v.Precio > (v2.Promedio + (3 * v2.Desv)) OR v.Precio < 0;

select * from aux_venta where Motivo = 2; -- outliers de cantidad
select * from aux_venta where Motivo = 3; -- outliers de precio

ALTER TABLE `venta_novedades` ADD `Outlier` TINYINT NOT NULL DEFAULT '1' AFTER `Cantidad`;

UPDATE venta_novedades v JOIN aux_venta a
	ON (v.IdVenta = a.IdVenta AND a.Motivo IN (2,3))
SET v.Outlier = 0;

UPDATE venta_novedades SET IdEmpleado = (IdSucursal * 1000000) + IdEmpleado;

/*Se cargan las novedades en la tabla de Ventas:*/
INSERT INTO venta (IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Outlier)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Outlier
FROM venta_novedades;