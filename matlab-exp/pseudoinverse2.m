clc
clear
close all
% 矩阵
A1 = single([1:1:10; 1:2:20]);
A2 = single([1:1:1000; 1:2:2000]);
A3 = single([1:1:10000; 1:2:20000]);
b = single([1.1; 2.2]);

% 计算 X1
[~,t1_svd] = cal_time(A1, b, 'svd');
[~,t1_right_inv] = cal_time(A1, b, 'right_inv');
[~,t1_pinv] = cal_time(A1, b, 'pinv');
[~,t1_qr] = cal_time(A1, b, 'QR');
% 计算 X2
[~,t2_svd] = cal_time(A2, b, 'svd');
[~,t2_right_inv] = cal_time(A2, b, 'right_inv');
[~,t2_pinv] = cal_time(A2, b, 'pinv');
[~,t2_qr] = cal_time(A2, b, 'QR');
% 计算 X3
[~,t3_svd] = cal_time(A3, b, 'svd');
[~,t3_right_inv] = cal_time(A3, b, 'right_inv');
[~,t3_pinv] = cal_time(A3, b, 'pinv');
[~,t3_qr] = cal_time(A3, b, 'QR');

% 输出运算时间
fprintf('运算时间：\n');
fprintf('t1_svd: %f seconds\n', t1_svd);
fprintf('t1_right_inv: %f seconds\n', t1_right_inv);
fprintf('t1_pinv: %f seconds\n', t1_pinv);
fprintf('t1_qr: %f seconds\n', t1_qr);
fprintf('t2_svd: %f seconds\n', t2_svd);
fprintf('t2_right_inv: %f seconds\n', t2_right_inv);
fprintf('t2_pinv: %f seconds\n', t2_pinv);
fprintf('t2_qr: %f seconds\n', t2_qr);
fprintf('t3_svd: %f seconds\n', t3_svd);
fprintf('t3_right_inv: %f seconds\n', t3_right_inv);
fprintf('t3_pinv: %f seconds\n', t3_pinv);
fprintf('t3_qr: %f seconds\n', t3_qr);

% 生成计算时间的矩阵（便于柱状图表示）
time_matrix = [t1_svd, t1_right_inv, t1_pinv, t1_qr;
t2_svd, t2_right_inv, t2_pinv, t2_qr;
t3_svd, t3_right_inv, t3_pinv, t3_qr];

% 绘制柱状图
bar(time_matrix);
% 设置图例
legend('SVD', '右逆','Pinv','QR');
% 设置X轴标签
xticklabels({'A1','A2','A3'});
% 设置轴标签
xlabel('Matrix Size');
ylabel('Time (s)');
% 设置标题
title('不同方法的计算时间');
% 将y轴更改为对数尺度
set(gca, 'YScale', 'log');

% 绘制3D柱状图
figure
bar3(time_matrix)
title('不同方法的计算时间(3D图)')
% 设置X轴标签
xticklabels({'SVD', '右逆','Pinv','QR'});
% 设置Y轴标签
yticklabels({'A1','A2','A3'});
% 设置Z轴标签
zticks([0:0.0001:0.1]) % 设置 Z 轴的刻度值间隔为 10
% % Z轴设置为对数尺度，对数底数为2
% set(gca,'ZScale','log', 'ZTick',1.5.^(0:0.000001:0.01))
% 设置轴名称
xlabel('矩阵')
ylabel('方法')
zlabel('Time')