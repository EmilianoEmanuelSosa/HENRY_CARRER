![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)


Todo producto digital genera una gran cantidad de datos que, utilizados estratégicamente, pueden aprovecharse para la toma de decisiones. En el M5 buscaremos entregar las herramientas necesarias para comprender como realizar la explotación de los mismos en sus etapas de análisis y visualización efectiva.
En este modulo se tomaran conceptos vistos en los anteriores para darles una aplicación en casos de negocio. Implementaremos como analista de dato el diseño y desarrollo de tableros de control con la herramienta Power BI, utilizando DAX (Data Analysis Expressions), Lenguaje M y Power Query, como tambien el uso de Python para visualización de datos. 

Al terminar este modulo tendremos la capacidad de desarrollar proyectos de data analytics como un analista integral, desde el relevamiento inicial hasta la creación de un tablero.


## Que Es Data Analytics?
Conjunto de métodos y técnicas de medición, que permiten gestionar la información en tres grandes etapas: **recolección, transformación y visualización.** 



## Que Hacemos como analista de datos?
Los analistas de datos buscan determinar cómo se pueden usar los datos para responder preguntas y resolver problemas. 
Estudian lo que está sucediendo ahora para identificar tendencias y hacer predicciones sobre el futuro.
## Tareas de Un Data Analyst
- Trabajar con equipos de tecnología, administración y/o data scientists para establecer metas.
- Minería de datos de fuentes primarias y secundarias
- Limpieza y disección de datos
- Analizar e interpretar resultados utilizando herramientas y técnicas estadísticas
- Identificar tendencias y patrones en conjuntos de datos
- Identificar nuevas oportunidades para la mejora de procesos.
- Proporcionar informes de datos para la gestión.
- Diseñar, crear y mantener bases de datos y sistemas de datos.
- Solucionar problemas de código y problemas relacionados con los datos


# En conclusión, ¿Qué es Data Analytics?
Conjunto de técnicas y procesos **cuantitativos** y **cualitativos** que son usados para la toma de decisiones, con el objetivo de mejorar la productividad y las ganancias de un negocio a través del conocimiento extraído de los datos.

# Evolución Proceso Analitico

![Proceso](/_src/assets/proceso_analitico.png)
## Tipos de Analisis:

- Descriptivo: Describe patrones claves en los datos existentes y permite observar situaciones y comportamientos habituales.


- Dahsboard Interactivo: Se definen conclusiones basadas en los datos históricos identificados en el análisis descriptivo y se automatiza el proceso, permitiendo al usuario interactuar con el análisis.


- Predictivo: Se identifican comportamientos futuros, en base a información histórica.


- Prescriptivo: Con simulaciones y optimizaciones se compara la información resultante del análisis predictivo, para implementar una acción. 


## El Camino de nuestros datos:

A la hora de comenzar a analizar nuestros se debe recorrer un camino que suele ser iterativo.

1. Inmersion: El primer paso es entender el modelo, problema o proceso de negocio sobre el que queremos aplicar Data Analytics. No es lo mismo medir el rendimiento del área comercial de una empresa de consumo  masivo , que de una empresa de cosméticos que realiza venta directa, o medir el crecimiento del negocio y su  participacion de mercado para AirBnB que para un laboratorio  Farmaceutico. Tener una visión general del problema al que vamos a aplicar Data Analytics nos ayuda a comprender qué tipo de solución debemos implementar como también establecer la estrategia a seguir.


2. Estrategia de medicion: consiste en definir las reglas por las cuales vamos a realizar la medicion del rendimiento: KPIS, objetivos, dimensiones.

3. Implementacion tecnica: que vamos a hacer  tecnicamente para desarrollar nuestra solución de Data Analytics. Data Manipulation, Data Modelling  y Data Visualization.

4. Analizar informacion para obtener resultados: Insigths.. Por ej: encuentro que tenemos  baja participacion en un mercado en donde tampoco tenemos competidores….

5. En base a los insigths, mejorar mi modelo de negocio, tomando acciones:  realizar acciones de mktg en ese mercado no explotado, para mejorar el rendimiento global...


