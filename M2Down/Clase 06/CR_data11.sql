-- HOMEWORK CLASE 5 #

/* """
Comentario
MULTILINEA
IF EXISTS
""" */

DROP DATABASE IF EXISTS henry;
CREATE DATABASE henry;

USE henry; -- Utilizar BD
DROP TABLE IF EXISTS carrera;
CREATE TABLE carrera (
	carrera_ID INT NOT NULL AUTO_INCREMENT, -- Entero no nulo que se va a incrementar solo
    nombre VARCHAR(20) NOT NULL,
    PRIMARY KEY(carrera_ID)
);

-- SELECT * FROM carrera; SELECCIONA TODOS LOS DATOS DE carrera

CREATE TABLE instructor (
	instructor_id INT NOT NULL AUTO_INCREMENT , 
    cedula VARCHAR(25) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY(instructor_id)
);
-- SELECT * FROM instructor;

CREATE TABLE cohorte (
	cohorte_id INT NOT NULL AUTO_INCREMENT,
    codigo VARCHAR(45) NOT NULL,
    carrera_id INT NOT NULL,
    instructor_id INT NOT NULL,
    fecha_inicio DATE,
    fecha_finalizacion DATE,
    PRIMARY KEY (cohorte_id),
    FOREIGN KEY(carrera_id) REFERENCES carrera(carrera_ID),
    FOREIGN KEY(instructor_id) REFERENCES instructor(instructor_id)
);
-- SELECT * FROM cohorte;


CREATE TABLE alumno (
	alumno_id INT NOT NULL AUTO_INCREMENT,
    cedula VARCHAR(25) NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
	fecha_ingreso DATE,
    cohorte_id INT,
    PRIMARY KEY(alumno_id),
    FOREIGN KEY(cohorte_id) REFERENCES cohorte(cohorte_id)
);
-- SELECT * FROM alumno;

-- Lecture

-- INSERT INTO EJ 1

DROP TABLE IF EXISTS alumnos;
CREATE TABLE alumnos(
	nombre VARCHAR(45) NOT NULL,
    apellido VARCHAR(45) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    pais VARCHAR(80) NOT NULL,
    cedulaIdentidad CHAR(20) NOT NULL,
	PRIMARY KEY(cedulaIdentidad)
);

INSERT INTO alumnos(nombre,apellido,fecha_nacimiento,ciudad,pais,cedulaIdentidad)
VALUES ('Maria','Becerra','2000-4-1', 'Rosario', 'Argentina', 38546122);

INSERT INTO alumnos(nombre,apellido,fecha_nacimiento,ciudad,pais,cedulaIdentidad)
VALUES ('El','Duki','1998-9-8', 'Santa Fe', 'Colombia', 39874156);

SELECT * FROM alumnos;

-- INSERT INTO ej 2
INSERT INTO alumnos(nombre,apellido,fecha_nacimiento,ciudad,pais,cedulaIdentidad)
VALUES ('Jeronimo','Gonzalez','1988-8-9', 'Córdoba', 'Argentina', 33687456),
	   ('Ricardo','Lorenzo','1975-2-10','La Paz','Bolivia',20856147),
       ('Carlos','Principe','1985-6-11','Montevideo','Uruguay',25478369);

SELECT * FROM alumnos;

-- INSERT INTO EJ 3

INSERT INTO alumnos
VALUES ('Ernesto','Corvalan','1993-12-12','Caleta Oliva','Argentina',35879145),
	   ('Roberto','Carlos','1997-1-13','Ciudad de Mexico','Mexico',37854698),
       ('Luis','Rodriguez','1976-3-14','Montevideo','Uruguay',20896369),
       ('Hernan','Crespo','1999-9-15','Santiago de Chile','Chile',39546178);
       
SELECT * FROM alumnos;

-- Modificar datos EJ 1

UPDATE alumnos
SET nombre = 'Juan'
WHERE cedulaIdentidad LIKE 35879145;

SELECT * FROM alumnos
WHERE cedulaIdentidad = '35879145';

-- Modificar datos EJ 2

UPDATE alumnos
SET nombre = 'Juan', ciudad='Santa Fe'
WHERE cedulaIdentidad = '33687456';
/*
UPDATE alumnos
SET nombre='Carlos'
;
*/
SELECT * FROM alumnos;
-- WHERE idAlumno = 1;

DELETE FROM alumnos WHERE idAlumno = 1;

DELETE FROM alumnos WHERE cedulaIdentidad = 33687456;

SELECT * FROM alumnos
WHERE cedulaIdentidad < 33687456;

DELETE FROM alumnos WHERE cedulaIdentidad < 33687456;

SELECT * FROM ALUMNOS
WHERE nombre IN ('Maria','Jose','Jorge','Hernan');

SELECT nombre, apellido, cedulaIdentidad 
FROM alumnos
WHERE pais LIKE 'Argentina';

SELECT nombre, apellido, fecha_nacimiento, ciudad, pais, cedulaIdentidad
FROM alumnos;
SELECT * FROM alumnos;
select CeDuLaIdEnTiDaD from ALUMNOS;

SELECT MAX(cedulaIdentidad) AS Mayor
FROM alumnos;

SELECT nombreProducto, subtotal + impuestos AS Total
FROM productos;

SELECT nombreColaborador, sueldo - retenciones AS SueldoNeto
FROM staff;

SELECT nombreProducto, precio * cantidad AS Total
FROM productos;

SELECT * FROM ALUMNOS
WHERE fecha_nacimiento BETWEEN '1998-1-1' AND '2001-1-1';

SELECT * FROM alumnos
WHERE pais LIKE '%ivia%';

SELECT * FROM alumnos
WHERE nombre IN ('Maria','Hernan','Jose','Jorge');

-- < > = !=
SELECT * FROM alumnos
WHERE cedulaIdentidad != 33687456;

SELECT * FROM alumnos
WHERE pais = 'Argentina' AND pais = 'Mexico';

SELECT * FROM ALUMNOS
WHERE pais = 'Argentina' OR pais = 'Mexico';

SELECT * FROM alumnos
WHERE NOT pais = 'Argentina';

