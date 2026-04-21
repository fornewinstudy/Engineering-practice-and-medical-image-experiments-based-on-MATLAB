clear;
Wp = 0.3 * pi;  % 通带角频率
Ws = 0.4 * pi;  % 阻带角频率
Ap = 6;  % 通带衰减
As = 17;  % 阻带衰减
T = 1;  % 采样周期
Fs = 1 / T;  % 采样频率
wp = Wp * Fs;  % 数字通带角频率
ws = Ws * Fs;  % 数字阻带角频率

% 计算Butterworth滤波器的阶数和截止频率
N = buttord(wp, ws, Ap, As, 's');
wc = wp / ((10^(0.1*Ap) - 1)^(1 / (2 * N)));

% 设计Butterworth滤波器
[num, den] = butter(N, wc, 's');

% 使用脉冲响应不变法进行离散化
[numd, dend] = impinvar(num, den, Fs);

% 绘制频率响应曲线
w = linspace(0, pi, 512);
h = freqz(numd, dend, w);
plot(w/pi, abs(h));
title('脉冲响应不变法');

% 计算设计滤波器的通带衰减和阻带衰减
w1 = [Wp, Ws];
h1 = freqz(numd, dend, w1);
fprintf('Ap= %.4f\n', -20 * log10(abs(h1(1))));
fprintf('As= %.4f\n', -20 * log10(abs(h1(2))));
