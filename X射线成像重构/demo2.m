% 读取模拟投影图像
ProjImg = imread('ProjImg.png');

% 将图像转换为双精度，以便进行计算
ProjImg = im2double(ProjImg);

% 获取图像的尺寸
[height, width] = size(ProjImg);

% 构建三维体积，将二维投影图像复制到每个体素位置
volume = repmat(ProjImg, [1, 1, 20]); % 20 是体积的深度

% 计算 X 射线投影
projection_image = sum(volume, 3);

% 显示投影图像
figure;
imagesc(projection_image);
colormap('gray');
colorbar;
title('X-ray Projection Image');
