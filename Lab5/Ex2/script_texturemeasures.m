%script to measure texture of different images
close all;
clc;
f = imread('cktboard.tif');
figure;
imshow(f(end-99:end,end-99:end));
f = double(f(end-99:end,end-99:end));
IPtexturemeasures(f);