% to organize the files in FieldMapRaw to the fold FieldMap
clear;clc;
% Change this!!!!
SubList = importdata('/Volumes/Chen_BKP/Organized4dpabi/SubList20210629.txt');
% SubList{1,1} = 'Sub004';
WorkDir = '/Volumes/Chen_BKP/Organized4dpabi/dpabi_task';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir([WorkDir,'/FieldMap']);

for iSub = 1:length(SubList)
    SubjectName = SubList{iSub};
    
    CurrentFieldMapRawDir = [WorkDir,'/FieldMapRaw/', SubjectName];
    FileInfo = dir(CurrentFieldMapRawDir);
    
    %For Mac file system
    if strcmp(FileInfo(3).name, '.DS_Store')
        InputName = [WorkDir,'/FieldMapRaw/', SubjectName,'/',FileInfo(4).name];
        c_DivideFieldMapMagnitudeFiles(InputName,WorkDir,SubjectName);

        PaseDiffRawDir = [WorkDir,'/FieldMapRaw/',SubjectName,'/',FileInfo(5).name];
        PaseDiffDir = [WorkDir,'/FieldMap/PhaseDiffRaw/',SubjectName];
        mkdir(PaseDiffDir);
        copyfile(PaseDiffRawDir,PaseDiffDir);
    else
        InputName = [WorkDir,'/FieldMapRaw/', SubjectName,'/',FileInfo(3).name];
        c_DivideFieldMapMagnitudeFiles(InputName,WorkDir,SubjectName);

        PaseDiffRawDir = [WorkDir,'/FieldMapRaw/',SubjectName,'/',FileInfo(4).name];
        PaseDiffDir = [WorkDir,'/FieldMap/PhaseDiffRaw/',SubjectName];
        mkdir(PaseDiffDir);
        copyfile(PaseDiffRawDir,PaseDiffDir);
    end
     fprintf('working with %s...\n',SubList{iSub});
end

fprintf('done!\n');