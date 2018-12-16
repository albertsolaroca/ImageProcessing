function output = IPdwt2scale(image,jScale)
%IPDWT2SCALE scales a dwt2 transformation for more 'clarity' of the
%coefficients
%  Uses the jScale parameter to fint the final approximation, then scales by contrast stretch the image taking into account the limits of the approximatiion 
rows = size(image,1)/(2^(jScale));
columns = size(image,2)/(2^(jScale));
image(1:rows, 1:columns) = IPcontraststretch(image(1:rows, 1:columns)); %approximation
for k = jScale:-1:1
    new_rows = size(image,1)/(2^(k-1));
    new_columns = size(image,2)/(2^(k-1));
    image(rows+1:new_rows,1:columns) = IPcontraststretch(image(rows+1:new_rows, 1:columns)); %vertical details
    image(1:rows,columns+1:new_columns) = IPcontraststretch(image(1:rows, columns+1:new_columns)); %horitzontal details
    image(rows+1:new_rows, columns+1:new_columns) = IPcontraststretch(image(rows+1:new_rows, columns+1:new_columns)); %diagonal details
    rows = new_rows;
    columns = new_columns;
end
output = image;
end

