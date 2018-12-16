close all;
clc;
figure;
f = imread('vase.tif');
imshow(f);
figure;
g = double(f);
i = IPdwt2(g,2);
j = IPcontraststretch(i);
imshow(uint8(j))