
%ejercicio 1


patron1 = imread('casa.png');
patron2 = imread('playa.png');
patron3 = imread('bicho.png');
patron3 = imread('bicho.png');


%% ejercicio 2
clc,clear all,close all

patron = [1 1 1 -1]';
estado = [1 -1 1 1]';
%enseno el patron a la red de hopfield
W = hopfield_w(patron);

%actualizo de manera sincronica
Salida_act_sinc = my_sign(W*estado);
disp('Al actualizar de forma sincronica se obtiene:')
disp(Salida_act_sinc)

%lo que se observa en el 1er caso es que la red evoluciona hacia un estado
%que coincide con el inverso del patron que se uso para inicializarla,
%estos estados espureos son estados de minima energia hacia los que
%evoluciona la red por mas que nunca se lo hubieran ense?ado

%si se vuelve a inicializar la red con el patron obtenido vuelvo al patron
%original. El sistema va a ciclar de esta forma entre esos 2 estados.

%actualizo de manera asincronica

filas = randperm(length(W(:,1)));

for j = 1:2000
  
  filas = randperm(length(W(:,1)));  
    
  for i = 1:length(filas)

    estado(filas(i)) = my_sign( W(filas(i),:)*estado);  
                   
  end
  
end

disp('Al actualizar de forma asincronica se obtiene:')
disp(estado)

%al actualizar en forma asincronica se observa que la salida es el patron
%que se le ense?o a la red. Tambien puede llegar a aparecer el inverso de
%ese patron debido a que los inversos tambien son estados estables de una
%red de hopfield.

