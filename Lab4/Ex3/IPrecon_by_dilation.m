function finalImage = IPrecon_by_dilation(F, mask, se)
%IPRECON_BY_DILATION Morphological reconstruction by dilation
%   Detailed explanation goes here

finalImage = IPdilate(F,se); %dilate
finalImage = finalImage & mask; %intersect
figure;imshow(F);figure;imshow(finalImage);
while(~isequal(finalImage,F))
    F = finalImage;
    finalImage = IPdilate(F,se); %dilate
    finalImage = finalImage & mask; %intersect
end

end

