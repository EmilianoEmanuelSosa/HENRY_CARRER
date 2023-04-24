USE henry;

-- 1. ¿Cuantas carreas tiene Henry?
SELECT count(idCarrera)
from carrera;

-- 2. ¿Cuantos alumnos hay en total?
SELECT DISTINCT count(*) as cantidad_alumnos
FROM alumno;

-- 3. ¿Cuantos alumnos tiene cada cohorte?
SELECT idCohorte, count(*) as cantidad_alumnos
FROM alumno
GROUP BY idCohorte;

-- 4. Confecciona un listado de los alumnos ordenado por los últimos alumnos que ingresaron, 
-- con nombre y apellido en un solo campo.
SELECT concat(nombre, ' ', apellido) AS nombre_apellido, fechaIngreso
FROM alumno
ORDER BY fechaIngreso DESC;

-- 5. ¿Cual es el nombre del primer alumno que ingreso a Henry?
SELECT concat(nombre, ' ', apellido) AS nombre_apellido, fechaIngreso
FROM alumno
ORDER BY fechaIngreso
LIMIT 3;

-- 6. ¿En que fecha ingreso?
SELECT date_format(fechaIngreso, '%d/%n/%Y') as fecha_ingreso
FROM alumno
ORDER BY fechaIngreso
LIMIT 1;

-- 7. ¿Cual es el nombre del ultimo alumno que ingreso a Henry?
SELECT concat(nombre, ' ', apellido) AS nombre_apellido, fechaIngreso
FROM alumno
ORDER BY fechaIngreso DESC
LIMIT 1;

-- 8. La función YEAR le permite extraer el año de un campo date,
-- utilice esta función y especifique cuantos alumnos ingresarona a Henry por año.
SELECT YEAR(fechaIngreso) AS año_ingreso, count(*) AS cantidad
FROM alumno
GROUP BY YEAR(fechaIngreso)
ORDER BY 1;

-- 9. ¿Cuantos alumnos ingresaron por semana a henry?, indique también el año. WEEKOFYEAR()
SELECT YEAR(fechaIngreso) AS año, WEEKOFYEAR(fechaIngreso) as semana, count(*) as cantidad
FROM alumno
GROUP BY YEAR(fechaIngreso), WEEKOFYEAR(fechaIngreso)
ORDER BY 1,2;

-- 10. ¿En que años ingresaron más de 20 alumnos?
SELECT YEAR(fechaIngreso) AS año_ingreso, count(*) AS cantidad
FROM alumno
GROUP BY YEAR(fechaIngreso)
HAVING count(*) > 20
ORDER BY 1;

-- 11. Investigue las funciones TIMESTAMPDIFF() y CURDATE().
-- ¿Podría utilizarlas para saber cual es la edad de los instructores?.
-- ¿Como podrías verificar si la función cálcula años completos? Utiliza DATE_ADD().
SELECT concat(nombre, ' ', apellido) AS nombre_apellido, timestampdiff(YEAR, fechaNacimiento, curdate()) AS años,
date_add(fechaNacimiento,interval timestampdiff(Year,fechaNacimiento, curdate()) year) as verificacion,
fechaNacimiento
FROM instructor
ORDER BY 1;

-- 12. Cálcula:
--            - La edad de cada alumno.<br>
--            - La edad promedio de los alumnos de henry.<br>
--           - La edad promedio de los alumnos de cada cohorte.<br>

SELECT concat(nombre, ' ', apellido) AS nombre_apellido, timestampdiff(YEAR, fechaNacimiento, curdate()) AS años,
date_add(fechaNacimiento,interval timestampdiff(Year,fechaNacimiento, curdate()) year) as verificacion,
fechaNacimiento
FROM alumno
ORDER BY 1;

SELECT avg(timestampdiff(YEAR, fechaNacimiento, curdate())) as edad_promedio
FROM alumno;

SELECT idCohorte, avg(timestampdiff(YEAR, fechaNacimiento, curdate())) as edad_promedio
FROM alumno
GROUP BY idCohorte;

SELECT *
from alumno
WHERE idCohorte = 1241
and fechaNacimiento < '1950-01-01';

update alumno
set fechaNacimiento = '2002-01-02'
where idAlumno = 127;

-- 13. Elabora un listado de los alumnos que superan la edad promedio de Henry.
SELECT concat(nombre, ' ', apellido) AS nombre_apellido,
timestampdiff(YEAR, fechaNacimiento, curdate()) AS años
FROM alumno
WHERE timestampdiff(YEAR, fechaNacimiento, curdate()) >
	(SELECT avg(timestampdiff(YEAR, fechaNacimiento, curdate())) as edad_promedio
	FROM alumno)
ORDER BY 2;





