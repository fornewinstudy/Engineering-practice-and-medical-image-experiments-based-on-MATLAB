% 加载图像
image_path = '003_164030.Jpg';
img = imread(image_path);
if size(img, 3) == 3
    img = rgb2gray(img); % 将彩色图像转换为灰度图像
end

% 转换为双精度类型并展平为向量
img = double(img);
img_vector = img(:);

% 定义向量长度和测量值数量
N = length(img_vector);
M = round(N * 0.25); % 假设测量值数量为图像向量长度的25%

% 生成随机传感矩阵
T = randn(M, N);

% 计算测量值
s = T * img_vector;

% 使用OMP算法重构图像
hat_y = omp(s, T, N);

% 将重构的向量转换回图像格式
reconstructed_img = reshape(hat_y, size(img));

% 显示原始图像和重构图像
figure;
subplot(1, 2, 1);
imshow(uint8(img));
title('原始图像');

subplot(1, 2, 2);
imshow(uint8(reconstructed_img));
title('重构图像');