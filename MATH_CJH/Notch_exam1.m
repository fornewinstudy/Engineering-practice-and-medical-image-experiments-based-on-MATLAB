clc;
clear all;
%设置初值
fs = 1000;%采样频率
T = 1/fs;
N = 1000;
n=0:N-1;
f1 = 50;
f2 = 100;
x=sin(2*pi*f1*n*T)+0.3*sin(2*pi*f2*n*T) + sin(2*pi*5*n*T);%原信号 
%陷波器1的设计
r1 = 0.97;
b1=[1 -2*cos(2*pi*f1*T) 1];
a1=[1 -2*r1*cos(2*pi*f1*T) r1*r1];
figure(1);
freqz(b1,a1,N,fs);%陷波器1特性显示
title('50Hz的陷波器');
y1=filtfilt(b1,a1,x);%陷波器1对输入信号滤波
%陷波器2的设计
r2 = 0.96;
b2=[1 -2*cos(2*pi*f2*T) 1];
a2=[1 -2*r2*cos(2*pi*f2*T) r2*r2];
figure(2);
freqz(b2,a2,N,fs);%陷波器2特性显示
title('100Hz的陷波器');
y2=filtfilt(b2,a2,y1);%陷波器2对输入信号滤波
% 信号显示部分
figure(3);
subplot(311);
plot(x);
title('原始信号');
subplot(312);
plot(y1);
title('经过50Hz陷波后的信号');
subplot(313);
plot(y2);
title('又经过100Hz陷波后的信号');