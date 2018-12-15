figure;
f = imread('noisymri.tif');
imshow(f);
figure;
g = double(f);
h = IPdwt2(g,1);
j = IPcontrastsketch(h);
imshow(uint8(j))