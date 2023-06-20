% Read in the phase coding direction

clear;clc;
% initialization
work_dir = '/Volumes/Chen_BKP/Organized4dpabi/dpabi_rest';

SubList = importdata('/Volumes/Chen_BKP/Organized4dpabi/dpabi_rest/SubList_rest.txt');

for iSub = 1:length(SubList)
    Fun_dir = dir([work_dir,'/FunImg/',SubList{iSub}]);
    fieldmap_dir = dir([work_dir,'/FieldMap/Magnitude1Img/',SubList{iSub}]);
    
    FunInfo = loadjson([work_dir,'/FunImg/',SubList{iSub},'/',Fun_dir(end-1).name]);
    fieldmapInfo = loadjson([work_dir,'/FieldMap/Magnitude1Img/',SubList{iSub},'/',fieldmap_dir(end-1).name]);
    
    Fun_direction{iSub,1} = FunInfo.PhaseEncodingDirection;
    fieldmap_direction{iSub,1} = fieldmapInfo.PhaseEncodingDirection;
end