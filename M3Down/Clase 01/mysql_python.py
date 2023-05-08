#Material adicional
#Mostrar conexión entre python y MySql
import pymysql

conexion = pymysql.connect(host='localhost',
                           database = 'test',
                           user= 'root',
                           password='')

cursor = conexion.cursor()

cursor.execute("SELECT * FROM alumnos")

for id_alumno, nombre, apellido, dni, email in cursor:
   #print(id_alumno, apellido, email)
   if nombre == "Estela": print(id_alumno, nombre, apellido, dni, email)

conexion.close()
