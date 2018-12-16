close all;
clc;
figure;
f = imread('noisymri.tif');
imshow(f);
g = double(f);
i = IPwaveletdenoise(g,3,40);
figure;
imshow(uint8(i));