function newImage = IPcontraststretch(imname)
%function that spread the grey values along all the domain
 %imname has to be a double to operate correctly
minimname = min(imname(:));
maximname = max(imname(:));
imname = 255/(maximname-minimname)*(imname-minimname);
newImage = imname;
end
