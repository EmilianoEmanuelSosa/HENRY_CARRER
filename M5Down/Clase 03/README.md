![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Power Query

El editor de Power Query representa la interfaz de usuario de Power Query, donde puede agregar o modificar consultas, administrar consultas agrupando o agregando descripciones a los pasos de consulta o visualizar las consultas y su estructura con diferentes vistas. La interfaz de usuario de Power Query tiene cinco componentes distintos.

![Editor](https://docs.microsoft.com/en-us/power-query/media/power-query-ui/pqui-user-interface.png)

- Cinta de opciones: la experiencia de navegación de la cinta de opciones, que proporciona varias pestañas para agregar transformaciones, seleccionar opciones para su consulta y acceder a diferentes botones de la cinta para completar varias tareas.
- Panel de consultas: una vista de todas las consultas disponibles.
- Vista actual: su vista de trabajo principal, que de forma predeterminada, muestra una vista previa de los datos de su consulta.
- Configuración de consulta: una vista de la consulta seleccionada actualmente con información relevante, como el nombre de la consulta, los pasos de la consulta y varios indicadores.
- Barra de estado: una barra que muestra información importante relevante sobre la consulta, como el tiempo de ejecución, el total de columnas y filas, y el estado de procesamiento. Esta barra también contiene botones para cambiar la vista actual.

#### La cinta de opciones
La cinta de opciones es el componente donde encontrará la mayoría de las transformaciones y acciones que puede realizar en el editor de Power Query. Tiene múltiples pestañas, cuyos valores dependen de la integración del producto. Cada una de las pestañas proporciona botones y opciones específicos, algunos de los cuales pueden ser redundantes en toda la experiencia de Power Query. Estos botones y opciones le proporcionan un fácil acceso a las transformaciones y acciones que pueda necesitar.

![Cinta](https://docs.microsoft.com/en-us/power-query/media/power-query-ui/standard-ribbon.png)


[Power Query](https://docs.microsoft.com/en-us/power-query/power-query-ui)

#### Elaboración de perfiles de datos
Otra característica de Power Query que puede ayudarle a comprender mejor sus datos es la generación de perfiles de datos. Al habilitar las funciones de generación de perfiles de datos, obtendrá comentarios sobre los datos dentro de los campos de consulta, como la distribución de valores, la calidad de la columna y más.

Le recomendamos que utilice esta función durante todo el desarrollo de sus consultas, pero siempre puede habilitar y deshabilitar la función a su conveniencia. La siguiente imagen muestra todas las herramientas de generación de perfiles de datos habilitadas para la consulta de análisis de país.

[Perfiles de datos](https://docs.microsoft.com/en-us/power-query/media/power-query-ui/pqui-data-profiling.png)


#### El editor avanzado
Si desea observar el código que el editor de Power Query está creando con cada paso, o desea crear su propio código de conformación, puede usar el editor avanzado. Para abrir el editor avanzado, seleccione la pestaña Ver en la cinta de opciones y, a continuación, seleccione Editor avanzado. Aparece una ventana que muestra el código de consulta existente.## Homework

[Editor](https://docs.microsoft.com/en-us/power-query/media/power-query-ui/queryoverview_advancededitor.png)


#### Pasos aplicados
Cada transformación que se aplica a la consulta se guarda como un paso en la sección Pasos aplicados del panel de configuración de la consulta. Si alguna vez necesita comprobar cómo se transforma la consulta de paso a paso, puede seleccionar un paso y obtener una vista previa de cómo se resuelve la consulta en ese momento específico.

También puede hacer clic con el botón secundario en una consulta y seleccionar la opción Propiedades para cambiar el nombre de la consulta o agregar una descripción para la consulta.

#### Agregar una nueva columna
Con los datos de clientes y proveedores en una sola tabla, ahora puede calcular la proporción de clientes a proveedores para cada país. Seleccione el último paso de la consulta Análisis de país y, a continuación, seleccione las columnas Clientes y Proveedores. En la pestaña Agregar columna de la cinta de opciones y dentro del grupo de números De, seleccione Estándar y, a continuación, Dividir (entero) en el menú desplegable.

#### Uso de la lista Pasos aplicados

Cualquier transformación en sus datos se mostrará en la lista Pasos aplicados. Por ejemplo, si cambia el nombre de una columna, se mostrará en la lista Pasos aplicados como Columnas renombradas.<br>
Al seleccionar cualquier paso, se le mostrarán los resultados de ese paso en particular, para que pueda ver exactamente cómo cambian sus datos a medida que agrega pasos a la consulta.

![Pasos](https://docs.microsoft.com/en-us/power-query/images/applied-steps-new-column-name.png)

Para eliminar un paso, haga clic con el botón secundario en el paso y seleccione Eliminar.

![Eliminar](https://docs.microsoft.com/en-us/power-query/images/applied-steps-delete.png)

Para editar el paso, haga clic con el botón secundario en el paso y seleccione Propiedades.

![Editar](https://docs.microsoft.com/en-us/power-query/applied-steps)

![Propiedades](https://docs.microsoft.com/en-us/power-query/images/applied-steps-properties.png)

Para cambiar el nombre de un paso, haga clic con el botón secundario en el paso y seleccione Cambiar nombre.

![Nombre](https://docs.microsoft.com/en-us/power-query/images/applied-steps-rename.png)


## Herramientas de Power Query
Dentro de la documentación oficial de Power Query, encontraras una sección específica para la "Transformación de datos" y dentro de esta sección herramientas para transformar tablas y columnas, agregar columnas, combinar datos y dividir columnas.<br>
Te recomendamos leer al menos las siguientes herramientas que te serán útiles a la hora de realizar transformaciones en Power Query:<br>

### [Documentación Oficial - Power Query](https://docs.microsoft.com/en-us/power-query/)


#### [Promover encabezados](https://docs.microsoft.com/en-us/power-query/table-promote-demote-headers)

#### [Elegir o quitar columnas](https://docs.microsoft.com/en-us/power-query/choose-remove-columns) 

#### [Tipos de datos](https://docs.microsoft.com/en-us/power-query/data-types)

#### [Errores](https://docs.microsoft.com/en-us/power-query/dealing-with-errors)

#### [Reemplazar valores](https://docs.microsoft.com/en-us/power-query/replace-values)

#### [Agregar columna personalizada](https://docs.microsoft.com/en-us/power-query/add-custom-column)

#### [Columna condicional](https://docs.microsoft.com/en-us/power-query/add-conditional-column)

#### [Anexar consultas](https://docs.microsoft.com/en-us/power-query/append-queries)

#### [Combinar consultas](https://docs.microsoft.com/en-us/power-query/merge-queries-overview)




## Homework

1. Utilizando los conectores Excel y CSV, debes conectarte a los archivos de la Clase 1 del M3.

![Archivos](/_src/assets/ejer21.PNG)

2. Renombrar las tablas que no tengan la denominación adecuada.
3. Elimina las columnas que no formen parte de la tabla original (column 1, column 2, etc.) y renombra las columnas:
  - `cliente`: `ID` - `IdCliente` 
  - `empleado`: `IDEmpleado` - `IdEmpleado` 
  - `proveedor`: `IDProveedor` - `IdProveedor` 
  - `sucursal`: `ID` - `IdSucursal` 
  - `tipo_gasto`: `Descripcion` - `Tipo_Gasto` 
  - `producto`: `IDProducto` - `IdProducto` 
  - `producto`: `Concepto` - `Producto` 

4. Tendrás que traducir la siguiente transformación en SQL y realizarla las transformaciones necesarias en Power Query. Recuerda que el tipo de datos sea el adecuado para datos de latitud y longitud.
```SQL 
ALTER TABLE `cliente` 	ADD `Latitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Y`, 
						            ADD `Longitud` DECIMAL(13,10) NOT NULL DEFAULT '0' AFTER `Latitud`;
UPDATE cliente SET Y = '0' WHERE Y = '';
UPDATE cliente SET X = '0' WHERE X = '';
UPDATE `cliente` SET Latitud = REPLACE(Y,',','.');
UPDATE `cliente` SET Longitud = REPLACE(X,',','.');
SELECT * FROM `cliente`;
ALTER TABLE `cliente` DROP `Y`;
ALTER TABLE `cliente` DROP `X`;
```
5. En la tabla `venta` cambia el los precios nulos por 0.

6. Traducir la siguiente transformación en SQL y realizarla las transformaciones necesarias en Power Query.
```SQL
UPDATE `cliente` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `cliente` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
UPDATE `cliente` SET Nombre_y_Apellido = 'Sin Dato' WHERE TRIM(Nombre_y_Apellido) = "" OR ISNULL(Nombre_y_Apellido);
UPDATE `cliente` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);

UPDATE `empleado` SET Apellido = 'Sin Dato' WHERE TRIM(Apellido) = "" OR ISNULL(Apellido);
UPDATE `empleado` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `empleado` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `empleado` SET Sector = 'Sin Dato' WHERE TRIM(Sector) = "" OR ISNULL(Sector);
UPDATE `empleado` SET Cargo = 'Sin Dato' WHERE TRIM(Cargo) = "" OR ISNULL(Cargo);

UPDATE `producto` SET Producto = 'Sin Dato' WHERE TRIM(Producto) = "" OR ISNULL(Producto);
UPDATE `producto` SET Tipo = 'Sin Dato' WHERE TRIM(Tipo) = "" OR ISNULL(Tipo);

UPDATE `proveedor` SET Nombre = 'Sin Dato' WHERE TRIM(Nombre) = "" OR ISNULL(Nombre);
UPDATE `proveedor` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `proveedor` SET Ciudad = 'Sin Dato' WHERE TRIM(Ciudad) = "" OR ISNULL(Ciudad);
UPDATE `proveedor` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `proveedor` SET Pais = 'Sin Dato' WHERE TRIM(Pais) = "" OR ISNULL(Pais);
UPDATE `proveedor` SET Departamento = 'Sin Dato' WHERE TRIM(Departamento) = "" OR ISNULL(Departamento);

UPDATE `sucursal` SET Domicilio = 'Sin Dato' WHERE TRIM(Domicilio) = "" OR ISNULL(Domicilio);
UPDATE `sucursal` SET Sucursal = 'Sin Dato' WHERE TRIM(Sucursal) = "" OR ISNULL(Sucursal);
UPDATE `sucursal` SET Provincia = 'Sin Dato' WHERE TRIM(Provincia) = "" OR ISNULL(Provincia);
UPDATE `sucursal` SET Localidad = 'Sin Dato' WHERE TRIM(Localidad) = "" OR ISNULL(Localidad);
```

7. Completa los precios faltantes de la tabla `ventas` combiandola con la columna correspondiente de la tabla `productos`.

8. Limpiar texto y poner em mayússculas cada plabra en las tablas que tengan campos con este tipo de dato.
9. Aplicar la siguiente transformación:
```SQL 
  - UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
  - UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';
  - UPDATE empleado SET Sucursal = 'Córdoba Quiroz' WHERE Sucursal = 'Cordoba Quiroz';
```
10. Agregar la columna IdSucursal a la tabla empleados y eliminar Sucursal.
11. Aplicar la siguiente transformación:
```SQL 
ALTER TABLE `empleado` ADD `CodigoEmpleado` INT NULL DEFAULT '0' AFTER `IdEmpleado`;

UPDATE empleado SET CodigoEmpleado = IdEmpleado;
UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado;
```
12. Eliminar las claves duplicadas.

13. Crear las siguientes categorías:
```SQL
ALTER TABLE `cliente` ADD `Rango_Etario` VARCHAR(20) NOT NULL DEFAULT '-' AFTER `Edad`;

UPDATE cliente SET Rango_Etario = '1_Hasta 30 años' WHERE Edad <= 30;
UPDATE cliente SET Rango_Etario = '2_De 31 a 40 años' WHERE Edad <= 40 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '3_De 41 a 50 años' WHERE Edad <= 50 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '4_De 51 a 60 años' WHERE Edad <= 60 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '5_Desde 60 años' WHERE Edad > 60 AND Rango_Etario = '-';
```

14. Renombrar las transformaciones aplicadas.

<table class="hide" width="100%" style='table-layout:fixed;'>
  <tr>
    <td>
      <a href="https://airtable.com/shrSzEYT4idEFGB8d?prefill_clase=00-PrimerosPasos">
        <img src="https://static.thenounproject.com/png/204643-200.png" width="100"/>
        <br>
        Hacé click acá para dejar tu feedback sobre esta clase.
      </a>
    </td>
  </tr>
</table>
