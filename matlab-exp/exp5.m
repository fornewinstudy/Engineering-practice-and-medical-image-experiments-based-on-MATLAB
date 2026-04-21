% 定义一个符号变量x
syms x;
% 定义多项式
F = 3.*x.^4 - 6.*x.^2 + 1;
G = x.^2 - 1;
% 定义 f 和 g
f = [3 0 -6 0 1];
g = [0 0 1 0 -1];
% 多项式加法
f_add_g = f + g;
disp("f + g =");disp(f_add_g);
% 多项式减法
f_sub_g = f - g;
disp("f - g =");disp(f_sub_g);
% 重新书写g，使得更适合乘除运算
g = [1 0 -1];
% 多项式乘法
f_mul_g = conv(f,g);
disp("f * g =");disp(f_mul_g);
% 多项式除法
[f_div_g,r] = deconv(f,g);
disp("f / g =");disp(f_div_g);
disp('余数：');disp(r);
% 多项式商的导函数
f_dfdg = polyder(f_div_g);
disp("df/dg =");disp(f_dfdg);

% (2)
% 定义已知点
x = [1 3 5 7 9 11 13 15 17 19];
y = [5.9 6.4 7.8 7.6 6.9 5.2 3.4 1.5 -0.7 -2];
% 线性插值估算
y_estimated_linear = interp1(x, y, 10, 'linear');
subplot(2,3,1);
plot(x,y);hold on;
plot(10,y_estimated_linear, 'o');grid on;
title('线性插值估算');
% 最近邻插值估算
y_estimated_nearest = interp1(x, y, 10, 'nearest');
subplot(2,3,2);
plot(x,y);hold on;
plot(10,y_estimated_nearest, 'o');grid on;
title('最近邻插值估算');
% 三次多项式插值
y_estimated_cubic = interp1(x,y,10,'cubic');
subplot(2,3,3);
plot(x,y);hold on;
plot(10,y_estimated_cubic, 'o');grid on;
title('三次多项式插值');
% 自然样条插值估算
y_estimated_spline = interp1(x, y, 10, 'spline');
subplot(2,3,4);
plot(x,y);hold on;
plot(10,y_estimated_spline, 'o');grid on;
title('自然样条插值估算');
% 三次样条插值估算
y_estimated_pchip = interp1(x, y, 10, 'pchip');
subplot(2,3,5);
plot(x,y);hold on;
plot(10,y_estimated_pchip, 'o');grid on;
title('三次样条插值估算');

% (3)
% 定义已知点
x = [1 2 4 7 9 12 13 15 17];
y = [1.5 3.9 6.6 11.7 15.6 18.8 19.6 20.6 21.1];
% 3次多项式拟合
p3 = polyfit(x, y, 3);
x_fit = linspace(1, 17, 101);
y_fit = polyval(p3, x);
y_fit1 = polyval(p3, x_fit);
% 绘制拟合曲线
subplot(1,2,1);
plot(x, y, 'o', x_fit,y_fit1 ,x, y_fit,'*');
title('3次多项式拟合');
xlabel('x');
ylabel('y');
legend('已知点', '拟合曲线','对应拟合点', 'Location', 'southeast');
% 5次多项式拟合
subplot(1,2,2);
p5 = polyfit(x, y, 5);
y_fit = polyval(p5, x);
y_fit1 = polyval(p5, x_fit);
% 绘制拟合曲线
plot(x, y, 'o', x_fit,y_fit1 ,x, y_fit,'*');
title('5次多项式拟合');
xlabel('x');
ylabel('y');
legend('已知点', '拟合曲线','对应拟合点', 'Location', 'southeast');