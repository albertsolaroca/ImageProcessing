close all;
clc;
figure;
f = imread('noisymri.tif');
imshow(f);
g = double(f);
figure;
for j=0:10:110
    fig = IPwaveletdenoise(g,3,j);
    subplot(3,4,(j/10)+1);
    imshow(uint8(fig));
    title(sprintf('Threshold = %i',j));
end