function r = preprocessing(s)
%Program to normalize & remove silent from recording

% -1 - 1 normalize

s = s / max(abs(s));

%Step 1 - break the signal into frame of 0.1 seconds
fs = 11000;
frame_duration = 0.005;
frame_len = frame_duration*fs;
N = length(s);
num_frames = floor(N/frame_len);

new_sig = zeros;
ct = 0;
for k = 1 : num_frames
	frame = s((k - 1)*frame_len + 1 : frame_len*k);
	
	%Step 2 - identify silence by finding frame with max amplitude less then 0.03
	max_val = max(frame);
	
	if(max_val > 0.01)
		%This frame is not silent
		ct = ct + 1;
		new_sig((ct - 1)*frame_len + 1 : frame_len*ct) = frame;
	end
end

%Create new signal which does not conntain silent frames
r = new_sig';
