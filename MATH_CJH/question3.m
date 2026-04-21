clc;
clear;
clear all;

f1 = 2;
f2 = 2.02;
f3 = 2.07;
fs = 10;
N = 1000;%写成参数，便于更改
n = 0:N-1;
%n = 0:999;
x = sin(2*pi*f1*n/fs)+sin(2*pi*f2*n/fs)+sin(2*pi*f3*n/fs); %N个样本
subplot(221);
%stem(n,x,'Filled','MarkerSize',2,'LineWidth',1.5,'color','b');
plot(n,x);%数据点数多的时候经常用plot绘制
title('signal x(n),0<=n<=9');
xlabel('n');
axis([0,99,-3.1,3.1]);

N1 = 10;
Xk1 = fft(x,N1);    %计算的是10点DFT
mag_Xk1 = abs(Xk1(1:N1/2+1));
k1 = 0:N1/2;
%w1 = k1*2*pi/N1;
f1 = k1*f1/N1;
subplot(222);
%stem(w1/pi,mag_Xk1,'Filled','MarkerSize',2,'LineWidth',1.5,'color','r');
stem(f1,mag_Xk1);
title('10点DFT的幅度谱');
%xlabel('以\pi为单位','Color','b','FontSize',12);
xlabel('以Hz为单位');


N2 = 100;
Xk2 = fft(x,N2);    %计算的是100点DFT
mag_Xk2 = abs(Xk2(1:N2/2+1));
k2 = 0:N2/2;
%w2 = k2*2*pi/N2;
f2 = k2*fs/N2;
subplot(223);
%stem(w2/pi,mag_Xk2,'Filled','MarkerSize',2,'LineWidth',1.5,'color','r');
stem(f2,mag_Xk2);

title('100点DFT的幅度谱');
%xlabel('以\pi为单位','Color','b','FontSize',12);
xlabel('以Hz为单位');

N3 = 1000;
Xk3 = fft(x,N3);    %计算的是1000点DFT
mag_Xk3 = abs(Xk3(1:N3/2+1));
k3 = 0:N3/2;
%w3 = k3*2*pi/N3;
f3 = k3*fs/N3;
subplot(224);
%stem(w3/pi,mag_Xk3,'Filled','MarkerSize',2,'LineWidth',1.5,'color','r');
stem(f3,mag_Xk3);
title('1000点DFT的幅度谱');
xlabel('以Hz为单位');