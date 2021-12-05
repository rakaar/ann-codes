function beha_day1_2()
daqreset;
global gen q srew fs1 irthr list1 check2 b hit;
tdur= 50;% duration for whcih the mouse can access water as the reward
irthr=3;
fs1 = 1000;
srew= daq.createSession('ni');
srew.Rate=fs1;
srew.DurationInSeconds=tdur;
%srew.IsContinuous = true;
ch_ip= addAnalogInputChannel(srew,'Dev1',0,'Voltage');
ch_ip(1).InputType = 'SingleEndedNonReferenced';
%ch_ip(1).InputType = 'SingleEndedNonReferenced';
%list1 = srew.addlistener('DataAvailable',@(src,event) rwd_chbr_ir(event.Data,irthr));

list1 = srew.addlistener('DataAvailable',@(src,event) day1_2(event,irthr));

srew.NotifyWhenDataAvailableExceeds =500;

srew.startBackground();

end
