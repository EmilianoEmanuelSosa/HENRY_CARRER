
# 1) Implementar un juego, que consista en apilar números enteros del 1 al 20, de forma aleatoria, para lo cual debe usarse una estructura de Pila.
# Luego, el usuario debe elegir un número de veces en que se va a quitar elementos de la pila, los cuales, sumados entre sí, no deben superar el valor de 50.
# El usuario pierde si la suma supera ese valor. Si no lo supera, gana, pero su calificación será 10 menos el número elementos que falten quitar para todavía no superar 50.
# El programa debe informar si perdió, y si ganó, con qué calificación lo hizo.

# *Consideraciones:<br>
# a. Se puede usar la función input() para obtener una entrada de teclado.<br>
# b. Se puede usar la el modulo random para obtener valores aleatorios.

import random as ran


class stack():
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        return self.items.pop()

    def isEmpty(self):
        return self.items == []

    def peek(self):
        return self.items[-1]

    def size(self):
        return len(self.items)


class game():
    def __init__(self):
        pass

    def playGame(self):
        print('\n\n\nThe object of the game is to draw numbers from a list without the total sum exceeding 50. \nIf you stop and the next sum exceeds 50, you win with 10 points. If the sum is greater than 50,\n you lose. If the sum is less than 50, we subtract one point for each number you could have rolled without exceeding 50.')
        print("\nLET'US BEGIN!\n")
        lis = stack()
        for i in range(1, 21):
            lis.push(ran.randint(1, 21))
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
                elif sum > 50:
                    print('\nYOU LOSE,sorry try again')
                    break
        return None


# * 2) Implementar un juego donde constas de 2 jarras, de capacidad 5 y 3
# litros respectivamente, y debes colocar 4 litros en la jarra de 5L.
# Las opciones posibles son:
#  Llenar la jarra de 3 litros
#  Llenar la jarra de 5 litros
#  Vaciar la jarra de 3 litros
#  Vaciar la jarra de 5 litros
#  Verter el contenido de la jarra de 3 litros en la de 5 litros
#  Verter el contenido de la jarra de 5 litros en la de 3 litros


class jug3():
    def __init__(self):
        self.jug = 0

    def full(self):
        self.jug = 3
        return self.jug

    def value(self):
        return self.jug

    def sumar(self, value):
        self.jug += value

    def restar(self, value):
        self.jug = value

    def transfer(self, jug_donante, jug_receptor):
        if jug_donante.value() > 0 and jug_receptor.value() < jug_receptor.full():
            cantidad = min(jug_donante.value(),
                           jug_receptor.full() - jug_receptor.value())
            jug_donante.restar(jug_donante.value() - cantidad)
            jug_receptor.sumar(cantidad)


class jug5():
    def __init__(self):
        self.jug = 0

    def value(self):
        return self.jug

    def full(self):
        self.jug = 5
        return self.jug

    def empty(self):
        self.jug = 0

    def sumar(self, value):
        self.jug += value

    def restar(self, value):
        self.jug = value

    def transfer(self, jug_donante, jug_receptor):
        if jug_donante.value() > 0 and jug_receptor.value() < jug_receptor.full():
            cantidad = min(jug_donante.value(),
                           jug_receptor.full() - jug_receptor.value())
            jug_donante.restar(jug_donante.value() - cantidad)
            jug_receptor.sumar(cantidad)


class playgamejug():
    def __init__(self):
        print("The game consis in leave with 4 liters the jug of 5 liters, emptying or filling the jug of 3 or 5 liters\nLET'US BEGIN!\n")

    def play(self):
    jugobjet3 = jug3()
    jugobjet5 = jug5()
    while True:
        print(jugobjet3.value(), jugobjet5.value())
        count = 0
        a = int(input(
            'Introduce 1 if you want fill the of 3 litter or 2 if you want to fill the jug of 5 litters or 3 if you want to pass: '))
        if a == 1:
            jugobjet3.full()
            count += 1
            print('The jug of 3 liter is filled...')
        elif a == 2:
            jugobjet5.full()
            count += 1
            print('The jug of 5 liter is filled...')
        elif a == 3 and count == 0:
            print('You have to fill any jug....')
        else:
            print('There are no jugs')
            count += 1

        transfer = int(
            input('Transfer water? Enter 1 for the 3 liter jug, 2 for the 5 liter jug or 3 to pass: '))

        if transfer == 1:
            transfer_done = transfer(jugobjet3, jugobjet5)
            if transfer_done:
                print(
                    f'Now the Jug of 3 liters has {jugobjet3.value()} liters and the Jug of 5 liters has {jugobjet5.value()} liters....')
            else:
                print('Transfer not possible')

        elif transfer == 2:
            transfer_done = transfer(jugobjet5, jugobjet3)
            if transfer_done:
                print(
                    f'Now the Jug of 3 liters has {jugobjet3.value()} liters and the Jug of 5 liters has {jugobjet5.value()} liters....')
            else:
                print('Transfer not possible')
        elif transfer == 3:
            pass
        else:
            print('Invalid choice')

        if (jugobjet5.value() == 4):
            print('YOU WIN!')
            break

        empty = int(
            input('What jug do you want to empty? Enter 1 for the 3 liter jug, 2 for the 5 liter jug or 3 to pass: '))
        if empty == 1:
            jugobjet3.empty()
            print('The 3 liter jug is now empty')
        elif empty == 2:
            jugobjet5.empty()
            print('The 5 liter jug is now empty')
        elif empty == 3:
            pass
        else:
            print('Invalid choice')
            # print(jugobjet5.value(), jugobjet3.value())


a = playgamejug()
a.play()
