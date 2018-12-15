function output = IPdwt2(image,jScale)
    output = image;
    for j = 1:size(image,2)
        output(:,j) = (IPdwt(output(:,j)',jScale))';
    end
    for i = 1:size(image,1)
        output(i,:) = IPdwt(output(i,:),jScale);
    end
end

