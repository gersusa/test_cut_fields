function MyMatlab1(InFile1, InFile2, InFile3, InFile4, TimeLimitInSeconds, ScoringMethod, NetworkModel)
%MYMATLAB1 Version1 Script. This script generates solution1.txt
%
% Input Arguments:
% TimeLimitInSeconds and ScoringMethod are not used yet, the algorithm acts
% as it would for ScoringMethod = 0.
% InFile1: CON file
% InFile2: INL file
% InFile3: RAW file
% InFile4: ROP file


start=tic;

  
p_time=0;  %present_time :  p_time
r_time=TimeLimitInSeconds;   %remaining_time: r_time



fprintf('Started\n')
% if isempty(gcp('nocreate'))
% parpool('local',4);
% end

[mpc,contingencies] = convert2mpc(InFile3,InFile4,InFile2,InFile1);
%TimeLimitInSeconds=600;
%ScoringMethod=2;

p_time=p_time+toc(start); %Update the present time
r_time=TimeLimitInSeconds-p_time;

[mpcOPF, ~, mpcOPF_or] = solveSCOPF(mpc,contingencies,true,TimeLimitInSeconds, ScoringMethod, tic, p_time, r_time);
save('mpc.mat','mpcOPF','mpcOPF_or','contingencies');
create_solution1(fixGen2Normal(gen2shunts(mpcOPF)));
end




