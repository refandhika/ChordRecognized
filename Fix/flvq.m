function last = flvq(s)

%1. Praproses data
%Silent removal
removed = sil_rem(s);
%Normalisasi
normalized = normalization(removed);


%2. MFCC
extracted = mfcc(normalized);
%last = extracted;

%3. FLVQ
fuzzification
fuzzied = fuzz_tri(extracted);

last = fuzzied;
