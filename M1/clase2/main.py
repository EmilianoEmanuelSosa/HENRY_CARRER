import os
import csv
file = open(r'/home/mkm/desktop/Programin/HENRY_CARRER/M1/clase2/Emisiones_CO2.csv',
            'r', encoding='latin-1')
dates = file.read()
dates = dates.split('\n', 1)[1]
dicc_emisiones = {'cod_pais': [],
                  'nom_pais': [],
                  'region': [],
                  'anio': [],
                  'co2': [],
                  'co2_percapita': []}


def replace(element):
    if element:
        element = element.replace('.', '')
        element = element.replace(',', '.')
    return float(element)


for line in file:
    line = line.rstrip()
    dey = line.split('|')
    dicc_emisiones['cod_pais'].append(dey[0])
    dicc_emisiones['nom_pais'].append(dey[1])
    dicc_emisiones['region'].append(dey[2])
    dicc_emisiones['anio'].append(int(dey[3]))
    dicc_emisiones['co2'].append(replace(dey[4]))
    dicc_emisiones['co2_percapita'].append(replace(dey[5]))
print(dicc_emisiones['anio'])
file.close()

# 2) a) ¿Cuántas variables hay?
# 5
# b) ¿Qué tipos de datos usar para cada una?

# For 1, str
# For 2, str
# For 3, str
# For 4, i
# For 5,
# For 6, str

# c) ¿Qué tipo de variables son? <br>

# 1-Qualitative
# 2-Qualitative
# 3-Qualitative
# 4-Quantitative
# 5-Quantitative
# 6-Quantitative

# d) ¿Hay valores faltantes?
# yes
# e) ¿Cuál es el total de emisiones de CO2 para 'América Latina y Caribe' en el año 2010?]
