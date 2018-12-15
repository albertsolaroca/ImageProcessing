function  y = IPdwt(x,jScale)
%IPdwt discrete wavelet transform based of Haar wavelet
%   Detailed explanation goes here
size(x,2)
d = zeros(1,size(x,2)-size(x,2)/2^jScale);
index = 0;
for i = 1:jScale
    c = (x(1:2:end) + x(2:2:end))/(2^(1/2));
    inter = (x(1:2:end) - x(2:2:end))/(2^(1/2));
    d(end-index-size(inter,2)+1:end-index) = inter;
    index = index + size(inter,2);
    x = c;
end
y = [x d];
end

