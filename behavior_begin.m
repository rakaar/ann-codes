%%last modified on :
% last modiied by :
daqreset; 
close all;
clear all;
%warning off;
clc;
%% declaration 
global q gen irthr fa hit miss cr fa_nostim timeout gap flag;
irthr =3;
x = inputdlg({'ID','GENDER','BODY WEIGHT'},'MOUSE DETAILS', [1 5; 1 10; 1 10]);
gen.mousedetails=x;
y=inputdlg('Enter the no of trials');
gen.ntrials=str2num(y{1});
gen.hittime=zeros(1,gen.ntrials);
gen.hit=zeros(1,gen.ntrials);
gen.miss=zeros(1,gen.ntrials);
gen.fa=zeros(1,gen.ntrials);
gen.cr=zeros(1,gen.ntrials);
gen.trialno=zeros(1,gen.ntrials);
gen.stimcode=zeros(1,gen.ntrials);
gen.input=zeros(1,gen.ntrials);
gen.itr_trial_inv = zeros(1,gen.ntrials);
gen.resp=zeros(1,gen.ntrials);
 gen.fa_stimincom = zeros(1,gen.ntrials);
  gen.fa_inr_trial_int = zeros(1,gen.ntrials);
gen.trial_abort = zeros(1,gen.ntrials);
hit = 0;
cr = 0;
miss= 0;
fa=0;
gen.tot_ntrials=0;
gap=1;% pause time 
timeout=10;
fa_nostim =0;
gen.missper=0;
gen.hitper =0;
gen.tri_abrt_per =0;

%% mat file generation 
mainfolder = pwd;% F:\ann_beha_pro2\codes
datadir='F:\ann_beha_pro2\data';
cd(datadir);
currDate = datestr(now,'mmddyy_HHMM');
save(sprintf('%d_%s.mat',str2num(gen.mousedetails{1}),currDate));
cd(mainfolder);
%% daq sessions

%% checking nosepoke for all trials
for q=1:gen.ntrials
    %while(gen.ntrials)
    gen.trialno(1,q) = 1;
    gen.tot_ntrials = gen.tot_ntrials + 1;
    %disp(randi([3,5],1));
    
    gen.itr_trial_inv(1,q)= randi([3,5],1);
    %disp(gen.itr_trial_inv(1,q))
    beha_cont_iti(gen.itr_trial_inv(1,q));
    if ( gen.resp(1,q)== 6)
        disp('aborted trial due to lick during interval ');
        gen.trial_abort(1,q)=1;
        continue;
    end
    beha_TDTtrigger();
    pause(1);
    %flag=0;
    %ann=beha_cont(gap,flag);
%     if (ann== 1)
%         gen.fa_stimincom(1,q) = 1;
%         gen.resp(1,q)=5;% for before offset of stim
%         disp('****lick before stim offset  ******');
%         beha_noise();
%         pause(timeout);
%         disp('aborted trial due to lick during time gap after stim offset');
%         continue;
%     else
        beha_rwdchk();
%     end
    
    fprintf('\ntrial count = %d\n',q);
    
end
%% final save of mat file generated 

 gen.missper= (length(find(gen.resp == 4))/(gen.ntrials-(length(find(gen.resp==6) )+length(find(gen.resp==5) ))))*100;
 gen.hitper= (length(find(gen.resp == 1))/(gen.ntrials-length(find(gen.resp==6) )+length(find(gen.resp==5) )))*100;
 gen.tri_abrt_per= ((length(find(gen.resp==6) )+length(find(gen.resp==5)))/gen.ntrials)*100;
cd(datadir);
save(sprintf('%d_%s.mat',str2num(gen.mousedetails{1}),currDate)); % F:\ann_beha_pro2\data
cd(mainfolder)