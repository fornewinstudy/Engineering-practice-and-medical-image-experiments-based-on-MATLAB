clc;
clear;
clear all;

n = 0:9;
x = cos(0.48*pi*n)+cos(0.52*pi*n); %10个样本
subplot(321);
stem(n,x);
title('signal x(n),0<=n<=9');
xlabel('n');
axis([0,9,-2.1,2.1]);
N1 = 10;
Xk1 = fft(x,N1);    %计算的是10点DFT
mag_Xk1 = abs(Xk1(1:N1/2+1));
k1 = 0:N1/2;
w1 = k1*2*pi/N1;
subplot(322);
stem(w1/pi,mag_Xk1);
title('幅度谱');
xlabel('以\pi rad为单位');

n2 = 0:99;
x2 = cos(0.48*pi*n2)+cos(0.52*pi*n2); %100个样本
subplot(323);
stem(n2,x2);
title('signal x(n),0<=n<=99');
xlabel('n');
axis([0,99,-2.1,2.1]);
N2 = 100;
Xk2 = fft(x2,N2);    %计算的是100点DFT
mag_Xk2 = abs(Xk2(1:N2/2+1));
k2 = 0:N2/2;
w2 = k2*2*pi/N2;
subplot(324);
stem(w2/pi,mag_Xk2);
title('幅度谱');
xlabel('以\pi rad 为单位');

n3 = 0:99;
y = [x,zeros(1,90)];    %10个样本，90个0
subplot(325);
stem(n3,y,'Filled','MarkerSize',2,'LineWidth',1.5,'color','b');
title('signal x(n)+90 zeros','Color','b','FontSize',12);
xlabel('n');
axis([0,99,-2.1,2.1]);
N3 = 100;
Yk = fft(y,N3); %计算信号y的100点DFT
mag_Yk = abs(Yk(1:N3/2+1));
k3 = 0:N3/2;
w3 = k3*2*pi/N3;
subplot(326);
stem(w3/pi,mag_Yk,'Filled','MarkerSize',2,'LineWidth',1.5,'color','r');
title('幅度谱','Color','b','FontSize',12);
xlabel('以\pi为单位','Color','b','FontSize',12);
