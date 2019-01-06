function openedImage = IPopen(image,se)
%IPOPEN Opening of an image by an strcuturing element
%   Detailed explanation goes here
openedImage = IPdilate(IPerode(image,se),se); %erode and then dilate
end

