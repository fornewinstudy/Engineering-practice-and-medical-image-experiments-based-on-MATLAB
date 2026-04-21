% 给定数据
x = [1;2;3;4;5;6;7;8;9;10];
y = [1.1;2.2;1.2;0.5;4.8;5.5;6.3;8.4;7.3;6.1];
% 定义目标函数
m = length(y);
J = @(theta) sum((theta(1)+theta(2).*x+theta(3).*x.^2+theta(4).*x.^3+theta(5).*x.^4-y).^2)/(2*m);
% 定义L2范数的惩罚项
lamda = 0.5;
penalty = @(theta) (lamda/2)*sum(theta(2:end).^2); % 注意不惩罚theta0
% 定义总的代价函数
costFunc = @(theta) J(theta) + penalty(theta);
% 使用fminunc函数进行优化
options = optimoptions(@fminunc,'Algorithm','quasi-newton');
theta_init = [0 0 0 0 0];
theta = fminunc(costFunc,theta_init,options);
% 绘制拟合曲线
y_fit = theta(1) + theta(2).*x + theta(3).*x.^2 + theta(4).*x.^3 + theta(5).*x.^4;
plot(x,y,'o',x,y_fit);
xlabel('x');
ylabel('y');
legend('原始数据','拟合曲线');