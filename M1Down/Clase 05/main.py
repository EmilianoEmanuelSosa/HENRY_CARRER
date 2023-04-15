
# 1) Implementar un juego, que consista en apilar números enteros del 1 al 20, de forma aleatoria, para lo cual debe usarse una estructura de Pila.
# Luego, el usuario debe elegir un número de veces en que se va a quitar elementos de la pila, los cuales, sumados entre sí, no deben superar el valor de 50.
# El usuario pierde si la suma supera ese valor. Si no lo supera, gana, pero su calificación será 10 menos el número elementos que falten quitar para todavía no superar 50.
# El programa debe informar si perdió, y si ganó, con qué calificación lo hizo.

# *Consideraciones:<br>
# a. Se puede usar la función input() para obtener una entrada de teclado.<br>
# b. Se puede usar la el modulo random para obtener valores aleatorios.


import random


class game():
    def __init__(self):
        pass

    def playGame(self):
        print('\n\n\nThe object of the game is to draw numbers from a list without the total sum exceeding 50. \nIf you stop and the next sum exceeds 50, you win with 10 points. If the sum is greater than 50,\n you lose. If the sum is less than 50, we subtract one point for each number you could have rolled without exceeding 50.')
        print("\nLET'US BEGIN!\n")
        lis = [random.randint(1, 21) for i in range(20)]
        sum = lis.pop()
        print(f'\nWas removed the: {sum}')
        while True:
            asw = str(
                input('\nyou want to continue?, and remove a number more? '))
            if not (asw.lower() in ('yes', 'no')):
                print('\nIntroduce yes or no')
            elif asw.lower() == 'yes':
                num_aprox = lis.pop()
                sum += num_aprox
                print(f'\nWas removed the:{num_aprox}')
            elif asw.lower() == 'no':
                if (sum < 50) & (sum+lis.pop() > 50):
                    print(
                        f"\nWOW YOU WIN, YOU'RE AMAZING! you win With: {sum}")
                    break
                elif (sum < 50) & (sum+lis.pop() < 50):
                    count = 0
                    while sum < 50:
                        count += 1
                        sum += lis.pop()
                    print(f'\nYou win, with to {count}')
                    break
                if sum > 50:
                    print('\nYOU LOSE,sorry try again')
                    break
        return None


games = game()
games.playGame()


# * 2) Implementar un juego donde constas de 2 jarras, de capacidad 5 y 3 litros respectivamente, y debes colocar 4 litros en la jarra de 5L.
# Las opciones posibles son:
#  Llenar la jarra de 3 litros
#  Llenar la jarra de 5 litros
#  Vaciar la jarra de 3 litros
#  Vaciar la jarra de 5 litros
#  Verter el contenido de la jarra de 3 litros en la de 5 litros
#  Verter el contenido de la jarra de 5 litros en la de 3 litros
