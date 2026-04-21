clear
close all
% 步骤1：生成带有线性趋势的二维点
n = 100;  % 点的数量
a_true = 2;  % 真实直线的斜率
b_true = 1;  % 真实直线的截距
noise_std = 1;  % 噪声的标准差

% 生成穿过直线的点
x = linspace(0, 10, n);  % 生成x坐标
y_true = a_true*x + b_true;  % 计算真实的y坐标

% 添加噪声
noise = randn(1, n) * noise_std;  % 生成服从正态分布的噪声
y = y_true + noise;  % 添加噪声后的y坐标

% 绘制生成的点
figure;
scatter(x, y, 'filled');
hold on;
plot(x, y_true, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('生成的点和真实直线');
legend('生成的点', '真实直线');

% 步骤2：使用最小二乘法计算最佳拟合直线的斜率a和截距b
A = [x' ones(n, 1)];  % 构建设计矩阵A
coeff = (A' * A) \ (A' * y');  % 计算a和b的解
a_est = coeff(1);  % 估计的斜率
b_est = coeff(2);  % 估计的截距

% 步骤3：输出计算结果
disp(['最小二乘法估计的斜率a为：', num2str(a_est)]);
disp(['最小二乘法估计的截距b为：', num2str(b_est)]);

% 步骤4：使用polyfit函数进行对照
polyfit_coeff = polyfit(x, y, 1);  % 使用polyfit函数拟合一次多项式
polyfit_a = polyfit_coeff(1);  % polyfit计算的斜率
polyfit_b = polyfit_coeff(2);  % polyfit计算的截距

disp(['polyfit函数计算的斜率a为：', num2str(polyfit_a)]);
disp(['polyfit函数计算的截距b为：', num2str(polyfit_b)]);
