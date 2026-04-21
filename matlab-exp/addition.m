clear
close all
% 生成具有二次曲线趋势的二维点
n = 100;  % 点的数量
a_true = 2;  % 真实曲线的二次项系数
b_true = -3;  % 真实曲线的一次项系数
c_true = 1;  % 真实曲线的常数项
noise_std = 1;  % 噪声的标准差

% 生成x坐标
x = linspace(0, 10, n);

% 计算真实的y坐标
y_true = a_true*x.^2 + b_true*x + c_true;

% 添加噪声
noise = randn(1, n) * noise_std;
y = y_true + noise;

% 绘制生成的点和线
figure('Position', [100, 100, 1400, 600]);
subplot(1,2,1);
scatter(x, y, 'filled');
hold on;
plot(x, y_true, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('生成的点和真实直线');
legend('生成的点', '真实直线');

% 使用最小二乘法拟合二次曲线
A = [x'.^2 x' ones(n, 1)];  % 构建设计矩阵A，包含x的平方项和常数项
coeff = (A' * A) \ (A' * y');  % 计算系数的解
a_est = coeff(1);  % 估计的二次项系数
b_est = coeff(2);  % 估计的一次项系数
c_est = coeff(3);  % 估计的常数项

% 绘制拟合的二次曲线
x_fit = linspace(0, 10, 100);  % 生成用于拟合的x坐标
y_fit = a_est*x_fit.^2 + b_est*x_fit + c_est;  % 计算拟合的y坐标

% 绘制拟合的二次曲线和原始数据点
subplot(1,2,2);
scatter(x, y, 'filled');
hold on;
plot(x_fit, y_fit, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('最小二乘法拟合的二次曲线');
legend('原始数据点', '拟合的二次曲线');

% 输出计算结果
disp(['最小二乘法估计的二次项系数a为：', num2str(a_est)]);
disp(['最小二乘法估计的一次项系数b为：', num2str(b_est)]);
disp(['最小二乘法估计的常数项c为：', num2str(c_est)]);
