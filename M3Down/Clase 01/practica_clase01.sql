use henry;

SET @anio = 2019;

SELECT *
FROM alumno
WHERE year(fechaIngreso) = @anio;

SELECT @promedio_edad := avg(timestampdiff(year, fechaNacimiento, curdate()))
FROM alumno;

SELECT @promedio_edad;

SHOW databases;
SHOW tables;
SHOW variables;

SET GLOBAL log_bin_trust_function_creators = 1; -- Para que me permita crear funciones

-- Crear una función
DELIMITER $$
CREATE FUNCTION antMeses(fechaIngreso DATE) RETURNS INT
BEGIN
	DECLARE meses INT;
    SET meses = timestampdiff(month, fechaIngreso, curdate());
    RETURN meses;
END$$
DELIMITER ;

SELECT antMeses('2019-05-05');
SET @ant_meses = antMeses('2019-05-05');
SELECT @ant_meses;

-- Crear un procedimiento
DELIMITER $$
CREATE PROCEDURE getTotalAlumnos()
BEGIN
	DECLARE total_alumnos INT DEFAULT 0;
    SELECT count(*) INTO total_alumnos
    FROM alumno;
    
    SELECT total_alumnos;
END$$
DELIMITER ;

CALL getTotalAlumnos();

















