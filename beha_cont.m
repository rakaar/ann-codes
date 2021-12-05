
function ann=beha_cont(chk,flag)
ann=0;
daqreset;
global sir fs1 irthr list1 ;
tdur= chk;% duration for whcih the mouse can access water as teh reward
irthr=3;
%flag =0;
fs1 = 1000;
sir= daq.createSession('ni');
sir.Rate=fs1;
sir.DurationInSeconds=tdur;
%sir.IsContinuous = true;
ch_ip= addAnalogInputChannel(sir,'Dev1',16,'Voltage');
ch_ip(1).InputType = 'SingleEndedNonReferenced';
%ch_ip(1).InputType = 'SingleEndedNonReferenced';
%list1 = srew.addlistener('DataAvailable',@(src,event) rwd_chbr_ir(event.Data,irthr));

list1 = sir.addlistener('DataAvailable',@(src,event) cont(event,irthr,flag));

sir.NotifyWhenDataAvailableExceeds =200;
sir.startBackground();
% wait(sir);
% if (sir.IsDone == 1)
%        %fprintf('\nflag 00000 =%d\n',flag);
% %beha_nostim();
% end
end
