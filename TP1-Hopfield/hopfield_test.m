clear all;close all, clc

%Autor: Maxim Dorogov 
%Asignatura: Redes Neuronales
%Trabajo practico: Red de Hopfield para reconocimiento de patrones
%binarios. imagenes de 50x50. cada neurona es una imagen

%Classroom de google classroom.google.com  90wuff
%estados espureos, crear patron combinacion lineal de las 3 imagenes aprendidas.
%ver que resultado se obtiene al multiplicar W por eso. Si la salida es
%igual a la entrada entonces se obtiene un estado estable
%estado espureo: estado de minima energia que no fue ensenado a la red
%osea la salida es igual a la entrada con una entrada que no fue enseniada.
%el inverso de cada imagen es un estado espureo (de minima energia)

%para verificar si un estado es estable. multiplico por W mi patron y me
%tiene que devolver el mismo patron.

%si empiezo en un estado pero termino en otro, deberia iterar hasta ver
%hacia donde evoluciona hasta alcanzar el estado estable.
  
patron1 = imread('casa.png');
patron2 = imread('playa.png');
patron3 = imread('bicho.png');
patron_corrupto = double(imread('cara.bmp'));
 
patron_corrupto(patron_corrupto == 0) = -1;

figure
imshow(patron_corrupto);

patron_corrupto = patron_corrupto(:);

%transformo las imagenes en vectores binarios

patron_vect1 = rgb2bin_vect(patron1);
patron_vect2 = rgb2bin_vect(patron2);
patron_vect3 = rgb2bin_vect(patron3);

%meto los vectores binarios como columnas de una matriz
patrones = [patron_vect1 patron_vect2 patron_vect3];

%genero la matriz W a partir de las columnas de la matriz anterior
W = hopfield_w(patrones);

%(patron_vect3+patron_vect2+patron_vect3)
test = sign(W*patron_corrupto);

%test = sign(W*patron_vect3);
% test = vec2mat(test,50);
% figure 
% imshow(test');



return
