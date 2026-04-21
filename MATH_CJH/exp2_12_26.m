% 梯形公式
f4 = @(theta) sqrt(4 - sin(theta).^2);
a4 = 0;
b4 = pi/6;
n4 = 4;
h4 = (b4 - a4) / n4;
x4 = a4:h4:b4;
result_trapezoidal_theta = h4 * (0.5 * f4(a4) + sum(f4(x4(2:end-1))) + 0.5 * f4(b4));

% Simpson公式
f5 = @(theta) sqrt(4 - sin(theta).^2);
a5 = 0;
b5 = pi/6;
n5 = 4;
h5 = (b5 - a5) / n5;
x5 = a5:h5:b5;
result_simpson_theta = h5/3 * (f5(a5) + 4 * sum(f5(x5(2:2:end-1))) + 2 * sum(f5(x5(3:2:end-2))) + f5(b5));

% Newton-Cotes公式
f6 = @(theta) sqrt(4 - sin(theta).^2);
a6 = 0;
b6 = pi/6;
n6 = 4;
x6 = linspace(a6, b6, n6+1);
h6 = (b6 - a6) / n6;
weights_theta = ones(1, n6+1);
weights_theta(2:2:end-1) = 4;
weights_theta(3:2:end-2) = 2;
weights_theta = weights_theta * h6/3;
result_newton_cotes_theta = sum(f6(x6) .* weights_theta);

disp('积分2的梯形公式结果：');
disp(result_trapezoidal_theta);

disp('积分2的Simpson公式结果：');
disp(result_simpson_theta);

disp('积分2的Newton-Cotes公式结果：');
disp(result_newton_cotes_theta);
