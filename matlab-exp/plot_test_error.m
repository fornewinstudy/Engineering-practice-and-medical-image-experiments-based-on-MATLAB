function plot_test_error(x_test, y_test)
% L1 lamda范围
lamda_list = 0:1:100;
% L2 lamda范围
lamda_list2 = 0:10:1000;
test_error_list_l1 = zeros(length(lamda_list), 1);
test_error_list_l2 = zeros(length(lamda_list), 1);
% 计算测试误差
for i = 1:length(lamda_list)
    lamda = lamda_list(i);
    % L1
    [~, test_error_l1] = linear_regression( x_test, y_test, lamda, 1);
    % L2
    [~, test_error_l2] = linear_regression( x_test, y_test, lamda, 2);
    % 储存为误差列表
    test_error_list_l1(i) = test_error_l1;
    test_error_list_l2(i) = test_error_l2;
end
% 画图
subplot(1,2,1);
plot(lamda_list, test_error_list_l1,'DisplayName','L1');
xlabel('lambda');
ylabel('test error');
title('Comparison of L1 norm');
legend('Location', 'best');
hold on;
subplot(1,2,2);
plot(lamda_list2, test_error_list_l2,'DisplayName','L2');
xlabel('lambda');
ylabel('test error');
title('Comparison of L2 norm');
legend('Location', 'best');
grid on;
end