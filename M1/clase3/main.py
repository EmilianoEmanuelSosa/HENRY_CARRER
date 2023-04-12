import numpy as np
# my_first_vector = np.array([1,2,3,4])
# c = np.array([(1.5,2,3),(4,5,6),(3,2,1),(4,5,6)], dtype =  int)
# **Ejercicio 1**: Responder las siguientes preguntas:

# * ¿Qué operaciones se pueden hacer tanto en un arreglo de Numpy como en una lista? Dar un ejemplo en una celda.

# my_list = [0,1,2,3,4]
# numpy_list = np.arange(0,5)
# print(my_list,numpy_list)

# * ¿Qué operaciones se pueden hacer en un arreglo de Numpy pero NO en una lista? Explorar algunas opciones y dar un ejemplo en una celda.
# For example the advance indexing



# a = np.arange(0,15)
# mask=(a >= 4)&(a <= 10)
# result=a[mask]
# print(result)

# a = np.array([[1, 2], [3, 4]])
# print(a.shape)

# * ¿Cuál es la diferencia entre un arreglo de forma -shape- (n,), (n,1) y (1,n)? Pueden crear arreglos para intentar responder esa pregunta.

# vector = np.arange(0,6)
# print(f" Vector's array this a vector unidimesional with the shape (n,) {vector.shape}",vector)

# array = np.array([[0],[1],[2],[3],[4],[5]])
# print(f" Array's array this a array with the shape (n,1) like: {array.shape}",array)


# array2 = np.array([[0,1,2,3,4,5]])
# print(f" Array2's array this a array with the shape (1,n) like: {array2.shape}",array2)



# #2
# # * Escribir un arreglo con números enteros del 0 al 9. Pista: arange
# g = np.arange(0,10)
# # * Escribir un arreglo con 100 números equiespaciados del 0 al 9. Pista: linspace

# f  = np.linspace(0,10,num=100)

# # **Ejercicio 3**:
# # * Escribir un arreglo con números enteros del 10 al 100 y seleccionar aquellos que son divisibles por 3<br>
# # Pista: mask

# u = np.arange(10,101)
# mask = (u % 3) == 0
# u = u[mask]
# print(u)


# # **Ejercicio 4**:
# # * Crear un arreglo de ceros de `shape` (5,10).
# # * Reemplazar la segunda y cuarta fila con unos
# # * Reemplazar la tercera y octava columna con dos (2).

# zeros=np.zeros((5,10), dtype=int)


# #**6
f = np.array([0,1,2,3,4])

