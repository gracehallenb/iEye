function [ii_data,ii_cfg] = ii_smooth(ii_data,ii_cfg,chan_names, typ, degr)
%II_SMOOTH Create a copy of a channel after smoothing (SmoothChan)
%   Smooths by one of several different filter types, if one of "moving,
%   lowess, loess, sgolay, rlowess, rloess", uses "smooth.m" in
%   curvefitting toolbox; otherwise, if Gaussian, convolves with a gaussian of width
%   "degree" samples.
%
% In updated version of iEye, this channel will typically only be used for
% computing velocity traces when identifying saccades; where possible,
% 'raw' gaze data will be used for scoring
%
% Modified by TCS 8/14/2017

if nargin == 2
    prompt = {'Enter channel to smooth:', 'Type: (moving, lowess, loess, sgolay, rlowess, rloess)', 'Degree'};
    dlg_title = 'Smooth Data';
    num_lines = 1;
    answer = inputdlg(prompt,dlg_title,num_lines);
    
    chan_names = answer{1};
    typ = answer{2};
    degr = str2num(answer{3});
end

if nargin < 3
    chan_names = {'X','Y'};
end

if ~iscell(chan_names)
    chan_names = {chan_names};
end

if nargin < 4
    typ = 'Gaussian';
end

if nargin < 5
    degr = 5; % for gaussian
end



for cc = 1:length(chan_names)
    if ismember(chan_names{cc},fieldnames(ii_data))
        chan = ii_data.(chan_names{cc});
        
        
        if ismember(typ,{'moving', 'lowess', 'loess', 'sgolay', 'rlowess', 'rloess'})
            smoothd = smooth(chan,degr,typ);
            
            
            
            
        elseif strcmpi(typ,'Gaussian')
            
            
            
            mykernel = normpdf(linspace(-50,50,101),0,degr);
            
            
            smoothd = conv(ii_data.(chan_names{cc}),mykernel,'same'); % tmpy = conv(et_rot_cueLocked(:,2,tt),mykernel,'same');
            
            clear mykernel;
            
        else
            
            error('iEye:ii_smooth:unrecognizedSmoothingOperation', 'Smoothing type %s not recognized',typ)
        end
        
        
        ii_data.(sprintf('%s_smooth',chan_names{cc})) = smoothd;
       
        ii_cfg.lchan{1}{end+1} = sprintf('%s_smooth',chan_names{cc});
        
        clear smoothd;
        
        ii_cfg.history{end+1} = sprintf('ii_smooth: chan %s, %s %d - %s',chan_names{cc},typ,degr,datestr(now,30));
        
    else
        
        error('iEye:ii_smooth:channelNotFound', 'Channel %s does not exist in ii_data',chan_names{cc})
    end
    
    
end




return


