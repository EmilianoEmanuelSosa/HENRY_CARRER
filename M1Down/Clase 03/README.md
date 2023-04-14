![HenryLogo](https://d31uz8lwfmyn8g.cloudfront.net/Assets/logo-henry-white-lg.png)

## Principales Objetivos de Aprendizaje para esta Clase

- Conocer las ventajas del uso de la librería Numpy para manejo de Arrays y Matrices en Python

## Numpy

Numpy es una librería muy importante para el ecosistema de Python ya que es la base de todos los cálculos científicos y muchas de las librerías de Machine Learning, como Scikit-Learn, que con sus modelos, cuando retorna un resultado, en general lo retorna en un formato Numpy.
NumPy (Numerical Python) es una librería numérica de Python, de código abierto, que proporciona estructuras de datos matriciales y funciones matemáticas de alto nivel.

* La API de **Numpy** tiene muchas similitudes con **Pandas**.
* Numpy reemplaza de forma más eficiente lo que podría ser un tipo lista, el uso de conjuntos de elementos numéricos.
* Las listas no poseen métodos que son prácticos para hacer aritmética.
* Es importante saber que otros lenguajes de programación poseen librerías altamente optimizadas para hacer cálculos numéricos con vectores de datos. Numpy es esa librería para el lenguaje de programación de Python.
* Los **array**, a diferencia de otros objetos en Python, están **fuertemente tipados**. Esto significa que no se permiten violaciones de los tipos de datos, es decir, dado el valor de una variable de un tipo concreto, no se puede usar como si fuera de otro tipo distinto a menos que se haga una conversión. La tipificación fuerte es necesaria porque es una de las cosas que permite que esta librería sea más rápida que usar listas. Los array tienen un **único tipo de dato**.

### Cómo instalar NumPy

```shell
pip install numpy
```

Por convención, se importa a Python de esta manera:

```python
import numpy as np
```

### Arrays de NumPy

En NumPy se trabaja con una estructura de datos llamada array o arreglos numéricos multidimensionales. Los arrays son parecidos a las listas de Python, por ejemplo, heredan algunas propiedades como el ser mutables y poder realizar slicing (de hecho podemos crear un array a partir de una lista). Pero tienen diferencias importantes: son menos pesados, más rápidos y permiten crear fácilmente arrays n-dimensionales.
Un array unidimensional puede ser una fila o una columna de una tabla, igual que una lista, esta se conoce como **vector**. Un array bidimensional es lo que llamamos comúnmente **matriz**. Y un array de 3 dimensiones o más, es decir, una matriz de matrices, se conoce como **tensor**.

* 1D: Vector
* 2D: Matriz
* 3D+: Tensor

![](../_src/assets/03-Numpy/numpy_array.png)

¿Cómo se ve en el código?
```python
>>> import numpy as np
>>> vector = np.arange(5)
>>> vector
array([0, 1, 2, 3, 4])
>>> 
>>> matrix = np.arange(9).reshape(3, 3)
>>> matrix
array([[0, 1, 2],
       [3, 4, 5],
       [6, 7, 8]])
>>> tensor = np.arange(12).reshape(3, 2, 2)
>>> tensor
array([[[ 0,  1],
        [ 2,  3]],

       [[ 4,  5],
        [ 6,  7]],

       [[ 8,  9],
        [10, 11]]])
```

<hr width="75%">
  <p align="center">
  Tip: Algo muy importante que tienes que saber es que los arrays tienen que tener un único tipo de dato. Esto hace que sea muy eficiente almacenarlos y acceder a ellos. Si intentas poner varios tipos de datos, NumPy te cambiará algunos elementos para que todos sean homogéneos. Por ejemplo, si creas un array con strings y enteros, te los transformará para que todos sean strings o si pones enteros y flotantes, hará que todos sean flotantes.
  Y una última regla: el tamaño de tus arrays 2D+ tiene que ser “rectangular”. Esto es igual que en matemáticas, si tu primera columna tiene 4 elementos, todas las columnas deberán tener 4 elementos. Lo mismo aplica para las filas.
  </p>
<hr width="75%">

### Crear un array

La forma más directa de crearlo es con np.array(tu_lista). Y al igual que las listas, se puede acceder a sus valores por medio de sus índices.

```python
>>> my_first_vector = np.array([2, 5, 6, 23])
>>> print(my_first_vector)
[ 2  5  6 23]
>>>
>>> my_first_matrix = np.array([[2, 4,], [6, 8]])
>>> print(my_first_matrix)
[[2 4]
 [6 8]]
>>> my_list = [0, 1, 2, 3, 4]
>>> print(np.array(my_list))
[0 1 2 3 4]
```

También puedes crear rápidamente un array con **secuencias** de números:

La función **np.arange()** funciona parecido a range en Python, solo que en lugar de regresar un generador, retorna un ndarray. Sus argumentos principales son: start, stop y step. Con lo que se le puede dar un rango de valores y cada cuánto tienen que aparecer.
Hay que en cuenta que start es inclusivo y stop es exclusivo. Igual que al hacer slicing en una lista.

```python
>>> print(np.arange(start=2, stop=10, step=2))
[2 4 6 8]
>>> print(np.arange(11, 1, -2))
[11  9  7  5  3]
```

La función **np.linspace()** toma el tamaño del array y los steps se calcularán  automáticamente. Y aquí tanto start como stop son inclusivos.

```python
>>> print(np.linspace(start=11, stop=12, num=18))
[11.         11.05882353 11.11764706 11.17647059 11.23529412 11.29411765
 11.35294118 11.41176471 11.47058824 11.52941176 11.58823529 11.64705882
 11.70588235 11.76470588 11.82352941 11.88235294 11.94117647 12.        ]
>>>
>>> print(np.linspace(0, 1, 11))
[0.  0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1. ]
```

### Arreglos vacíos y predefinidos.

**Numpy** dispone de una función con la que se pueden crear arrays de un tamaño dado inicializados con ceros. Esta función es **np.zeros()** y tiene la siguiente forma:

np.zeros(shape, dtype=float, order=‘C’)
Donde
* shape: son las dimensiones del array Numpy que se desea construir. Si es un escalar creará un vector, mientras si se indica una tupla se obtendrá una matriz.
* dtype: es un parámetro opcional en el que se indica el tipo de dato. Por defecto se utiliza el tipo de dato float.
* order: es un parámetro opcional con el que se indica como se llenarán las matrices: F primero las filas o C primero las columnas. Siendo el valor por defecto C.

```python
>>> print(np.zeros(4))
[0. 0. 0. 0.]
>>> print(np.zeros((2, 2)))
[[0. 0.]
 [0. 0.]]
```

También existe, la función **np.ones()**
```python
>>> print(np.ones(6))
[1. 1. 1. 1. 1. 1.]
>>> print(np.ones((2, 2)))
[[1. 1.]
 [1. 1.]]
```

La función **np.full()** crea un array con un valor en específico. Tiene 2 argumentos principales: shape que tiene que ser pasado como una tupla con las dimensiones y fill_value con el valor requerido.

```python
>>> print(np.full(shape=(2, 2), fill_value=5))
[[5 5]
 [5 5]]
>>> print(np.full((2, 3, 4), 0.55))
[[[0.55 0.55 0.55 0.55]
  [0.55 0.55 0.55 0.55]
  [0.55 0.55 0.55 0.55]]

 [[0.55 0.55 0.55 0.55]
  [0.55 0.55 0.55 0.55]
  [0.55 0.55 0.55 0.55]]]
```

La función **np.full_like()** sirve si ya se tiene un array y se lo quiere tomar como base para crear otro con el mismo tamaño, pero con un mismo valor.

```python
>>> base = np.linspace(2, 6, 4)
>>> print(np.full_like(base, np.pi))
[3.14159265 3.14159265 3.14159265 3.14159265]
```

### Arreglos aleatorios

La función **rand()** genera números aleatorios entre 0 y 1 en una distribución uniforme. Y la función **uniform()** permite ingresar los límites de la muestra.

```python
>>> print(np.random.rand(2, 2))
[[0.62740202 0.11171536]
 [0.47526728 0.19739417]]
>>> 
>>> print(np.random.uniform(low=0, high=1, size=6))
[0.7878737  0.3431897  0.77765595 0.60943181 0.30961326 0.60167083]
```

La función **randn()** genera números aleatorios en una distribución "normal estándar". Y la función **normal()** permite escalar los límites de la muestra.

```python
>>> print(np.random.randn(2, 2))
[[ 0.91140011  1.72792052]
 [-0.84028707 -0.27378577]]
>>> 
>>> print(np.random.normal(loc=0, scale=2, size=6))
[-2.36743682 -3.12673482 -1.14254395 -3.19805542 -1.11930443 -2.70161226]
```

La función **randint()** genera números enteros aleatorios entre un rango dado.

```python
>>> print(np.random.randint(low=0, high=10, size=(3, 3)))
[[1 0 5]
 [5 5 3]
 [7 5 4]]
>>> print(np.random.randint(1,100,10))
[61 55  8 95 93 89 27 24  1 38]
```

### Tamaño de los arrays

El atributo **.shape** devuelve las dimensiones del array y la función **reshape()** redimensiona un array, es decir, permite crear matrices o tensores a partir de vectores y viceversa. Para un array de 2 dimensiones, el primer valor son las filas y el segundo las columnas.
El atributo **.dtype** devuelve el tipo de dato de un array.

```python
>>> a = np.arange(1,10)
>>> print(a)
[1 2 3 4 5 6 7 8 9]
>>> B = np.reshape(a, [3,3])
>>> print(B)
[[1 2 3]
 [4 5 6]
 [7 8 9]]
>>> print(B.dtype)
int64
```

![unaImagenConBoxShadow](../_src/assets/03-Numpy/numpy_array_shape.png)

Un método particular es **flatten()**, que permite llevar cualquier array a una dimensión:

```python
>>> a = np.arange(0,20)
>>> print(a)
[ 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19]
>>> b = np.reshape(a, [2,10])
>>> print(b)
[[ 0  1  2  3  4  5  6  7  8  9]
 [10 11 12 13 14 15 16 17 18 19]]
>>> c = np.reshape(a, [2,2,5])
>>> print(c)
[[[ 0  1  2  3  4]
  [ 5  6  7  8  9]]

 [[10 11 12 13 14]
  [15 16 17 18 19]]]
>>> d = c.flatten()
>>> print(d)
[ 0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19]
>>> d.shape
(20,)
>>> a.shape
(20,)
```

### Manipulando arrays

De manera muy parecida a las listas, los ndarrays permiten hacer slicing con []. Sus índices empiezan en 0.

```python
>>> matrix_cool = np.arange(9).reshape(3, 3)
>>> print(matrix_cool)
[[0 1 2]
 [3 4 5]
 [6 7 8]]
>>> print(matrix_cool[1, 2])
5
>>> print(matrix_cool[0, :])
[0 1 2]
>>> print(matrix_cool[:, 1])
[1 4 7]
>>> print(matrix_cool[:, 1:])
[[1 2]
 [4 5]
 [7 8]]
>>> print(matrix_cool[0:2, 0:2])
[[0 1]
 [3 4]]
>>> print(matrix_cool[:, :])
[[0 1 2]
 [3 4 5]
 [6 7 8]]
```

### Copiar un array de NumPy

Se debe usar el método ***copy()** o nuevamente np.array(array_a_copiar)

```python
>>> a1 = np.array([2, 4, 6])
>>> a2 = a1.copy()
>>> a1[0] = 8
>>> print(a1)
>>> print(a2)
[8 4 6]
[2 4 6]
```

<hr width="75%">
  <p align="center">
  Tip: Notar que un error muy comun puede ser realizar simplemente la asignación.
  </p>
<hr width="75%">

  ```python
  >>> a1 = np.array([2, 4, 6])
  >>> a2 = a1         # Sin colocar copy()
  >>> a1[0] = 8
  >>> print(a1)
  >>> print(a2)
  [8 4 6]
  [8 4 6]             # ambos array se ven modificados
  ```

<hr width="75%">
  <p align="center">
  Esto sucede porque **a2** termina siendo una referenica a **a1** y no otro array.
  </p>
<hr width="75%">

## Opearciones con Arrays

Si intetamos sumar dos listas, se van a concatenar. Pero si intentamos sumar 2 ndarrays del mismo tamaño, se sumaran cada uno de sus elementos entre sí sin problemas, al igual que hacer una suma de matrices.

### Suma

```python
>>> A = np.arange(5, 11)
>>> print(A)
[ 5  6  7  8  9 10]
>>> print(A + 10)
[15 16 17 18 19 20]
```

### Resta

```python
>>> B = np.full(4, 3)
>>> C = np.ones(4, dtype='int')
>>> print(B)
[3 3 3 3]
>>> print(C)
[1 1 1 1]
>>> print(B - C)
[2 2 2 2]
```

Con la multiplicación y división las cosas se ponen un poco más complejas. Si tenemos una matriz y la multiplicamos o dividimos por un escalar, las operaciones se aplicarán de manera muy similar que lo que vimos con la suma.

Pero si intentamos multiplicar una matriz y un vector o dos matrices, las reglas cambian, y se aplica algo llamado **broadcasting** y aparecen operaciones como el producto punto. Con NumPy es extremadamente sencillo aplicarlo, pero es necesario tener claro los conceptos matemáticos detrás de ello. Por ejemplo, podemos realizar la multiplicación de matrices con el método **matmul()**:

```python
>>> a = np.array([[2,3],[2,3],[2,3]])
>>> a.shape
(3, 2)
>>> b = np.array([[1,6,5,2,7],[1,2,7,0,9]])
>>> b.shape
(2, 5)
>>> np.matmul(a,b)
array([[ 5, 18, 31,  4, 41],
       [ 5, 18, 31,  4, 41],
       [ 5, 18, 31,  4, 41]])
>>> a@b #Similar a usar matmul()
array([[ 5, 18, 31,  4, 41],
       [ 5, 18, 31,  4, 41],
       [ 5, 18, 31,  4, 41]])
```

## Matrices en Numpy

Numpy permite trabajar con estructuras denominadas matrices, las cuales tienen algunas diferencias respectos de los arrays:
* Con **np.array([1,2,3])** ó **np.array([[1,2,3]])** generamos arrays, mientras que con **np.mat([1,2,3])** generamos matrices:
```python
>>> np.array([[1,2,3]])
array([[1, 2, 3]])
>>> np.array([1,2,3])
array([1, 2, 3]) 
>>> np.mat([1,2,3])
matrix([[1, 2, 3]])
```
* Ambos tienen operaciones **.T (traspuesta)** para devolver la matriz de transposición, pero np.mat tiene otras como **H (transposición conjugada)** e **I (matriz inversa)**
```python
>>> a = np.array([[1,2,3],[4,5,6]])
>>> m = np.mat([(1,2,3),(4,5,6)])
>>> a.T
array([[1, 4],
       [2, 5],
       [3, 6]])
>>> m.T
matrix([[1, 4],
        [2, 5],
        [3, 6]])
>>> m.H
matrix([[1, 4],
        [2, 5],
        [3, 6]])
>>> m.I
matrix([[-0.94444444,  0.44444444],
        [-0.11111111,  0.11111111],
        [ 0.72222222, -0.22222222]])
```
* np.array puede representar datos con más de 1 ~ n dimensiones, mientras que np.mat solo se puede usar para dos dimensiones
* np.array toma la primera columna a[:, 0] lo que se devuelve no es una matriz, la forma no tiene dimensiones de columna (por ejemplo(3,) en lugar de (3,1)), Y np.mat es una matriz en forma de un vector de columna (como se esperaba)
```python
>>> a = np.array([[1,2,3],[4,5,6]])
>>> m = np.mat([(1,2,3),(4,5,6)])
>>> a[:, 0]
array([1, 4])
>>> m[:, 0]
matrix([[1],
        [4]])
>>> a[:, 0].shape
(2,)
>>> m[:, 0].shape
(2, 1)
```
* Los dos se pueden convertir entre sí con np.asmatrix () o np.asarray ()

#### Ejemplos de operaciones con arrays

```python
>>> # Aritmetica
>>> a = np.arange(4)
>>> 
>>> print("a     =", a)
a     = [0 1 2 3]
>>> print("a + 5 =", a + 5)
a + 5 = [5 6 7 8]
>>> print("a - 5 =", a - 5)
a - 5 = [-5 -4 -3 -2]
>>> print("a * 2 =", a * 2)
a * 2 = [0 2 4 6]
>>> print("a / 2 =", a / 2)
a / 2 = [ 0.   0.5  1.   1.5]
>>> print("a // 2 =", a // 2)  
a // 2 = [0 0 1 1]
>>> print("-a     = ", -a)
-a     =  [ 0 -1 -2 -3]
>>> print("a ** 2 = ", a ** 2)
a ** 2 =  [0 1 4 9]
>>> print("a % 2  = ", a % 2)
a % 2  =  [0 1 0 1]
```

## Estadística

Hay métodos que nos devuelven medidas estadísticas, como por ejemplo promedio, desviación standard, mediana y percentil:

```python
>>> height_list = [74, 74, 72, 72, 73, 69, 69, 71, 76, 71, 73, 73, 74, 74, 69, 70, 73, 75, 78, 79, 76, 74, 76, 72, 71, 75]
>>> print(np.mean(height_list))
73.1923076923077
>>> print(np.median(height_list))
73.0
>>> print(np.std(height_list))
2.572326554954764
>>> print(np.percentile(height_list,90))
76.0
```

También se pueden obtener los mínimos o máximos:

```python
>>> print(np.max(height_list))
79
>>> print(np.min(height_list))
69
```

```python
>>> # Otras ufuncs interesantes
>>> a = np.arange(4)
>>> b = np.arange(1,5)
>>> 
>>> display(np.exp(a))         # exponencial
array([  1.        ,   2.71828183,   7.3890561 ,  20.08553692])
>>> display(np.log(b))         # logaritmo natural
array([ 0.        ,  0.69314718,  1.09861229,  1.38629436])
>>> display(np.sqrt(a))        # raiz cuadrada
array([ 0.        ,  1.        ,  1.41421356,  1.73205081])
>>> display(np.greater(a,b))   # superior o igual punto a punto
array([False, False, False, False], dtype=bool)
```

## Rendimiento

Las ufuncs corren a velocidad de código compilado C. De poder utilizarse se deberían preferir a el uso de for loops. Un código Numpy solo con funciones nativas, sin bucles, se le llama código "vectorizado".

```python
>>> %%timeit
>>> a = np.arange(1000000)
>>> b = np.zeros(1000000)
>>> i = 0
>>> for el in a:
>>>     b[i] = el+el
>>>     i+=1 
296 ms ± 40.5 ms per loop (mean ± std. dev. of 7 runs, 1 loop each)
%%timeit
>>> a = np.arange(1000000)
>>> b = np.zeros(1000000)
>>> b=a+a
3.36 ms ± 275 µs per loop (mean ± std. dev. of 7 runs, 100 loops each)
```

### Diferencia entre None y np.nan

Cuando tenemos un objeto None incluído en una serie, el “upcasting” de Numpy se resuelve a “object”. Cuando tenemos un np.nan, conservamos una columna de tipo float y podemos seguir operando:

```python
>>> val1 = np.array([1, None, 2, 3])
>>> val1
array([1, None, 2, 3], dtype=object)
>>> val2 = np.array([1, np.nan, 3, 4])
>>> val2
array([ 1., nan,  3.,  4.])
>>> val2.dtype
dtype('float64')
>>> for tipo in ['object','int']:
>>>     print("Tipo:", tipo)
>>>     %timeit np.arange(1E6, dtype=tipo).sum()
>>>     print()
Tipo: object
54.2 ms ± 2.2 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)

Tipo: int
2.14 ms ± 315 µs per loop (mean ± std. dev. of 7 runs, 100 loops each) 
```

## Máscaras

Se puede crear filtros que se denominan máscaras en base a una condición dada, para que posteriormente se puedan seleccionar los elementos que la cumplan.

```python
>>> a = np.arange(0,20).reshape(2,10)
>>> print(a)
[[ 0  1  2  3  4  5  6  7  8  9]
 [10 11 12 13 14 15 16 17 18 19]]
>>> mascara = ((a % 2) == 0)
>>> print(mascara)
[[ True False  True False  True False  True False  True False]
 [ True False  True False  True False  True False  True False]]
>>> a[mascara]
array([ 0,  2,  4,  6,  8, 10, 12, 14, 16, 18])
```

## Recursos adicionales

* [Visualizar tu código] (https://memlayout.com/)