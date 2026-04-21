clear;close all;
% 读取模糊图像
blurredImage = imread('man_disk_blurred.png');

% 创建待估计的模糊核
kernel = fspecial('disk', 5);

% 设置总变差正则化参数
lambda = 0.1; % 正则化参数
numIter = 10; % 增加迭代次数
% 使用总变差正则化恢复图像
restoredImage = deconvreg(blurredImage, kernel, lambda, numIter);

% 显示恢复图像
figure;
imshow(restoredImage);
title('恢复图像')

% 读取原图
org_img = imread('man.png');

% 计算PSNR值
psnr_blur = psnr(blurredImage , org_img);
fprintf('PSNR value of blurry image: %f\n', psnr_blur);
psnr_inv = psnr(restoredImage, org_img);
fprintf('PSNR value of inverse filtered image: %f\n', psnr_inv);
