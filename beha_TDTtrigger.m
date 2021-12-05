%% initialize hardware TDT 
% turn on matlab only after turning on TDT 

function beha_TDTtrigger()
%daqreset;
global gen q ;
clear stimulus;
SR=20000;%%% DO NOT CHANGE WITHOUT TALKING TO ME (SB) 12/8/2018
TDTSR=195312.5;%%% DO NOT CHANGE WITHOUT TALKING TO ME (SB) 12/8/2018       %156250;%195312.5;
tot_tim = 0.05;
time_to_trigger = 0.04;
HW_Fso=SR; % sampling frequency for trigger pulse 
HW_RZ6=TDTSR;%TDT supported frequency auditory stimulation
s2= daq.createSession('ni');
s2.Rate=HW_Fso;
ch_op= addAnalogOutputChannel(s2,'Dev1','ao1','Voltage');
ch_op.Name = 'stimulus';
 HW_Amplitude = 5;
tpls=generate_trigger_begin(tot_tim,HW_Fso,HW_Amplitude,time_to_trigger);
%% for stimulus generation 
t1=17000;
t2=6000;
fre=[t1 t2];
n = randi(4);
stimulus = beha_stimulus(fre,n,HW_RZ6);
%% 
mtriggerwf=zeros(1,fix(length(stimulus)*HW_Fso/HW_RZ6));
mtriggerwf(1:length(tpls))=tpls;%%% MASTER TRIGGER Waveform
figure(3)
clf
plot((1:length(stimulus))/HW_RZ6,stimulus)
hold on
plot((1:length(mtriggerwf))/20000,mtriggerwf,'g');
s2.queueOutputData(mtriggerwf');
trigPlay_2CH_RZ6_IIT(stimulus(:,1)',stimulus(:,2)',HW_RZ6);
s2.startForeground();
end
 