function fuzz = fuzz_tri(ft); 

for i = 1 : size(ft, 2)
	fuzz(1,i) = min(ft(:,i));
	fuzz(2,i) = mean(ft(:,i));
	fuzz(3,i) = max(ft(:,i));
end
