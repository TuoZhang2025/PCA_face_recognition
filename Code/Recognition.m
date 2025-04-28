function OutputName = Recognition(TestImage, m, A, Eigenfaces)
%-------------将选定的测试图像和所有训练图像投影到特征脸空间。
% 比较它们之间的欧几里得距离，找到最小欧几里得距离的图像索引。
ProjectedImages = [];
Train_Number = size(A,2);
for i = 1 : Train_Number
    temp = Eigenfaces' * A(:,i); % 将居中图像投影到特征脸空间
    ProjectedImages = [ProjectedImages temp]; 
end

%-------------将你选定的测试图像投影到特征脸空间-------------
InputImage = imread(TestImage);
temp = InputImage(:,:,1);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
Projected_TestImage = Eigenfaces'*Difference; % 测试图像的特征向量

%----------------------- 计算欧几里得距离并找到最小欧几里得距离的图像索引-------------------- 
Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( Projected_TestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end

[Euc_dist_min , Recognized_index] = min(Euc_dist);
OutputName = strcat(int2str(Recognized_index),'.jpg');
