function [ Energia ] = energia( Patrones )
%recibe una matriz M con ceros encerrada en un cuadrado de ceros y
%calcula su energia

%concateno ceros en los costados
aux = zeros(1,length(Patrones(:,1)));
Patrones_aux = horzcat([Patrones aux']);
Patrones_aux = horzcat([ aux' Patrones_aux]);
aux = zeros(1,length(Patrones_aux(1,:)));

Patrones_aux = horzcat([Patrones_aux ; aux]);
Patrones_aux = horzcat([aux ; Patrones_aux]);

e_aux = 0;

for fila = 2:length(Patrones_aux(:,1))-1
    
    for col = 2:length(Patrones_aux(1,:))-1
        
        e_aux = e_aux + Patrones_aux(fila,col)*(Patrones_aux(fila,col+1)+Patrones_aux(fila,col-1)...
            +Patrones_aux(fila-1,col) + Patrones_aux(fila+1,col));
                
    end
    
end

Energia = -e_aux/2;


end

