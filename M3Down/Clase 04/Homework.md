![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Homework

A lo largo del módulo ustedes serán los analistas de datos de una compañía de venta de insumos tecnológicos al público. A lo largo de las prácticas se harán cargo de la información de la empresa y realizarán el proceso completo de captura, limpieza, análisis, diagnóstico, documentación, explotación y publicación de resultados.

La Dirección de Ventas ha solicitado las siguientes tablas a Marketing con el fin de que sean integradas:

* La tabla de puntos de venta propios, un Excel frecuentemente utilizado para contactar a cada sucursal, actualizada en 2021.
* La tabla de empleados, un Excel mantenido por el personal administrativo de RRHH.
* La tabla de proveedores, un Excel mantenido por un analista de otra dirección que ya no esta en la empresa. 
* La tabla de clientes, alojada en el CRM de la empresa.
* La tabla de productos, un Excel mantenido por otro analista.
* Las tablas de ventas, gastos y compras, tres archivos CSV generados a partir del sistema transaccional de la empresa.

Es necesario realizar la captura de esos archivos e ingestarlos dentro de nuestra base de datos.

### Sugerencia:

#### Instrucción LOAD DATA

LOAD DATA sirve para tomar cualquier archivo CSV y cargarlo dentre de una tabla.
La sintaxis básica es:

```sql
LOAD DATA LOCAL INFILE '/importfile.csv'
INTO TABLE test_table
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
(field1, filed2, field3);
```

LOAD DATA indica que debe cargar un archivo csv (cualquier hoja de cálculo puede generar este tipo de archivos); si pasamos la opción LOCAL indicamos que el archivo esta en nuestra máquina y que debe ser leí­do por el cliente y enviado al servidor; sino, la ruta (absoluta o relativa) es en el servidor.

Si dentro de la tabla hay registros, la violación de claves primarias podría causar la detención de la carga, entonces escribimos las opciones IGNORE (ignora las filas que violen el constraint y no las inserta) o REPLACE (agrega las filas reemplazando las existentes).

```sql
LOAD DATA LOCAL INFILE ‘ruta_archivo’
REPLACE INTO TABLE ‘nombre de la tabla’
```

Es necesario indicarle a MySQL cual es el separador de campos con "FIELDS TERMINATED BY ‘;’"
Por lo general se usa coma (,) aunque tambien pueden aparecer el punto y coma (;) ó el pipe (|)
Tambien se puede indicar con que están encerradas las cadenas, si comillas simples, dobles, numerales (#), acentos viriguardilla (~) con "FIELDS ENCLOSED BY ‘»‘"
Se pueden agregar OPTIONALLY para indicar que algunos campos estan encerrados con comillas, pero no todos con "FIELDS OPTIONALLY ENCLOSED BY ‘#’"
Para iniciar una lína, es posible usar "LINES STARTING BY ‘»’" (indica que las lineas empiezan en una cadena vacia)
Para terminar una línea, es posible usar "LINES TERMINATED BY ‘\n’", indicando que  la lina termina con un salto de linea (\n).
Si en el archivo CSV hay una o mas filas que representan los encabezados de los campos y desean «obviarlas» entonces es posible usar "IGNORE 1 LINES".

Para indicar su orden de guardado en la tabla; ejemplo, tenemos una tabla:
nombre, apellido, cedula, fecha_nacimiento
pero en el csv los campos vienen cedula, nombre, apellido, fecha_nacimiento, entonces colocamos entre parentesis los campos asi:
(cedula, nombre, apellido, fecha_nacimiento)
Primera columna de mi csv corresponde al campo cedula, segunda al nombre y asi suscesivamente.

Si acaso el archivo está guardado en ANSI, entonces se puede pasar opcionalmente el charset en el que está el archivo en la sentencia "CHARACTER SET latin1":
Si acaso el archivo está guardado en UTF8, entonces se puede pasar opcionalmente el charset en el que está el archivo en la sentencia "CHARACTER SET utf8":

```sql
LOAD DATA LOCAL INFILE ‘ruta_archivo’
CHARACTER SET latin1
INTO TABLE ‘nombre de la tabla’
```

* charset: Define el juego de caracteres con el que MySQL guardará los datos de forma interna.
* collation: Define la forma en el que MySQL buscará y ordenará los datos.

Un ejemplo de sintaxis completa queda:

```sql
LOAD DATA LOCAL INFILE ‘archivo’
CHARACTER SET 
IGNORE
FIELDS TERMINATED BY ‘;’ ENCLOSED BY ‘»‘
LINES STARTING BY » TERMINATES BY »
IGNORE 1 LINES
(field1, field2, field3, @field4)
```sql

