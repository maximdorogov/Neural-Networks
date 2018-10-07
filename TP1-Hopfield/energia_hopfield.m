function [ Energia ] = energia_hopfield( w, p )
% recibe como 1er argumento a la matriz de pesos
%recibe como 2do argumento el patron que usa para calcular energia

Energia = 0;

    for i=1:length(w(1,:))

        for i=1:length(w(:,1))
            
            Energia = Energia + w(i,j)*p(i)*p(j);
            
        end

    end
    Energia = (-1/2)*Energia;
end
