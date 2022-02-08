# -*- coding: utf-8 -*-
"""
Created on Sat Feb 6 18:16:40 2022

@author: juanl
"""

from sqlalchemy import create_engine
#from mysql.connector import connect, Error

import pandas as pd

# =============================================================================
# realizamos los parametros de conexión a la DB y exportamos los dataframes
# =============================================================================

hostname="localhost"
dbname="RET_db"
uname="cargamos"
pwd="carga1234"

# Creamos un SQLAlchemy engine para conectar a MySQL Database
engine = create_engine("mysql+pymysql://{user}:{pw}@{host}/{db}"
                        .format(host=hostname, db=dbname, user=uname, pw=pwd))

# Tomamos la tabla y creamos un dataframe 
df1 = pd.read_sql_table('paquete_detail', engine)
df2 = pd.read_sql_table('register_detail', engine)

# =============================================================================
# Tomamos el valor al inicio del arreglo
# =============================================================================

# Eliminamos los caracteres 

df2.arreglo_estado = df2.arreglo_estado.str.replace('[', '')
df2.arreglo_estado = df2.arreglo_estado.str.replace(']', '')

df2.complemento_estado = df2.complemento_estado.str.replace('[', '')
df2.complemento_estado = df2.complemento_estado.str.replace(']', '')

# Creamos una función para tomar el valor
def Convert(string):
    li = list(string.split(","))
    return li[0]

# Tomamos el valor y lo insertamos en el dataframe

df2.arreglo_estado = df2.arreglo_estado.apply(Convert)
df2.complemento_estado = df2.complemento_estado.apply(Convert)

df1.to_csv("g:/My Drive/cargamos/paquete_clean.csv", index=False)
df2.to_csv("g:/My Drive/cargamos/register_clean.csv", index=False)