%To sort the order of the stimulus' presentation
% Output is a 4 dimentional cell: *_StimulusOrder{n,k}(1,o)
%n: Subject's serial number
%k: the kth task: 1,happy 2, sad 3, rum 4, dis
%o: 1-4: the serial number of the stimulus (from E-prime script), if (1,o)=3 means the stimulus o was the third to be presented in the real task

clc;clear;
WorkDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/Behavior_data/Sorted';
ResultDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/Behavior_data/Stimulus_order';
IPCAS_Sublist = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/IPCAS_Sublist');
PKUSIMENS_Sublist = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUSIMENS_Sublist');
PKUGE_Sublist = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUGE_Sublist');
SessionSet = {'HappyMemo', 'SadMemo', 'Rum', 'Dis'};


IPCAS_StimulusOrder = {};
PKUSIMENS_StimulusOrder = {};
PKUGE_StimulusOrder = {};
for iTop = 1:length(IPCAS_Sublist)
    for iSession = 1:length(SessionSet)
        %read in the xls file
        Data={};
        %if serial number > 10, things are a little different :(
        if iTop < 10
            fid = fopen([WorkDir,'/',IPCAS_Sublist{iTop}, '/', SessionSet{iSession}, '_Behavior_Time_', IPCAS_Sublist{iTop}(6:8), '.xls']);
            IPCAS_SubjectNumber = str2num(IPCAS_Sublist{iTop}(6));
        else
            fid = fopen([WorkDir,'/',IPCAS_Sublist{iTop}, '/', SessionSet{iSession}, '_Behavior_Time_', IPCAS_Sublist{iTop}(5:8), '.xls']);
            IPCAS_SubjectNumber = str2num(IPCAS_Sublist{iTop}(5:6));
         end
        StringFilter = '%s\t%s\t%d\t%d\t';
        Data = textscan(fid,StringFilter);
        fclose(fid);
        
        %count the position
        j = 0;
        for i = 1:length(Data{1,2})
            % to see whether this is a trial count, if yes then put the position number in the corresponding slot
            if strcmpi(Data{1,2}{i,1}, 'TrialCount') == 1
                j = j + 1;
                StimulusNumber = Data{1,3}(i,1);
                IPCAS_StimulusOrder{IPCAS_SubjectNumber,iSession}(StimulusNumber) = j;
            end   
        end
        
        Data={};
        if iTop < 10
            fid = fopen([WorkDir,'/',PKUSIMENS_Sublist{iTop}, '/', SessionSet{iSession}, '_Behavior_Time_', PKUSIMENS_Sublist{iTop}(6:8), '.xls']);
            PKUSIMENS_SubjectNumber = str2num(PKUSIMENS_Sublist{iTop}(6));
        else
            fid = fopen([WorkDir,'/',PKUSIMENS_Sublist{iTop}, '/', SessionSet{iSession}, '_Behavior_Time_', PKUSIMENS_Sublist{iTop}(5:8), '.xls']);
            PKUSIMENS_SubjectNumber = str2num(PKUSIMENS_Sublist{iTop}(5:6));
        end
        StringFilter = '%s\t%s\t%d\t%d\t';
        Data = textscan(fid,StringFilter);
        fclose(fid);
        
        %count the position
        j = 0;
        for i = 1:length(Data{1,2})
            % to see whether this is a trial count, if yes then put the position number in the corresponding slot
            if strcmpi(Data{1,2}{i,1}, 'TrialCount') == 1
                j = j + 1;
                StimulusNumber = Data{1,3}(i,1);
                PKUSIMENS_StimulusOrder{PKUSIMENS_SubjectNumber,iSession}(StimulusNumber) = j;
            end   
        end
        
        Data={};
        if iTop < 10
            fid = fopen([WorkDir,'/',PKUGE_Sublist{iTop}, '/', SessionSet{iSession}, '_Behavior_Time_', PKUGE_Sublist{iTop}(6:8), '.xls']);
            PKUGE_SubjectNumber = str2num(PKUGE_Sublist{iTop}(6));
        else
            fid = fopen([WorkDir,'/',PKUGE_Sublist{iTop}, '/', SessionSet{iSession}, '_Behavior_Time_', PKUGE_Sublist{iTop}(5:8), '.xls']);
            PKUGE_SubjectNumber = str2num(PKUGE_Sublist{iTop}(5:6));
        end
        StringFilter = '%s\t%s\t%d\t%d\t';
        Data = textscan(fid,StringFilter);
        fclose(fid);
        
        %count the position
        j = 0;
        for i = 1:length(Data{1,2})
            % to see whether this is a trial count, if yes then put the position number in the corresponding slot
            if strcmpi(Data{1,2}{i,1}, 'TrialCount') == 1
                j = j + 1;
                StimulusNumber = Data{1,3}(i,1);
                PKUGE_StimulusOrder{PKUGE_SubjectNumber,iSession}(StimulusNumber) = j;
            end   
        end
    end
end


% StimulusOrder_Site = {};
% for i = 1:length(ScanSiteInfo)
%     if i < 26
%         SubjectNumber = str2num(ScanSiteInfo{i,1}(6));
%         ScanNumber = str2num(ScanSiteInfo{i,1}(8));
%     else
%         SubjectNumber = str2num(ScanSiteInfo{i,1}(5:6));
%         ScanNumber = str2num(ScanSiteInfo{i,1}(8));
%     end
%     SiteNumber = ScanSiteInfo{i,2};
%     for iSession = 1:length(SessionSet)
%         StimulusOrder_Site{SubjectNumber,SiteNumber,iSession} = StimulusOrder{SubjectNumber,ScanNumber,iSession};
%     end
% end


save([ResultDir,'/StimulusOrder.mat'],'*_StimulusOrder');

