%To copy the calculated metrics to structured folders and conduct
%statistical comparisons

clear all; clc;
DataDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Dynamic_Preprocessing';
TopTargetDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Analysis/Dynamic_Analysis/Dynamic_Regional_Metrics/Metrics';
SubList = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Analysis/IPCAS_Sublist.txt');

SiteSet = {'IPCAS','PKUGE','PKUSIMENS'};
MeasureSet = {'ALFF','fALFF','ReHo','DC','VMHC','GSCorr'};
ResultSet = {'ALFF','fALFF','ReHo','DC_PositiveWeightedSum','zVMHC','zGSCorr'};
ConditionSet = {'_FunImgARCWS','_FunImgARCWS','_FunImgARCW','_FunImgARCWS','_FunImgARCWSsym','_FunImgARCWS'};


for iSite = 1:length(SiteSet)
    for iMeasure = 1:length(MeasureSet)
        for iSub = 1:length(SubList)
            %rest
           CurrentDir = [DataDir,'/',SiteSet{iSite},'_rest/Results/TemporalDynamics/TemporalDynamicsMetrics/',MeasureSet{iMeasure},ConditionSet{iMeasure},'/CV',ResultSet{iMeasure},'_',SubList{iSub},'.nii'];
           TargetDir = [TopTargetDir,'/',SiteSet{iSite},'/rest/TemporalDynamicsMetrics/CV/',MeasureSet{iMeasure}];
           if ~exist(TargetDir,'dir'); mkdir(TargetDir); end
           copyfile(CurrentDir,TargetDir);
           
           %rum
           CurrentDir = [DataDir,'/',SiteSet{iSite},'_task/S3_Results/TemporalDynamics/TemporalDynamicsMetrics/',MeasureSet{iMeasure},ConditionSet{iMeasure},'/CV',ResultSet{iMeasure},'_',SubList{iSub},'.nii'];
           TargetDir = [TopTargetDir,'/',SiteSet{iSite},'/rum/TemporalDynamicsMetrics/CV/',MeasureSet{iMeasure}];
           if ~exist(TargetDir,'dir'); mkdir(TargetDir); end
           copyfile(CurrentDir,TargetDir);
           
           %dis
           CurrentDir = [DataDir,'/',SiteSet{iSite},'_task/S4_Results/TemporalDynamics/TemporalDynamicsMetrics/',MeasureSet{iMeasure},ConditionSet{iMeasure},'/CV',ResultSet{iMeasure},'_',SubList{iSub},'.nii'];
           TargetDir = [TopTargetDir,'/',SiteSet{iSite},'/dis/TemporalDynamicsMetrics/CV/',MeasureSet{iMeasure}];
           if ~exist(TargetDir,'dir'); mkdir(TargetDir); end
           copyfile(CurrentDir,TargetDir);
           
        end
    end
end
