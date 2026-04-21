%1(2)
% 目标函数
f2 = [-3; -2; -1; -4];
% 不等式约束系数
A2 = [2, -4, -3, -1];
% 不等式约束常数
b2 = -3;
% 等式约束系数
Aeq = [2, 4, 3, 1];
% 等式约束常数
beq = 6;
% 变量下界
lb2 = zeros(4, 1);
 % 变量上界
ub2 = [];                
% 使用linprog求解
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x2, fval2] = linprog(f2, A2, b2, Aeq, beq, lb2, ub2, options);
% 显示结果
disp('问题2的最优解:')
disp(x2)
disp('问题2的最优值:')
disp(-fval2)