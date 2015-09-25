for kel = 1 : length(kelas)
    for k = 16 : size(kelas{kel},1)
		for outpu = 1 : jum_output
			for kof = 1 : size(lvqnya{outpu},1)
				if kelas{kel}(k,kof) <= lvqnya{outpu}(kof,3)' && kelas{kel}(k,kof) >= lvqnya{outpu}(kof,2)'
					sim_dim(kof) = (kelas{kel}(k,kof) - lvqnya{outpu}(kof,3)') / (lvqnya{outpu}(kof,2)' - lvqnya{outpu}(kof,3)');
				elseif kelas{kel}(k,kof) < lvqnya{outpu}(kof,2)' && kelas{kel}(k,kof) >= lvqnya{outpu}(kof,1)'
					sim_dim(kof) = (kelas{kel}(k,kof) - lvqnya{outpu}(kof,1)') / (lvqnya{outpu}(kof,2)' - lvqnya{outpu}(kof,1)');
				else
					sim_dim(kof) = 0;
				end
			end
			sim_out(outpu) = min(sim_dim);
		end
		[besar pemenang] = max(sim_out);
		if pemenang == kel
			klar(k - 15,kel) = 1;
		else
			klar(k - 15,kel) = 0;
		end
	end	
end

accuracy = (sum(sum(klar)) / (size(klar,1)*size(klar,2))) * 100;