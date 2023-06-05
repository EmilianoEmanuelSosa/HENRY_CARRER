![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Script de Ptyhon en Power BI

Eb Power BI, Puede ejecutar scripts de Python e importar los conjuntos de datos resultantes en un modelo de datos de Power BI Desktop.<br>
Para ejecutar scripts de Python en Power BI Desktop, debe instalar Python en el equipo local.

La integración de Power BI con Python requiere la instalación de dos paquetes de Python:

- Pandas. Tus datos importados deben estar en un marco de datos pandas,debido q que debe estar en un marco de estructura de datos bidimensional. Por ejemplo, los datos se alinean de forma tabular en filas y columnas.

- Matplotlib. Proporciona una API orientada a objetos para incrustar gráficos en aplicaciones utilizando kits de herramientas gui de uso general, como Tkinter, wxPython, Qt o GTK +.

### Habilitar secuencias de comandos de Python
Para habilitar las secuencias de comandos de Python:

1. En Power BI Desktop, seleccione Opciones y configuración de > de archivos > Opciones > secuencias de comandos de Python. Aparecerá la página de opciones de script de Python.
2. Si es necesario, especifique la ruta de instalación local de Python en Directorios principales de Python detectados.<br>
  En la imagen de arriba, la ruta local de instalación de Python es C:\Python. Asegúrese de que la ruta de acceso es para la instalación local de Python que desea que use Power BI Desktop. Es muy importante verificar y especificar de manera adecuada esta ruta para evitar errores de ejecución.
3. Seleccione Aceptar.

Una vez que especifique la instalación de Python, estará listo para comenzar a ejecutar scripts de Python en Power BI Desktop.

### Preparar un script de Python
Primero, cree un script en su entorno de desarrollo local de Python y asegúrese de que se ejecute correctamente. Por ejemplo, aquí hay un script de Python simple que importa pandas y usa un marco de datos:

```python
import pandas as pd
data = [['Alex',10],['Bob',12],['Clarke',13]]
df = pd.DataFrame(data,columns=['Name','Age'],dtype=float)
print (df)
```
Al preparar y ejecutar un script de Python en Power BI Desktop, existen algunas limitaciones:

- Solo se importan tramas de datos pandas, así que asegúrese de que los datos que desea importar a Power BI estén representados en un marco de datos.
- Cualquier script de Python que se ejecute durante más de 30 minutos de tiempo de espera devolvera un error.
- Las llamadas interactivas en el script de Python, como esperar la entrada del usuario, detienen la ejecución del script.
- Al establecer el directorio de trabajo dentro del script de Python, debe definir una ruta completa al directorio de trabajo, en lugar de una ruta relativa.
- Actualmente no se admiten tablas anidadas

### Cargar datos mediante un script

1. En la cinta Inicio, seleccione Obtener datos > Otro. También puede escribir "python" en el buscador.
2. Seleccione Otros > script de Python.
3. Seleccione Conectar. Su última versión local de Python instalada se selecciona como su motor de Python. Copie el script en el cuadro de diálogo de script de Python que aparece.
4. Seleccione Aceptar. Si el script se ejecuta correctamente, aparece el Navegador y puede cargar los datos y utilizarlos. Para el ejemplo, seleccione df, como se muestra en la imagen y, a continuación, Cargar.

![1](https://docs.microsoft.com/en-us/power-bi/connect-data/media/desktop-python-scripts/python-scripts-1.png)

![2](https://docs.microsoft.com/en-us/power-bi/connect-data/media/desktop-python-scripts/python-scripts-6.png)

![3](https://docs.microsoft.com/en-us/power-bi/connect-data/media/desktop-python-scripts/python-scripts-5.png)

![Python](https://docs.microsoft.com/en-us/power-bi/connect-data/media/desktop-python-scripts/python-scripts-7.png)

## Visualizaciones de python en Power BI

Trabjar este ejemplo con los pasos anteriores y el siguiente script:

```python
import pandas as pd 
df = pd.DataFrame({ 
    'Fname':['Harry','Sally','Paul','Abe','June','Mike','Tom'], 
    'Age':[21,34,42,18,24,80,22], 
    'Weight': [180, 130, 200, 140, 176, 142, 210], 
    'Gender':['M','F','M','M','F','M','M'], 
    'State':['Washington','Oregon','California','Washington','Nevada','Texas','Nevada'],
    'Children':[4,1,2,3,0,2,0],
    'Pets':[3,2,2,5,0,1,5] 
}) 
print (df) 
```

1. Seleccione el icono visual de Python en el panel Visualizaciones.
2. En el cuadro de diálogo Habilitar objetos visuales de script que aparece, seleccione Habilitar.<br>
  Al agregar un objeto visual de Python a un informe, Power BI Desktop realiza las siguientes acciones:
  - Aparece una imagen visual de Python de marcador de posición en el lienzo del informe.
  - El editor de scripts de Python aparece en la parte inferior del panel central.
3. A continuación, arrastre los campos Edad, Niños, Fname, Género, Mascotas, Estado y Peso a la sección Valores donde dice Agregar campos de datos aquí.<br>
El script de Python solo puede usar campos agregados a la sección Valores. Puede agregar o quitar campos de la sección Valores mientras trabaja en su script de Python. Power BI Desktop detecta automáticamente los cambios de campo.
4. Ahora puede usar los datos que seleccionó para crear una gráfica.<br>
A medida que selecciona o elimina campos, el código de soporte en el editor de scripts de Python se genera o elimina automáticamente.<br>
En función de sus selecciones, el editor de scripts de Python genera el siguiente código de enlace.

- El editor creó un marco de datos de conjunto de datos, con los campos que agregó.
- La agregación predeterminada es: no resumir.
- Al igual que los elementos visuales de tabla, los campos se agrupan y las filas duplicadas aparecen solo una vez.

Puede acceder a las columnas del conjunto de datos utilizando sus respectivos nombres. Por ejemplo, puede codificar en su script de Python para acceder al campo de edad.dataset["Age"]

5. Con el marco de datos generado automáticamente por los campos que seleccionó, está listo para escribir un script de Python que resulte en el trazado al dispositivo predeterminado de Python. Cuando se complete el script, seleccione Ejecutar desde la barra de título del editor de scripts de Python.

Power BI Desktop vuelve a trazar el objeto visual si se produce alguno de los eventos siguientes:

- Al seleccionar Ejecutar desde la barra de título del editor de scripts de Python
- Cada vez que se produce un cambio de datos, debido a la actualización, el filtrado o el resaltado de datos
Cuando ejecuta un script de Python que produce un error, el objeto visual de Python no se traza y aparece un mensaje de error de lienzo. Para obtener detalles sobre el error, seleccione Ver detalles en el mensaje.

Para obtener una vista más amplia de las visualizaciones, puede minimizar el editor de scripts de Python.


### Gráfico de dispersión

1. En Pegar o escribir el código de script aquí, escriba este código:

```python
import matplotlib.pyplot as plt 
dataset.plot(kind='scatter', x='Age', y='Weight', color='red')
plt.show() 
```
2. Al seleccionar el botón Ejecutar script, el siguiente gráfico de dispersión se genera en el marcador de posición de la imagen visual de Python.

![dp](https://docs.microsoft.com/en-us/power-bi/connect-data/media/desktop-python-visuals/python-visuals-12.png)

### Gráfico de líneas

```python
import matplotlib.pyplot as plt 
ax = plt.gca() 
dataset.plot(kind='line',x='Fname',y='Children',ax=ax) 
dataset.plot(kind='line',x='Fname',y='Pets', color='red', ax=ax) 
plt.show() 
```
![dl](https://docs.microsoft.com/en-us/power-bi/connect-data/media/desktop-python-visuals/python-visuals-13.png)

### Gráfico de barras

```python
import matplotlib.pyplot as plt 
dataset.plot(kind='bar',x='Fname',y='Age') 
plt.show()
```
![db](https://docs.microsoft.com/en-us/power-bi/connect-data/media/desktop-python-visuals/python-visuals-14.png)


### Limitaciones conocidas

Los objetos visuales de Python en Power BI Desktop tienen algunas limitaciones:

- Limitaciones de tamaño de datos. Los datos utilizados por el visual de Python para trazar están limitados a 150.000 filas. Si se seleccionan más de 150.000 filas, solo se utilizan las 150.000 filas principales y se muestra un mensaje en la imagen. Además, los datos de entrada tienen un límite de 250 MB.
- Si el conjunto de datos de entrada de un objeto visual de Python tiene una columna que contiene un valor de cadena superior a 32766 caracteres, ese valor se trunca.
- Resolución. Todas las imágenes de Python se muestran a 72 DPI.
- Limitación de tiempo de cálculo. Si un cálculo visual de Python supera los cinco minutos, se agota el tiempo de espera de ejecución, lo que resulta en un error.
- Relaciones. Al igual que con otros objetos visuales de Power BI Desktop, si se seleccionan campos de datos de diferentes tablas sin una relación definida entre ellos, se produce un error.
- Los objetos visuales de Python se actualizan tras las actualizaciones de datos, el filtrado y el resaltado. Sin embargo, la imagen en sí no es interactiva y no puede ser la fuente de filtrado cruzado.
- Los elementos visuales de Python responden a resaltar otros elementos visuales, pero no puede hacer clic en elementos en el objeto visual de Python para filtrar otros elementos.
- Solo los gráficos que se trazan en el dispositivo de visualización predeterminado de Python se muestran correctamente en el lienzo. Evite usar explícitamente un dispositivo de visualización Python diferente.
- Los objetos visuales de Python no admiten el cambio de nombre de las columnas de entrada. Las columnas se denominarán por su nombre original durante la ejecución del script.


## Homework


1. Mediante un script de python cargar el archivo "wine_reviews" a Power BI.
2. En una página crear los siguiuentes gráficos:
 - Gráfico de dispersión que relacione "price" y "points".
 - Un histograma con las frecuencia del campo "points".
 - Un boxplot del "points".
3. En una página aparte crear los siguientes gráficos. 
 - Un histograma con las frecuencia del campo "price". 
 - Un boxplot del "price".
 - ¿Qué sucede con las gráficas anteriores?
 - Aplique un filtro al campo "price" para segmentar solo aquellos "menores o iguales a 1.000". Realice los gráficos en la misma página.

 
 Tenga en cuenta lo siguiente para el puntro 2 y 3:<br>

"En función de sus selecciones, el editor de scripts de Python genera el siguiente código de enlace.<br>

El editor creó un marco de datos de conjunto de datos, con los campos que agregó.<br>
La agregación predeterminada es: no resumir.<br>
Al igual que los elementos visuales de tabla, los campos se agrupan y las filas duplicadas aparecen solo una vez.<br>
En ciertos casos, es posible que no desee que se produzca la agrupación automática o que aparezcan todas las filas, incluidos los duplicados. Si es así, puede agregar un campo de índice al conjunto de datos que haga que todas las filas se consideren únicas y que impida la agrupación."

4. Presente la relación entre "price" y "points" en un pairplot.

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
=======
- Mediante un script de python cargar el archivo "wine_reviews" a Power BI.
- Obtener los datos de geolocalización desde el siguiente link.
- Crear los tres gráficos referidos en este material.
>>>>>>> d111edc534aa6edddb3686c94c731fadaff94c38
