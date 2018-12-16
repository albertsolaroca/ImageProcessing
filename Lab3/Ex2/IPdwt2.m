function output = IPdwt2(image,jScale)
    output = image;
    for k = 1:jScale
        rows = size(output,1)/(2^(k-1))
        columns = size(output,2)/(2^(k-1))
        for j = 1:columns %applying funct based on loop is the most efficient
            output(1:rows,j) = (IPdwt(output(1:rows,j)',1))';
        end
        for i = 1:rows
            output(i,1:columns) = IPdwt(output(i,1:columns),1);
        end
    end
end

