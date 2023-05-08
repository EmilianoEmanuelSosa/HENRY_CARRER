![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Homework

1. Crear una tabla que permita realizar el seguimiento de los usuarios que ingresan nuevos registros en fact_venta.
2. Crear una acción que permita la carga de datos en la tabla anterior.
3. Crear una tabla que permita registrar la cantidad total registros, luego de cada ingreso la tabla fact_venta.
4. Crear una acción que permita la carga de datos en la tabla anterior.
5. Crear una tabla que agrupe los datos de la tabla del item 3, a su vez crear un proceso de carga de los datos agrupados.
6. Crear una tabla que permita realizar el seguimiento de la actualización de registros de la tabla fact_venta.
7. Crear una acción que permita la carga de datos en la tabla anterior, para su actualización.

### Carga Incremental

En este punto, ya contamos con toda la información de los datasets originales cargada en el DataWarehouse diseñado. Sin embargo, la gerencia, requiere la posibilidad de evaluar agregar a esa información la operatoria diara comenzando por la información de Ventas. Para lo cual, en la carpeta "Carga_Incremental" se disponibilizaron los archivos:

* Ventas_Actualizado.csv: Tiene una estructura idéntica al original, pero con los registros del día 01/01/2021.
* Clientes_Actializado.csv: Tiena una estructura idéntica al original, pero actualizado al día 01/01/2021.

Es necesario diseñar un proceso que permita ingestar al DataWarehouse las novedades diarias, tanto de la tabla de ventas como de la tabla de clientes.
Se debe tener en cuenta, que dichas fuentes actualizadas, contienen la información original más las novedades, por lo tanto, en la tabla de "ventas" es necesario identificar qué registros son nuevos y cuales ya estaban cargados anteriormente, y en la tabla de clientes tambien, con el agregado de que en ésta última, pueden haber además registros modificados, con lo que hay que hacer uso de los campos de auditoría de esa tabla, por ejemplo, Fecha_Modificación.

## Homework Adicional

### 1) Variables, Funciones y Procedimientos

1. Crear un procedimiento que recibe como parametro una fecha y muestre el listado de productos que se vendieron en esa fecha.<br>
2. Crear una función que calcule el valor nominal de un margen bruto determinado por el usuario a partir del precio de lista de los productos.
3. Obtner un listado de productos de IMPRESION y utilizarlo para cálcular el valor nominal de un margen bruto del 20% de cada uno de los productos.
4. Crear un procedimiento que permita listar los productos vendidos desde fact_venta a partir de un "Tipo" que determine el usuario.
5. Crear un procedimiento que permita realizar la insercción de datos en la tabla fact_venta.
6. Crear un procedimiento almacenado que reciba un grupo etario y devuelta el total de ventas para ese grupo.
7. Crear una variable que se pase como valor para realizar una filtro sobre Rango_etario en una consulta génerica a dim_cliente.

### 2) Join

1. Obtener un listado del nombre y apellido de cada cliente que haya adquirido algun producto junto al id del producto y su respectivo precio.
2. Obteber un listado de clientes con la cantidad de productos adquiridos, incluyendo aquellos que nunca compraron algún producto.
3. Obtener un listado de cual fue el volumen de compra (cantidad) por año de cada cliente. 
4. Obtener un listado del nombre y apellido de cada cliente que haya adquirido algun producto junto al id del producto, la cantidad de productos adquiridos y el precio promedio.
5. Cacular la cantidad de productos vendidos y la suma total de ventas para cada localidad, presentar el análisis en un listado con el nombre de cada localidad.
6. Cacular la cantidad de productos vendidos y la suma total de ventas para cada provincia, presentar el análisis en un listado con el nombre de cada provincia, pero solo en aquellas donde la suma total de las ventas fue superior a $100.000.
7. Obtener un listado de cantidad de productos vendidos por rango etario y las ventas totales en base a esta misma dimensión.
8. Obtener la cantidad de clientes por provincia.

### 3) Subconsultas, Vistas y Funciones Ventana

1. Comprara el promedio de ventas por tipo de producto, visualizando con Outliers y sin outliers.
2. Obtener el total de ventas del primer día y útlimo día sobre los cuales se tenga resgitros.
3. Obtenga un listado de los productos vendidos y del total de ventas de cada uno, según los requisitos del punto anterior.
4. Obtenga el importe total de ventas por fecha y a partir de este último listado, en que fecha se obtuvo el récord de ventas.
5. Obtenga el porcentaje de clientes por provincia, que sí realizaron compras.
6. Obtener el promedio de días que transcurren por producto entre operación y operación de venta.
7. Obtener por IdProducto, desde la tabla venta, los valores correspondientes a la mediana del precio. Investigar las funciones FLOOR() y CEILING().
8. Obtener la Mediana de Edad, por rango etario, a partir del maestro de Clientes.