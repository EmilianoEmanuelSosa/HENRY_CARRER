import pandas as pd
import numpy as np
import plotly.express as px

n = 1500
X1 = np.linspace(-10,10,n)
X2 = np.linspace(0,22,n)
X3 = np.linspace(-5,0,n)

y_real = -1.5*X1 + 0.5*X2 + 2*X3 + 5

linear_generator = y_real + np.random.randn(n)

pd.DataFrame({'X1': X1,'X2': X2,'X3': X3, 'y' :linear_generator}).to_csv('data_regression.csv')
#px.scatter(linear_generator)