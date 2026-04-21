function [y_train, test_error] = linear_regression(x_test,y_test, lamda, norm_type)
% 在训练集上训练线性回归模型
if norm_type == 1
    % L1范数拟合
    theta = optimization_L1(lamda);
    y_train = theta(1)+theta(2)*x_test+theta(3)*x_test.^2+theta(4)*x_test.^3+theta(5)*x_test.^4;
else
     % L2范数拟合
    theta = optimization_L2(lamda);
    y_train = theta(1)+theta(2)*x_test+theta(3)*x_test.^2+theta(4)*x_test.^3+theta(5)*x_test.^4;
end
% 计算测试误差
test_error = mean((y_train - y_test).^2);
end