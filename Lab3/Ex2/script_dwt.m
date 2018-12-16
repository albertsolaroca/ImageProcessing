close all;
clc;
%original image
figure;
f = imread('vase.tif');
imshow(f);
%image showing the details and approximation of 7.30(c)
figure;
g = double(f);
i = IPdwt2(g,2);
j = IPdwt2scale(i,2);
imshow(uint8(j))
