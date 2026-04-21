clear
%(1)
% 定义被积函数
f = inline('sqrt(cos(x.^2)+1)','x');
% 离散化积分区间
a = 0;  % 积分下限
b = 2.*pi;  % 积分上限
n = 1000;  % 离散化步数
% 输入方法选择
num = input("请输入方法：");
% 根据数字选择方法
switch num
    case 1
        % 辛普生法
        disp("辛普生法");
        [I,n]= quadl(f,a,b); %Lobatto quadrature
        % 显示结果
        fprintf('定积分近似值为：%f\n', I);
    case 2
        % 高斯-克朗罗德法
        disp("高斯-克朗罗德法");
        f = @(x)sqrt(cos(x.^2)+1);
        [I,err] = quadgk(f,a,b);
        % 显示结果
        fprintf('定积分近似值为：%f\n', I);
     case 3
         % 梯形积分法
         disp('梯形积分法');
         x = linspace(a, b, n);
         % 计算被积函数在离散化点上的取值
         y = f(x);
         % 使用梯形法求解定积分
         I = trapz(x, y);
         % 显示结果
         fprintf('定积分近似值为：%f\n', I);
    otherwise
        disp("输入错误，请重新输入");
end

%(2)
equations = @(x) [
    sin(x(1)) + x(2)^2 + log(x(3)) - 7;
    3 * x(1) + 2^x(2) - x(3)^3 + 1;
    x(1) + x(2) + x(3) - 5];
initialGuess = [1; 1; 1];  % 初值 x0=1, y0=1, z0=1
solution = fsolve(equations, initialGuess);
disp('方程组的数值解x,y,z');
disp(solution);

%(3)
% 定义函数
f = @(x)(x^3 + cos(x) + x*log(x))/exp(x);
[xmin, fmin, ~] = fminbnd(f, 0, 1);
% 显示结果
disp(['函数最小值点：', num2str(xmin)]);
disp(['函数最小值：', num2str(fmin)]);

%(4)
% 定义常微分方程
syms y(x) 
eqn = diff(y,x,2) - 3*diff(y,x) + 2*y - 1;
Dy = diff(y,x);
cond = [y(0)==1, Dy(0)==1];
ySol(x) = dsolve(eqn,cond);
disp('常微分方程的数值解');disp(ySol(x));