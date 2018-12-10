function H=IPGaussian(D0,M,N)

x = 1:M;
y = 1:N;
[X,Y] = meshgrid(x,y);

Duv_squared = (X-(M+1)/2).^2 + (Y-(N+1)/2).^2;
H = (exp(-Duv_squared./(2*(D0^2))));

end
