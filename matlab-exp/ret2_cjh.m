% task 2
clear;close all;
% 读取图像
org_img = imread('Fingerprint256.png');              % 原图
img = imread('Fingerprint256_thick_scratch.png'); % 粗线涂画

% 获取图像大小
[h, w, c] = size(img);  

% 定义填充边界条件为'replicate' 
org_img = padarray(org_img, [3 3], 'replicate');  
img = padarray(img, [3 3], 'replicate');  

% 定义核大小 
kernelSize = [13 15]; 

% 定义迭代次数
iterNum = 15;  

% 初始化恢复后的图像
recovered = img;  

% 获取涂画区域
ind = (recovered==0) | (recovered==255);
s = sum(ind(:))/numel(ind);

% 进行迭代均值滤波
for i = 1:iterNum  
    % 均值滤波
    recovered = medfilt2(recovered, kernelSize);  
    
    % 根据原图像和滤波后的图像计算残差图像
    residual = img - recovered;  
    
    % 将残差图像加回恢复后的图像
    recovered = recovered + residual;  
end 

% 只对涂画区域做恢复处理
recovered(~ind) = img(~ind);

% 显示结果
subplot(1,2,1);  
imshow(img);
title('原图像');  

subplot(1,2,2); 
imshow(recovered);
title('恢复后的图像');

% 计算PSNR值
psnr_blur = psnr(img, org_img);
fprintf('PSNR value of blurry image: %f\n', psnr_blur);
psnr_val = psnr(org_img, recovered);
fprintf('PSNR between the original image and the recovered image: %.2f\n', psnr_val);