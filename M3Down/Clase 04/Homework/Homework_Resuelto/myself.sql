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
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

DROP TABLE IF EXISTS gasto;
CREATE TABLE IF NOT EXISTS gasto(
  	IdGasto 		INTEGER,
  	IdSucursal 	INTEGER,
  	IdTipoGasto 	INTEGER,
    Fecha			DATE,
  	Mont 		DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;	

LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Gasto.csv'
INTO TABLE gasto
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table if exists Cliente;
create table if not exists Cliente(
  IDClientes INTEGER,
  Provincia VARCHAR(255),
  Nombre_y_Apellido VARCHAR(255),
  Domicilo VARCHAR(255),
  Telefono VARCHAR(255),
  Edad VARCHAR(10),
  Localidad VARCHAR(200),
  x VARCHAR(30),
  Y VARCHAR(30),
  Fecha_Alta DATE NOT NULL,
  Usuario_Alta VARCHAR(30),
  Fecha_Ultima_Modificacion DATE NOT NULL,
  Usuario_Ultima_Modificacion VARCHAR(30),
  Marca_Baja TINYINT,
  col10 VARCHAR(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Clientes.csv'
INTO TABLE Cliente
FIELDS TERMINATED BY ';' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS compra;
CREATE TABLE IF NOT EXISTS compra (
  IdCompra			INTEGER,
  Fecha 				DATE,
  IdProducto			INTEGER,
  Cantidad			INTEGER,
  Precio				DECIMAL(10,2),
  IdProveedor			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Compra.csv' 
INTO TABLE compra 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS venta;
CREATE TABLE IF NOT EXISTS venta (
  IdVenta				INTEGER,
  Fecha 				DATE NOT NULL,
  Fecha_Entrega 		DATE NOT NULL,
  IdCanal				INTEGER, 
  IdCliente			INTEGER, 
  IdSucursal			INTEGER,
  IdEmpleado			INTEGER,
  IdProducto			INTEGER,
  Precio				VARCHAR(30),
  Cantidad			VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Venta.csv' 
INTO TABLE venta 
FIELDS TERMINATED BY ',' ENCLOSED BY '' ESCAPED BY '' 
LINES TERMINATED BY '\r\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS canal_venta;
CREATE TABLE IF NOT EXISTS canal_venta (
  IdCanal				INTEGER,
  Canal 				VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/CanalDeVenta.csv' 
INTO TABLE canal_venta 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS tipo_gasto;
CREATE TABLE IF NOT EXISTS tipo_gasto (
  IdTipoGasto int(11) NOT NULL AUTO_INCREMENT,
  Descripcion varchar(100) NOT NULL,
  Monto_Aproximado DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (IdTipoGasto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/TiposDeGasto.csv' 
INTO TABLE tipo_gasto 
FIELDS TERMINATED BY ',' ENCLOSED BY '\"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS proveedor;
CREATE TABLE IF NOT EXISTS proveedor (
	IDProveedor		INTEGER,
	Nombre			VARCHAR(80),
	Domicilio		VARCHAR(150),
	Ciudad			VARCHAR(80),
	Provincia		VARCHAR(50),
	Pais			VARCHAR(20),
	Departamento	VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA LOCAL INFILE '/home/mkm/programin/HENRY_CARRER/M3Down/Clase 04/Homework/Provedores.csv' 
INTO TABLE proveedor
FIELDS TERMINATED BY ',' ENCLOSED BY '\"' ESCAPED BY '\"' 
LINES TERMINATED BY '\n' IGNORE 1 LINES;