![Journey](/_src/assets/data_analytics_joruney.png)

## Visualización de Datos

La visualización de datos es la representación gráfica de información y datos. Al utilizar elementos visuales como cuadros, gráficos y mapas, las herramientas de visualización de datos proporcionan una manera accesible de ver y comprender tendencias, valores atípicos y patrones en los datos.

En el mundo del big data, las herramientas y tecnologías de visualización de datos son esenciales para analizar grandes cantidades de información y tomar decisiones basadas en los datos.

Nuestros ojos son atraídos por los colores y patrones. Nuestra cultura es visual, lo que incluye todo tipo de cosas, desde arte y publicidad hasta televisión y películas.

La visualización de datos es otra forma de arte visual que capta nuestro interés y mantiene nuestros ojos en el mensaje. Cuando vemos un gráfico, vemos rápidamente las tendencias y los valores atípicos. Si podemos ver algo, lo interiorizamos rápidamente. Es contar historias con un propósito. Si alguna vez haz visto una gigantesca hoja de cálculo de datos y no te fue posible ver una tendencia, sabes cuán eficaz puede ser una visualización.

![Visual](/_src/assets/visual.PNG)


[¿Qué es la visualización de datos?](https://www.tableau.com/es-mx/learn/articles/data-visualization)

### Por qué el diseño es importante en la visualización de datos

El enfoque de  toda visualización debe estar constantemente en lograr un equilibrio entre el contenido, las imágenes y la narración para cumplir con el objetivo principal: la comunicación clara y convincente de la información. El propósito es el de facilitar al cerebro humano la comprensión y extracción de información útil. Además, el objetivo también es facilitar la identificación de patrones, tendencias y valores atípicos en grandes volúmenes de datos.<br>
Ver (percepción) y comprender (cognición) ocurren todo el tiempo, todos los días de segundo a segundo. Cuanto más corto sea el tiempo entre ver y comprender, más efectiva será la visualización.

El cerebro humano puede procesar una pequeña cantidad de información visual muy rápidamente, pero solo por un período de tiempo muy corto. Esto se denomina memoria visual a corto plazo (VSTM).

Cada elemento en lo visual debe ser visto (percepción) dentro de aproximadamente 40 milisegundos... por más tiempo y debe procesarse atentamente (cognición). Si aprovechamos VSTM, nuestros usuarios finales pueden interpretar imágenes completas en pocos segundos.

¿Cuantos 5 puedes contar aquí?

![Prueba](/_src/assets/prueba1.PNG)


¿En esta imagen?

![Prueba](/_src/assets/prueba2.PNG)

¿Ha aumentado o disminuido el Volumen Bruto de Mercaderías en los últimos cinco años? Y... ¿Qué categoría ha crecido más rápido?

![Volumen](/_src/assets/ej1.PNG)

Quizás con este gráfico resulte más sencillo determinarlo.

![Volumen](/_src/assets/ej2.PNG)

Hacer uso de VSTM requiere que sepamos qué funciona y qué no cuando ocurre el procesamiento visual. Los atributos que funcionan bien con VSTM se denominan características visuales predispectas.<br>
Por ejemplo, cuando los datos se representan de forma visual, podemos detectar rápidamente comportamientos que podrían pasar desapercibidos si los vemos estadísticamente. Tiene sentido que la visualización de datos nos dé más significado, ya que el 90% de la información transmitida al cerebro humano es visual. También procesamos imágenes visuales 60.000 veces más rápido que el texto, ya que al cerebro le resulta más fácil recordarlas y analizarlas.<br>

![Brain](/_src/assets/brain.PNG)


Hay diversos estudios psicológicos que demuestran que si tenemos delante una tarea cognitiva exigente y una tentación, es más probable que caigamos en la tentación. 
El psicólogo Roy Baumeister, pionero en esta teoría, define el “agotamiento del ego” ha demostrado que la energía mental no es una metáfora en sí, sino que realmente responde como un esfuerzo físico.<br>
Un estudio publicado en los Proceedings of the National Academy of Sciences demuestra la correlación entre el grado de agotamiento entre jueces y sus decisiones sobre peticiones de libertad condicional. Después de las comidas, se aprobaban más peticiones, mientras que peticiones revisadas antes de la hora de comer tendían a ser denegadas en mayor proporción. Jueces cansados y hambrientos tienden a tomar la decisión más fácil y común de denegar la petición. Y ¡ojo! que hablo de correlación pero no de causalidad, pues no se llegó a demostrar que este fuera el motivo, aunque parece el más probable.


[Agotamiento del ego](https://psicologiaymente.com/psicologia/teoria-agotamiento-del-ego)

La presentación visual de la información afecta a su legibilidad, comprensión y memorización.

Los siguientes atributos son los puntos de partida que construyen buenas prácticas:
- accesible
- adecuado
- creíble
- íntegro
- conciso
- oportuno
- comprensible
- valioso

### Y... ¿cómo lo aplicamos?

En primer lugar, necesitamos saber la diferencia entre la percepción y la cognición. Hay una gran diferencia entre estos conceptos, y es importante entenderlos en términos de cómo funciona el cerebro humano. Entonces podríamos ver cómo aplicar eso dentro de un tablero.

La percepción es la organización, identificación e interpretación de los estímulos de tus sentidos. Una forma sencilla de describirlo es como la adquisición de información a través de los sentidos.

La cognición es el procesamiento de la información y la adquisición de conocimiento a través de la razón, la intuición y la percepción. Una forma más simple de pensar en ello es como el procesamiento de la percepción en conocimiento.

La principal diferencia entre esos términos es que la percepción es rápida, mientras que la cognición es mucho más lenta. Cuando los patrones no se pueden percibir de manera rápida y sencilla, el usuario comienza a experimentar un "esfuerzo cognitivo".

El término “esfuerzo cognitivo” hace referencia a la sensación percibida al enfrentarnos a tareas mentales difíciles. Los estudios en este campo señalan una tendencia de las personas a preferir tareas sencillas, asociadas a una baja demanda de control cognitivo.

[Realiza este test de atención](https://www.youtube.com/watch?v=PbVYH8FCLvo&t=47s)


### Patrones visuales

Los usuarios finales no miran los paneles, los escanean.

Como desarrolladores y diseñadores, tenemos mucho control sobre lo que nuestros usuarios miran al ver un tablero. Para crear el camino correcto que los ojos del usuario van a seguir, primero necesitamos entender cómo nuestros ojos procesan la información.

¿Cómo le damos sentido a lo que vemos?<br>
Hay varias categorías de procesamiento pre-atento; exploremos algunos:

![Patrones](/_src/assets/patrones.PNG)

Los patrones visuales o (jerarquías visuales) nos permiten saber qué datos involucran primero a nuestros usuarios y con qué visualizaciones interactúan (y en qué orden) mientras están en el tablero. Al establecer una jerarquía visual, nos aseguramos de que la comunicación entre nuestros usuarios y los paneles sea fluida teniendo en cuenta las siguientes técnicas:

- Escala: Los elementos de diferentes tamaños guiarán la atención del usuario: los elementos más grandes atraen más atención en comparación con los elementos más pequeños.
- Color: La gente se siente atraída hacia colores audaces y contrastantes.
- Contraste: Los cambios de color se pueden utilizar para atraer la atención. Contrastar el color de un elemento contra otro atrae el foco.
- Alineación: Las columnas y las cuadrículas pueden crear alineación entre los elementos y hacer que el usuario se dé cuenta.
- Proximidad: Esto ayuda a separar y agrupar ciertos elementos de visualización de datos juntos (o separados) para ayudar a distinguir entre ellos.
- Patrones de escaneo: Los estudios de seguimiento ocular muestran dónde los usuarios enfocan su mirada una vez que están en un tablero y dónde proceden después.<br>
Y... hablando de patrones de escaneo, es importante mencionar que existe más de un tipo, el que más usamos -o recomendamos- a la hora de diseñar es el diseño Z-Pattern.

Este tipo de patrón es un concepto de diseño que considera que los usuarios tienden a ver información altamente visual en un Z-Pattern. es decir, tienden a:
- primero mire la parte superior izquierda y luego muévase horizontalmente hacia la parte superior derecha.
- luego dibuja sus ojos en diagonal hacia la parte inferior izquierda.
- y por último, hacer un último movimiento horizontal hacia la parte inferior derecha.

![Patrones Z](/_src/assets/z.PNG)

### Elección de gráficos

Quizás sea el más conocido, se basa en un diagrama de selección de gráficos creado en 2009 por el Dr. Andrew Abela como parte del método Extreme Presentation.

Todo comienza preguntándose qué se desea representar con los datos, y según la respuesta los gráficos se pueden agrupar en cuatro tipos principales:

- Comparación: cuando queremos comparar entre sí los diferentes valores o atributos dentro de los datos. Existen algunas variantes, según sean los datos. Por ejemplo, ¿Tienen los datos la variable tiempo? ¿Cuántos periodos de tiempo? ¿Cuántas variables y categorías presentan los datos?.
- Composición: cuando queremos saber cómo están compuestos los datos, es decir, qué características generales están presentes en el conjunto de datos. Existen algunas variantes, según sean los datos. Por ejemplo, ¿Se tienen cambios a lo largo del tiempo? ¿Con cuántos periodos de tiempo? En datos estáticos, ¿se tienen valores que se acumulan?.
- Distribución: cuando queremos comprender cómo se distribuyen los puntos de datos individuales dentro de todo el juego de datos. Según el número de variables en las que queramos analizar la distribución se elegirán gráficos de barras, líneas o gráficos de dispersión (scatter charts).
- Relación: en este caso estamos interesados en saber cómo los valores y atributos se relacionan entre sí. Para enfrentar los valores se suelen usar gráficos de dispersión (scatter charts) cuando intervienen dos variables y gráficos de burbujas (bubble charts) cuando intervienen tres variables.
De estos cuatro tipos, lo más probable en la mayoría de casos es que principalmente se utilicen los dos primeros, Comparación y Composición, a no ser que se tengan necesidades de análisis estadístico avanzadas.

Como puedes ver la mayoría de los casos se pueden solucionar con unos pocos tipos de gráficos básicos, aunque pueden aplicarse múltiples variantes para cada caso concreto. Podemos decir que los gráficos más usados son los de barras y líneas en todas sus variantes (horizontal o vertical, simple o apiladas, etc.). Cuando se requiere un gran detalle se suele recurrir a la tabla de datos.

![Graficos](/_src/assets/graficos.png)

## Herramientas de visualización

![Herramientas](https://qlik.imgix.net//-/media/images/global-us/site-content/gartner-mq-landing/2022/2022damqqlikcomreg635x635.jpg?fit=crop&auto=format&fit=max&dpr=1)

# Checklist para el desarrollo de un dashboard

1. Entender el contexto.
2. Objetivos a perseguir con nuestro tablero.
3. Lista de preguntas que buscamos responder en el dashboard
4. Revisión de datos con los que contamos, fuentes, estado de las mismas, limpieza y organización de la data.
5. Dibujo un mock-up/maqueta del tablero, buscando perseguir el objetivo planteado en el punto 1 y verificando que visualizaciones responden a las preguntas del punto 2
6. Creación del reporte en la herramienta, por ej: Power Bi / Tableau/ Looker/Python
8. Verificar Títulos, formatos, filtros. Contextualizar la data, glosario de datos.
9. Validar con alguien que sea claro el mensaje a transmitir.

### Power BI

Power BI es una colección de servicios de software, aplicaciones y conectores que funcionan conjuntamente para convertir orígenes de datos sin relación entre sí en información coherente, interactiva y atractiva visualmente. Power BI permite conectarse con facilidad a los orígenes de datos y aplicar procesos de transformación sencillos sin recurrir a ETL complejos.

Power BI consta de varios elementos que funcionan de manera conjunta, empezando por estos tres conceptos básicos:

- Aplicación de escritorio de Windows llamada Power BI Desktop.
- Servicio SaaS (software como servicio) en línea denominado "Servicio de Power BI".
- Aplicaciones móviles de Power BI para dispositivos Windows, iOS y Android.

Estos tres elementos (Power BI Desktop, el servicio y las aplicaciones móviles) están diseñados para crear, compartir y usar información empresarial de la forma que le resulte más eficaz para usted y para su rol.

![Flujo de trabajo](https://docs.microsoft.com/es-es/power-bi/fundamentals/media/service-service-vs-desktop/power-bi-venn-desktop-service.png)

#### El flujo de trabajo en Power BI

Un flujo de trabajo habitual en Power BI comienza con la conexión a orígenes de datos en Power BI Desktop y la creación de un informe. Después, ese informe se publica desde Power BI Desktop en el servicio Power BI y se comparte para que los usuarios profesionales del servicio Power BI y los dispositivos móviles puedan verlo e interactuar con él.

Este flujo de trabajo es habitual y muestra cómo los tres elementos principales de Power BI se complementan entre sí.


#### Power BI Desktop

Power BI Desktop es una aplicación gratuita que se puede instalar en el equipo local y que permite conectarse a los datos, transformarlos y visualizarlos. Con Power BI Desktop, puede conectarse a varios orígenes de datos diferentes y combinarlos (lo que se suele denominar modelado) en un modelo de datos. Este modelo de datos permite compilar objetos visuales y colecciones de objetos visuales que se pueden compartir como informes con otras personas de dentro de la organización. La mayoría de los usuarios que trabajan en proyectos de inteligencia empresarial usan Power BI Desktop para crear informes y luego usan el servicio Power BI para compartir los informes con otros.

Los usos más comunes de Power BI Desktop son los siguientes:<br>
- Conectar a datos
- Transformar y limpiar datos, para crear un modelo de datos
- Crear objetos visuales, como gráficos o grafos, que proporcionan representaciones visuales de los datos
- Crear informes que son colecciones de objetos visuales, en una o varias páginas de informes
- Compartir informes con otros usuarios mediante el servicio Power BI

En Power BI Desktop hay tres vistas disponibles, que se seleccionan en el lado izquierdo del lienzo. Las vistas, que se muestran en el orden en que aparecen, son las siguientes:

- Informe: en esta vista se crean informes y objetos visuales y es donde se pasa la mayor parte del tiempo de creación.
- Datos: en esta vista se ven las tablas, las medidas y los demás datos que se usan en el modelo de datos asociado al informe y se transforman los datos para usarlos de la mejor manera posible en el modelo del informe.
- Modelo: en esta vista se ven y se administran las relaciones entre las tablas del modelo de datos.


#### Conectar a datos
Para empezar a trabajar con Power BI Desktop, el primer paso es conectarse a los datos. Hay muchos orígenes de datos distintos a los que es posible conectarse desde Power BI Desktop.

En la cinta Inicio, seleccione Obtener datos > Más.

Aparece la ventana Obtener datos, que muestra muchas categorías a las que Power BI Desktop puede conectarse.

![Conexión a fuentes](/_src/assets/conetar.png)


![Vista Power BI](https://docs.microsoft.com/es-es/power-bi/fundamentals/media/desktop-what-is-desktop/what-is-desktop-07.png)

![Power BI](https://docs.microsoft.com/es-es/power-bi/fundamentals/media/power-bi-overview/power-bi-overview-blocks.png)

### Material complementario


#### Visualización de Datos

[Data Storytelling - Cole Nussbaumer](/Libros/storytelling-with-data-cole-nussbaumer-knaflic.pdf)

[Diagrama de selección original](https://extremepresentation.typepad.com/files/choosing-a-good-chart-09.pdf)

[Elección de gráficos](https://infogram.com/es/pagina/elige-el-grafico-correcto-visualizacion-datos)

[Gráficos por tipo de función](https://www.data-to-viz.com/#portfolio)

[Catalogo de gráficos](https://datavizcatalogue.com/)

#### Herramientas de visualización

[Vitual Box - MAC](https://www.youtube.com/watch?v=V3b76U46fBU)

[Windows 10 y Virtual Box - MAC](https://www.youtube.com/watch?v=WbpE9euPcJY)

[Guía de descarga e instalación de Power BI](https://docs.microsoft.com/es-es/power-bi/fundamentals/desktop-get-the-desktop#download-power-bi-desktop-directly)

[Introducción a Power BI](https://powerbi.microsoft.com/es-es/getting-started-with-power-bi/)


## Homework

1.	Desde la gerencia de ventas nos comentan que es necesario aumentar el volumen de facturación y cobertura de regiones ( tener clientes en la mayor cantidad posible de zonas) como también evitar la pérdida de clientes, hoy por hoy se manejan con un Excel que alguien armo en algún momento, pero no confían en esa data para seguir este nuevo objetivo, de manera tal que no se conoce realmente el estado de situación actual. Por lo tanto como departamento de data analytics tenemos que presentarles una propuesta basadas en datos para acompañar este proceso de negocio.
- 	En base al modelo de datos utilizado en M3  generar una un propuesta analítico de cada tipo según lo visto en clase:

- a) Descriptivo 
- b) Dashboard
- c) Predictivo
- d) Prescriptivo

2. Relaciona cada situación con algún tipo de gráfico:
- a) Velocidad de frenado promedio de 5 modelos distintos de vehículos.<br>
Gráfico de columnas:<br>
Eje x = modelos de vehículos.<br>
Eje y = Velocidad promedio de frenado.<br>
- b) Costo de una llamada por segundos.<br>
Gráfico de líneas:
Eje x = Csoto de la llamada.<br>
Eje y = Segundos de duración.<br>
- c) El recorrido del equipo de ventas de una distribuidora con 4 paradas y las sumas vendidas en cada una.<br>
Mapa georeferenciado:<br>
Latiud y longitud de cada parada.<br>
Importe de ventas totales en cada punto.<br>
- d) Cantidad de edificios y casas que conforman un barrio.
Gráfico circular:<br>
Dos categorias.<br>
Cantidad total por categoría.<br>

3. El siguiente gráfico representa el movimiento vehículo desde un punto. Interprétala y responde a las siguientes preguntas:
- a) ¿Cuánto tiempo ha estado andando?
- b) ¿Hasta que distancia máxima del recorrido pudo realizar?
- c) ¿Ha hecho alguna parada?
- d) ¿Que sucede luego del pico de mts recorrido?
- e) ¿Cuantos metros recorrio en total?

![Ejercicio2](/_src/assets/ejer2.PNG)

4. Se decide presentar el volumen de ventas de 5 productos correspondientes a una distribuidora de alimentos. Los productos van de A = 100 un., B = 95 un., C =90 un., D = 88 un., E = 105 un.
 - a) ¿Que gráfico utilizaría?.
 - b) ¿Sería correcto utilizar un gráfico de lineas? ¿Por qué?.
 - c) ¿Sería correcto utilizar un gráfico circular? ¿Por qué?.

