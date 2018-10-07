function [ bin_vector ] = rgb2bin_vect( rgb_image )
% recibe como argumento la imagen RGB y devuelve un vector double binario
%blanco y negro.
    bin_vector = double(rgb_image(:,:,1));
    bin_vector(bin_vector == 0) = -1;
    bin_vector(bin_vector == 255) = 1;
    bin_vector = bin_vector(:);
end

