clear all,close all,clc
%cantidad de entradas
N_ENTRADAS = 2;
 
%  dataset binario para N entradas 
a = 0:(2^N_ENTRADAS)-1;
data_set = de2bi(a,'left-msb');

% salidas del dataset
data_set_outs = xor(data_set(:,1),data_set(:,2));

%reemplazo 0 por unos
data_set(data_set == 0) = -1;

data_set_outs = double(data_set_outs);
data_set_outs(data_set_outs == 0) = -1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%-------MUESTRO EL DATASET------------------------------------------%%%

figure
hold on
plot(data_set(:,1),data_set(:,2),'o');
xlabel('X2')
ylabel('X1')
xlim([-2 2])
ylim([-2 2])

%%%---------------INICIALIZO LOS PERCEPTRONES------------------------------%%%

beta = 0.5;
n = 0.1;

PERCEPTRONES_ENTRADA = 2;
PERCEPTRON_SALIDA =1;

W_in = randn(PERCEPTRONES_ENTRADA,length(data_set(1,:))+1);
W_out = randn(PERCEPTRON_SALIDA,length(data_set(1,:))+1);

num_iteraciones = 0;
net_outputs = zeros(length(data_set_outs),1);

%%%--------------SELECCIONO FILAS ALEATORIAS DEL DATASET----------

while (immse(data_set_outs,net_outputs) > 0.0001)
        
        num_iteraciones = num_iteraciones + 1;
        filas = randperm(length(data_set(:,1)));

    for i = 1:length(filas);

        %%%---CALCULO H1 Y H2

        X_in = [data_set(filas(i),:) 1]'; %le concateno un 1 debido al modelo

        h = W_in*X_in; %h contiene h1 y h2

        v = tanh(h*beta);

        X_out = [v ;1]; %le concateno un 1 debido al modelo

        h_s = W_out*X_out;

        y = tanh(h_s*beta);

        delta_s = tang_prima(h_s,beta)*(data_set_outs(filas(i)) - y);

        delta_in = delta_s*tang_prima(h,beta).*W_out(1:2)';

        W_out = W_out + n*delta_s*[v ;1]';

        W_in = W_in + n*delta_in*X_in';
        
    end
    
    %calculo las salidas y ver el error cuadratico medio.
    net_outputs = get_outputs_from_NN( W_in, W_out, data_set );

end

%Imprimo las rectas de decision

t = -4:4;
plot(t,(-W_in(1,1)/W_in(1,2))*t - W_in(1,3)/W_in(1,2));
plot(t,(-W_in(2,1)/W_in(2,2))*t - W_in(2,3)/W_in(2,2));
disp('CANTIDAD DE ITERACIONES:')
disp(num_iteraciones);

