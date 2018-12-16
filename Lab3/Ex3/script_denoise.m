close all;
clc;
figure;
f = imread('noisymri.tif');
imshow(f);
g = double(f);
figure;
i=1;
for j=1:4
    for thr = 10:25:85
        fig = IPwaveletdenoise(g,j,thr);
        subplot(4,4,i);
        imshow(uint8(fig));
        title(sprintf('Threshold = %i, J-Scale = %i',thr,j));
        i = i+1;
    end
end