import math
def Numberbinary(numero):
    '''
    Esta función recibe como parámetro un número entero mayor ó igual a cero y lo devuelve en su
    representación binaria. Debe recibir y devolver un valor de tipo entero.
    En caso de que el parámetro no sea de tipo entero y mayor a -1 retorna nulo.
    '''
    while True:
        try:
            if type(numero) == int and numero >= 0:
                binario = ""
                while numero > 0:
                    resto = numero % 2
                    binario = str(resto) + binario
                    numero = numero // 2
                return binario
        except:
            print('Number not interger or equal or mayor to 0, Try again')
            return binario







'''2) Convertir de decimal a binario las fracciones 1/2, 1/3, 1/4, 1/5, 1/6, 1/7,
1/8, 1/9. Luego analizar los resultados y observar qué particularidad se encuentra
en los mismos. Se puede usar Python o una calculadora, lo importante es ver si hay
algo que podemos notar...'''

def numberfloat(num):
    final = '0.'
    while num <2:
        num*=2
        if num < 0:
            final +='0'
        elif num >= 1:
            final+='1'
            num-=1
        if num==0:
            break
    return float(final)
lis = [1/2,1/3,1/4,1/5,1/6,1/7,1/8,1/9]
for i in lis:
    print(i)
    print(numberfloat(i))