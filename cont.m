%% %% callback function of list1
function cont(event,thr)
global sir ir2 list1 flag;
ir2 = ceil(event.Data);
disp('checking if lick during time gap of 1 sec')
ir2cut = find(ir2 < thr);
if length(ir2cut) >= 1
  flag=1;
    %         gen.fa_stimincom(1,q) = 1;
            % gen.resp(1,q)=5;% for before offset of stim
    %         fa_nostim =fa_nostim +1;
    %         disp('****lick before stim offset  ******');
    delete(list1);
    fprintf('\nflag nnnnnn =%d\n',flag);
else
flag=0; 
end
end









