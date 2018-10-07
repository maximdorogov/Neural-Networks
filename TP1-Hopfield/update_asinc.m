clear all;close all, clc

%actualizacion asincronica

lucy = imread('lucy.bmp');
lucy = imresize(lucy,0.1);
lucy_borrado = imread('lucy_borrado.bmp');
lucy_borrado = imresize(lucy_borrado,0.1);
%lucy_black = imread('lucy_black.bmp');

figure
imshow(lucy_borrado);
title('Imagen ingresada')

lucy_bin = rgb2bin_vect(lucy);
lucy_borrado_bin = rgb2bin_vect(lucy_borrado);
%lucy_black_bin = rgb2bin_vect(lucy_black); 


%meto los vectores binarios como columnas de una matriz
patrones = [lucy_bin];
%genero la matriz W a partir de las columnas de la matriz anterior
W = hopfield_w(patrones);

filas = randperm(length(W(:,1)));

for j = 1:1
  
  filas = randperm(length(W(:,1)));  
    
  for i = 1:length(filas)

    lucy_borrado_bin(filas(i)) = my_sign( W(filas(i),:)*lucy_borrado_bin);  
                   
  end
  
end

  figure
  lucy_borrado_aux = vec2mat(lucy_borrado_bin,86); %meter 86 si resize es 0.1 172 si es 0.2
  imshow(lucy_borrado_aux')
  title('Imagen corregida')    
  

