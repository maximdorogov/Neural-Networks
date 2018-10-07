%ejercicio 4
clear all;close all;clc

%declaro constantes
%numero de neuronas o dipolos en mi vector
N = 10;
T = 5:-0.05:0;
k = 1;
N_iteraciones = 10;
M = zeros(1,length(T));

% las columnas de Patrones son vectores con 1 y -1
Patrones = my_sign(randn(N)); 

% algoritmo para tomar elementos y permutarlos
for temp = 1:length(T) %indice para las temperaturas
    
    for iter = 1:N_iteraciones

        pos_aleatoria = randperm(N^2);

        for k = 1:length(pos_aleatoria)
            
            [i,j] = ind2sub(N,pos_aleatoria(k));

            %calculo  la energia 
            energia_anterior = energia(Patrones);
            
            %hago flip del elemento.    
            Patrones(i,j) = -Patrones(i,j);
            
            %calculo la nueva energia 
            energia_actual = energia(Patrones);
            deltaE = energia_actual - energia_anterior;
            
            %regla de decision
            if (deltaE > 0)
                
                if (rand > exp(-deltaE/(T(temp))))

                    Patrones(i,j) = -Patrones(i,j);
                    energia_actual = energia_anterior;
                    
                end
            end
        end
    end 
    
    M(temp) = sum(Patrones(:));
    
end

plot(T,M);
ylim([-200 150])
grid minor
return

    
    
    
    
