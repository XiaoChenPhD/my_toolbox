function  rvinf(inputdata,outputname)
% remove all inf points from the image (replace them with zero)
% written by Xiao Chen
% 20201120
% chenxiaochina@hotmail.com

[data, header] = y_Read(inputdata);
data(find(isinf(data))) = 0;
y_Write(data, header, outputname);