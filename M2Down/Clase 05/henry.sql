CREATE DATABASE HENRY;
USE HENRY;

CREATE TABLE Carrera (
    ID INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255),
    PRIMARY KEY(ID)
);

CREATE TABLE Instructor(
    ID INT NOT NULL AUTO_INCREMENT,
    Cedula_identidad INT NOT NULL,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    Date_birth DATE,
    Date_incorporation DATE,
    Cohorte_by INT NOT NULL,
    PRIMARY KEY(ID)
);

CREATE TABLE Cohorte (
    ID INT NOT NULL AUTO_INCREMENT,
    Codigo VARCHAR(255),
    Carrera_by INT NOT NULL,
    Date_start DATE,
    Date_finish DATE,
    instructor_by INT NOT NULL,
    FOREIGN KEY (instructor_by) REFERENCES Instructor(ID),
    FOREIGN KEY(Carrera_by) REFERENCES Carrera(ID),
    PRIMARY KEY (ID)
);

CREATE TABLE Alumnos (
    ID INT NOT NULL AUTO_INCREMENT,
    Cedula_identidad INT NOT NULL,
    Nombre VARCHAR(255),
    Apellido VARCHAR(255),
    date_birth DATE,
    date_admission DATE,
    Cohorte_by INT NOT NULL,
    FOREIGN KEY (Cohorte_by) REFERENCES Cohorte(ID),
    PRIMARY KEY(ID),
);