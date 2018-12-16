function output = IPwaveletdenoise(image,jScale,threshold)

output = IPdwt2(image,jScale);
approximation = output(1:size(image,1)/(2^jScale),1:size(image,1)/(2^jScale));
output(abs(output)<threshold)=0;
output(1:size(image,1)/(2^jScale),1:size(image,1)/(2^jScale)) = approximation;
output = IPidwt2(output,jScale);

end