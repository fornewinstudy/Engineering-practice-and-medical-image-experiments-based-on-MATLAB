clear;close all;
% task3
% 读取模糊图像和模糊核
org_img = imread('man.png');
img = imread('man_disk_blurred.png');
kernel = fspecial('disk',5); % 模糊核已知

% 使用逆滤波器进行图像去模糊
result_inv = deconvblind(img,kernel);	

% 显示结果
figure
subplot(1,2,1)
imshow(img)
title('Original Image')
subplot(1,2,2)
imshow(result_inv)
title('Inverse Filtered Image')

% 计算PSNR值
psnr_blur = psnr(img, org_img);
fprintf('PSNR value of blurry image: %f\n', psnr_blur);
psnr_inv = psnr(result_inv, org_img);
fprintf('PSNR value of inverse filtered image: %f\n', psnr_inv);