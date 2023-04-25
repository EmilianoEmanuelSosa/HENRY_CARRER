import pandas as pd
import numpy as np
import math

population_dict = {'California': 38332521,
                   'Texas': 26448193,
                   'New York': 19651127,
                   'Florida': 19552860,
                   'Illinois': 12882135}

area_dict = {'California': 423967,
             'Texas': 695662,
             'New York': 141297,
             'Florida': 170312,
             'Illinois': np.nan}

population = pd.Series(population_dict)
area = pd.Series(area_dict)
# print(population.index)


date = pd.DataFrame({'Population': population, 'Area': area})
date['Density'] = date['Population'] / date['Area']
date['Density'] = date['Density'].apply(
    lambda x: int(x) if not math.isnan(x) else None)


file = pd.DataFrame()
fifa = pd.read_csv(
    r'/home/mkm/desktop/Programin/HENRY_CARRER/M1/clase4/fifa-statistics.csv', decimal=',')
print(fifa)
# print(date['Density'])
# print(date)
# print(date['Population']['California'])
