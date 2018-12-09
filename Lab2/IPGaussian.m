function H=IPGaussian(D0,M,N)

x = 1:M;
y = 1:N;

% rfloor = floor(M/2); rceil = ceil(M/2);
% cfloor = floor(N/2); cceil = ceil(N/2);
% 
% x=-rfloor:rceil-1;
% y=-cfloor:cceil-1;

[X,Y] = meshgrid(x,y);

Duv_squared = (X-(M+1)/2).^2 + (Y-(N+1)/2).^2;
H = ifftshift(exp(-Duv_squared./(2*(D0^2))));

figure;
mesh(X,Y,H);
end
