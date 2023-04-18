import pandas as pd
import random as ran
# *1) Cargar el dataset "Emisiones_CO2.csv" provisto en la clase 2
# *en un Dataframe de Pandas, quitar los registros que contengan valores faltantes
# *e implementar una nueva columna, que contenga el resultado de una función Hash aplicada
# *sobre el campo "Código de País" y se denomine "Clave_Hash".<br>
# *Consideraciones: Se puede utilizar la función provista.


def hash_function(key2):
    word = ''
    salt = ran.randint(1, 25)
    keys = []
    keys.append(salt)
    for i in key2:
        if ord(i) + salt > 0:
            b = ord(i) + salt
            word += chr(b)
        elif ord(i) + 4 < 0:
            word += i
    a = open(r'/home/mkm/desktop/Programin/HENRY_CARRER/M1Down/Clase 06/emissionsKeys.csv',
             'w', encoding='latin-1')
    a.write(keys)
    a.close
    return word


def deshash_function(wordhash):
    word = ''
    for i in wordhash:
        b = ord(i) - 4
        word += chr(b)
    return word


file = pd.read_csv(r'/home/mkm/desktop/Programin/HENRY_CARRER/M1Down/Clase 06/Emisiones_CO2.csv',
                   sep="|", encoding='latin-1')
file = file.rename(columns=lambda x: x.strip())
file = file.dropna()

file['Hash'] = file['Código de país'].apply(lambda x: hash(x))
new = pd.DataFrame(
    {'Hash': file['Hash'], 'Código de país': file['Código de país'], 'Name_country': file['Nombre del país'], 'Región': file['Región']})
new.to_csv(
    r'/home/mkm/desktop/Programin/HENRY_CARRER/M1Down/Clase 06/emissionsHashed.csv', index=False, sep='|')

# *2. A partir del Dataframe creado en el punto 1, construir uno nuevo, que contenga solo los valores distintos
# *de la tupla "Clave_Hash",
# *"Código de País" , "Nombre de país" y "Región". Quitando luego del dataframe original los campos "Código de País"
# *, "Nombre de país" y "Región"
