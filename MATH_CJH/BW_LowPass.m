clc;
clear all;
fp = 1000;  %1kHz
fstop = 3000;% 3kHz
wp = 2*pi*fp;% rad/s 通带截止频率
ws = 2*pi*fstop;% rad/s 阻带截止频率
Rp = 1; %通带波纹
As = 50;%阻带最小衰减
%设计BW滤波器
[N,wc] = buttord(wp,ws,Rp,As,'s');
[num,den] = butter(N,wc,'s');%H(s)分子分母系数
w = linspace(0,2*pi*5000,5000);
H = freqs(num,den,w);%计算滤波器的频率响应
plot(w/(2*pi),20*log10(abs(H)+eps),'LineWidth',1,'color','b');
xlabel('Hz');
ylabel('20log_1_0|H(j\Omega)|','FontSize',14);

%计算Rp 和As
w = [wp ws];
H = freqs(num,den,w);
fprintf('Rp = %.4f\n',-20*log10(abs(H(1))));
fprintf('As = %.4f\n',-20*log10(abs(H(2))));
N
figure(2);
pzmap(num,den);