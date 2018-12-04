function newImage = IPGradient(imname)

clc;                                  % clear the command window
close all;                            % close open figure windows      
inputfile = [imname,'.tif'];
f = imread(inputfile);
figure;
imshow(f);

filter1 = [-1 -1 -1; 0 0 0; 1 1 1];
filter2 = [-1 0 1;-1 0 1;-1 0 1];

grad1 = IPFilter(imname,filter1);
grad2 = IPFilter(imname,filter2);
figure;
imshow(grad1);
figure;
imshow(grad2);

final = im2uint8((im2double(grad1).^2 + im2double(grad2).^2).^(1/2));
figure;
imshow(final);

end