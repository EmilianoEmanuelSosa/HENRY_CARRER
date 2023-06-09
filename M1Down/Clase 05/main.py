
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
        self.capacity = 0

    def get_capacity(self):
        return self.capacity

    def full(self):
        self.capacity = 3

    def ac(self, val):
        self.capacity = val

    def empty(self):
        self.capacity = 0

    def transfer(self, volumewater):
        if not ((isinstance(volumewater, int)) or volumewater <= 0):
            return "Don't be posible..."
        if (volumewater+self.capacity == 3) or (volumewater+self.capacity < 3):
            self.capacity += volumewater
            return 0
        elif (volumewater+self.capacity > 3):
            if ((volumewater+self.capacity)-3)*-1 < 0:
                return ((volumewater+self.capacity)-3)
            else:
                return (volumewater+self.capacity)-3


class jug5():
    def __init__(self):
        self.capacity = 0

    def get_capacity(self):
        return self.capacity

    def ac(self, val):
        self.capacity = val

    def full(self):
        self.capacity = 5

    def empty(self):
        self.capacity = 0

    def transfer(self, volumewater):
        if not ((isinstance(volumewater, int)) or volumewater <= 0):
            return "Don't be posible..."
        if ((volumewater+self.capacity) == 5) or ((volumewater+self.capacity) < 5):
            self.capacity += volumewater
            return 0
        elif ((volumewater+self.capacity) > 5):
            if ((volumewater+self.capacity)-5)*-1 < 0:
                return ((volumewater+self.capacity)-5)
            else:
                return ((volumewater+self.capacity)-5)*-1


# caca = jug3()
# caca.transfer(2)
# print(caca.get_capacity())


class gamejug():
    def __init__(self):
        print('Welcome to game of jug, your job is fill the jug of 5 litter with 4 litter, if you can, You win! lets go!!!')

    def playgame(self):
        jarra3 = jug3()
        jarra5 = jug5()
        count1 = 0
        while True:
            print((jarra3.get_capacity()))
            print(jarra5.get_capacity())
            while True:
                full = int(input(
                    'What jug your fill?, 1 for the jug of 3 litter and 2 for the jug of 5 litter or 3 if you can pass...'))
                if full == 1:
                    jarra3.full()
                    count1 += 1
                    print('The jug of 3 litter is fill..')
                    ju = False
                    ja = True
                    break
                elif full == 2:
                    jarra5.full()
                    print('The jug of 5 litters is fill..')
                    count1 += 1
                    ju = True
                    ja = False
                    break
                elif full == 3 and count1 != 0:
                    break
            print((jarra3.get_capacity()))
            print(jarra5.get_capacity())
            if (jarra5.get_capacity()) == 4:
                print('You are amazing and you win...')
                break
            while True:
                trans = int(input(
                    'You can only transfer a jug fill... and the jug that you decide transfer for the another jug...1 for the 3 litters and 2 for the 5 litters and 3 for pass.... '))
                if trans == 1 and ja:
                    result = jarra5.transfer(jarra3.get_capacity())
                    jarra5.transfer(jarra3.get_capacity())
                    jarra3.ac(result)
                    print(
                        f'The jug of 3 litters have now:{jarra3.get_capacity()}')
                    break
                elif trans == 2 and ju:
                    result = jarra3.transfer(jarra5.get_capacity())
                    jarra3.transfer(jarra5.get_capacity())
                    jarra5.ac(result)
                    print(
                        f'The jug of 5 litters have now:{jarra5.get_capacity()}')
                    break
                elif trans == 3:
                    break
            print((jarra3.get_capacity()))
            print(jarra5.get_capacity())
            while True:
                emp = int(input(
                    'tell me the jug tbat you want to empty, 1 for the 3 and 2 for the 5 and 3 for pass...'))
                if emp == 1:
                    jarra3.empty()
                    print('the jug of 3 litters is empty...')
                    break
                elif emp == 2:
                    jarra5.empty()
                    print('the jug of 5 litters is empty...')
                    break
                elif emp == 3:
                    break


