%1
%(1)
f = [-1; 2; -3];          % 目标函数系数
A = [1 1 1; -1 -2 -4; 1 -1 1];   % 不等式约束系数
b = [6; -12; 2];          % 不等式约束常数
lb = zeros(3, 1);         % 变量下界
ub = [];                  % 变量上界
[x, fval] = linprog(f, A, b, [], [], lb, ub);
disp(x);                  % 最优解
disp(-fval);              % 最优值
%(2)
f = [-3; 2; -1; -4];     % 目标函数系数
Aeq = [2 4 3 1];         % 等式约束系数
beq = 6;                 % 等式约束常数
A = [-2 4 3 1];          % 不等式约束系数
b = -3;                  % 不等式约束常数
lb = zeros(4, 1);        % 变量下界
ub = [];                 % 变量上界
[x, fval] = linprog(f, A, b, Aeq, beq, lb, ub);
disp(x);                 % 最优解
disp(-fval);             % 最优值
%2
%(1)
% 定义目标函数
fun = @(x) x(1)^2 + x(2)^2 - 2*x(1) - 4*x(2);
% 定义初始点
O3 = [0; 0];
% 定义不等式约束和变量取值范围
A3 = [1 1; -1 0; 0 -1];
b3 = [1; 0; 0];
% 定义变量的下界
lb3 = [0; 0];
% method 1
% 使用fmincon函数求解非线性规划问题
x1 = fmincon(fun, O3, [], [], Aeq3, beq3, lb3, ub3);
% 输出结果
disp(x);
disp(fval);
% method 2
% 求解
[x, fval,~,~] = fmincon(fun,O3, A3, b3, [], [], lb3, [], [], []);
% 输出结果
disp(x);                 % 最优解
disp(fval);             % 最优值
%(2)
% 定义目标函数
fun = @(x) (x(1) - 9/4)^2 + (x(2) - 2)^2;
% 定义不等式约束和变量取值范围
A = [1 0; 1 1; -1 0; 0 -1];
b = [0; 6; 0; 0];
lb = [0; 0];
% 定义非线性约束函数
nonlcon = @(x) x(1)^2 - x(2);
% method 2
% 求解
[x, fval, exitflag, output] = fmincon(fun, [0; 0], A, b, [], [], lb, [], nonlcon, []);
% 输出结果
disp(x);                 % 最优解
disp(fval);             % 最优值