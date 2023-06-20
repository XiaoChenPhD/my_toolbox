function [] = c_DivideFieldMapMagnitudeFiles(InputName,WorkingDirectory,SubjectName)
% function [] = c_DivideFieldMapMagnitudeFiles(InputName,WorkingDirectory,SubjectName)
% Divide dicom files of the magnitude images from the fieldmapping sacnnings
% into 2 series according to the differences in the TE, short TE in Magnitude1Raw
% and long TE in Magnitude2Raw
% 
% InputName: the directory where the magnitude images store. After the dicom
% sorter preprocessed, it should be in the form of <Subject_directory>/xxx_0003_fieldmap_rest
% there should be 2 fieldmapping directories, and the magnitude directory
% should contain more files.
%
% WorkingDirectory: the directory where you store all the files dpabi needs.
% SubjectName: the subject who is presently dealt with.
% 
% Written by Xiao Chen 20201014
% Modified by Xiao Chen 20201022, to make it compatible with the
% organizative works of dpabiSurf.
% Institute of Psychology, Chinese Academy of Scineces
% chenxiaochina@hotmail.com

% get the info of all dicom files
FileInfo = dir(InputName);

DicomInfo = [];
TE = [];
for iFile = 1:length(FileInfo)
    if FileInfo(iFile).name(1) == '.' % do nothing
            continue;
    end
    DicomInfo = dicominfo([FileInfo(iFile).folder,filesep,FileInfo(iFile).name]);%to give the full path
    TE(iFile,1) = DicomInfo.EchoTime;
end
% delete the rows with 0s
TE(find(TE == 0),:) = [];
%get short and long TEs
ShortTE = min(unique(TE));
LongTE = max(unique(TE));

Magnitude1Dir = [WorkingDirectory,'/FieldMap/Magnitude1Raw/',SubjectName];
Magnitude2Dir = [WorkingDirectory,'/FieldMap/Magnitude2Raw/',SubjectName];
mkdir(Magnitude1Dir);mkdir(Magnitude2Dir);

DicomInfo = [];
for iFile = 1:length(FileInfo)
    if FileInfo(iFile).name(1) == '.' % do nothing
            continue;
    end
    DicomInfo = dicominfo([FileInfo(iFile).folder,filesep,FileInfo(iFile).name]);%to give the full path
    if DicomInfo.EchoTime == ShortTE
        copyfile([FileInfo(iFile).folder,'/',FileInfo(iFile).name], ...
            Magnitude1Dir);
    elseif DicomInfo.EchoTime == LongTE
        copyfile([FileInfo(iFile).folder,'/',FileInfo(iFile).name], ...
            Magnitude2Dir);
    end
end