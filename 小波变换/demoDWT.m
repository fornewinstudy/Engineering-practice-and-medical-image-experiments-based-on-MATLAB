
% 加载图像
img = imread('123.jpg');
if size(img, 3) == 3
    img = rgb2gray(img); % 将彩色图像转换为灰度图像
end

% 转换为双精度类型并展平为向量
img = double(img);
img_vector = img(:);

% 定义向量长度和测量值数量
N = length(img_vector);

% 生成DWT变换矩阵
W = DWT(N);

% 对信号进行DWT变换
y = W * img_vector;

% 设置阈值并压缩系数
threshold = max(abs(y)) * 0.05; % 阈值可以根据需要调整
y(abs(y) < threshold) = 0;

% 使用保留的系数进行逆变换
img_reconstructed_vector = W' * y;

% 将重构的向量转换回图像格式
reconstructed_img = reshape(img_reconstructed_vector, size(img));

% 显示原始图像和重构图像
figure;
subplot(1, 2, 1);
imshow(uint8(img));
title('原始图像');

subplot(1, 2, 2);
imshow(uint8(reconstructed_img));
title('重构图像');
