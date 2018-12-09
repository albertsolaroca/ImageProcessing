function script(imname)
clc;                                  % clear the command window
close all;                            % close open figure windows      
inputfile = [imname,'.tif'];
f = imread(inputfile);
figure;
imshow(f);

D0 = 460;
H = IPGaussian(D0,size(f,1)*2,size(f,2)*2);
g = IPftfilter(f,H);
figure;
imshow(g);

end