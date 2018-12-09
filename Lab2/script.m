function k = script(imname)
clc;                                  % clear the command window
close all;                            % close open figure windows      
inputfile = [imname,'.tif'];
f = imread(inputfile);
figure; subplot(2,3,1);
imshow(f);
title('Original image')
M = size(f,1);N = size(f,2);
P = 2 * M; Q=2*N;
D0 = [10 30 60 160 460];
for i = 1:size(D0,2)
    subplot(2,3,i+1);
    H = IPGaussian(D0(i),P,Q);
    g = IPftfilter(f,H);
    imshow(g);
    title(sprintf('GLFP with D_0 = %i',D0(i)));
end
end