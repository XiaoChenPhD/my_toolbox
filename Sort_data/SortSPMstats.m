clear all;clc;
DataDir = '/MD3860F/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/SPM_analysis/PKUSIMENS_catenated';
TargetDir = '/MD3860F/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/SPM_analysis/PKUSIMENS_stats';
if ~exist(TargetDir, 'dir'); mkdir(TargetDir); end

SubList = importdata('/mnt/Data/RfMRILab/ChenX/Rumination_project/Scripts/Analysis/IPCAS_Sublist.txt');

for i = 1:length(SubList)
    Source = [DataDir,'/',SubList{i},'/spmT_0001.nii'];
    Target = [TargetDir,'/spmT_0001_',SubList{i},'.nii'];
    copyfile(Source,Target);
    
end