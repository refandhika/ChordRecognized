%nilai awal
w{1} = fuzz_tri(kelas{1})';
w{2} = fuzz_tri(kelas{2})';
w{3} = fuzz_tri(kelas{3})';
w{4} = fuzz_tri(kelas{4})';
w{5} = fuzz_tri(kelas{5})';
w{6} = fuzz_tri(kelas{6})';
w{7} = fuzz_tri(kelas{7})';
w{8} = fuzz_tri(kelas{8})';
w{9} = fuzz_tri(kelas{9})';
w{10} = fuzz_tri(kelas{10})';
w{11} = fuzz_tri(kelas{11})';
w{12} = fuzz_tri(kelas{12})';
w{13} = fuzz_tri(kelas{13})';
w{14} = fuzz_tri(kelas{14})';
w{15} = fuzz_tri(kelas{15})';
w{16} = fuzz_tri(kelas{16})';
w{17} = fuzz_tri(kelas{17})';
w{18} = fuzz_tri(kelas{18})';
w{19} = fuzz_tri(kelas{19})';
w{20} = fuzz_tri(kelas{20})';
w{21} = fuzz_tri(kelas{21})';
w{22} = fuzz_tri(kelas{22})';
w{23} = fuzz_tri(kelas{23})';
w{24} = fuzz_tri(kelas{24})';

w = w';
all{1} = w;

jum_output = 24;
alfa = 0.05;
beta1 = 1.02;
beta2 = 0.98;
epoch = 1000;

for i = 1:epoch
    
	for kel = 1 : length(kelas)
        
		for k = 1 : size(kelas{kel},1)
            inputnya = kelas{kel}(k,:);
            
			for outpu = 1 : jum_output
                posisi(outpu) = (kelas{kel}(k,:) - w{outpu}(:,3)') / (w{outpu}(:,2)' - w{outpu}(:,3)');
				if posisi(outpu) > 1
					jarak(outpu) = posisi(outpu) - 1;
				else
					jarak(outpu) = 1 - posisi(outpu);
				end
			end
            
			[kecil pemenang] = min(jarak);
            
			if (w{pemenang}(:,2)' - w{pemenang}(:,3)') > 0
				w{pemenang}(:,3) = w{pemenang}(:,2)
			elseif (w{pemenang}(:,1)' - w{pemenang}(:,2)') > 0
				w{pemenang}(:,1) = w{pemenang}(:,2)
			end
			
			if min(jarak) > 1 && min(jarak) == 0
                w{pemenang}(:,1) = w{pemenang}(:,2) - beta1*(w{pemenang}(:,2) - w{pemenang}(:,1));
				w{pemenang}(:,2) = w{pemenang}(:,2);
				w{pemenang}(:,3) = w{pemenang}(:,2) + beta1*(w{pemenang}(:,3) - w{pemenang}(:,2));
            elseif pemenang == k
                w{pemenang}(:,1) = w{pemenang}(:,2) - beta1*(w{pemenang}(:,2) - w{pemenang}(:,1));
				w{pemenang}(:,3) = w{pemenang}(:,2) + beta1*(w{pemenang}(:,3) - w{pemenang}(:,2));
				if posisi(pemenang) < 1
					w{pemenang}(:,2) = w{pemenang}(:,2) + alfa*(1 - min(jarak))*(inputnya' - w{pemenang}(:,2));
				elseif posisi(pemenang) > 1
					w{pemenang}(:,2) = w{pemenang}(:,2) - alfa*(1 - min(jarak))*(inputnya' - w{pemenang}(:,2));
				else
					w{pemenang}(:,2) = w{pemenang}(:,2);
				end
            else
                w{pemenang}(:,1) = w{pemenang}(:,2) - beta2*(w{pemenang}(:,2) - w{pemenang}(:,1));
				w{pemenang}(:,3) = w{pemenang}(:,2) + beta2*(w{pemenang}(:,3) - w{pemenang}(:,2));
				if posisi(pemenang) > 1
					w{pemenang}(:,2) = w{pemenang}(:,2) + alfa*(1 - min(jarak))*(inputnya' - w{pemenang}(:,2));
				elseif posisi(pemenang) < 1
					w{pemenang}(:,2) = w{pemenang}(:,2) - alfa*(1 - min(jarak))*(inputnya' - w{pemenang}(:,2));
				else
					w{pemenang}(:,2) = w{pemenang}(:,2);
				end
			end
			
        end
		
    end
    all{i+1}=w;
    i;
    alfa=0.5*alfa;
	beta1=0.5*(beta1 - 1) + 1;
	beta2=1 - 0.5*(1 - beta2);
end

lvqnya = all{epoch+1};
