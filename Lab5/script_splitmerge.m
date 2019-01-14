close all;
clc;
%original image
figure;
f = imread('tiger.tif');
imshow(f);
[g, blocks] = splitmerge(f,2,@IPpredicate);
figure;
imshow(g);