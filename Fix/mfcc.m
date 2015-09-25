function r = mfcc(s)
% MFCC
%
% Inputs: s  contains the signal to analize
%         fs is the sampling rate of the signal
%
% Output: r contains the transformed signal
%
%


fs = 11000;
m = 100; %pergeseran ke frame berikutnya
n = 256; %panjang frame
l = length(s);

nbFrame = floor((l - n) / m) + 1;

%frame blocking
for i = 1:n
    for j = 1:nbFrame
        M(i, j) = s(((j - 1) * m) + i);
    end
end

h = hamming(n); %windowing menggunakan hamming (bawaan matlab)

M2 = diag(h) * M; %diag (bawaan matlab)

%FFT (bawaan matlab)
for i = 1:nbFrame
    frame(:,i) = fft(M2(:, i));
end

t = n / 2;
tmax = l / fs;

m = melfb(13, n, fs); %Mel Frequency Wraping (melfb.m)
n2 = 1 + floor(n / 2);
z = m * abs(frame(1:n2, :)).^2;

r = dct(log(z)); %perhitungan DCT (bawaan matlab)
