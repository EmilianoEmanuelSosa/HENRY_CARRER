![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Homework

1. Genere 5 consultas simples con alguna función de agregación y filtrado sobre las tablas. Anote los resultados del la ficha de estadísticas.
2. A partir del conjunto de datos elaborado en clases anteriores, genere las PK de cada una de las tablas a partir del campo que cumpla con los requisitos correspondientes.
3. Genere la indexación de los campos que representen fechas o ID en las tablas:
- venta.
- cana_venta.
- producto.
- tipo_producto.
- sucursal.
- empleado.
- localidad.
- proveedor.
- gasto.
- cliente.
- compra.
4. Ahora que las tablas están indexadas, vuelva a ejecutar las consultas del punto 1 y evalue las estadístias. ¿Nota alguna diferencia?.
5. Genere una nueva tabla que lleve el nombre fact_venta (modelo estrella) que pueda agrupar los hechos relevantes de la tabla venta, los campos a considerar deben ser los siguientes:

- IdVenta
- Fecha
- Fecha_Entrega
- IdCanal
- IdCliente
- IdEmpleado
- IdProducto
- Precio
- Cantidad

6. A partir de la tabla creada en el punto anterior, deberá poblarla con los datos de la tabla ventas.