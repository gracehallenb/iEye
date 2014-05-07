function mgs_stats()
%MGS_STATS Summary of this function goes here
%   Detailed explanation goes here

%%%%%%%%%%%%%%%%
% WHAT WE WANT %
%%%%%%%%%%%%%%%%
% SRT
% ERROR
% GAIN
% VALID TRIALS MATRIX
% PERCENT TRIALS BROKE FIXATION (0 = broke, 1 = didnt break)
% BREAK UP STATS IN CATEGORIES: ALL, BROKE FIXATION, DIDN'T BREAK FIXATION
% PLOT DISTRIBUTIONS
% SPLIT DATA BY HEMIFIELD
% SPLIT DATA BY QUADRANT

ii_stats = evalin('base','ii_stats');
num_runs = length(ii_stats); % How many runs did the subject complete?

%%%%%%%%%%%%%%%%%%%%%%%%
% TOSS OUT NOGO TRIALS %
%%%%%%%%%%%%%%%%%%%%%%%%
% Throw out nogo trials (SRT > 900ms);

ii_results.num_nogo = 0;

for i = 1:num_runs
    ii_stats(i).nogo_mat = ones(30,1);
    ii_stats(i).nogo_inds = find(ii_stats(i).srt>=900);
    ii_stats(i).num_nogo = 30 - length(ii_stats(i).nogo_inds); % Get # of nogo trials
    ii_stats(i).nogo_mat(ii_stats(i).nogo_inds) = 0;
    ii_results.num_nogo = ii_results.num_nogo + ii_stats(i).num_nogo;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%
% CREATE VALIDITY MATRIX %
%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:num_runs
    ii_stats(i).break_mat = ii_stats(i).trial_compliance(:,1,1); % Find fixation breaks
    ii_stats(i).num_fix_breaks = 30 - sum(ii_stats(i).break_mat); % Get # of fixation break trials
end

%%%%%%%%%%%%%%%%%%%%
% COMBINE ALL RUNS %
%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%
% RAW STATS (NOGO ONLY) %
%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:num_runs
    ii_stats(i).good_inds = find(ii_stats(i).nogo_mat==1); % Get good trials
    
    % Error
    ii_stats(i).good_primary_err_x = ii_stats(i).primary_err_x(ii_stats(i).good_inds);
    ii_stats(i).good_primary_err_y = ii_stats(i).primary_err_y(ii_stats(i).good_inds);
    ii_stats(i).good_primary_err_z = ii_stats(i).primary_err_z(ii_stats(i).good_inds);
    
    ii_stats(i).good_final_err_x = ii_stats(i).final_err_x(ii_stats(i).good_inds);
    ii_stats(i).good_final_err_y = ii_stats(i).final_err_y(ii_stats(i).good_inds);
    ii_stats(i).good_final_err_z = ii_stats(i).final_err_z(ii_stats(i).good_inds);
    
    % Gain
    ii_stats(i).good_primary_gain_x = ii_stats(i).primary_gain_x(ii_stats(i).good_inds);
    ii_stats(i).good_primary_gain_y = ii_stats(i).primary_gain_y(ii_stats(i).good_inds);
    ii_stats(i).good_primary_gain_z = ii_stats(i).primary_gain_z(ii_stats(i).good_inds);
    
    ii_stats(i).good_final_gain_x = ii_stats(i).final_gain_x(ii_stats(i).good_inds);
    ii_stats(i).good_final_gain_y = ii_stats(i).final_gain_y(ii_stats(i).good_inds);
    ii_stats(i).good_final_gain_z = ii_stats(i).final_gain_z(ii_stats(i).good_inds);
    
    % SRT
    ii_stats(i).good_srt = ii_stats(i).srt(ii_stats(i).good_inds);
end

ii_results.all_primary_err_x = [];
ii_results.all_primary_err_y = [];
ii_results.all_primary_err_z = [];

ii_results.all_final_err_x = [];
ii_results.all_final_err_y = [];
ii_results.all_final_err_z = [];

ii_results.all_primary_gain_x = [];
ii_results.all_primary_gain_y = [];
ii_results.all_primary_gain_z = [];

ii_results.all_final_gain_x = [];
ii_results.all_final_gain_y = [];
ii_results.all_final_gain_z = [];

ii_results.all_srt = [];

for j = 1:num_runs
    % Error
    ii_results.all_primary_err_x = [ii_results.all_primary_err_x; ii_stats(j).good_primary_err_x];
    ii_results.all_primary_err_y = [ii_results.all_primary_err_y; ii_stats(j).good_primary_err_y];
    ii_results.all_primary_err_z = [ii_results.all_primary_err_z; ii_stats(j).good_primary_err_z];

    ii_results.all_final_err_x = [ii_results.all_final_err_x; ii_stats(j).good_final_err_x];
    ii_results.all_final_err_y = [ii_results.all_final_err_y; ii_stats(j).good_final_err_y];
    ii_results.all_final_err_z = [ii_results.all_final_err_z; ii_stats(j).good_final_err_z];
    
    % Gain
    ii_results.all_primary_gain_x = [ii_results.all_primary_gain_x; ii_stats(j).good_primary_gain_x];
    ii_results.all_primary_gain_y = [ii_results.all_primary_gain_y; ii_stats(j).good_primary_gain_y];
    ii_results.all_primary_gain_z = [ii_results.all_primary_gain_z; ii_stats(j).good_primary_gain_z];
    
    ii_results.all_final_gain_x = [ii_results.all_final_gain_x; ii_stats(j).good_final_gain_x];
    ii_results.all_final_gain_y = [ii_results.all_final_gain_y; ii_stats(j).good_final_gain_y];
    ii_results.all_final_gain_z = [ii_results.all_final_gain_z; ii_stats(j).good_final_gain_z];
    
    % SRT
    
    ii_results.all_srt = [ii_results.all_srt; ii_stats(j).good_srt];
end


%%%%%%%%%%%%%%%%%%%%%%
% NO FIXATION BREAKS %
%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%
% FIXATION BREAKS ONLY %
%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%
% SHIT I WANT TO SEE %
%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%
% STORE STUFF %
%%%%%%%%%%%%%%%

putvar(ii_stats,ii_results);
end

