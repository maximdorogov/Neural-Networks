import pandas as pd
import numpy as np


def get_dataset(data_path):
	#leo el archivo y reemplazo todos los NaN con ceros.
	#otra forma podria ser crear una funcion de validacion y descartar los datos si aparece un NaN
	df = pd.read_csv(data_path, delimiter = ';')
	df.replace(np.nan, 0, inplace=True)
	return df

def get_mean_values(data_fr):
	return data_fr.iloc[:,1:].mean(axis=1)

def create_output_data_frame(df,output_mean):
	output_parcels = df.iloc[:,0]
	bigdata = pd.concat([output_parcels , output_mean], axis = 1)
	bigdata.columns = ['Codigo Parcela', 'Dato']
	return bigdata


def main():

	#leo el archivo y reemplazo todos los NaN con ceros.
	df = get_dataset('data_set.csv')
	#calculo promedio
	output_mean =  get_mean_values(df)
	#armo el frame a exportar
	output_frame = create_output_data_frame(df,output_mean)
	#exporto el frame a csv
	output_frame.to_csv('out.csv')
	#imprimo el contenido del archivo de salida por pantalla
	print(output_frame)

main()


