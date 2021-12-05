%% %% callback function of list1
function flag2=cont_iti(event,thr)
global gen fa q sir ir2 list1 fa_nostim flag2;
ir2 = ceil(event.Data);
disp('checking if lick before stim ')
ir2cut = find(ir2 < thr);
if length(ir2cut) >= 1
        flag2=1;
        gen.fa_stimincom(1,q) = 1;
        gen.resp(1,q)=5;% for before offset of stim
        fa_nostim =fa_nostim +1;
        disp('****lick before stim offset  ******');
        delete(list1);
     
end     
end









