![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Principales Objetivos de Aprendizaje para esta Clase

-Conocer los distintos tipos de datos
-Identificar las falencias podemos encontrar en los datos
-Comprender de qué se trata el Análisis Exploratorio

## Características de los Datos

Los datos con los que vamos a estar trabajando, son en definitiva la fuente del conocimiento necesario que debemos adquirir para poder resolver las preguntas que nos hacemos, entonces, es preciso conocer todas sus características, algunas de ellas son:

* Variabilidad.
* Estadística.
* Distribución.
* Rangos.

## Tipos de datos

Cuando trabajamos con [estadísticas](https://relopezbriega.github.io/blog/2015/06/27/probabilidad-y-estadistica-con-python/), es importante reconocer los diferentes tipos de [datos](https://es.wikipedia.org/wiki/Dato): numéricos ([discretos y continuos](https://es.wikipedia.org/wiki/Variable_discreta_y_variable_continua)), [categóricos](https://en.wikipedia.org/wiki/Categorical_variable) y ordinales. Los datos no son más que observaciones del mundo en que vivimos, por tanto, los mismos pueden venir en diferentes formas, no solo numéricas. Por ejemplo, si le preguntáramos a nuestros amigos ¿cuántas mascotas tienen? nos podrían responder: `0, 1, 2, 4, 3, 8`; esta información por sí misma puede ser útil, pero para nuestro análisis de mascotas, nos podría servir también otro tipo de información, como por ejemplo el *género* de cada uno de nuestros amigos; de esta forma obtendríamos la siguiente información: `hombre, mujer, mujer, mujer, hombre, mujer`. Como vemos, podemos incluir a los datos dentro de tres categorías fundamentales: [datos cuantitativos](https://es.wikipedia.org/wiki/Cantidad) o numéricos, [datos cualitativos](https://es.wikipedia.org/wiki/Cualidad) o [categóricos](https://en.wikipedia.org/wiki/Categorical_variable) y datos ordinales.

### Datos cuantitativos

Los [datos cuantitativos](https://es.wikipedia.org/wiki/Cantidad) son representados por números; estos números van a ser significativos si representan la medida o la cantidad observada de cierta característica. Dentro de esta categoría podemos encontrar por ejemplo: cantidades de dólares, cuentas, tamaños, número de empleados, y kilómetros por hora. Con los datos cuantitativos, se puede hacer todo tipo de tareas de procesamiento de datos numéricos, tales como sumarlos, calcular promedios, o medir su variabilidad. Asimismo, vamos a poder dividir a los datos cuantitativos en [discretos y continuos](https://es.wikipedia.org/wiki/Variable_discreta_y_variable_continua), dependiendo de los valores potencialmente observables.

* Los datos ***discretos*** solo van a poder asumir un valor de una lista de números específicos. Representan ítems que pueden ser *contados*; todos sus posibles valores pueden ser listados. Suele ser relativamente fácil trabajar con este tipo de dato.

* Los datos ***continuos*** representan *mediciones*; sus posibles valores no pueden ser contados y sólo pueden ser descritos usando intervalos en la recta de los [números reales](https://es.wikipedia.org/wiki/N%C3%BAmero_real). Por ejemplo, la cantidad de kilómetros recorridos no puede ser medida con exactitud, puede ser que hayamos recorrido 1.7 km o 1.6987 km; en cualquier medida que tomemos del mundo real, siempre pueden haber pequeñas o grandes variaciones. Generalmente, los *datos continuos* se suelen redondear a un número fijo de decimales para facilitar su manipulación.

### Datos cualitativos

Si los datos nos dicen en cual de determinadas categorías no numéricas nuestros ítems van a caer, entonces estamos hablando de [datos cualitativos](https://es.wikipedia.org/wiki/Cualidad) o [categóricos](https://en.wikipedia.org/wiki/Categorical_variable); ya que los mismos van a representar determinada *cualidad* que los ítems poseen. Dentro de esta categoría vamos a encontrar datos como: el sexo de una persona, el estado civil, la ciudad natal, o los tipos de películas que le gustan. Los datos categóricos pueden tomar valores numéricos (por ejemplo, "1" para indicar "masculino" y "2" para indicar "femenino"), pero esos números no tienen un sentido matemático.

### Datos ordinales

Son una categoría que contiene datos cualitativos, pero con la particularidad de que hay un orden implícito. En este tipo de datos, va a existir un *orden* significativo, vamos a poder clasificar un primero, segundo, tercero, etc. es decir, que podemos establecer un *ranking* para estos datos, el cual posiblemente luego tenga un rol importante en la etapa de análisis. Los datos se dividen en categorías, pero los números colocados en cada categoría tienen un significado. Por ejemplo, la calificación de un restaurante en una escala de 0 (bajo) a 5 (más alta) estrellas representa *datos ordinales*. Los *datos ordinales* son a menudo tratados como datos categóricos, en el sentido que se suelen agrupar y ordenar. Sin embargo, a diferencia de los datos categóricos, los números sí tienen un significado matemático.

## Falencias en los datos

Como primera medida, antes de comenzar a realizar las tareas de análisis, vamos a encontrarnos con ciertas cuestiones que hacen a la calidad y fiabilidad del dato, y debemos resolverlas, entre ellas:

* Faltantes: ¿Qué hacer?
* Rangos de datos numéricos.
* Normalización.
* Errores: Su tratamiento.

## ¿Qué es el EDA?

Eda es la sigla en inglés para Exploratory Data Analysis y consiste en una de las primeras tareas que tiene que desempeñar el Científico de Datos. Es cuando revisamos por primera vez los datos que nos llegan, por ejemplo un archivo CSV que nos entregan y deberemos intentar comprender “¿de qué se trata?”, vislumbrar posibles patrones y reconociendo distribuciones estadísticas que puedan ser útiles en el futuro.

Lo ideal es que tengamos un objetivo que nos hayan “adjuntado” con los datos, que indique lo que se quiere conseguir a partir de esos datos. Por ejemplo, nos pasan un excel y nos dicen “Queremos predecir ventas a 30 días”, ó “Clasificar casos malignos/benignos de una enfermedad”, “Queremos identificar audiencias que van a realizar re-compra de un producto”, “queremos hacer pronóstico de fidelización de clientes/abandonos”, “Quiero detectar casos de fraude en mi sistema en tiempo real”.

## EDA deconstruido

Al llegar un archivo, lo primero que deberíamos hacer es intentar responder:

* ¿Cuántos registros hay?
* ¿Son demasiado pocos?
* ¿Son muchos y no tenemos Capacidad (CPU+RAM) suficiente para procesarlo?
* ¿Están todas las filas completas o tenemos campos con valores nulos?
* En caso que haya demasiados nulos: ¿Queda el resto de información inútil?
* ¿Qué datos son discretos y cuáles continuos?
* Muchas veces sirve obtener el tipo de datos: texto, int, double, float
* Si es un problema de tipo supervisado.
* ¿Cuál es la columna de “salida”? ¿binaria, multiclase?
* ¿Está balanceado el conjunto salida?
* ¿Cuáles parecen ser features importantes? ¿Cuáles podemos descartar?
* ¿Siguen alguna distribución?
* ¿Hay correlación entre features (características)?
* En problemas de NLP es frecuente que existan categorías repetidas ó mal tipeadas, ó con máyusculas/minúsculas, singular y plural, por ejemplo “Abogado” y “Abogadas”, “avogado” pertenecerían todos a un mismo conjunto.
* ¿Estamos ante un problema dependiente del tiempo? Es decir un TimeSeries.
* Si fuera un problema de Visión Artificial: ¿Tenemos suficientes muestras de cada clase y variedad, para poder hacer generalizar un modelo de Machine Learning?
* ¿Cuáles son los Outliers? (unos pocos datos aislados que difieren drásticamente del resto y “contaminan” ó desvían las distribuciones)
* ¿Podemos eliminarlos? ¿Es importante conservarlos? son errores de carga o son reales?
* ¿Tenemos posible sesgo de datos? (por ejemplo perjudicar a clases minoritarias por no incluirlas y que el modelo de ML discrimine)
* Puede ocurrir que tengamos set de datos incompletos y debamos pedir a nuestro cliente/proveedor ó interesado que nos brinde mayor información de los campos, que aporte más conocimiento ó que corrija campos.

La importancia de este análisis es sobre todo la de darnos un vistazo sobre la calidad de datos que tenemos y hasta puede determinar la continuidad o no de un proyecto.
Siempre dependerá de los datos que tengamos, en cantidad y calidad y por supuesto nunca deberemos dejar de tener en vista **el objetivo**, el propósito que buscamos lograr. Siempre debemos apuntar a lograr eso con nuestras acciones.

Fuente: https://relopezbriega.github.io