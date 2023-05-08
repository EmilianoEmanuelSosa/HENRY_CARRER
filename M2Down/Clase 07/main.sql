use HENRY;
select * from alumno;
select idCohorte,count(idCohorte) as AlumnosTotales from alumno group by idcohorte;
select fechaIngreso,concat(nombre,', ',apellido) as ultimos_ingresos
from alumno
order by fechaIngreso;
select 
select * from alumno;