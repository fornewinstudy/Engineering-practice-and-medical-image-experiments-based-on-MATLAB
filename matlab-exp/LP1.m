clear
%1(1)
% 目标函数
f1 = [-1; 2; -3];
% 不等式约束系数
A1 = [1, 1, 1;
     -1, -2, -4;
     -1, 1, -1];
% 不等式约束常数
b1 = [6; -12; -2];
% 变量下界
lb1 = [-inf,0,0];
% 变量上界
ub1 = [];                  
% 使用linprog求解
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x1, fval1] = linprog(f1, A1, b1, [], [], lb1, ub1, options );
% 显示结果
disp('问题1的最优解:')
disp(x1)
disp('问题1的最优值:')
disp(-fval1)