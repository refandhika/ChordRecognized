function r = mfcc(s,fs)
%
%MFCC
%
%s merupakan sinyal suara yang akan kita analisis
%fs merupakan sampling rate dari sinyal yang mau dianalisis
%output : r berisi sinyal yang telah ditransformasi

m = 100; %pergeseran ke frame berikutnya
n = 256; %panjang frame yg dibuat
l = length(s);

nbFrame = floor((l-n)/m) + 1;

%frame blocking

%M=zeros(n,nbFrame);

for i=1:n
    for j=1:nbFrame
        M(i,j) = s(((j-1) * m) +i);
    end
end

h = hamming(n); %windowing menggunakan hamming

M2 = diag(h) * M;

%frame=zeros(n, nbFrame);

%FFT
for i=1:nbFrame
    frame(:,i) = fft(M2(:,i));
end

t= n/2;
tmax = 1/fs;
melf = melfb(13, n, fs); %mel frequency wrapping
n2 = 1 + floor(n/2);
z = melf * abs(frame(1:n2, :)).^2;

r = dct(log(z)); %perhitungan DCT (discrete cosine transform)