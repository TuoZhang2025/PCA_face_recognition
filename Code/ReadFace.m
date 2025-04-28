function Training_Data = ReadFace(Training_Path)
% ---------- 从训练数据文件中的所有1D图像向量构造2D矩阵 ------------
flist = dir(strcat(Training_Path,'/*.jpg'));
Training_Data = [];
for imidx = 1:length(flist)
    fprintf('正在构建训练图像数据空间 [%d] \n', imidx); 
    path = strcat(Training_Path,strcat('/',int2str(imidx),'.jpg'));
    img = imread(path);
    [irow icol] = size(img);
    temp = reshape(img',irow*icol,1);   % 将2D图像重塑为1D图像向量
    Training_Data = [Training_Data temp];
end
fprintf('\n');