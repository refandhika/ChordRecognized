alfa = 0.95;
beta = 0.25;
alfa_epoch = alfa;
beta_epoch = beta;
w = bobot;
all{1} = w;
epoch = 20;
for i = 1:epoch
	for kel = 1 : length(kelas)
				for k = 6 : jum_latih + 5
					for outpu = 1 : jum_output
						for kof = 1 : cepstrum
							inputnya = kelas{kel}(k,kof);
							bobotmax = w{outpu}(kof,3);
							bobotmid = w{outpu}(kof,2);
							bobotmin = w{outpu}(kof,1);
							if inputnya < bobotmax && inputnya >= bobotmid
								sim_dim(kof) = (inputnya - bobotmax) / (bobotmid - bobotmax);
							elseif inputnya < bobotmid && inputnya > bobotmin
								sim_dim(kof) = (inputnya - bobotmin) / (bobotmid - bobotmin);
							else
								sim_dim(kof) = 0;
							end
						end
						sim_out(outpu) = min(sim_dim);
					end
					[besar, pemenang] = max(sim_out);
					if max(sim_out) == 0;
						for keo = 1 : length(w)
							for kof = 1 : size(w{keo},1)
								w{keo}(kof,1) = w{keo}(kof,1) - beta_epoch*(w{keo}(kof,2) - w{keo}(kof,1));
								w{keo}(kof,3) = w{keo}(kof,3) + beta_epoch*(w{keo}(kof,3) - w{keo}(kof,2));
							end
						end
					elseif pemenang == kel
						for kof = 1 : size(w{kel},1)
							w{pemenang}(kof,1) = w{pemenang}(kof,1) - beta_epoch*(w{pemenang}(kof,2) - w{pemenang}(kof,1));
							w{pemenang}(kof,2) = w{pemenang}(kof,2) + alfa_epoch*(1 - besar)*(kelas{pemenang}(k,kof)' - w{pemenang}(kof,2));
							w{pemenang}(kof,3) = w{pemenang}(kof,3) + beta_epoch*(w{pemenang}(kof,3) - w{pemenang}(kof,2));
						end
					else
						for kof = 1 : size(w{kel},1)
							w{pemenang}(kof,1) = w{pemenang}(kof,1) + beta_epoch*(w{pemenang}(kof,2) - w{pemenang}(kof,1));
							w{pemenang}(kof,2) = w{pemenang}(kof,2) - alfa_epoch*(1 - besar)*(kelas{pemenang}(k,kof)' - w{pemenang}(kof,2));
							w{pemenang}(kof,3) = w{pemenang}(kof,3) - beta_epoch*(w{pemenang}(kof,3) - w{pemenang}(kof,2));
						end
					end	
				end
			end
	all{i+1}=w;
	i;
	alfa_epoch=0.5*alfa_epoch;
	beta_epoch=0.5*beta_epoch;
end
lvqnya = all{epoch+1};
for kel = 1 : length(kelas)
	for k = 1 : jum_all - 15
		for outpu = 1 : jum_output
			for kof = 1 : cepstrum
				inputnya = kelas{kel}(k,kof);
				bobotmax = lvqnya{outpu}(kof,3);
				bobotmid = lvqnya{outpu}(kof,2);
				bobotmin = lvqnya{outpu}(kof,1);
				if inputnya <= bobotmax && inputnya >= bobotmid
					sim_dim(kof) = (inputnya - bobotmax) / (bobotmid - bobotmax);
				elseif inputnya < bobotmid && inputnya >= bobotmin
					sim_dim(kof) = (inputnya - bobotmin) / (bobotmid - bobotmin);
				else
					sim_dim(kof) = 0;
				end
			end
			sim_out(outpu) = min(sim_dim);
		end
		[besar, pemenang] = max(sim_out);
		if pemenang == kel
			klar(k,kel) = 1;
		else
			klar(k,kel) = 0;
		end
		sav_menang(k,kel) = pemenang;
	end
end
accuracy(count_beta,count_alfa) = (sum(sum(klar)) / (size(klar,1)*size(klar,2))) * 100;
