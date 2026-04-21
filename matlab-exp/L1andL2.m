% 原始数据集
x=[1;2;3;4;5;6;7;8;9;10];
% y=[1.1;2.2;5.5;6.8;5.8;5.5;4.3;4.3;5.6;10.1];
y=[1.1;2.2;1.2;0.5;4.8;5.5;6.3;8.4;7.3;6.1];
% 测试集
x_test = [11;12;13];
y_test = [7.8;8.2;8.5];
figure;
% 显示真实点
plot(x,y,'rx','linewidth',1);
hold on;
% L1&L2
for lamda = [0.001, 0.01, 0.1, 1,10,25]
    % L1范数拟合
    theta = optimization_L1(lamda);
    hypothesis = theta(1)+theta(2)*x+theta(3)*x.^2+theta(4)*x.^3+theta(5)*x.^4;
    % L1拟合曲线
    plot(x,hypothesis,'ColorMode','auto','linewidth',1);
    hold on;
    % L2范数拟合
    theta = optimization_L2(lamda);
    hypothesis = theta(1)+theta(2)*x+theta(3)*x.^2+theta(4)*x.^3+theta(5)*x.^4;
    % L2拟合曲线
    plot(x,hypothesis,'ColorMode','auto','LineStyle','--','linewidth',1);
    hold on;
end
% 添加图例和标签
xlabel('x');
ylabel('y');
% 分组命名
legend('真实点','0.001', '0.001','0.01','0.01', '0.1','0.1','1','1','10','10','25','25');
title('L1 and L2 Fitting with Different Lambda');