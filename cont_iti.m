%% %% callback function of list1
function cont_iti(event,thr)
global  sir ir2 list1 fa_nostim flag2;
ir2 = ceil(event.Data);
disp('checking if lick before stim ')
ir2cut = find(ir2 < thr);
if length(ir2cut) >= 1
        flag2=1;
        delete(list1);
   else
flag2=0;  
end     
end









