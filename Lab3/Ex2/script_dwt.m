close all;
clc;
%original image
figure;
f = imread('vase.tif');
imshow(f);
%image showing the details and approximation of 7.30(c)
figure;
g = double(f);
i = IPdwt2(g,2);
j = IPdwt2scale(i,2);
imshow(uint8(j))
numbers_pos = [121 3; 121 130; 252 3; 252 130; 252 257; 505 3; 505 257];
for i = 1:7
    text(numbers_pos(i,2),numbers_pos(i,1),num2str(i));
end
figure;
imshow(uint8(j(1:128,1:128)));