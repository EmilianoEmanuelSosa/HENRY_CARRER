import csv


archivo = open(
    r"C:\Users\Mark XII\Desktop\programacion\HENRY_CARRER\M1Down\Clase 04\hospitales2.csv", encoding="UTF-8  ")

tabla = csv.reader(archivo, delimiter=",")
with open("output.csv", "w", encoding="UTF-8", newline="") as salida:
    # salida_writer = csv.writer(salida)
