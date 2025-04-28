clear all
close all
clc

Training_Path = '../TrainDatabase';  % 设置训练数据文件的目录
Testing_Path = '../TestDatabase';    % 设置测试数据文件的目录

disp('请选择一个测试照片来自TestDatabase')
[filename, pathname] = uigetfile({'*.jpg'},'请选择一个测试照片来自TestDatabase');
id_test = strsplit(filename, '.');
id_test = id_test(1);

disp('稍等一下，正在计算')
TestImage = [pathname, filename];
im = imread(TestImage);

Training_Data = ReadFace(Training_Path);
[m, A, Eigenfaces] = EigenfaceCore(Training_Data);
OutputName = Recognition(TestImage, m, A, Eigenfaces);
id_result = strsplit(OutputName, '.');
id_result = id_result(1);

SelectedImage = strcat(Training_Path,'/',OutputName);
SelectedImage = imread(SelectedImage);

Visualize_Eigenface(Eigenfaces,128,128);

figure('name','识别结果')
subplot(1,2,1);
imshow(im)
title(strcat('测试图像 (ID: ', id_test, ')'));

subplot(1,2,2);
imshow(SelectedImage);
title(strcat('识别结果 (ID: ', id_result, ')'));
disp('完成')
