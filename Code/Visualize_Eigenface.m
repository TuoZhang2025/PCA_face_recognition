function Visualize_Eigenface(Eigenfaces, imgrow, imgcol)
%-------------------显示最大9张特征脸图像---------------
    Num_Eigenvalue = size(Eigenfaces,2);
    figure('Name','特征脸')
    img = zeros(imgrow, imgcol);
    for i=1:min(Num_Eigenvalue,9)
        img(:) = Eigenfaces(:,i);
        subplot(3,3,i);
        imshow(img',[]);
    end
end
