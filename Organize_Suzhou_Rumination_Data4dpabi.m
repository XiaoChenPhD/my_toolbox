% Organize data from Suzhou as the structure for dapbi
% Written by ChenXiao
% 20210629

clear;clc;
% initialization
Data_dir = '/Volumes/Samsung_T5/Organized4dpabi/Sorted_Data_noRedundance';
rest_dpabi_dir = '/Volumes/Samsung_T5/Organized4dpabi/dpabi_rest';
task_dpabi_dir = '/Volumes/Samsung_T5/Organized4dpabi/dpabi_task';

SubList = importdata('/Volumes/Samsung_T5/Organized4dpabi/SubList20210805.txt');

for iSub = 34:length(SubList)
    % load the path under each subject
    temp = dir([Data_dir,'/',SubList{iSub}]);
    Sorted_dir = dir([Data_dir,'/',SubList{iSub},'/',temp(end).name]);
    
    % search for each session
    t1 = [];fieldmap = []; rest = [];
    sad = []; rum = []; dis = [];
    for ii = 1:length({Sorted_dir.name})
        t1(ii) = ~isempty(strfind(Sorted_dir(ii).name,'_t1iso_mprage'));
        fieldmap(ii) = ~isempty(strfind(Sorted_dir(ii).name,'_fieldmap_rest'));
        rest(ii) = ~isempty(strfind(Sorted_dir(ii).name,'_bold_rest'));
        sad(ii) = ~isempty(strfind(Sorted_dir(ii).name,'_bold_sad'));
        rum(ii) = ~isempty(strfind(Sorted_dir(ii).name,'_bold_rum'));
        dis(ii) = ~isempty(strfind(Sorted_dir(ii).name,'_bold_dis'));
    end
    
    mkdir([task_dpabi_dir,'/FunRaw/',SubList{iSub}]);%rum
    mkdir([task_dpabi_dir,'/S2_FunRaw/',SubList{iSub}]);%dis
    
    % copy t1 files
    if ~isempty(find(t1))
        mkdir([rest_dpabi_dir,'/T1Raw/',SubList{iSub}]);
        mkdir([task_dpabi_dir,'/T1Raw/',SubList{iSub}]);
        
        index = find(t1);
        t1_data_dir = [Data_dir,'/',SubList{iSub},'/',temp(end).name,'/',Sorted_dir(index(end)).name];
        copyfile(t1_data_dir,[rest_dpabi_dir,'/T1Raw/',SubList{iSub}]);
        copyfile(t1_data_dir,[task_dpabi_dir,'/T1Raw/',SubList{iSub}]);
    end

    % copy fieldmap data
    if ~isempty(find(fieldmap))
        index = find(fieldmap);
        mkdir([rest_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end-1)).name]);
        mkdir([rest_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end)).name]);
        
        mkdir([task_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end-1)).name]);
        mkdir([task_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end)).name]);
        
        fieldmap_data_dir1 = [Data_dir,'/',SubList{iSub},'/',temp(end).name,'/',Sorted_dir(index(1)).name];
        fieldmap_data_dir2 = [Data_dir,'/',SubList{iSub},'/',temp(end).name,'/',Sorted_dir(index(2)).name];
        
        copyfile(fieldmap_data_dir1,[rest_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end-1)).name]);
        copyfile(fieldmap_data_dir2,[rest_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end)).name]);
        
        copyfile(fieldmap_data_dir1,[task_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end-1)).name]);
        copyfile(fieldmap_data_dir2,[task_dpabi_dir,'/FieldMapRaw/',SubList{iSub},'/',Sorted_dir(index(end)).name]);
    end
    
    % copy resting state files
    if ~isempty(find(rest))
        mkdir([rest_dpabi_dir,'/FunRaw/',SubList{iSub}]);
        
        index = find(rest);
        rest_data_dir = [Data_dir,'/',SubList{iSub},'/',temp(end).name,'/',Sorted_dir(index(end)).name];
        copyfile(rest_data_dir,[rest_dpabi_dir,'/FunRaw/',SubList{iSub}]);
    end
    
    % copy rumination state files
    if ~isempty(find(rum))
        index = find(rum);
        rum_data_dir = [Data_dir,'/',SubList{iSub},'/',temp(end).name,'/',Sorted_dir(index(end)).name];
        copyfile(rum_data_dir,[task_dpabi_dir,'/FunRaw/',SubList{iSub}]);
    end
    
    % copy distraction state files
    if ~isempty(find(dis))
        index = find(dis);
        dis_data_dir = [Data_dir,'/',SubList{iSub},'/',temp(end).name,'/',Sorted_dir(index(end)).name];
        copyfile(dis_data_dir,[task_dpabi_dir,'/S2_FunRaw/',SubList{iSub}]);
    end
end

% check for dimcom info
name_set = {};
for iSub = 8:length(SubList)
    temp = dir([rest_dpabi_dir,'/T1Raw/',SubList{iSub}]);
    dicom_name = temp(end).name;
    info = dicominfo([rest_dpabi_dir,'/T1Raw/',SubList{iSub},'/',dicom_name]);
    name_set{iSub,1} = info.PatientName.FamilyName;
end


