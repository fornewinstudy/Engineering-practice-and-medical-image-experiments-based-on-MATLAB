function compress_image_dwt(image_path)
    % 加载图像
    img = imread(image_path);
    
    % 将图像转换为灰度图像
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    % 转换为双精度类型
    img = double(img);
    
    % 设置小波变换参数
    [C, S] = wavedec2(img, 2, 'sym4');  % 2层分解，使用'sym4'小波
    threshold = 20;  % 设置阈值
    
    % 提取和阈值处理细节系数
    [H, V, D] = detcoef2('all', C, S, 1);  % 提取第1层细节系数
    H = wthcoef2('h', C, S, 1, threshold);  % 阈值处理水平高频分量
    V = wthcoef2('v', C, S, 1, threshold);  % 阈值处理垂直高频分量
    D = wthcoef2('d', C, S, 1, threshold);  % 阈值处理对角高频分量
    
    % 重构图像
    C_new = [appcoef2(C, S, 'sym4', 1), H(:)', V(:)', D(:)'];
    img_compressed = waverec2(C_new, S, 'sym4');
    
    % 显示原始图像和压缩后的图像
    figure;
    subplot(1, 2, 1);
    imshow(uint8(img));
    title('原始图像');
    
    subplot(1, 2, 2);
    imshow(uint8(img_compressed));
    title('压缩后的图像');
end


% 辅助函数：应用阈值处理高频分量
function C = wthcoef2(type, C, S, level, threshold)
    % 获取对应级别的系数索引
    [~,H,V,D] = detcoef2(type, C, S, level);
    
    % 应用阈值
    H(abs(H) < threshold) = 0;
    V(abs(V) < threshold) = 0;
    D(abs(D) < threshold) = 0;
    
    % 更新系数
    C = appcoef2(C, S, 'sym8', level); % 获取低频系数
    C = [C; H(:); V(:); D(:)]; % 合并处理后的高频系数
end
