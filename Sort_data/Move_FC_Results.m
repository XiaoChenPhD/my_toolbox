%To move preprocessed FC results to another directory so that I can do
%new ROI analysis
clear all; clc;
DataDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing';
TargetDir = '/MD3860F/RfMRILab/ChenX/Rumination_project/Analysis/Analysis4Publish/FC_Results_backup';

SiteSet = {'IPCAS','PKUGE','PKUSIMENS'};
SessionSet = {'','S2_','S3_','S4_'};

for iSite = 1:length(SiteSet)
    CurrentTargetDir = [TargetDir,'/',SiteSet{iSite},'_rest/Results'];
    if ~exist(CurrentTargetDir,'dir'); mkdir(CurrentTargetDir); end
    movefile([DataDir,'/',SiteSet{iSite},'_rest/Results/FC_FunImgARCWFS'],CurrentTargetDir);
    
    
    CurrentTargetDir = [TargetDir,'/',SiteSet{iSite},'_rest/Results'];
    if ~exist(CurrentTargetDir,'dir'); mkdir(CurrentTargetDir); end
    movefile([DataDir,'/',SiteSet{iSite},'_rest/Results/ROISignals_FunImgARCWFS'],CurrentTargetDir);
    
%     CurrentTargetDir = [TargetDir,'/',SiteSet{iSite},'_rest/ResultsS'];
%     if ~exist(CurrentTargetDir,'dir'); mkdir(CurrentTargetDir); end
%     movefile([DataDir,'/',SiteSet{iSite},'_rest/Results/FC_FunImgARCWF'],CurrentTargetDir);
end

for iSite = 1:length(SiteSet)
    for iSession = 1:length(SessionSet)
        CurrentTargetDir = [TargetDir,'/',SiteSet{iSite},'_task/',SessionSet{iSession},'Results'];
        if ~exist(CurrentTargetDir,'dir'); mkdir(CurrentTargetDir); end
        movefile([DataDir,'/',SiteSet{iSite},'_task/',SessionSet{iSession},'Results/FC_FunImgARCWFS'],CurrentTargetDir);

        CurrentTargetDir = [TargetDir,'/',SiteSet{iSite},'_task/',SessionSet{iSession},'Results'];
        if ~exist(CurrentTargetDir,'dir'); mkdir(CurrentTargetDir); end
        movefile([DataDir,'/',SiteSet{iSite},'_task/',SessionSet{iSession},'Results/',SessionSet{iSession},'ROISignals_FunImgARCWFS'],CurrentTargetDir);

%         CurrentTargetDir = [TargetDir,'/',SiteSet{iSite},'_task/',SessionSet{iSession},'ResultsS'];
%         if ~exist(CurrentTargetDir,'dir'); mkdir(CurrentTargetDir); end
%         movefile([DataDir,'/',SiteSet{iSite},'_task/',SessionSet{iSession},'Results/FC_FunImgARCWF'],CurrentTargetDir);
    end
end
