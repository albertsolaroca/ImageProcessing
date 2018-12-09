function g=IPftfilter(x,H)

M=size(x,1); N = size(x,2);
P = 2*M; Q = 2*N;

fp = zeros(P,Q);
fp(1:M,1:N) = x;
Fp = fft2(double(fp),P,Q);
Fp = fftshift(Fp);
figure;
imagesc(abs(Fp));
figure;
imagesc(abs(H));
Gp = H.*Fp;
figure;
imagesc(abs(Gp));
Gp = ifftshift(Gp);
gp = ifft2(Gp);
gp = real(gp);
g = gp(1:M,1:N);

end