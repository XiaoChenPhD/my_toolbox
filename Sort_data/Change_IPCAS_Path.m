% Because the sorted IPCAS data's folders do not contain any info about the
% sesssion's names, I write this script to read the dicom files' sesseion
% info and rename the folders accordingly.

clear;clc;

Workdir='/mnt/Data/RfMRILab/ChenX/Rumination_project/Data/Full_Preprocessing/IPCAS_sorted';
SubjectFolders=dir(Workdir);

for i=3:length(SubjectFolders)
    CurrentSubjectDir=[Workdir,'/',SubjectFolders(i).name];
    CurrentSubjectSessions=dir(CurrentSubjectDir);
    for j=3:length(CurrentSubjectSessions)
        CurrentSessionPath=[CurrentSubjectSessions(j).folder,'/',CurrentSubjectSessions(j).name];
        CurremtDicomPath=dir(CurrentSessionPath);
        CurrentDicom=[CurremtDicomPath(3).folder,'/',CurremtDicomPath(3).name];
        CurrentDicomInfo=dicominfo(CurrentDicom);
        TargetSessionPath=[CurrentSubjectSessions(j).folder,'/',CurrentDicomInfo.SeriesDescription];
        a=CurrentSessionPath(end);
        b=TargetSessionPath(end);
        if a~=b
            movefile(CurrentSessionPath,TargetSessionPath);
        end
    end
end