5. Se presenta el siguiente gráfico.
 - a) ¿Es correcta su utilización?
 - b) ¿Que inconveniente presenta a la hora de reconocer patrones?
 - c) ¿Qué otros tipos de gráficos utilizaría?
 - d) ¿Que tipo de tematicas estarían relacionadas a la variable presentada?

 ![Ejercicio3](/_src/assets/ejer3.PNG)

6. Debes instalar Power BI Desktop y seguir las instrucciones del siguiente link para realizar tu primer conexión de datos:

[Conexión OData](https://docs.microsoft.com/en-us/power-query/power-query-ui)

- Conecta las tablas "Products", "Orders", "Order_Details".

7. Investigar que es un mockup y diseñar uno para el modelo presentado, realice la selección de gráficos de cada métrica conforme a las reglas presentadas en esta clase.<br>
Las métricas a representar son:
  - Filtros para Fecha de orde, País, Ciudad y Producto.
  - Cantidad de ventas totales (Agregar una columna cálculada Total = Order_Details[Quantity]*Order_Details[UnitPrice]).<br>
  [Columnas cálculadas](https://docs.microsoft.com/es-es/power-bi/transform-model/desktop-tutorial-create-calculated-columns).
  - Ventas por ciudad.
  - Ventas por productos.
  - Evolución del total de ventas por fecha de orden.
  - Top 10 de ventas por productos.