a = gamejug()
a.playgame()


# class jug3():
#     def __init__(self):
#         self.jug = 0

#     def full(self):
#         self.jug = 3
#         return self.jug

#     def value(self):
#         return self.jug

#     def sumar(self, value):
#         self.jug += value

#     def restar(self, value):
#         self.jug = value

#     def transfer(self, jug_donante, jug_receptor):
#         if jug_donante.value() > 0 and jug_receptor.value() < jug_receptor.full():
#             cantidad = min(jug_donante.value(),
#                            jug_receptor.full() - jug_receptor.value())
#             jug_donante.restar(jug_donante.value() - cantidad)
#             jug_receptor.sumar(cantidad)


# class jug5():
#     def __init__(self):
#         self.jug = 0

#     def value(self):
#         return self.jug

#     def full(self):
#         self.jug = 5
#         return self.jug

#     def empty(self):
#         self.jug = 0

#     def sumar(self, value):
#         self.jug += value

#     def restar(self, value):
#         self.jug = value

#     def transfer(self, jug_donante, jug_receptor):
#         if jug_donante.value() > 0 and jug_receptor.value() < jug_receptor.full():
#             cantidad = min(jug_donante.value(),
#                            jug_receptor.full() - jug_receptor.value())
#             jug_donante.restar(jug_donante.value() - cantidad)
#             jug_receptor.sumar(cantidad)


# class playgamejug():
#     def __init__(self):
#         print("The game consis in leave with 4 liters the jug of 5 liters, emptying or filling the jug of 3 or 5 liters\nLET'US BEGIN!\n")

#     def play(self):
#         jugobjet3 = jug3()
#         jugobjet5 = jug5()
#         while True:
#             print(jugobjet3.value(), jugobjet5.value())
#             count = 0
#             a = int(input(
#                 'Introduce 1 if you want fill the of 3 litter or 2 if you want to fill the jug of 5 litters or 3 if you want to pass: '))
#             if a == 1:
#                 jugobjet3.full()
#                 count += 1
#                 print('The jug of 3 liter is filled...')
#             elif a == 2:
#                 jugobjet5.full()
#                 count += 1
#                 print('The jug of 5 liter is filled...')
#             elif a == 3 and count == 0:
#                 print('You have to fill any jug....')
#             else:
#                 print('There are no jugs')
#                 count += 1

#             transfer = int(
#                 input('Transfer water? Enter 1 for the 3 liter jug, 2 for the 5 liter jug or 3 to pass: '))

#             if transfer == 1:
#                 transfer_done = transfer(jugobjet3, jugobjet5)
#                 if transfer_done:
#                     print(
#                         f'Now the Jug of 3 liters has {jugobjet3.value()} liters and the Jug of 5 liters has {jugobjet5.value()} liters....')
#                 else:
#                     print('Transfer not possible')

#             elif transfer == 2:
#                 transfer_done = transfer(jugobjet5, jugobjet3)
#                 if transfer_done:
#                     print(
#                         f'Now the Jug of 3 liters has {jugobjet3.value()} liters and the Jug of 5 liters has {jugobjet5.value()} liters....')
#                 else:
#                     print('Transfer not possible')
#             elif transfer == 3:
#                 pass
#             else:
#                 print('Invalid choice')

#             if (jugobjet5.value() == 4):
#                 print('YOU WIN!')
#                 break

#             empty = int(
#                 input('What jug do you want to empty? Enter 1 for the 3 liter jug, 2 for the 5 liter jug or 3 to pass: '))
#             if empty == 1:
#                 jugobjet3.empty()
#                 print('The 3 liter jug is now empty')
#             elif empty == 2:
#                 jugobjet5.empty()
#                 print('The 5 liter jug is now empty')
#             elif empty == 3:
#                 pass
#             else:
#                 print('Invalid choice')
#                 # print(jugobjet5.value(), jugobjet3.value())


# a = playgamejug()
# a.play()
