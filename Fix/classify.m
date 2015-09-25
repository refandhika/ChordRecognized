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
	set(handles.chord,'String', 'Chord A');
elseif pemenang == 2
	set(handles.chord,'String', 'Chord Am');
elseif pemenang == 3
	set(handles.chord,'String', 'Chord A#');
elseif pemenang == 4
	set(handles.chord,'String', 'Chord A#m');
elseif pemenang == 5
	set(handles.chord,'String', 'Chord B');
elseif pemenang == 6
	set(handles.chord,'String', 'Chord Bm');
elseif pemenang == 7
	set(handles.chord,'String', 'Chord C');
elseif pemenang == 8
	set(handles.chord,'String', 'Chord Cm');
elseif pemenang == 9
	set(handles.chord,'String', 'Chord C#');
elseif pemenang == 10
	set(handles.chord,'String', 'Chord C#m');
elseif pemenang == 11
	set(handles.chord,'String', 'Chord D');
elseif pemenang == 12
	set(handles.chord,'String', 'Chord Dm');
elseif pemenang == 13
	set(handles.chord,'String', 'Chord D#');
elseif pemenang == 14
	set(handles.chord,'String', 'Chord D#m');
elseif pemenang == 15
	set(handles.chord,'String', 'Chord E');
elseif pemenang == 16
	set(handles.chord,'String', 'Chord Em');
elseif pemenang == 17
	set(handles.chord,'String', 'Chord F');
elseif pemenang == 18
	set(handles.chord,'String', 'Chord Fm');
elseif pemenang == 19
	set(handles.chord,'String', 'Chord F#');
elseif pemenang == 20
	set(handles.chord,'String', 'Chord F#m');
elseif pemenang == 21
	set(handles.chord,'String', 'Chord G');
elseif pemenang == 22
	set(handles.chord,'String', 'Chord Gm');
elseif pemenang == 23
	set(handles.chord,'String', 'Chord G#');
elseif pemenang == 24
	set(handles.chord,'String', 'Chord G#m');
end