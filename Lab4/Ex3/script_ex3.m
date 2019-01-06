%% Init
close all;
clc;
%original image
figure;
f = imread('angio_noise.tif');
imshow(f); %noisy image
figure;
g = imread('angio.tif');
imshow(g); %original image
structuring_element = [1 1 1; 1 1 1; 1 1 1]; %structuring element
%% Opening
openedImage = IPopen(f,structuring_element);
ndiff1 = sum(openedImage ~= g,'all')
figure; imshow(openedImage);
%% Reconstruction
erodedImage = IPerode(f,structuring_element);
h = IPrecon_by_dilation(erodedImage,f,structuring_element); %morphological reconstructuion by opening
ndiff2 = sum(h ~= g,'all')
figure;imshow(h);