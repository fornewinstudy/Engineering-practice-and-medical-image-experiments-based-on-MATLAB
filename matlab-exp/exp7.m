% 符号计算方法求函数的不定积分和定积分
% (1)
syms x a;% 符号定义
f(x) = x^2 / sqrt(a^2 + x^2);% 公式
int(f(x));  % 求不定积分
fprintf('不定积分:\n'); disp(int(f(x)));
syms x
a = 0;
b = 1;
int(f(x), a, b);  % 求定积分
fprintf('定积分:\n'); disp(int(f(x), a, b));
% (2)
syms x
f = (2 - x^2)^12;% 公式
int(f,x);  % 求不定积分
fprintf('不定积分:\n'); disp(int(f,x));
syms x
a = 0;
b = 1;
int(f, x, a, b);  % 求定积分
fprintf('定积分:\n'); disp(int(f, x, a, b));

% 求级数之和
syms n x;% 符号定义
sum = symsum(x^(2*n-1)/(2*n-1), n, 1, Inf); % 求级数之和
fprintf('级数之和:\n'); disp(sum);

% 求非线性方程的符号解
syms x
eqn = 2*sin(3*x-pi/4) == 1;% 公式
sol = solve(eqn, x);  % 求解符号解
fprintf('非线性方程的符号解:\n'); disp(sol);