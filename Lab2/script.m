function f = script(imname)
clc;                                  % clear the command window
close all;                            % close open figure windows      
inputfile = [imname,'.tif'];
f = imread(inputfile);
figure;
imshow(f);
M = size(f,1);N = size(f,2);
P = 2 * M; Q=2*N;
D0 = 460;
H = IPGaussian(D0,P,Q);
g = IPftfilter(f,H);
figure;
imshow(g);

end