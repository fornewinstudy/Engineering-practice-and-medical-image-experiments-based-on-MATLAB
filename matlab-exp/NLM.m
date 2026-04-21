% 读取图像
img = imread('Peppers_clear.png');              % 原图
input_image = imread('Peppers_thin_scratch.png'); % 细线涂画

% 获取涂画区域
ind = (input_image==0) | (input_image==255);
s = sum(ind(:))/numel(ind);

% 设置 NLM 参数
patch_size = 9;
search_window_size = 20;
h = 15;

% 进行 NLM 滤波
denoised_image = non_local_means_denoising(input_image, patch_size, search_window_size, h);

% 只对涂画区域做恢复处理
denoised_image(~ind) = noise_img(~ind);

% 显示去噪后的图像
imshow(denoised_image);

function denoised_image = non_local_means_denoising(input_image, patch_size, search_window_size, h)
    % 将输入图像转换为双精度，以便进行计算
    input_image = double(input_image);
    
    % 对输入图像进行边界扩展
    pad_size = max(patch_size, search_window_size);
    padded_image = padarray(input_image, [pad_size, pad_size], 'replicate');
    
    % 获取输入图像的大小
    [m, n] = size(input_image);
    
    % 初始化加权和和权重矩阵
    w_sum = zeros(m, n);
    weights = zeros(m, n);
    
    % 在搜索窗口内进行滑动
    for i = -search_window_size:search_window_size
        for j = -search_window_size:search_window_size
            % 计算偏移图像
            shifted_image = padded_image(pad_size+i+1:pad_size+i+m, pad_size+j+1:pad_size+j+n);
            
            % 计算距离
            distance = (input_image - shifted_image).^2;
            
            % 计算加权距离
            weight = exp(-distance / (h^2));
            
            % 更新加权和和权重矩阵
            w_sum = w_sum + weight .* shifted_image;
            weights = weights + weight;
        end
    end
    
    % 计算去噪后的图像
    denoised_image = w_sum ./ weights;
    
    % 将图像转换回原始数据类型
    denoised_image = cast(denoised_image, class(input_image));
end