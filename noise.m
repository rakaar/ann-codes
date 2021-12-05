%% for noise signal fr timeout and wrong lick
function stimulus = noise(HW_RZ6)
fl=5000;
fh=15000;
stim_dur =1 ; 
fs=HW_RZ6;
att = 0;
t = 0:1/fs:(stim_dur-1/fs);
N = length(t);
[stimulus]=BandPassNoise(N,fs,fl,fh);
stimulus=stimulus*(1/max(abs(stimulus)));
stimulus = 10*(10^(-att/20))*stimulus;
stimulus=aud_gate_on(stimulus,0.0001*1000,fs);
stimulus=aud_gate_off(stimulus,0.0001*1000,fs);
end