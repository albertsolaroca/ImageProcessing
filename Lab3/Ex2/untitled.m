figure;
f = imread('noisymri.tif');
imshow(f);
figure;
g = double(f);
%g = IPcontrastsketch(g)
h = IPdwt2(g,1);
h(1:end/2,1:end/2) = IPdwt2(h(1:end/2,1:end/2),1);
j = IPcontrastsketch(h);
imshow(uint8(j))