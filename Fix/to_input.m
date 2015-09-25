function r = to_input(s)
%Convert all data to input

kelas{24}(20,13) = zeros;

for i = 1 : 24
	for j = 1 : 20
		temp = preprocessing(s{i}(j,:));
		kelas{i}(j,:) = mean(mfcc(temp)');
	end
end

r = kelas;