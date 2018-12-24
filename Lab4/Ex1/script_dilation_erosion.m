close all;
clc;
%original image
figure;
f = imread('wirebondmask.tif');
imshow(f);
%image showing the details and approximation of 7.30(c)
g = logical(f);
structuring_element = [1 1 1; 1 1 1; 1 1 1];
h = IPdilate(g,structuring_element);
j = IPerode(g,structuring_element);
figure;
imshow(mat2gray(h));
figure;
imshow(mat2gray(j));