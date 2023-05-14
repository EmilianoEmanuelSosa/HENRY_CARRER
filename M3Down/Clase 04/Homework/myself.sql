DROP DATABASE iF  EXISTS henry_m3;
CREATE DATABASE IF NOT EXISTS henry_m3;
USE henry_m3;

drop table if exists products;
CREATE TABLE IF NOT EXISTS products(
ID_PRODUCTO INTEGER,
Concepto varchar (255),
Tipo varchar(30),
Precio2 VARCHAR(255)) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;



LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/PRODUCTOS.csv'
INTO TABLE products
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table if exists empleados;
create table if not exists empleados(
    ID_empleado INTEGER,
    Apellido VARCHAR(30),
    Nombre VARCHAR(30),
    Sucursal VARCHAR(30),
    Sector VARCHAR(30),
    Cargo VARCHAR(30),
    Salario VARCHAR(30)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Empleados.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


drop table if exists sucursales;
create table if not exists sucursales(
    IDsucursales INTEGER,
    Direccion VARCHAR(30),
    Localidad VARCHAR(30),
    Provincia VARCHAR(30),
    Latitud VARCHAR(30),
    Longitud VARCHAR(30)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Sucursales.csv'
INTO TABLE empleados
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS `gasto`;
CREATE TABLE IF NOT EXISTS `gasto` (
  	`IdGasto` 		INTEGER,
  	`IdSucursal` 	INTEGER,
  	`IdTipoGasto` 	INTEGER,
    `Fecha`			DATE,
  	`Monto` 		DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	

LOAD DATA INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Gasto.csv'
INTO TABLE `gasto` 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1
LINES (IdGasto,IdSucursal,IdTipoGasto,Fecha,Monto);
