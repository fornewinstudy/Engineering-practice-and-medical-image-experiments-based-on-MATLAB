function [ output ] = PSNR( img1,img2)
%PSNR 峰值信噪比
    if sum(sum(img1-img2)) == 0
        error('Those pictures are the same');
    end
    MAX=1;          %图像有多少灰度级（我这里定为1）
    % 归一化
    if (max(max(img1))-min(min(img1))) ~= 0
        img1 = (img1-min(min(img1)))./(max(max(img1))-min(min(img1)));
    end
    if (max(max(img1))-min(min(img1))) ~= 0
        img2 = (img2-min(min(img2)))./(max(max(img2))-min(min(img2)));
    end
    %
    MSE=sum(sum((img1-img2).^2))/(1024*1024);     %图片像素设为1024 x 1024
    output=20*log10(MAX/sqrt(MSE));           %峰值信噪比    
end


