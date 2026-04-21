% 读取volume.mat文件
data = load('volume.mat');
volume = data.volume; % 假设mat文件中变量名为'volume'

% 获取volume的尺寸
[height, width, depth] = size(volume);

% 计算沿X射线投影方向的投影图像
projection_image = sum(volume, 3);

% 显示投影图像
imagesc(projection_image);
colormap('gray');
colorbar;
title('X-ray Projection Image');

I_0 = 1.0;  % 初始强度（可以调整）
projection_image = I_0 * exp(-sum(volume, 3));

% 显示投影图像
imagesc(1- projection_image);
colormap('gray');
colorbar;
title('X-ray Projection Image with Intensity');

% 原始图像（假设名为 OriginalImg）
OriginalImg = imread('ProjImg.png');

% 调整投影图像的大小，使其与原始图像的大小相同
projection_image_resized = imresize(projection_image, size(OriginalImg));

% 计算投影图像和原始图像之间的 PSNR
psnr_value = psnr(double(OriginalImg), double(projection_image_resized));

% 显示 PSNR 值
fprintf('PSNR between Original Image and Projection Image: %.2f dB\n', psnr_value);

