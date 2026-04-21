%2(1)
% 目标函数
fun1 = @(x) x(1)^2 + x(2)^2 - 2*x(1) - 4*x(2);
% 定义不等式约束系数
A3 = [1 1];
% 不等式约束常数
b3 = 1;
% 定义初始点
x0 = [0; 0];
% 定义变量的下界
lb3 = [0; 0];
% 定义变量的上界
ub3 = [];
% 输入方法选择
num = input("请输入方法：");
% 根据数字选择方法
switch num
    case 1
        disp("方法1");
        % 使用fmincon求解
        [x3, fval3] = fmincon(fun1, x0, A3, b3,[],[], lb3, ub3);
    case 2
        disp("方法2");
        nonlcon = @circlecon;
        % 使用nonlcon求解非线性规划问题
        [x3, fval3] = fmincon(fun1, x0, A3, b3, [], [], [], [], nonlcon);
    otherwise
        disp("输入错误，请重新输入");
end
% 显示结果
disp('问题3的最优解:')
disp(x3)
disp('问题3的最优值:')
disp(fval3)

% 定义非线性约束函数
function [c,ceq] = circlecon(x)
c = x(1)^2 + x(2)^2 - 2*x(1) - 4*x(2); % 目标函数
ceq = [];
end