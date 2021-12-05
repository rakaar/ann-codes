function beha_analysis()
global gen q fa hit miss cr; 
resp = gen.input(1,q);
%resp = input;
rew=1:4;% case no of rewarding stimulus
nrew=5:8; % case num of non rewarding stim
if (resp == 1) % could be gen.input also
    if ~isempty(find(rew==gen.stimcode(1,q)))
        gen.hit(1,q) = 1;
        gen.resp(1,q)=1;% for hit
        hit = hit+1;
        disp('********* REWARD RECEIVED********');
        reward();
    elseif ~isempty(find(nrew==gen.stimcode(1,q)))
        gen.fa(1,q) = 1;
        gen.resp(1,q)=2;% fpr false alarm
        fa =fa+1;
        beha_noise();
        disp('****GONE WRONG THIS TIME :- NO REWARD******');
    end
elseif (resp ==0)
    if ~isempty(find(nrew==gen.stimcode(1,q)))
        gen.cr(1,q) = 1;
        gen.resp(1,q)=3;% fpr correct rejection
        cr=cr+1;
        disp('you are correct, it was not rewarding')
    elseif ~isempty(find(rew==gen.stimcode(1,q)))
        gen.miss(1,q) = 1;
        miss = miss+1;
        gen.resp(1,q)=4;% for miss
        disp('missed')
    end
    
end
end


