function newImage = IPcontrastsketch(imname)

clc;                                  % clear the command window
close all;                            % close open figure windows      
inputfile = [imname,'.tif'];
figure;
f = imread(inputfile);
hist(f);
figure;
imshow(f);

minf = min(f(:));
maxf = max(f(:));

f = 255/(maxf-minf)*(f-minf);
figure;
hist(f);

figure;
imshow(f);


end