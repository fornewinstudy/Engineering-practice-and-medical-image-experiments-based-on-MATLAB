% 读取音频文件
[y, Fs] = audioread('happy.wav');

% 增加音量
y = y * 2;

% 计算音量
volume = sqrt(mean(y.^2, 2));

% 设置GIF参数
filename = 'volume.gif';
fps = 30;  % 每秒帧数
duration = 10;  % GIF持续时间（秒）
nframes = fps * duration; % 总帧数
amp = 50; % 音量跳动幅度
depth = 10; % 立体效果深度

% 创建画布
fig = figure('Color', 'w');
axis off;
ax = axes('Position',[0.1 0.1 0.8 0.8]);

% 创建波形图子图
ax1 = subplot(2,1,1);
t = (0:length(y)-1) / Fs;
plot(ax1, t, y(:,1), 'LineWidth', 1.5);
xlabel(ax1, 'Time (s)');
ylabel(ax1, 'Amplitude');
title(ax1, 'Audio Waveform');
grid(ax1, 'on');
set(ax1, 'FontSize', 12);
set(ax1, 'XMinorGrid', 'on');

% 创建立体图子图
ax2 = subplot(2,1,2);
[X, Y] = meshgrid(-amp:amp, -amp:amp);
Z = zeros(size(X));
surf(ax2, X, Y, Z, 'FaceColor', 'y', 'EdgeColor', 'interp', 'FaceAlpha', 0.5);

% 创建底部矩形
patch(ax2, [-amp, -amp, amp, amp], [-amp, amp, amp, -amp], [0, 0, 0, 0], 'k', 'FaceAlpha', 0.3);

% 循环绘制音量跳动图
for i = 1:nframes
    % 计算当前帧对应的音量值
    idx = round(i * length(volume) / nframes);
    v = volume(idx);
    
    % 计算立体网格的高度
    h = v * depth / max(volume);
    
    % 更新立体网格的高度
    Z(:) = h;
    
     % 使用高斯函数计算Z值
    sigma = amp/2; % 高斯函数的标准差
    Z = v * exp(-(X.^2 + Y.^2)/(2*sigma^2));
    
    % 绘制立体网格
    surf(ax2, X, Y, Z, 'FaceColor', 'r', 'EdgeColor', 'none', 'FaceAlpha',0.5);
    
    % 绘制底部矩形
    patch(ax2, [-amp, -amp, amp, amp], [-amp, amp, amp, -amp], [0, 0, 0, 0], 'k', 'FaceAlpha', 0.3);
    
    % 设置标题
    title(sprintf('Volume: %.2f', v), 'FontSize', 16);
    
    % 将当前图像保存为GIF帧
    frame = getframe(gca);
    im = frame2im(frame);
    [A,map] = rgb2ind(im,256);
    if i == 1
        imwrite(A,map,filename,'gif', 'Loopcount',inf, 'DelayTime', 1/fps);
    else
        imwrite(A,map,filename,'gif', 'WriteMode','append', 'DelayTime', 1/fps);
    end
end