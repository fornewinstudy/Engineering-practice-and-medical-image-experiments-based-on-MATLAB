% clear
% % 数字滤波器规格:
% wp = 0.3 * pi;  % 数字通带频率（弧度）
% ws = 0.4 * pi;  % 数字阻带频率（弧度）
% Rp = 8;         % 通带波纹（分贝）
% As = 20;        % 阻带衰减（分贝）
% 
% % 模拟原型规格:
% T = 1;  % 设置 T = 1
% OmegaP = (2/T) * tan(wp/2);  % 预翘模拟原型通带频率
% OmegaS = (2/T) * tan(ws/2);  % 预翘模拟原型阻带频率
% 
% % 模拟原型阶数计算:
% N = ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1))) / (2 * log10(OmegaP/OmegaS)));
% fprintf('\n*** Butterworth 滤波器阶数 = %2.0f \n', N);
% N = 6;
% OmegaC = OmegaP / ((10^(Rp/10)-1)^(1/(2*N)));  % 模拟BW原型截止频率
% wn = 2 * atan((OmegaC * T) / 2);  % 数字BW截止频率
N = 6;
wn = 0.84;
% 数字Butterworth滤波器设计:
[b, a] = butter(N, wn, 's');
[h,w]=freqs(b,a, linspace(0,1,1000)*pi);
% % [b0, B, A] = dirccas(b, a);
% 
% % 绘制幅度谱
% figure;
% freqz(b, a, 'whole', 1000, 1);
% title('Frequency Response');
% 
% % 绘制零极点图
% figure;
% zplane(b, a);
% title('Pole-Zero Plot');

% 统计通带衰减和阻带衰减
% [H, f] = freqz(b, a,linspace(0, 1000)*pi);
passband_attenuation = -min(20 * log10(abs(h(w<=(0.3*pi)))));
stopband_attenuation = -max(20 * log10(abs(h(w>=(0.4*pi)))));

fprintf('\n通带衰减: %f dB\n', passband_attenuation);
fprintf('阻带衰减: %f dB\n', stopband_attenuation);
