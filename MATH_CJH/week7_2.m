% 设计参数
ws = 0.2 * pi;
wp = 0.3 * pi;
Rp = 1;    % dB
As = 50;   % dB

% 计算通带和阻带的截止频率
wc = (wp + ws) / 2;

% 计算通带和阻带的宽度
bw = wp - ws;

% 计算阶数
N = ceil((As - 7.95) / (2.285 * bw));

% 定义等间隔的频率点
frequencies = [0, ws/pi, wp/pi, 1];

% 定义每个频带的权重
weights = [0, 1, 0];

% 设计滤波器
b = firpm(N, frequencies, weights, [10^(Rp/20), 10^(-As/20)]);

% 频率响应
freqz(b, 1, 1024);

% 画图
title('Frequency Response of FIR Highpass Filter');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
grid on;
