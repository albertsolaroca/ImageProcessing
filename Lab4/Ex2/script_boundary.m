close all;
clc;
%original image
figure;
f = imread('lincoln.tif');
imshow(f);
g = logical(f);
structuring_element = [1 1 1; 1 1 1; 1 1 1];
h = IPboundary(g,structuring_element);
figure;
imshow(mat2gray(h));