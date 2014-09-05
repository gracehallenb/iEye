r = 2;

ii_stats = evalin('base','ii_stats');

ii_definetrial('XDAT',1,'XDAT',6); % create trialvec
ii_findsaccades('X','Y',.05,10,'XDAT',4,'XDAT',5); % find saccades

% COMBINE
for i=2:length(ii_cfg.cursel)
    di(i-1)= ii_cfg.cursel(i,1) - ii_cfg.cursel(i-1,1);
end

z=find(di<100);
ii_cfg.cursel(z,2) = ii_cfg.cursel(z+1,1); ii_cfg.cursel(z+1,:) = [];

for i=1:(size(ii_cfg.cursel,1))
    ii_cfg.sel(ii_cfg.cursel(i,1):ii_cfg.cursel(i,2)) = 1;
end

%%%%%%%%%%%%%%%%%%
% CHECK SACCADES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

ii_stats(r).saccades_45 = ii_cfg.cursel;
putvar(ii_stats);

%%%%%%%%%%%%%%%%%%
% CHECK SACCADES %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%

numsacs = zeros(30,1);

% sync saccades with trial numbers
sacmat = ii_cfg.cursel;

for i = 1:length(sacmat)
    sacmat(i,3) = median(ii_cfg.trialvec(sacmat(i,1):sacmat(i,2)));
end

% count # of saccades per trial
for i = 1:30
    sacs = find(sacmat(:,3)==i);
    numsacs(i) = length(sacs);
end

ii_stats(r).numsacs = numsacs;
ii_stats(r).saccades_go = ii_cfg.cursel;
putvar(ii_stats);
