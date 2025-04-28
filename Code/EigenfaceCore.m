function [m, A, Eigenfaces] = EigenfaceCore(Training_Data)

%----------------------------计算均值图像 ------------------------
% ---------------------计算协方差矩阵 --------------------------
m = mean(Training_Data,2);
Train_Number = size(Training_Data,2);
temp_m = [];  
for i = 1 : Train_Number
    temp_m = [temp_m m];
end
A = double(Training_Data) - temp_m;

%-------------------使用 "svd" 函数计算协方差矩阵的特征向量
%--------------------和特征值。
disp('正在计算...请稍等')
L = A'*A;
%size(L)
[V D] = eig(L); 

%-----------------------------排序并去除特征值---------------
Eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1000 ) % 设置阈值，根据需要调整
        Eig_vec = [Eig_vec V(:,i)];
    end
end

Eigenfaces = A * Eig_vec;
