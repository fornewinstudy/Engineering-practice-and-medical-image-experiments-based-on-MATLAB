clc;
clear;
clear all;

f0 = 50;
n1 = 0:7;
n2 = 0:9;
n3 = 0:79;
fs = 200;
x1 = sin(2*pi*f0*n1/fs);
x2 = sin(2*pi*f0*n2/fs);
x3 = sin(2*pi*f0*n3/fs);
subplot(321);
stem(n1,x1);
title('signal x(n),0<=n<=7');
xlabel('n');
axis([0,7,-2.1,2.1]);
subplot(323);
stem(n2,x2);
title('signal x(n),0<=n<=9');
xlabel('n');
axis([0,9,-2.1,2.1]);
subplot(325);
stem(n3,x3);
title('signal x(n),0<=n<=79');
xlabel('n');
axis([0,79,-2.1,2.1]);
N1 = 8;
Xk1 = fft(x1,N1);    %计算的是8点DFT
mag_Xk1 = abs(Xk1(1:N1/2+1));
k1 = 0:N1/2;
%w1 = k1*2*pi/N1;
f1 = k1*fs/N1;%以Hz为单位
subplot(322);
%stem(w1/pi,mag_Xk1,'Filled','MarkerSize',2,'LineWidth',1.5,'color','r');
stem(f1,mag_Xk1);
title('8点DFT的幅度谱');
xlabel('以Hz为单位');
N2 = 10;
Xk2 = fft(x2,N2);    %计算的是10点DFT
mag_Xk2 = abs(Xk2(1:N2/2+1));
k2 = 0:N2/2;
%w2 = k2*2*pi/N2;
f2 = k2*fs/N2;
subplot(324);
%stem(w2/pi,mag_Xk2,'Filled','MarkerSize',2,'LineWidth',1.5,'color','r');
stem(f2,mag_Xk2)
title('10点DFT的幅度谱');
xlabel('以Hz为单位');
N3 = 80;
Xk3 = fft(x3,N3);    %计算的是80点DFT
mag_Xk3 = abs(Xk3(1:N3/2+1));
k3 = 0:N3/2;
%w3 = k3*2*pi/N3;
f3 = k3*fs/N3;
subplot(326);
%stem(w3/pi,mag_Xk3,'Filled','MarkerSize',2,'LineWidth',1.5,'color','r');
stem(f3,mag_Xk3);
title('80点DFT的幅度谱');
xlabel('以Hz为单位');
