% 生成一些带有二次曲线趋势的二维点，并添加噪声
n = 100;  % 数据点数量
x = linspace(0, 10, n)';
y_true = 2*x.^2 + 3*x + 1;  % 真实的二次曲线
noise = 10*randn(n, 1);  % 随机噪声
y = y_true + noise;  % 加入噪声后的数据

% 提高拟合多项式的阶数
poly_order = 5;  % 多项式阶数

% 构建X矩阵
X = zeros(n, poly_order + 1);
for i = 0:poly_order
    X(:, i+1) = x.^i;
end

% 使用最小二乘法计算多项式系数
coefficients = (X' * X) \ (X' * y);

% 计算拟合的y坐标
y_fit = X * coefficients;

% 绘制原始数据点和拟合的曲线
figure;
scatter(x, y, 'filled');
hold on;
plot(x, y_fit, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('y');
title('多项式拟合（最小二乘法）');
legend('原始数据点', '拟合的曲线');
