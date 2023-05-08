#Ejemplo de insersión usando Python
import pymysql

conn = pymysql.connect(
 host="localhost",
 user="root",
 passwd="",
 db="test"
)

cursor = conn.cursor()

articulos = [
 (5,"TV Philips", 38000),
 (6,"Cel Motorola", 41350),
 (7,"Cel Samsung", 27800)
]
prod = 'Secador Pelo'
precio = 36800

#cursor.execute("INSERT INTO productos VALUES (3,'Aspiradora', 25000);")
#cursor.execute("INSERT INTO productos VALUES (%s, %s, %s)", (4,prod,precio))
cursor.executemany("INSERT INTO productos VALUES (%s, %s, %s)", articulos)


conn.commit()
conn.close()
