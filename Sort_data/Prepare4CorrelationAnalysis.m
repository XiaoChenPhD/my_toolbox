%Because Prof. Yan's correlation_Image.m only deal with the image
%directory, I have to write this script to copy those images into one
%folder.

clear all; clc;
DataDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing';
TopTargetDir = '/mnt/Data/RfMRILab/ChenX/Rumination_project/Analysis/Behavior_corr';
SiteSet = {'IPCAS','PKUGE','PKUSIMENS'};
MeasureSet = {'ALFF','fALFF','ReHo','DegreeCentrality','VMHC'};
MeasurePrefixSet = {'szALFFMap_','szfALFFMap_','szReHoMap_','szDegreeCentrality_PositiveWeightedSumBrainMap_','zVMHCMap_'};
ConditionSet = {'_FunImgARCW','_FunImgARCW','_FunImgARCWF','_FunImgARCWF','_FunImgARCWFsymS'};
ResultsSet = {'ResultsS/','ResultsS/','ResultsS/','ResultsS/','Results/'};
SubList = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Analysis/IPCAS_Sublist.txt');

for iSite = 1:length(SiteSet)
    for iMeasure = 1:length(MeasureSet)
        for iSub = 1:length(SubList)
            %rest regional
            CurrentDir1 = [DataDir,'/',SiteSet{iSite},'_rest/',ResultsSet{iMeasure},MeasureSet{iMeasure},ConditionSet{iMeasure},'/',MeasurePrefixSet{iMeasure},SubList{iSub},'.nii'];
            TargetDir1 = [TopTargetDir,'/',SiteSet{iSite},'/rest/',MeasureSet{iMeasure}];
            if ~exist(TargetDir1,'dir'); mkdir(TargetDir1); end
            copyfile(CurrentDir1,TargetDir1);
            %rum reginonal
            CurrentDir2 = [DataDir,'/',SiteSet{iSite},'_task/S3_',ResultsSet{iMeasure},MeasureSet{iMeasure},ConditionSet{iMeasure},'/',MeasurePrefixSet{iMeasure},SubList{iSub},'.nii'];
            TargetDir2 = [TopTargetDir,'/',SiteSet{iSite},'/rum/',MeasureSet{iMeasure}];
            if ~exist(TargetDir2,'dir'); mkdir(TargetDir2); end
            copyfile(CurrentDir2,TargetDir2);
            %rest ROI11
            CurrentDir3 = [DataDir,'/',SiteSet{iSite},'_rest/Results/FC_FunImgARCWFS/zROI11FCMap_',SubList{iSub},'.nii'];
            TargetDir3 = [TopTargetDir,'/',SiteSet{iSite},'/rest/ROI11'];
            if ~exist(TargetDir3,'dir'); mkdir(TargetDir3); end
            copyfile(CurrentDir3,TargetDir3);
            %rum ROI11
            CurrentDir4 = [DataDir,'/',SiteSet{iSite},'_task/S3_Results/FC_FunImgARCWFS/zROI11FCMap_',SubList{iSub},'.nii'];
            TargetDir4 = [TopTargetDir,'/',SiteSet{iSite},'/rum/ROI11'];
            if ~exist(TargetDir4,'dir'); mkdir(TargetDir4); end
            copyfile(CurrentDir4,TargetDir4);
            %rest ROI16
            CurrentDir5 = [DataDir,'/',SiteSet{iSite},'_rest/Results/FC_FunImgARCWFS/zROI16FCMap_',SubList{iSub},'.nii'];
            TargetDir5 = [TopTargetDir,'/',SiteSet{iSite},'/rest/ROI16'];
            if ~exist(TargetDir5,'dir'); mkdir(TargetDir5); end
            copyfile(CurrentDir5,TargetDir5);
            %rum ROI16
            CurrentDir6 = [DataDir,'/',SiteSet{iSite},'_task/S3_Results/FC_FunImgARCWFS/zROI16FCMap_',SubList{iSub},'.nii'];
            TargetDir6 = [TopTargetDir,'/',SiteSet{iSite},'/rum/ROI16'];
            if ~exist(TargetDir6,'dir'); mkdir(TargetDir6); end
            copyfile(CurrentDir6,TargetDir6);
        end
    end
end