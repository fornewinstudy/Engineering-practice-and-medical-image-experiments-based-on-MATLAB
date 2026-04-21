% 复合梯形公式
f = @(x) x * exp(x) / (1 + x)^2;
a = 0;
b = 1;
n = 4;
h = (b - a) / n;
x = a:h:b;
result_trapezoidal = h * (0.5 * f(a) + sum(f(x(2:end-1))) + 0.5 * f(b));

% 复合Simpson公式
result_simpson = h/3 * (f(a) + 4 * sum(f(x(2:2:end-1))) + 2 * sum(f(x(3:2:end-2))) + f(b));

disp('复合梯形公式结果：');
disp(result_trapezoidal);

disp('复合Simpson公式结果：');
disp(result_simpson);
