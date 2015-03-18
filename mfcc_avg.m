function ave=mfcc_avg(s);

for i=1:13
    ave(i) = mean(s(i,:));
end
