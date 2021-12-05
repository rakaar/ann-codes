%% %% callback function of list1
function rwd_chbr_ir(event,thr)
 global gen q srew ir2 TimeStamps1 TriggerTime1 list1 check2 t;
%global srew ir2 TimeStamps1 TriggerTime1 list1 check2 ;
fprintf('\n reward chkkkkkk after nfsabfbaibfhiab \n');
disp('avasaf')
disp(q)
%disp(event.Data);
ir2 = ceil(event.Data);
TriggerTime1 = ceil(event.TriggerTime);

TimeStamps1 = event.TimeStamps;

gen.ir= ir2;
gen.timstp=TimeStamps1;
gen.trigtim= TriggerTime1;
figure(11)
hold on
plot(TimeStamps1,ir2)
disp('chk')
ir2cut = find(ir2 < thr);
if length(ir2cut) >= 1 % as first column represents data from ir 2 = reward chamber
    disp('chking ir livck');
     check2=1;
     gen.input(1,q)= 1;
     t=ir2cut(1);
% %     disp(t);
% %     disp(gen.timstp(t));
% %     disp(seconds(gen.timstp(t)));
        gen.hittime(1,q) = double(gen.timstp(t));
        beha_analysis();
        delete(list1);
else
    check2=0;
    disp('chking ir livck');
     gen.input(1,q)= 0;
    beha_analysis();
end
end







