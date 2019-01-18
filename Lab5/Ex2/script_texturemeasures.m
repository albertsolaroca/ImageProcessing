%script to measure texture of different images
close all;
clc;
f = imread('bubbles.tif');
g = imread('cktboard.tif');
h = imread('cereal.tif');
figure;
subplot(1,3,1);imshow(f(end-99:end,end-99:end)); title('Bubbles');
subplot(1,3,2);imshow(g(end-99:end,end-99:end)); title('Cktboard');
subplot(1,3,3);imshow(h(end-99:end,end-99:end)); title('Cereal');

f = double(f(end-99:end,end-99:end));
g = double(g(end-99:end,end-99:end));
h = double(h(end-99:end,end-99:end));

[m1,std1,R1,thirdMom1,unif1,entr1] = IPtexturemeasures(f)
[m2,std2,R2,thirdMom2,unif2,entr2] = IPtexturemeasures(g)
[m3,std3,R3,thirdMom3,unif3,entr3] = IPtexturemeasures(h)