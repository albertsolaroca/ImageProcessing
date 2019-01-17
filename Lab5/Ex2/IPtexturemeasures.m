function [m,var,R,thirdMom,unif,entr] = IPtexturemeasures(image)
%IPTEXTUREMEASURES Summary of an image by different statistical measures
%about the texture
%   image must be a double matrix

values = unique(image); %different values
counts = histcounts(image,values); %number of repetition
counts = [counts sum(image == values(end),'all')]; %split the last bin
counts(1,end-1) = counts(1,end-1) - counts(1,end);
m = counts*values/(size(image,1)*size(image,2)); %mean
var = counts*((values-m).^2)/(size(image,1)*size(image,2)); %variance
norm = (size(values,1) - 1)^2; %denom to normalize
R = 1 - (1/(1 + (var / norm ))); %R
thirdMom = counts*((values-m).^3)/norm; %third moment
unif = sum(counts.^2); %uniformity
entr = -counts*(log(counts)/log(2))'; %entropy
end

