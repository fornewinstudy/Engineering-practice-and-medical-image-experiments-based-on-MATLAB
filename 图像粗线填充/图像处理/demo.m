% 清除所有变量、关闭所有图形窗口和清空命令窗口
clear all; close all; clc;

% 读取原始图像
img = imread('CT(1).png');
img12 = imread('guide12.jpg');
% 转换到YCbCr颜色空间并提取亮度通道（Y通道）
ycc = rgb2ycbcr(img);
nimg = ycc(:,:,1);

% 设置参数
lambda = 15;  % 平滑度参数
alpha = 1.5;   % 边缘保留参数

% 使用wlsFilter函数进行图像平滑处理
diff = uint8(wlsFilter(double(nimg), lambda, alpha, double(nimg)/50));

% 将处理后的图像合并回RGB颜色空间
fimg = ycbcr2rgb(cat(3, diff, ycc(:,:,2:3)));

% 显示处理前后的图像
figure, imshow(img, []), title('带高斯噪声的图像');
figure, imshow(fimg), title('平滑后的图像');


figure, imshow(uint8((double(fimg)+double(img))/2)), title('与原图加权叠加，保留自然感'); %与原图加权叠加，保留自然感

% 计算PSNR
psnr_val = psnr(uint8((double(fimg)+double(img))/2), img);
disp(['PSNR值为：', num2str(psnr_val)]);

% 计算SSIM
ssim_val = ssim(uint8((double(fimg)+double(img))/2), img);
disp(['SSIM值为：', num2str(ssim_val)]);

% 保存处理后的图像
imwrite(fimg, 'res_with_gaussian_noise.jpg');
