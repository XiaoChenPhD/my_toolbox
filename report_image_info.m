function report = report_image_info(data_path, config)
% to first use dicominfo function from spm to get the information of the
% dicom files, and then write out some key information
%
% inputs:
% data_path:  the full path where raw dicom files were stored
% config:     two values, 
%             'epi', if this is a functional MRI image; 
%             't1', if this is a t1 weighted image.
% Xiao Chen
% chenxiaophd@gmail.com
% 230825

current_dir = dir(data_path);
dicom_file = [data_path, '/', current_dir(4).name];
dicom_info = dicominfo(dicom_file);

if strcmp(config, 't1')
    % for T1 images from SIEMENS, the slice gap, iPAT/Aset and Band Width
    % are not availale
    report = cell(10,2);
    report(:,1) = {"Phase encoding direction"; ...
              "Scan option (for fat suppression)"; ...
              "TR"; ...
              "TE"; ...
              "TI"; ...
              "FoV"; ...
              "matrix"; ...
              "Slice thickness"; ...
              "Flip angle"; ...
              "Receive coil"; ...
              };
    report{1,2} = dicom_info.InPlanePhaseEncodingDirection;
    report{2,2} = dicom_info.ScanOptions;
    report{3,2} = dicom_info.RepetitionTime;
    report{4,2} = dicom_info.EchoTime;
    report{5,2} = dicom_info.InversionTime;
    report{6,2} = dicom_info.Rows;
    report{7,2} = dicom_info.Private_0051_100c;
    report{8,2} = dicom_info.SliceThickness;
    report{9,2} = dicom_info.FlipAngle;
    report{10,2} = dicom_info.Private_0051_100f;

elseif strcmp(config, 'epi')
    % for epi images from siemens, the TI, FOV cannot be determined
    report = cell(9,2);
    report(:,1) = {"Phase encoding direction"; ...
              "Scan option (for fat suppression)"; ...
              "TR"; ...
              "TE"; ...
              "matrix"; ...
              "Slice thickness"; ...
              "Flip angle"; ...
              "Receive coil"; ...
              "Spacing between slices"
              };
    report{1,2} = dicom_info.InPlanePhaseEncodingDirection;
    report{2,2} = dicom_info.ScanOptions;
    report{3,2} = dicom_info.RepetitionTime;
    report{4,2} = dicom_info.EchoTime;
    report{5,2} = dicom_info.Private_0051_100b;
    report{6,2} = dicom_info.SliceThickness;
    report{7,2} = dicom_info.FlipAngle;
    report{8,2} = dicom_info.Private_0051_100f;
    report{9,2} = dicom_info.SpacingBetweenSlices;
end

