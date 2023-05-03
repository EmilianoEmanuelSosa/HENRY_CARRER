DROP DATABASE HENRY;
CREATE DATABASE HENRY;
USE HENRY;

CREATE TABLE carrera (
    idcarrera INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    PRIMARY KEY(idcarrera)
);

CREATE TABLE instructor (
	idInstructor INT NOT NULL AUTO_INCREMENT,
	cedulaIdentidad VARCHAR(30) NOT NULL,
	nombre VARCHAR(40) NOT NULL,
	apellido VARCHAR(40) NOT NULL,
	fechaNacimiento DATE NOT NULL,
	fechaIncorporacion DATE,
	PRIMARY KEY (idInstructor)
);

CREATE TABLE cohorte (
    idCohorte INT NOT NULL AUTO_INCREMENT,
    Codigo VARCHAR(255),
    idCarrera INT NOT NULL,
    idInstructor INT NOT NULL,
    fechaInicio DATE,
    fechaFinalizacion DATE,
    FOREIGN KEY (idInstructor) REFERENCES instructor(idInstructor),
    FOREIGN KEY(idCarrera) REFERENCES carrera(idCarrera),
    PRIMARY KEY (idCohorte)
);

CREATE TABLE alumno (
    idAlumno INT NOT NULL AUTO_INCREMENT,
    cedulaIdentidad VARCHAR(30) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    fechaIngreso DATE ,
    idCohorte INT,
    FOREIGN KEY (idCohorte) REFERENCES cohorte(idCohorte),
    PRIMARY KEY(idAlumno)
);
-- ESTRUCTURE OF A TABLE
DESC carrera; 
--TO SEE THE CONTENT OF TABLE
SELECT * FROM Alumnos; 
-- 
ALTER TABLE alumno RENAME COLUMN IDAlumnos TO id_alumno
-- 
ALTER TABLE alumno CHANGE ;
--ALTER TABLE student_details ADD student_grade VARCHAR(5); to add Column
--INSERT INTO student_details(student_full_name, student_year) VALUES('John Doe','1st'); para insertar

show tables;

SELECT * FROM alumno;

RENAME TABLE alumnos TO alumno;
select * from alumno;


SELECT instructor.nombre,cohorte.idInstructor
FROM cohorte
INNER JOIN instructor
ON cohorte.idInstructor = instructor.idInstructor
where idCarrera=1;
SELECT alumno.nombre, alumno.apellido, alumno.fechaNacimiento, carrera.Nombre
FROM alumno
INNER JOIN cohorte
ON cohorte.idCohorte=idCohorte
INNER JOIN carrera
ON carrera = idcarrera;