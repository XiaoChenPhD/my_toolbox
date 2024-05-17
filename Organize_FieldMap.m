% to organize the files in FieldMapRaw to the fold FieldMap
clear;clc;
% Change this!!!!
% SubList = importdata('/Volumes/Chen_BKP/Organized4dpabi/SubList20210629.txt');
SubList{1,1} = 'Pilot001';
WorkDir = 'C:\DYSMARK_pilot\resting_state';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mkdir([WorkDir, filesep, 'FieldMap']);

for iSub = 1:length(SubList)
    SubjectName = SubList{iSub};
    
    CurrentFieldMapRawDir = [WorkDir, filesep, 'FieldMapRaw', filesep, SubjectName];
    FileInfo = dir(CurrentFieldMapRawDir);
    
    %For Mac file system
    if strcmp(FileInfo(3).name, '.DS_Store')
        InputName = [WorkDir, filesep, 'FieldMapRaw', filesep, SubjectName,filesep,FileInfo(4).name];
        c_DivideFieldMapMagnitudeFiles(InputName,WorkDir,SubjectName);

        PaseDiffRawDir = [WorkDir, filesep, 'FieldMapRaw', filesep, SubjectName, filesep, FileInfo(5).name];
        PaseDiffDir = [WorkDir,filesep, 'FieldMap', filesep, 'PhaseDiffRaw', filesep, SubjectName];
        mkdir(PaseDiffDir);
        copyfile(PaseDiffRawDir,PaseDiffDir);
    else
        InputName = [WorkDir, filesep, 'FieldMapRaw', filesep, SubjectName, filesep, FileInfo(3).name];
        c_DivideFieldMapMagnitudeFiles(InputName,WorkDir,SubjectName);

        PaseDiffRawDir = [WorkDir, filesep, 'FieldMapRaw', filesep, SubjectName, filesep, FileInfo(4).name];
        PaseDiffDir = [WorkDir, filesep, 'FieldMap', filesep, 'PhaseDiffRaw', filesep, SubjectName];
        mkdir(PaseDiffDir);
        copyfile(PaseDiffRawDir,PaseDiffDir);
    end
     fprintf('working with %s...\n',SubList{iSub});
end

fprintf('done!\n');