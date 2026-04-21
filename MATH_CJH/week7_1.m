% 设计参数
w1s = 0.4 * pi;
w1p = 0.3 * pi;
w2p = 0.7 * pi;
w2s = 0.6 * pi;
Rp = 0.25;  % dB
As = 40;    % dB

% 计算通带和阻带的截止频率
wc1 = sqrt(w1s * w1p);
wc2 = sqrt(w2s * w2p);

% 计算通带和阻带的宽度
bw1 = w1p - w1s;
bw2 = w2p - w2s;

% 计算阶数
N = ceil(As / (6.02 * Rp));

% 设计滤波器
b = fir1(N, [wc1, wc2]/pi, 'bandpass', hann(N+1));

% 频率响应
freqz(b, 1, 1024);

% 画图
title('Frequency Response of FIR Bandstop Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
