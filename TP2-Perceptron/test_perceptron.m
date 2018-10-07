function [ out ] = test_perceptron( W, data_set,data_set_outputs )
%devuelve 1 si se aprendio el data set y 0 si no se aprendio
output = zeros(length(data_set(:,1)),1);
out = 0;

    for i = 1:length(data_set(:,1))
        %le concateno un 1 como ultima posicion porque asi figura en el
        %modelo del perceptron
        X = [data_set(i,:) 1]';
        output(i)  = my_sign(W*X);
        
    end

    if isequal(output,data_set_outputs)
        out = 1;
    end
end

