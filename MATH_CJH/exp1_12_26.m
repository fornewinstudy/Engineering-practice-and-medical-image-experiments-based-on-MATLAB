% 梯形公式
f1 = @(x) (1 - exp(-x)).^(1/2) ./ x;
a1 = 1;
b1 = 4;
n1 = 6;
h1 = (b1 - a1) / n1;
x1 = a1:h1:b1;
result_trapezoidal = h1 * (0.5 * f1(a1) + sum(f1(x1(2:end-1))) + 0.5 * f1(b1));

% Simpson公式
f2 = @(x) (1 - exp(-x)).^(1/2) ./ x;
a2 = 1;
b2 = 4;
n2 = 6;
h2 = (b2 - a2) / n2;
x2 = a2:h2:b2;
result_simpson = h2/3 * (f2(a2) + 4 * sum(f2(x2(2:2:end-1))) + 2 * sum(f2(x2(3:2:end-2))) + f2(b2));

% Newton-Cotes公式
f3 = @(x) (1 - exp(-x)).^(1/2) ./ x;
a3 = 1;
b3 = 4;
n3 = 6;
x3 = linspace(a3, b3, n3+1);
h3 = (b3 - a3) / n3;
weights = ones(1, n3+1);
weights(2:2:end-1) = 4;
weights(3:2:end-2) = 2;
weights = weights * h3/3;
result_newton_cotes = sum(f3(x3) .* weights);

disp('积分1的梯形公式结果：');
disp(result_trapezoidal);

disp('积分1的Simpson公式结果：');
disp(result_simpson);

disp('积分1的Newton-Cotes公式结果：');
disp(result_newton_cotes);
