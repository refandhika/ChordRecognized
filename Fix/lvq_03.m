alfa = 0.05;
count_alfa = 1;
while alfa < 0.9999
	beta = 0.05;
	count_beta = 1;
	while beta < 0.9999
		alfa_epoch = alfa;
		beta_epoch = beta;
		w = bobot;
		all{1} = w;
		epoch = 20;
		for i = 1:epoch
			for kel = 1 : length(kelas)
				for k = 1 : 5
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
				for k = 11 : 20
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
		lvqnya{lvqke} = all{epoch+1};
		for kel = 1 : length(kelas)
			for k = 6 : 10
				for outpu = 1 : jum_output
					for kof = 1 : cepstrum
						inputnya = kelas{kel}(k,kof);
						bobotmax = lvqnya{lvqke}{outpu}(kof,3);
						bobotmid = lvqnya{lvqke}{outpu}(kof,2);
						bobotmin = lvqnya{lvqke}{outpu}(kof,1);
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
					klar(k - 5,kel) = 1;
				else
					klar(k - 5,kel) = 0;
				end
				sav_menang{lvqke}(k - 5,kel) = pemenang;
			end
		end
		accuracy(count_beta,count_alfa) = (sum(sum(klar)) / (size(klar,1)*size(klar,2))) * 100;
		lvqke = lvqke + 1;
		sim_beta(count_beta) = beta;
		count_beta = count_beta + 1;
		beta = beta + 0.05;
	end
	sim_alfa(count_alfa) = alfa;
	count_alfa = count_alfa + 1;
	alfa = alfa + 0.05;
end