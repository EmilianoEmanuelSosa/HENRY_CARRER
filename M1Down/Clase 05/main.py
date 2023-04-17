
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

    def empty(self):
        self.jug = 0
        return 0

    def receiver(self, value):
        if value < 3:
            value -= 3
            self.jug = value
            return value

    def transfersend(self):
        if self.jug > 0:
            transferobj = jug5(self.jug)
            transferobj.full()
            return
        return transferobj.full()


class jug5():
    def __init__(self,):
        self.jug = 0

    def value(self):
        return self.jug

    def full(self):
        self.jug = 5

    def empty(self):
        self.jug = 0

    def receiver(self, value):
        if self.jug + value <= 5:
            self.jug += value
            return value
        elif self.jug + value > 5:
            ley = self.jug
            self.jug = 5
            return (ley+value)-5

    def transfersend(self):
        if self.jug > 0:
            tranferobj = jug3()
            tranferobj.receiver(self.jug)
            return
        elif self.jug == 0:
            print('nothing to transfer...')


class playgamejug():
    def __init__(self):
        print("The game consis in leave with 4 liters the jug of 5 liters, emptying or filling the jug of 3 or 5 liters\nLET'US BEGIN!\n")

    def play(self):
        while True:
            while True:
                a = int(input(
                    'Introduce 1 if you want fill the of 3 litter or 2 if you want to fill the jug of 5 litters: '))
                if a == 1:
                    j = jug3()
                    j.full()
                    b = jug5()
                    break
                elif a == 2:
                    b = jug5()
                    b.full()
                    j = jug3()
                    break
                else:
                    print('dont be any jug')
            if b.value() == 4 or j.value() == 4:
                print('YOU WIN')
                break
            while True:
                transfer = int(
                    input('transfer any jug? if is yes tell me which.. 1 or 2 or 3 if you want pass'))
                if transfer == 1:
                    j.transfersend()
                    break
                elif transfer == 2:
                    b.transfersend()
                    break
                elif transfer == 3:
                    break
                else:
                    print('Donde be any jug')
            while True:
                empty = int(
                    input('What jug you want to empty? 1 or 2? or 3 if you want to pass'))
                if empty == 1:
                    j.empty()
                    print('the jug of 3 litter be empty')
                    break
                elif empty == 2:
                    b.empty()
                    print('the jug of 5 litter be empty')
                    break
                elif empty == 3:
                    break
                else:
                    print('Dont be any jug')


a = playgamejug()
a.play()
