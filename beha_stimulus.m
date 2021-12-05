function stimulus = beha_stimulus(fre,n,HW_RZ6)
 global gen q ;
stim_dur = 0.03;
fs=HW_RZ6;
att=0;% db
ramp_dur=0.005; %ramp duration in seconds
si_dur=.07; %ISI duration in seconds
t = 0:1/fs:(stim_dur-1/fs);
si=zeros(fix(si_dur*fs),1);
mxpts = length(t);
rampSamps = floor(fs*ramp_dur);
% for two diferent tones to be played
for j=1:length(fre)% for both the frequencies prepapre the ramped stimulus 
    tone(j,:)= 10*(10^(-att/20))*sin(2*pi*fre(j)*t);
    tone(j,1:rampSamps)=tone(j,(1:rampSamps)).*(0:(rampSamps-1))/rampSamps;
    tone(j,((mxpts-rampSamps):mxpts))= tone(j,((mxpts-rampSamps):mxpts)).*(rampSamps:-1:0)/rampSamps;
end
switch n
    
    case 1 %122 122 122 122
        period=[tone(1,:)';si;tone(2,:)';si;tone(2,:)';si];
        stimulus = [period;period;period;period];
        gen.stimcode(1,q)=1;
    case 2 %211 211 211 211
        period=[tone(2,:)';si;tone(1,:)';si;tone(1,:)';si];
        stimulus = [period;period;period;period];
        gen.stimcode(1,q)=2;
        
    case 3 % 112 112 112 112
        period=[tone(1,:)';si;tone(1,:)';si;tone(2,:)';si];
        stimulus = [period;period;period;period];
        gen.stimcode(1,q)=3;
        
    case 4  % 221 221 221 221
        period=[tone(2,:)';si;tone(2,:)';si;tone(1,:)';si];
        stimulus = [period;period;period;period];
        gen.stimcode(1,q)=4;
        
    case 5  % 1     1     1     1     1     1     1     1     2     2     1     1
        period=[tone(1,:)';si;tone(1,:)';si;tone(1,:)';si];
        stimulus =[ period;period;tone(1,:)';si;tone(1,:)';si;tone(2,:)';si;tone(2,:)';si;tone(1,:)';si;tone(1,:)'];
        gen.stimcode(1,q)=5;
        
    case 6  % 1     1     1     1     1     1     2     1     2     2     2     1
        period=[tone(1,:)';si;tone(1,:)';si;tone(1,:)';si];
        stimulus =[ period;period;tone(2,:)';si;tone(1,:)';si;tone(2,:)';si;tone(2,:)';si;tone(2,:)';si;tone(1,:)'];
        gen.stimcode(1,q)=6;
    case 7  %     2     1     1      1     1     1     1     2     1     2     2     2
        period=[tone(1,:)';si;tone(1,:)';si;tone(1,:)';si];
        period2=[tone(2,:)';si;tone(1,:)';si;tone(1,:)';si];
        stimulus =[ period2;period;tone(1,:)';si;tone(2,:)';si;tone(1,:)';si;tone(2,:)';si;tone(2,:)';si;tone(2,:)'];
        gen.stimcode(1,q)=7;
    case 8  % 2     2     2     2     2     2     2     1     2     1     2     2
        period=[tone(2,:)';si;tone(2,:)';si;tone(2,:)';si];
        period2=[tone(1,:)';si;tone(2,:)';si;tone(2,:)';si];        
        stimulus =[ period;period;tone(2,:)';si;tone(1,:)';si;tone(2,:)';period2];
        gen.stimcode(1,q)=8;
%     otherwise
%         disp('other value')
%         gen.stimcode(1,q)=9;
end
stimulus=[stimulus stimulus];
end

