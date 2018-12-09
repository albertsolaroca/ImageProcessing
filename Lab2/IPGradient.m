function newImage = IPGradient(imname)

clc;                                  % clear the command window
close all;                            % close open figure windows      
inputfile = [imname,'.tif'];
f = imread(inputfile);

filter1 = [-1 -1 -1; 0 0 0; 1 1 1];
filter2 = [-1 0 1;-1 0 1;-1 0 1];

grad1 = IPFilter(imname,filter1);
grad2 = IPFilter(imname,filter2);
final = im2uint8((im2double(grad1).^2 + im2double(grad2).^2).^(1/2));

figure;
subplot(2,2,1),imshow(f),title('Original Image');
subplot(2,2,2), imshow(grad1), title('Vertical Gradients');
subplot(2,2,3), imshow(grad2), title('Horizontal Gradients');
subplot(2,2,4), imshow(final), title('Gradient Magnitude');

end