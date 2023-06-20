% to get the coil setting from SIEMENS's dicom images
% written by Xiao Chen
% chenxiaochina@hotmail.com

clear;clc;
%Change this!!!!
SubList = importdata('/home/aa/ZouSiyun/Preprocessing/Sublist.txt');
WorkDir = '/home/aa/ZouSiyun/Preprocessing';

for iSub = 1:length(SubList)
    SubjectName = SubList{iSub};
    CurrentFunRawDir = [WorkDir,'/FunRaw/', SubjectName];
    FileInfo = dir(CurrentFunRawDir);
    InputName = [WorkDir,'/FunRaw/', SubjectName,'/',FileInfo(5).name];
    DicomInfo = dicominfo([WorkDir,'/FunRaw/', SubjectName,'/',FileInfo(5).name]);
    
    CoilInfo{iSub,1} = SubList{iSub};
    CoilInfo{iSub,2} = DicomInfo.Private_0051_100f;
end

fid = fopen([WorkDir, '/Coil_Info.txt'],'w');
for iSub = 1:length(SubList)
   fprintf(fid,'%s\t%s\n',CoilInfo{iSub,1},CoilInfo{iSub,2});
end
fclose(fid);