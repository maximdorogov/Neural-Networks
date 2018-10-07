function [ signo ] = my_sign( data )
% usar esta funcion en lugar de sign() para tomar el valor 0 como signo 1
    data(data == 0) = 1;
    
    signo = sign(data);

end

