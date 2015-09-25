new_signal = wavrecord(3*Fs,Fs);
%new_signal = wavread('b-16');
new_signal = preprocessing(new_signal);
new_signal = mfcc(new_signal);
new_signal = mean(new_signal');
for outpu = 1 : jum_output
	for kof = 1 : cepstrum
		inputnya = new_signal(kof);
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

if pemenang == 1
	disp('Chord A');
elseif pemenang == 2
	disp('Chord Am');
elseif pemenang == 3
	disp('Chord A#');
elseif pemenang == 4
	disp('Chord A#m');
elseif pemenang == 5
	disp('Chord B');
elseif pemenang == 6
	disp('Chord Bm');
elseif pemenang == 7
	disp('Chord C');
elseif pemenang == 8
	disp('Chord Cm');
elseif pemenang == 9
	disp('Chord C#');
elseif pemenang == 10
	disp('Chord C#m');
elseif pemenang == 11
	disp('Chord D');
elseif pemenang == 12
	disp('Chord Dm');
elseif pemenang == 13
	disp('Chord D#');
elseif pemenang == 14
	disp('Chord D#m');
elseif pemenang == 15
	disp('Chord E');
elseif pemenang == 16
	disp('Chord Em');
elseif pemenang == 17
	disp('Chord F');
elseif pemenang == 18
	disp('Chord Fm');
elseif pemenang == 19
	disp('Chord F#');
elseif pemenang == 20
	disp('Chord F#m');
elseif pemenang == 21
	disp('Chord G');
elseif pemenang == 22
	disp('Chord Gm');
elseif pemenang == 23
	disp('Chord G#');
elseif pemenang == 24
	disp('Chord G#m');
end