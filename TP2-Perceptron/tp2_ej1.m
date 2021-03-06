clear all,close all,clc
%TP2 
%ejercicio 1a perceptron 
%funcion and y or con un perceptron
%armo la matriz que caracteriza la tabla de una compuerta and

%cantidad de entradas
N_ENTRADAS = 2;
 
%  dataset binario para 4 entradas 
a = 0:(2^N_ENTRADAS)-1;
data_set = de2bi(a,'left-msb');
data_set(data_set == 0) = -1;

%%%%%%%% SALIDAS PARA EL DATASET (COMENTAR EL QUE NO SE USA)%%%%%%%%%%%

%salidas para el dataset AND de N entradas
data_set_outputs = -1 + zeros(1,2^N_ENTRADAS)';
data_set_outputs(2^N_ENTRADAS) = 1;
data_set_outputs;

% % salidas para el dataset OR de N entradas
% data_set_outputs = ones(1,2^N_ENTRADAS)';
% data_set_outputs(1) = -1;
% data_set_outputs;

%%%%-------MUESTRO EL DATASET------------------------------------------%%%

figure
hold on
plot(data_set(:,1),data_set(:,2),'o');
xlabel('X2')
ylabel('X1')
xlim([-2 2])
ylim([-2 2])

%%%----------------------------------------------------------------%%%

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

t = -4:4;

plot(t,(-W(1)/W(2))*t - W(3)/W(2));

disp('CANTIDAD DE ITERACIONES:')
disp(num_iteraciones);