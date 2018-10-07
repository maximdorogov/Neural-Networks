function [ weight_matrix ] = hopfield_w( input_data_matrix )
%   Esta funcion crea la matriz W. (Matriz de pesos de la red)
%   Recibe como argumento una matriz que tenga como columnas los vectores
%binarios con los cuales se desea entrenar a la red.

weight_matrix = input_data_matrix*input_data_matrix'...
  - length(input_data_matrix(1,:))*eye(length(input_data_matrix(:,1)));

end

