
# *Homework 4_4
# A partir del CSV hospitales2.csv, generar un archivo CSV de salida, que contenga los siguientes campos en este orden:<br>
# latitude<br>
# longitude<br>
# name<br>
# label<br>
# Con los correspondientes datos extraídos del CSV original, el campo name tiene que corresponder con la dirección del hospital, y el campo label con el nombre del hospital.<br>
# Ejemplo de visualización en: https://www.gpsvisualizer.com


import pandas as pd
import math as mt

hospitals = pd.read_csv(
    r'/home/mkm/desktop/Programin/HENRY_CARRER/M1/clase4/hospitales2.csv', decimal=',')


new_df = hospitals[['WKT', 'NOMBRE', 'NOM_MAP']]
new_df.loc[:, 'longitude'] = new_df['WKT'].str.replace(
    'POINT (', '').str.replace(')', '').str.split(' ', expand=True)[0].astype(float)

new_df.loc[:, 'latitude'] = new_df['WKT'].str.replace(
    'POINT (', '').str.replace(')', '').str.split(' ', expand=True)[1].astype(float)

new_df = new_df[['latitude', 'longitude', 'NOMBRE', 'NOM_MAP']]


new_df.to_csv(
    r'/home/mkm/desktop/Programin/HENRY_CARRER/M1/clase4/newhospital.csv', index=False, sep='|')


# newhospital = pd.DataFrame('')
# newhospital['Latitude']
# name = hospitals['NOMBRE']
# label = hospitals['NOM_MAP']


# latitude = hospitals['WKT'].str.replace('POINT (', '').str.replace(
#     ')', '').str.split(' ', expand=True).astype(float)
