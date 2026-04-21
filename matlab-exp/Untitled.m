coefficients = [4, -12, -14, 5, 9];
x = sym('x');  % 创建符号变量x
polynomial = poly2sym(coefficients, x);

% 计算多项式的微分
derivative = polyder(coefficients);
derivative_polynomial = poly2sym(derivative, x);

% 计算多项式的积分
integral = polyint(coefficients);
integral_polynomial = poly2sym(integral, x);

disp('Polynomial:');
disp(polynomial);

disp('Derivative of the polynomial:');
disp(derivative_polynomial);

disp('Integral of the polynomial:');
disp(integral_polynomial);

% 绘制多项式和其微分
fplot(polynomial, 'b', 'DisplayName', 'Polynomial');
hold on;
fplot(derivative_polynomial, 'r', 'DisplayName', 'Derivative');
hold off;
xlabel('x');
ylabel('y');
title('Plot of Polynomial and its Derivative');
legend('Location', 'best');
grid on;

