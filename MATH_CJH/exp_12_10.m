 % 系统函数的系数
b = [1 0 -sqrt(2) 1];
a = [1];

% 输入信号
n = 0:99;
x = 3*cos(0.25*pi*n);

% 初始条件
y = zeros(size(n));

% 差分方程的迭代计算
for i = 3:length(n)
    y(i) = b(1)*x(i) + b(2)*x(i-1) + b(3)*x(i-2) - a(2)*y(i-1) - a(3)*y(i-2);
end

% 绘制输入信号和系统输出
figure;
subplot(2,1,1);
stem(n, x);
title('输入信号');
xlabel('n');
ylabel('幅度');

subplot(2,1,2);
stem(n, y);
title('系统输出');
xlabel('n');
ylabel('幅度');
