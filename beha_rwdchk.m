
function beha_rwdchk()

fprintf('\n reward chkkkkkk\n');
daqreset;
tic
global gen q srew fs1 irthr list1 check2 b;
%global  srew fs1 irthr list1 check2;
tdur= 8;% duration for whcih the mouse can access water as the reward
irthr=3;
check2=0;
fs1 = 1000;
srew= daq.createSession('ni');
srew.Rate=fs1;
srew.DurationInSeconds=tdur;
%srew.IsContinuous = true;
ch_ip= addAnalogInputChannel(srew,'Dev1',0,'Voltage');
ch_ip(1).InputType = 'SingleEndedNonReferenced';
%ch_ip(1).InputType = 'SingleEndedNonReferenced';
%list1 = srew.addlistener('DataAvailable',@(src,event) rwd_chbr_ir(event.Data,irthr));
b=toc;
list1 = srew.addlistener('DataAvailable',@(src,event) rwd_chbr_ir(event,irthr));%

%pause(5)
srew.NotifyWhenDataAvailableExceeds =250;
fprintf('\n reward chkkkkkk after \n');
srew.startBackground();
%pause(.25)
wait(srew);
if (srew.IsDone == 1)
    disp('m dne ');
%beha_analysis();
end
end
