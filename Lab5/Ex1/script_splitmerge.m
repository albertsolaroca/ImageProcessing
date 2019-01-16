close all;
clc;
%original image
figure;
f = imread('tiger.tif');
imshow(f);
f_new = double(f);
for i=0:3
    [g, blocks] = splitmerge(f_new,2^i,@IPpredicate);
    figure;
    imshow(g);
end