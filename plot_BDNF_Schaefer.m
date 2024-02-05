% To plot the BDNF expression level in each Schaefer region
% 
% Xiao Chen
% chenxiaophd@gmail.com

%% initialization
clear;clc;

work_dir = ['/Users/ChenXiao/Documents/My_Documents/Cooperation/JiaFengnan', ...
            '/expression_plot'];

T = readtable([work_dir, '/tmp_excel.xlsx']);
[data,~,~,header] = y_ReadAll([work_dir, ...
            '/Schaefer2018_400Parcels_17Networks_order_FSLMNI152_1mm.nii']);
data_expression = data;
for i = 1:400
    if isnan(T.expression(i))
        T.expression(i) = 0.001;
    end
    data_expression(data_expression == i) = T.expression(i);
end

y_Write(data_expression,header, [work_dir, '/temp.nii'])

%% generate a border of MTL subsystem
dmn_index = [188:194, 385:390];
[data,~,~,header] = y_ReadAll([work_dir, ...
    '/Schaefer2018_400Parcels_17Networks_order_FSLMNI152_1mm.nii']);
data2 = zeros(size(data));
for j = 1:length(dmn_index)
    data2(data == dmn_index(j)) = 10;
end
BW = edge3(data2,'approxcanny',0.9);
data3 = zeros(size(data));
data3(BW) = 10;
% y_Write(data3,header,'test2.nii')

data_final = data_expression+data3;
y_Write(data_final,header, [work_dir, '/for_plot.nii'])

%%
BrainNet_MapCfg('BrainMesh_ICBM152_smoothed.nv', ...
                [work_dir, '/temp.nii'], ...
                [work_dir, '/plot_setting.mat'], ...
                [work_dir,'/expression_plot.png']);