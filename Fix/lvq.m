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
beta = 0.02;
epoch = 1000;

for i = 1:epoch
	for kel = 1 : length(kelas)
        for k = 1 : size(kelas{kel},1) / 2
			for outpu = 1 : jum_output
				for kof = 1 : size(w{outpu},1)
					if kelas{kel}(k,kof) <= w{outpu}(kof,3)' && kelas{kel}(k,kof) >= w{outpu}(kof,2)'
						sim_dim(kof) = (kelas{kel}(k,kof) - w{outpu}(kof,3)') / (w{outpu}(kof,2)' - w{outpu}(kof,3)');
					elseif kelas{kel}(k,kof) < w{outpu}(kof,2)' && kelas{kel}(k,kof) >= w{outpu}(kof,1)'
						sim_dim(kof) = (kelas{kel}(k,kof) - w{outpu}(kof,1)') / (w{outpu}(kof,2)' - w{outpu}(kof,1)');
					else
						sim_dim(kof) = 0;
					end
				end
				sim_out(outpu) = min(sim_dim);
			end
			[besar pemenang] = max(sim_out);
			if max(sim_out) == 0;
				for keo = 1 : length(w)
					for kof = 1 : size(w{keo},1)
						w{keo}(kof,1) = w{keo}(kof,1) - beta*(w{keo}(kof,2) - w{keo}(kof,1));
						w{keo}(kof,3) = w{keo}(kof,3) + beta*(w{keo}(kof,3) - w{keo}(kof,2));
					end
				end
			elseif pemenang == kel
				for kof = 1 : size(w{kel},1)
					w{pemenang}(kof,1) = w{pemenang}(kof,1) - beta*(w{pemenang}(kof,2) - w{pemenang}(kof,1));
					w{pemenang}(kof,2) = w{pemenang}(kof,2) + alfa*(1 - besar)*(kelas{pemenang}(k,kof)' - w{pemenang}(kof,2));
					w{pemenang}(kof,3) = w{pemenang}(kof,3) + beta*(w{pemenang}(kof,3) - w{pemenang}(kof,2));
				end
			else
				for kof = 1 : size(w{kel},1)
					w{pemenang}(kof,1) = w{pemenang}(kof,1) + beta*(w{pemenang}(kof,2) - w{pemenang}(kof,1));
					w{pemenang}(kof,2) = w{pemenang}(kof,2) - alfa*(1 - besar)*(kelas{pemenang}(k,kof)' - w{pemenang}(kof,2));
					w{pemenang}(kof,3) = w{pemenang}(kof,3) - beta*(w{pemenang}(kof,3) - w{pemenang}(kof,2));
				end
			end
		end	
	end
    all{i+1}=w;
    i;
    alfa=0.5*alfa;
	beta=0.5*beta;
end

lvqnya = all{epoch+1};
