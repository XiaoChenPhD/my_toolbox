%Subjects were told to answer some questions right after each scanning
%sessions. I write the E-prime scripts to save those scores in files named
%with "**_Scale_data_*_*.xls". This script is to read those scales and save
%them.

clc;clear;
WorkDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/Behavior_data/Sorted';
ResultDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Raw/Behavior_data/Scale_Sorted';
IPCAS_Sublist = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/IPCAS_Sublist');
PKUSIMENS_Sublist = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUSIMENS_Sublist');
PKUGE_Sublist = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Sort_data/PKUGE_Sublist');
SessionSet = {'Rest', 'HappyMemo', 'SadMemo', 'Rum', 'Dis'};
SiteSet = {'IPCAS','PKUGE','PKUSIMENS'};

EmotionScore = {};%EmotionbeforeRest %AferRest %Happy %Sad %Rum %dis Condition x Subject
RestThinkingContent = {};%Item x Subject
HappyThinkingContent = {};
SadThinkingContent = {};
RumThinkingContent = {};
DisThinkingContent = {};

for iSite = 1: length(SiteSet)
    Sublist = {};
    switch iSite
        case 1
            Sublist = IPCAS_Sublist;
        case 2
            Sublist = PKUGE_Sublist;
        case 3
            Sublist = PKUSIMENS_Sublist;
    end
    for iTop = 1:length(Sublist)
        for iSession = 1:length(SessionSet)
            Data={};
            
            %if serial number > 10, things are a little different :(
            if iTop < 10
                fid = fopen([WorkDir,'/',Sublist{iTop}, '/', SessionSet{iSession}, '_Scale_data_', Sublist{iTop}(6:8), '.xls']);
                SubjectNumber = str2num(Sublist{iTop}(6));
            else
                fid = fopen([WorkDir,'/',Sublist{iTop}, '/', SessionSet{iSession}, '_Scale_data_', Sublist{iTop}(5:8), '.xls']);
                SubjectNumber = str2num(Sublist{iTop}(5:6));
            end

            Data = textscan(fid,'%s');


            for i = 1:length(Data{1,1})
                if strcmp(Data{1,1}{i,1}(1:1),'E') == 1
                    if strcmp(Data{1,1}{i,1}(1:8),'EmotionB')
                        EmotionScore{iTop,1} = str2num(Data{1,1}{i+1,1});
                    else
                        EmotionScore{iTop,iSession+1} = str2num(Data{1,1}{i+1,1});
                    end


                elseif strcmp(Data{1,1}{i,1},'Score') == 1
                    ItemNum = str2num(Data{1,1}{i-1,1});

                    switch iSession
                        case 1
                          RestThinkingContent{iTop,ItemNum} = str2num(Data{1,1}{i+1,1});
                        case 2
                          HappyThinkingContent{iTop,ItemNum} = str2num(Data{1,1}{i+1,1});
                        case 3
                          SadThinkingContent{iTop,ItemNum} = str2num(Data{1,1}{i+1,1}); 
                        case 4
                          RumThinkingContent{iTop,ItemNum} = str2num(Data{1,1}{i+1,1}); 
                        case 5
                          DisThinkingContent{iTop,ItemNum} = str2num(Data{1,1}{i+1,1});
                    end
                end   
            end

        end
    end
    
    
    save([ResultDir,'/',SiteSet{iSite},'_ScaleData.mat'],'*Content','*Score');
end