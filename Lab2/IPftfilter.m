function g=IPftfilter(x,H)

M=size(x,1); N = size(x,2);
P = 2*M; Q = 2*N;

fp = im2double(x);
fp = [fp zeros(M,N)];
fp = [fp; zeros(M,Q)];
Fp = fft2(double(fp),P,Q);
Fp = fftshift(Fp);
Gp = H.*Fp;
Gp = ifftshift(Gp);
gp = ifft2(Gp);
gp = real(gp);
g = gp(1:M,1:N);
end