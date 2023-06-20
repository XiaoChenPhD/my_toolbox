function trl = mytrialfun(cfg)
% trl = mytrialfun(cfg)
% A function that can read the events fromm seeg files
% this function requires the following fields to be specified
% cfg.dataset
% cfg.trialdef.eventtype
% cfg.trialdef.eventvalue
% cfg.trialdef.prestim
% cfg.trialdef.poststim
%
% written by ChenXiao 
% based on a model from https://www.fieldtriptoolbox.org/tutorial/preprocessing/
% chenxiaochina@hotmail.com


hdr   = ft_read_header(cfg.dataset);
event = cfg.event;

%the first trigger should be solid
trl = [];
for i = 1:length(event)
    begsample     = event(i).sample - cfg.trialdef.prestim*hdr.Fs;
    endsample     = event(i).sample + cfg.trialdef.poststim*hdr.Fs - 1;
    offset        = -cfg.trialdef.prestim*hdr.Fs;
    trl(i, :) = round([begsample endsample offset]);
end

% %check the distance between two sequential events
% count = 0;
% for i = 2:length(event) 
%     count = count + 1;
%     if event(i).sample - event(i-1).sample > 100000 && count < 5 
%        begsample     = event(i).sample - cfg.trialdef.prestim*hdr.Fs;
%        endsample     = event(i).sample + cfg.trialdef.poststim*hdr.Fs - 1;
%        offset        = -cfg.trialdef.prestim*hdr.Fs;
%        trl(end+1, :) = round([begsample endsample offset]); 
%     end
% end
