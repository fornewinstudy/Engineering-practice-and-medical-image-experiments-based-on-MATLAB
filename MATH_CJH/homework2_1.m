% 输入实验数据
Q = [1, 2, 3, 4];
y = [0.8, 1.5, 1.8, 2.0];

% 调用最小二乘法函数
[a0, a1] = myLeastSquares(Q, y);

% 打印结果
disp(['a0: ', num2str(a0)]);
disp(['a1: ', num2str(a1)]);

