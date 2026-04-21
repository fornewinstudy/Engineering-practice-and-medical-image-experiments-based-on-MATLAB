clc;
clear all;
wform = ecg(500);%产生类似心电波形的信号
fs = 500;
T = 1/fs;
N = length(wform);
n = 0:N-1;
noise = 0.25*sin(2*pi*50*n*T);
x = wform + noise;%心电波形加噪声
%下面语句用等波纹方法设计了一个具有线性相位的FIR滤波器
d = designfilt('lowpassfir', ...
    'PassbandFrequency',0.15,'StopbandFrequency',0.2, ...
    'PassbandRipple',1,'StopbandAttenuation',60, ...
    'DesignMethod','equiripple');
y = filtfilt(d,x);%零相位滤波
y1 = filter(d,x);%滤波

subplot(3,1,1);
plot(wform);
title('Original Waveform','fontsize',12);
subplot(3,1,2);
plot(x);
title('ECG Waveform with noise','fontsize',12);
subplot(3,1,3);
plot(y);
hold on;
plot(y1,'-.','Linewidth',1);
title('Filtered Waveforms','fontsize',12);
legend('filtered by using function filtfilt','filtered by using function filter');



