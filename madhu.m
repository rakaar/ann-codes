%% %% callback function of list1
function madhu(event)
global rrr listma ;
ir2 = (event.Data);
TriggerTime1 = (event.TriggerTime);
TimeStamps1 = event.TimeStamps;
figure(100);
hold on
plot(TimeStamps1,ir2);
end






