%ej2 Capacidad = Max_patrones/Cant_neuronas
% el error de la tabla esta definida para un aprendizaje sincronico
% fijo un tamanio de red y empiezo a ensenarle patrones hasta que supero la
% cota del error que esta en la tabla
%Para hoy randn(Neuronas,Patrones); genero N patrones de N neuronas. 
%Armo la matriz W con esto y genero vectores aleatorios. Analizo las
%salidas y calculo lo que se pide en la tabla.
clear all;close all;clc

Q_Neuronas = 1000;
Q_Patrones = 610;

% las columnas de Patrones son vectores que le ensenio a la matriz
Patrones = my_sign(randn(Q_Neuronas,Q_Patrones)); 

W = hopfield_w(Patrones);

Aprendidos = my_sign(W*Patrones);

% calculo cuantas neuronas no coinciden con los patrones originales

aux = Aprendidos - Patrones;

Q_errores = 0;
error = 0;

for i = 1:Q_Patrones;
  
  Q_errores = 0;  
    
  for j=1:Q_Neuronas  
      
      if aux(j,i)~= 0 
          
          Q_errores = Q_errores + 1;
          
      end
     
  end
    % calculo la probabilidad de error
    error = error + Q_errores/(Q_Neuronas*Q_Patrones);
    
end

disp('El error es:');
disp(error);

disp('Cantidad de neuronas:');
disp(Q_Neuronas);
disp('Cantidad de patrones:');
disp(Q_Patrones);
