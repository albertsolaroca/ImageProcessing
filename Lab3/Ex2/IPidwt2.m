function output = IPidwt2(image,jScale)
%IPIDWT2 Summary of this function goes here
%   Detailed explanation goes here
    output = image;
    for k = jScale:-1:1
        rows = size(output,1)/(2^(k-1))
        columns = size(output,2)/(2^(k-1))
        for j = 1:columns %applying funct based on loop is the most efficient
            output(1:rows,j) = (IPidwt(output(1:rows,j)',1))';
        end
        for i = 1:rows
            output(i,1:columns) = IPidwt(output(i,1:columns),1);
        end
    end
end

