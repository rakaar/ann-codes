
function beha_cont_iti(chk)
daqreset;
global sir2 fs1 irthr list1 flag2 ;
tdur= chk;% duration for whcih the mouse can access water as teh reward
irthr=3;
fs1 = 1000;
sir2= daq.createSession('ni');
sir2.Rate=fs1;
sir2.DurationInSeconds=tdur;
%sir.IsContinuous = true;
ch_ip= addAnalogInputChannel(sir2,'Dev1',16,'Voltage');
ch_ip(1).InputType = 'SingleEndedNonReferenced';
%ch_ip(1).InputType = 'SingleEndedNonReferenced';
%list1 = srew.addlistener('DataAvailable',@(src,event) rwd_chbr_ir(event.Data,irthr));

list1 = sir2.addlistener('DataAvailable',@(src,event) cont_iti(event,irthr));
sir2.NotifyWhenDataAvailableExceeds =200;
sir2.startBackground();
 wait(sir2);
% if (sir2.IsDone == 1)
% beha_nostim_iti(flag2);
% end
end
