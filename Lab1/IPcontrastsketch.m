function newImage = IPcontrastsketch(imname)

% clc;                                  % clear the command window
% close all;                            % close open figure windows      
% inputfile = [imname,'.tif'];
f = imname;
% figure;
% imhist(f);
% title('Histogram of the original image');
% ylabel('Number of pixels');
% 
% figure;
% imshow(f);
% f= double(f);

minf = min(f(:));
maxf = max(f(:));

f = 255/(maxf-minf)*(f-minf);
newImage = f;
% figure;
% imhist(f);
% title('Histogram after applying contrast sketching to the image');
% ylabel('Number of pixels');

% figure;
% imshow(f);


end