%% %% callback function of list1
function day1_2(event,thr)
global gen q srew ir2 TimeStamps1 TriggerTime1 list1 hit;
ir2 = ceil(event.Data);
% 
% TriggerTime1 = ceil(event.TriggerTime);
 TimeStamps1 = event.TimeStamps;
% 
% 
% gen.ir= ir2;
% gen.timstp=TimeStamps1;
% gen.trigtim= TriggerTime1;
% 
figure(11)
hold on
plot(TimeStamps1,ir2)
 disp('chk')
ir2cut = find(ir2 < thr);
if length(ir2cut) >= 1 % as first column represents data from ir 2 = reward chamber
hit=hit+1;
reward();
end







