clear
clc
filename = 'D:\Matlab_Project\data\sample.mat';
data = load(filename); % 加载.mat文件，并将其保存在名为"data"的结构中
% 可视化数据
% 生成示例数据（4维数据）
figure;
% 子图1
subplot(2, 2, 1);
scatter(data(:, 1), data(:, 2), 50, data(:, 3), 'filled');
colorbar;
title('Dimension 3 by Color');
xlabel('Dimension 1');
ylabel('Dimension 2');

% 子图2
subplot(2, 2, 2);
scatter(data(:, 1), data(:, 2), 50, data(:, 4), 'filled');
colorbar;
title('Dimension 4 by Color');
xlabel('Dimension 1');
ylabel('Dimension 2');

% 子图3
subplot(2, 2, 3);
scatter(data(:, 2), data(:, 3), 50, data(:, 1), 'filled');
colorbar;
title('Dimension 1 by Color');
xlabel('Dimension 2');
ylabel('Dimension 3');

% 子图4
subplot(2, 2, 4);
scatter(data(:, 3), data(:, 4), 50, data(:, 2), 'filled');
colorbar;
title('Dimension 2 by Color');
xlabel('Dimension 3');
ylabel('Dimension 4');

sgtitle('Visualization of 4-D Data');