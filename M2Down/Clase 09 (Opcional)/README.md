![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Principales Objetivos de Aprendizaje para esta Clase

- Usar los conceptos de Tests Estadísticos y Pruebas de Hipótesis

# Tests Estadísticos

["Estadística para administración y economía" - Capítulo 9](https://github.com/soyHenry/DS-M2/blob/main/Anderson.pdf)

Por lo general, en la práctica, se tienen que tomar decisiones sobre poblaciones, partiendo de la información muestral de las mismas. Tales decisiones se llaman, decisiones estadísticas.<br>
Para tomar decisiones conviene hacer determinados supuestos y tales supuestos son formulados respecto del valor de algún parámetro, que pueden ser o no ciertos. A estos los denominamos Hipótesis Estadísticas y, en general, lo son sobre las distribuciones de probabilidad de las poblaciones.<br>
En el procedimiento de test estadísticos, se utilizan las denominadas pruebas de hipótesis y en ellas se usan datos de una muestra para probar dos afirmaciones contrarias indicadas por H0 (hipótesis nula) y Ha (la hipótesis alternativa).<br>

Suponga que las notas promedios de un Henry Challenge es de 78, Henry determina que a través de métodos innovadores puede aumentar esa media. En este caso, se establece un grupo de investigación que busca evidencias para concluir que el nuevo sistema aumenta la media del rendimiento. La hipótesis de investigación es, entonces, que el nuevo sistema proporciona un rendimiento medio mayor; es decir, μ > 78. Como lineamiento general, una hipótesis de investigación se debe plantear como hipótesis alternativa. Por tanto, en este estudio las hipótesis nula y alternativa adecuadas son "H0: μ<= 78" y "H1: μ> 78".<br>

Si los resultados obtenidos con la muestra indican que no se puede rechazar H0, el grupo no concluirán que el nuevo sistema sea mejor. Quizá será necesario continuar investigando y realizar nuevas pruebas. Pero si los resultados muestrales indican que se
puede rechazar H0, inferirán que Ha: μ > 78 es verdadera. Esta conclusión proporciona el apoyo estadístico necesario para afirmar que el nuevo sistema aumenta el rendimiento. Se considerará la implementación del nuevo sistema.<br>
En estudios de investigación como éste, las hipótesis nula y alternativa deben formularse de manera que al rechazar H0 se apoye la conclusión de la investigación. La hipótesis de la investigación, entonces, debe expresarse como hipótesis alternativa.<br>
Cuando lo que realizamos es una afirmación, en este caso sería que quienes rinden un HC obtienen por lo menos 78 puntos en promedio, la "H0: μ>= 78" y "H1: μ< 78". Es decir que en toda situación en la que se desee probar la validez de una afirmación, la hipótesis nula se suele basar en la suposición de que la afirmación sea verdadera. Entonces, la hipótesis alternativa se formula de manera que rechazar H0 proporcione la evidencia estadística de que la suposición establecida es incorrecta.<br>

Existen además otras formas de realizar el planteo de H0 y H1, como cuando se debe tomar una decisión. Como por ejemplo controlar la calidad de un determinado respuesto en donde debe medir obligatoriamente 10 cm. "H0: μ= 10" y "H1: μ!= 10". Lo que determina solo dos alternativas.

![test](/_src/assets/hipotesis.PNG)

METODOLOGÍA DE LA PRUEBA DE HIPÓTESIS: DEFINICIÓN DE ETAPAS

1. Formular la hipótesis nula.<br>
2. Formular la hipótesis alternativa.<br>
3. Especificar el nivel de significación.<br>
4. Determinar el tamaño de la muestra.<br>
5. Determinar el estadístico de prueba.<br>
6. Establecer los valores críticos que dividen las zonas de rechazo y de no rechazo.<br>
7. Obtener los datos y calcular los estadísticos.<br>
8. Determinar el estadístico de prueba ha caído en la región de rechazo o en la de no rechazo.<br>
9. Determinar la decisión estadística.<br>
10. Expresar la decisión estadística en términos del problema.<br>


### Prueba de una hipótesis de investigación
Considere un determinado modelo de automóvil en el que el rendimiento de la gasolina es 100 km por 10L. Un grupo de investigación elabora un nuevo sistema de inyección de combustible diseñado para dar un mejor rendimiento en km por litro de gasolina. Para evaluar el nuevo
sistema se fabrican varios de éstos, se instalan en los automóviles y se someten a pruebas controladas de manejo. En este caso, el grupo de investigación busca evidencias para concluir que el nuevo sistema aumenta la media del rendimiento. La hipótesis de investigación es, entonces,
que el nuevo sistema de inyección de combustible proporciona un rendimiento medio mayor a 100 km cada 10L de combustible; es decir, μ = 100. Como lineamiento general, una hipótesis de investigación se debe plantear como hipótesis alternativa. Por tanto, en este estudio las hipótesis nula y alternativa adecuadas son:<br>

H0: μ <= 100
Ha: μ > 100

Si los resultados obtenidos con la muestra indican que no se puede rechazar H0, los investigadores no concluirán que el nuevo sistema de inyección de combustible sea mejor. Quizá será necesario continuar investigando y realizar nuevas pruebas. Pero si los resultados muestrales indican que se puede rechazar H0, los investigadores inferirán que Ha: μ > 100 es verdadera. Esta conclusión proporciona a los investigadores el apoyo estadístico necesario para afirmar que el nuevo sistema aumenta el rendimiento. Se considerará la producción del nuevo sistema.<br>
En estudios de investigación como éste, las hipótesis nula y alternativa deben formularse de manera que al rechazar H0 se apoye la conclusión de la investigación. La hipótesis de la investigación, entonces, debe expresarse como hipótesis alternativa.

### Prueba de la validez de una afirmación
Como ilustración de la prueba de la validez de una afirmación, considere una situación en la que un fabricante de refrescos asegura que los envases de dos litros de refresco contienen en promedio, por lo menos, 67.6 ml de líquido. Se selecciona una muestra de envases de dos litros y se mide su contenido para confirmar lo que asegura el fabricante. En este tipo de situaciones de prueba de hipótesis, se suele suponer que el dicho del fabricante es verdad a menos que las evidencias muestrales indiquen lo contrario. Si se sigue este método en el ejemplo de los refrescos, las hipótesis nula y alternativa se establecen como sigue.

H0: μ >= 67.6
Ha: μ < 67.6

Si los resultados muestrales indican que no se puede rechazar H0, entonces no se cuestiona lo que asegura el fabricante. Pero si los resultados muestrales indican que se puede rechazar H0, lo que se inferirá es que Ha: μ < 67.6 es verdad. Si tal es la conclusión, las evidencias estadísticas indican que el dicho del fabricante no es correcto. En toda situación en la que se desee probar la validez de una afirmación, la hipótesis nula se suele basar en la suposición de que la afirmación sea verdadera. Entonces, la hipótesis alternativa se formula de manera que rechazar H0 proporcione la evidencia estadística de que la suposición establecida es incorrecta.

### Prueba en situaciones de toma de decisión
En general, este tipo de situaciones se presentan cuando la persona que debe tomar una decisión tiene que elegir entre dos líneas de acción, una relacionada con la hipótesis nula y otra con la hipótesis alternativa. Por ejemplo, con base en una muestra de las piezas de un pedido recibido, el inspector de control de calidad tiene que decidir si acepta el pedido o si lo regresa al proveedor debido a que no satisface las especificaciones. Suponga que una especificación para unas piezas determinadas sea que su longitud media deba ser de dos pulgadas. Si la longitud media es menor o mayor a dos pulgadas, las piezas ocasionarán problemas de calidad en la operación de ensamblado. En este caso, las hipótesis nula y alternativa se formulan como sigue.

H0: μ = 2
Ha: μ =! 2

Si los resultados muestrales indican que no se puede rechazar H0, el inspector de control de calidad no tendrá razón para dudar que el pedido satisfaga las especificaciones y aceptará el pedido. Pero si los resultados muestrales indican que H0 se debe rechazar, se concluirá que las piezas no satisfacen las especificaciones. En este caso, el inspector de control de calidad tendrá evidencias suficientes para regresar el pedido al proveedor. Así, se ve que en este tipo de situaciones, se toman medidas en ambos casos, cuando H0 no se puede rechazar y cuando H0 se puede rechazar.

## Formas para las hipótesis nula y alternativa
Las pruebas de hipótesis se refieren a dos parámetros poblacionales: la media poblacional y la proporción poblacional. A partir de la situación, las pruebas de hipótesis para un parámetro poblacional asumen una de estas tres formas: en dos se emplean desigualdades en la
hipótesis nula y en la tercera se aplica una igualdad en la hipótesis nula. En las pruebas de hipótesis para la media poblacional, μ0 denota el valor hipotético y para la prueba de hipótesis hay que escoger una de las formas siguientes.

Pruebas de una cola:<br> 
H0: μ >= μ0
Ha: μ < μ0

H0: μ <= μ0
Ha: μ > μ0

Prueba de dos colas.<br>
H0: μ = μ0
Ha: μ =! μ0

## Errores tipo I y II
Las hipótesis nula y alternativa son afirmaciones opuestas acerca de la población. Una de las dos, ya sea la hipótesis nula o la alternativa es verdadera, pero no ambas. Lo ideal es que la prueba de hipótesis lleve a la aceptación de H0 cuando H0 sea verdadera y al rechazo de H0 cuando Ha sea verdadera. Por desgracia, las conclusiones correctas no siempre son posibles. Como la prueba de hipótesis se basa en una información muestral debe tenerse en cuenta que existe la posibilidad de error.<br>

![Prueba](/_src/assets/hipotesprueba.PNG)

### Error II
Si se aceptara H0, es verdadera y a conclusión es correcta. Pero, si al aceptar lo anterior resultará que Ha es verdadera se comete un error tipo II; es decir, se acepta H0 cuando es falsa. 
### Error I
Si la conclusión es rechazar la H0, se considera a Ha verdadera. Si resultará que H0 es verdadera se comete un error tipo I; es decir, se rechaza H0 cuando es verdadera. Pero si Ha es verdadera, es correcto rechazar H0.

En el ejemplo del autmóvil que recorre 100km con 10L de gasolina, el error tipo I de rechazar H0 cuando es verdadera corresponde a la afirmación de los investigadores de que el nuevo sistema mejora el rendimiento (μ > 100) cuando en realidad el nuevo sistema no es nada mejor que el actual. En cambio, el error tipo II de aceptar H0 cuando es falsa corresponde a la conclusión de los investigadores de que el nuevo sistema no es mejor que el actual (μ <= 100) cuando en realidad el nuevo sistema sí mejora el rendimiento.<br>
En esta prueba de hipótesis del rendimiento, la hipótesis nula es H0: μ <= 100. Admita que la hipótesis nula es verdadera como una igualdad; es decir μ = 100. A la probabilidad de cometer un error tipo I cuando la hipótesis nula es verdadera como igualdad se le conoce como nivel de significancia. Por tanto en la prueba de hipótesis del rendimiento de combustible, el nivel de significancia es la probabilidad de rechazar H0: μ <= 100 cuando μ = 100. 

NIVEL DE SIGNIFICANCIA<br>
El nivel de significancia es la probabilidad de cometer un error tipo I cuado la hipótesis nula es verdadera como igualdad.

Para denotar el nivel de significancia se usa la letra griega α (alfa), y los valores que se suelen usar para α son 0.05 y 0.01.
En la práctica la persona responsable de la prueba de hipótesis especifica el nivel de significancia. Al elegir α se controla la probabilidad de cometer un error tipo I. A las aplicaciones de la prueba de hipótesis en que sólo se controla el error tipo I se les llama pruebas de significancia. Muchas aplicaciones de las pruebas de hipótesis son de este tipo.<br>
No siempre sucede lo mismo con un error tipo II. Por tanto, si se decide aceptar H0 no es posible establecer la confianza en esa decisión. Debido a la incertidumbre de cometer un error tipo II al realizar una prueba de significancia los dedicados a la estadística suelen recomendar que se diga “no se rechaza H0” en lugar de “se acepta H0”. Decir “no se rechaza H0” implica la recomendación de reservarse tanto el juicio como la acción. Siempre que no se determine y controle la probabilidad de cometer un error tipo II, no se dirá “se acepta H0”. En esos casos sólo son posibles dos conclusiones: no se rechaza H0 o se rechaza H0.<br>
Aunque controlar el error tipo II en una prueba de hipótesis es poco común, es posible.

### Especificar el nivel de significación

La distribución muestral del estadístico analizado, suele seguir una distribución estadística conocida, como la distribución normal estandarizada, la distribución t o la distribución chi cuadrado, éstas se utilizan como ayuda para determinar si la hipótesis nula es cierta.

Existen dos tipos de errores: <br>
- Error de tipo I: Es la probabilidad de que se rechace la hipótesis nula cuando es verdadera. Se conoce como nivel de significancia. <br>
- Error de tipo II: Es la probabilidad de aceptar la hipótesis nula cuando es falsa. Se conoce como la potencia de la prueba.

El error de tipo I que se llama también nivel de significación, determina el nivel de riesgo que se está dispuesto a tolerar en términos de rechazo de una hipótesis verdadera (imagina rechazar algo que en realidad era cierto,¡que problema!). La selección del nivel de Error I particular de riesgo, depende de la importancia (significación) del problema. En otras palabras, si se encuentra que los resultados observados en una muestra al azar difieren mar cadamente de aquellos que cabría esperar con la hipótesis y la variación propia del muestreo, se diría que las diferencias observadas son significativas y se estaría en condiciones de rechazar la hipótesis. Habitualmente se trabaja con niveles de significación del 1% y del 5%.

![conclusion](/_src/assets/siginifica.PNG)

### Determinar el tamaño de la muestra.<br>
El tamaño de la muestra se determina al tomar en cuenta la importancia de Error I y Error II y al considerar las restricciones presupuestarias al efectuar el estudio. Generalmente las muestras grandes, permiten detectar incluso diferencias pequeñas entre los valores hipotéticos los parámetros poblacionales. Para un nivel de Error I dado, aumentar el tamaño de la muestra reducirá Error II y así se incrementará el poder de la prueba para detectar que la hipótesis nula es falsa. Sin embargo, esto implica un aumento de los costos del estudio, por lo que las restricciones presupuestarias afectarán el tamaño de la muestra que se tomará.<br>
La fórmula para determinar el tamaño de muestra mínimo requerido para una prueba de
hipótesis de la media, usando la distribución normal es:

El valor z0 es el valor crítico de z que surge del nivel de significación especificado (Error I), mientras que z1 es el valor respecto de la probabilidad del error de tipo II asignada. El valor de la varianza debe conocerse o utilizar su estimador. Esta fórmula puede emplearse lo mismo para pruebas unilaterales que bilaterales. El único valor que difiere en estos dos tipos de pruebas es el valor de z0 utilizado.

### Determinar el estadístico de prueba.<br>
Una vez definidas las hipótesis nula y alternativa, y el tamaño de la muestra se puede establecer la distribución a utilizar: normal, t- student ó chi cuadrado.

### Establecer los valores críticos que dividen las zonas de rechazo y de no rechazo.<br>
Para poder establecer un método objetivo, que permita comparar los resultados muestrales con la hipótesis nula, el “nivel de significación”, se representa como un área (como toda probabilidad en una función de densidad), que se ubica a la derecha, a la izquierda o a ambos lados (en este caso, con la mitad de  en cada lado) según como se haya definido la Hipótesis alternativa. Esta probabilidad permite encontrar, en la tabla correspondiente (normal, t de Student o chi cuadrado), un valor de la variable (z, t ó ) denominado “valor crítico” simbolizado con zc (o eventualmente tc ó c), que divide al eje de las abscisas en dos zonas: la “zona de rechazo”, que se extiende por debajo de , y la “zona de no rechazo”, que se extiende a lo largo del resto del eje.

### Obtener los datos y calcular los estadísticos.<br>
Este paso está reservado a la efectiva realización de la investigación muestral. Es decir que en este momento es cuando se realiza el estudio tendiente a obtener los valores muestrales y calcular los estadísticos.

### Determinar el estadístico de prueba ha caído en la región de rechazo o en la de no rechazo.<br>
Se debe determinar la técnica a utilizar para determinar si el estadístico muestral ha caído en la región de rechazo o en la de no rechazo, es decir, el modo en que el estadístico de la muestra se va a comparar con el parámetro hipotético. El estadístico de prueba puede ser el estadístico muestral (el estimador insesgado del parámetro que se prueba) o una versión transformada de ese estadístico muestral.<br>
La forma de verificar la validez del supuesto formulado, consiste en comparar el parámetro poblacional con el estadístico muestral:

![resumen](/_src/assets/estadistico.PNG)

El procedimiento para efectuar esta comparación, consiste en construir una variable estandarizada zi cuando n > 30, porque al estar trabajando con una muestra grande las estadísticas tienen Distribución Normal, en cuyo numerador aparece, precisamente, la diferencia entre media poblacional y media muestra , o entre varianza poblacional  y varianza muestral es decir:

![resumen](/_src/assets/z.PNG)

o en su defecto la variable t de Student ó chi cuadrado (si se tratara de n ≤ 30 y no conocemos el desvío estandar poblacional), haciendo:

![resumen](/_src/assets/t.PNG)

El valor del estadístico de prueba. se compara con el valor crítico en la distribución apropiada, para determinar si cae en la zona de rechazo o en la de no rechazo.

### Determinar la decisión estadística.<br>

Se determina la decisión de la prueba de hipótesis

- si z1 > zc entonces z1 cae en la “zona de rechazo” y se considera que las diferencias entre z1 y zc son significativas entonces Rechazo la Hipótesis nula.

- si z1 ≤ zc entonces z1 cae en la “zona de no rechazo” y se considera que las diferencias entre z1 y zc no son significativas entonces No Rechazo la Hipótesis nula.

### Expresar la decisión estadística en términos del problema.<br>
Una vez tomada la decisión, se deben expresar sus consecuencias en términos del problema particular.


![resumen](/_src/assets/prueba2.PNG)


![test](/_src/assets/pruebahip.PNG)


## Pruebas de hipótesis para la media poblacional.<br>

En el cálculo de las prubas de hipótesis, debemos estandarizar las variables a fin de poder estimar la zona en la cual se encuentra la prueba, esto se determina mediante la busqueda de los valores de z para el nivel de siginificancia en las tablas correspondientes (normal, t, chi cuadrado). Para un nivel del sigifincancia de 0.05 y una prueba de dos colas. el valor de z 

Cuando nos encontramos frente a una prueba de hipótesis del tipo: "H0: μ<= x" y "H1: μ> x" o "H0: μ>= x" y "H1: μ< x" , la denominamos prueba de una cola.

![prueba2](/_src/assets/unacola.jpg)

Cuando nos encontramos frente a una prueba de hipótesis del tipo: "H0: μ= x" y "H1: μ!= 1x", la denominamos prueba de dos colas.

![prueba2](/_src/assets/doscolas.png)


# IMPORTANTE
Te recomendamos complementar este material con la lectura y ejercicios de las secciones 9.3 (pág. 345) y 9.4  (pág. 359) del Libro ["Estadística para administración y economía" - Capítulo 9](https://github.com/soyHenry/DS-M2/blob/main/Anderson.pdf).<br>
Podrás verificar las soluciones en las pág. 1002 y 1003.

## Homework

1. El gerente de Danvers-Hilton Resort afirma que la cantidad media que gastan los huéspedes en un fin de semana es de $600 o menos. Un miembro del equipo de contadores observó que en los últimos meses habían aumentado tales cantidades. El contador emplea una muestra de cuentas de fin de semana para probar la afirmación del gerente.
  - a. ¿Qué forma de hipótesis deberá usar para probar la afirmación del gerente?.
  - b. ¿Cuál es la conclusión apropiada cuando no se puede rechazar la hipótesis nula H0?
  - c. ¿Cuál es la conclusión apropiada cuando se puede rechazar la hipótesis nula H0?

2. El gerente de un negocio de venta de automóviles está pensando en un nuevo plan de bonificaciones, con objeto de incrementar el volumen de ventas. Al presente, el volumen medio de ventas es 14 automóviles por mes. El gerente desea realizar un estudio para ver si el plan de
bonificaciones incrementa el volumen de ventas. Para recolectar los datos una muestra de vendedores venderá durante un mes bajo el nuevo plan de bonificaciones.
  - a. Dé las hipótesis nula y alternativa más adecuadas para este estudio.
  - b. Comente la conclusión resultante en el caso en que H0 no pueda rechazarse.
  - c. Comente la conclusión que se obtendrá si H0 puede rechazarse.

3. Nielsen informó que los hombres jóvenes estadounidenses ven diariamente 56.2 minutos de televisión en las horas de mayor audiencia (The Wall Street Journal Europe, 18 de noviembre de 2003). Un investigador cree que en Alemania, los hombres jóvenes ven más tiempo la televisión
en las horas de mayor audiencia. Este investigador toma una muestra de hombres jóvenes alemanes y registra el tiempo que ven televisión en un día. Los resultados muestrales se usan para probar las siguientes hipótesis nula y alternativa.
  - a. Dé las hipótesis nula y alternativa más adecuadas para este estudio.
  - b. En esta situación, ¿cuál es el error tipo I? ¿Qué consecuencia tiene cometer este error?
  - c. En esta situación, ¿cuál es el error tipo II? ¿Qué consecuencia tiene cometer este error?

4. En la etiqueta de una botella de jugo de naranja de 3 cuartos (de litro) dice que el jugo de naranja contiene en promedio 1 gramo o menos de grasa. Responda a las preguntas siguientes relacionadas con una prueba de hipótesis para probar lo que dice en la etiqueta.
  - a. Dé las hipótesis nula y alternativa adecuadas.
  - b. En esta situación, ¿cuál es el error tipo I? ¿Qué consecuencia tiene cometer este error?
  - c. En esta situación, ¿cuál es el error tipo II? ¿Qué consecuencia tiene cometer este error?


## Ejercicios complementarios

5. Un fabricante de neumáticos informa que el promedio de km que se puede recorrer con ellos es de 50.000km la desviación estandar es de 4.000 km. Usted decide comprar 80 neumáticos y decide corroborar la afirmación del fabricante. Si su medición da una media de 49.600km.<br>
- Determine la hipótesis nula y alternativa.<br>
- ¿Consedería correcto lo expresado por el fabricante para un nivel de significancia del 0.05?.<br>
- ¿A partir de que valor de media muestral se ecuentra la zona de rechazo?
- ¿Consedería correcto lo expresado por el fabricante para un nivel del 0.01?. <br>
- ¿A partir de que valor de media muestral se ecuentra la zona de rechazo?

6. Los alumnos de Henry, obtienen en promedio una puntuación de 78 en un HC con una desviación estándar de 15 puntos. Henry determina que a través de métodos innovadores puede aumentar esa media. Considerando la hipótesis de investigación de que el nuevo sistema proporciona un rendimiento medio mayor; es decir, μ > 78. El grupo de investigación tomo una muestra de 45 alumnos y obtiene notas promedio de 80 puntos.
- Determine la hipótesis nula y alternativa.<br>
- ¿Determine si el nuevo sistema realmente mejoro el rendimiento para un nivel de significancia del 0.05?.<br>
- ¿A partir de que valor de media muestral se ecuentra la zona de rechazo?
- ¿Determine si el nuevo sistema realmente mejoro el rendimiento para un nivel de significancia del 0.01?.<br>
- ¿A partir de que valor de media muestral se ecuentra la zona de rechazo?