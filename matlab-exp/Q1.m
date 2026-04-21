% 设置采样点数和间距
N = 100;
dx = pi/50;

% 生成采样点
x = (0:N-1)*dx;
% 生成目标函数
f = sin(2*x);

% 添加高斯噪声
rng default
sigma = 0.2;
noise = sigma*randn(size(x));
y = f + noise;

% 离散傅里叶变换
Ff = fft(f)/N;
F = fft(y)/N;
freq = (0:N-1)/(N*dx);

% 绘制函数和采样结果
figure
subplot(2,1,1)
plot(x, f, 'r', x, y, 'b')
xlabel('x')
ylabel('f(x) and y(x)')
legend('f(x)', 'y(x)')
% 绘制离散傅里叶变换结果
subplot(2,1,2)
stem(freq, abs(F),'b')
xlabel('Frequency')
ylabel('Magnitude')
title('Discrete Fourier Transform')
legend('F')
% 使用均值滤波% 设置均值滤波器的窗口大小
window_size = 3;

% 对 y 进行均值滤波
y_filtered = movmean(y, window_size);

% 离散傅里叶变换
F_filtered = fft(y_filtered)/N;

% 计算信噪比
SNR1 = 10*log10(sum(f.^2)/sum((f-y_filtered).^2));
% 输出信噪比
fprintf('均值滤波SNR: %.2f dB\n', SNR1)

% 绘制均值滤波后的结果
figure
subplot(2,1,1)
plot(x, f, 'r', x, y_filtered, 'b')
xlabel('x')
ylabel('f(x) and y_{filtered}(x)')
legend('f(x)', 'y_{filtered}(x)')
% 绘制离散傅里叶变换结果
title('均值滤波法');
subplot(2,1,2)
stem(freq, abs(F_filtered))
xlabel('Frequency')
ylabel('Magnitude')
title('Discrete Fourier Transform of y_{filtered}')
legend('F')

% 使用傅里叶系数阈值法进行去噪
% 设置阈值
threshold = 0.2;

% 获取傅里叶系数
F_noise = F ;

% 将小于阈值的系数置为0
F_noise(abs(F_noise) < threshold) = 0;

% 反变换得到去噪后的信号
y_denoised = ifft(F_noise*N);
% 计算信噪比
SNR2 = 10*log10(sum(f.^2)/sum((f-y_denoised).^2));

% 绘制去噪后的结果
figure
subplot(2,1,1)
plot(x, f, 'r', x, y_denoised, 'b')
xlabel('x')
ylabel('f(x) and y_{denoised}(x)')
legend('f(x)', 'y_{denoised}(x)')
title('傅里叶系数阈值法');
% 绘制离散傅里叶变换结果
subplot(2,1,2)
stem(freq, abs(F_filtered + F_noise))
xlabel('Frequency')
ylabel('Magnitude')
title('Discrete Fourier Transform of y_{denoised}')
legend('F')

% 输出信噪比
fprintf('傅里叶系数阈值法SNR: %.2f dB\n', SNR2)
%{
可以看到，在添加高斯噪声后，采样结果的波形出现了明显的扰动。离散傅里叶变换的结果显示出了扰动的频率和幅度，可以用来分析噪声的特性。
均值滤波法通过取一定窗口内的均值来平滑信号，可以一定程度上去除高斯噪声。
傅里叶系数阈值法则是将噪声的幅度较小的频率系数置为0，保留较大幅度的信号，从而实现去噪。
在本例中，傅里叶系数阈值法的效果比均值滤波法更好，可以清晰地还原出原始函数的波形，并且噪声被有效去除。最后计算的信噪比也表明，傅里叶系数阈值法去噪后的信号质量比均值滤波法更高。
%}