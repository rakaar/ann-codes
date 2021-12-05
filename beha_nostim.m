function beha_nostim()
global timeout gen q flag;
%fprintf('\nflag =%d\n',flag);
  %beha_rwdchk();
if (gen.resp(1,q)==5)
    gen.fa_stimincom(1,q) = 1;
    %gen.resp(1,q)=5;% for before offset of stim
    disp('****lick before stim offset  ******');
    beha_noise();
    pause(timeout);
else
    beha_rwdchk();
end
end