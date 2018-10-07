clear all,close all,clc
%TP2 
%ejercicio 1a perceptron 
%funcion and y or con un perceptron
%armo la matriz que caracteriza la tabla de una compuerta and

%cantidad de entradas
N_ENTRADAS = 4;
 
%  dataset binario para 4 entradas 
a = 0:(N_ENTRADAS^2)-1;
data_set = de2bi(a,'left-msb');
data_set(data_set == 0) = -1;

% salidas para el dataset AND de 4 entradas
data_set_outputs = -1 + zeros(1,N_ENTRADAS^2)';
data_set_outputs(N_ENTRADAS^2) = 1;
data_set_outputs;

%
% FALTA IMPLEMENTAR DATA_SET_OUTPUT PARA COMPUERTA OR
%

%inicializo el perceptron.    
W = randn(1,length(data_set(1,:))+1);
n = 0.1;  %learning rate
num_iteraciones = 0;

while (test_perceptron(W,data_set,data_set_outputs) ~= 1)
    
    num_iteraciones = num_iteraciones +1;
    filas = randperm(length(data_set(:,1)));

    for i = 1:length(data_set(:,1))

        X = [data_set(filas(i),:) 1]'; %le concateno un 1 debido al modelo

        y = my_sign(W*X);
        
        delta_y = data_set_outputs(i) - y;
        
        delta_w  = n*X*(delta_y);

        W = W + delta_w';
    end
end

disp('CANTIDAD DE ITERACIONES:')
disp(num_iteraciones);