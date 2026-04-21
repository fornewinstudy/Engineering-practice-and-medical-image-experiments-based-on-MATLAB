clc;
clear all;
fp = 1000;  %1kHz
fstop = 3000;% 3kHz
wp = 2*pi*fp;
ws = 2*pi*fstop;
Rp = 1; 
As = 50;
%设计Ellip 滤波器
[N,wc] = ellipord(wp,ws,Rp,As,'s');
[num,den] = ellip(N,Rp,As,wc,'s');

w = linspace(0,2*pi*5000,5000);
H = freqs(num,den,w);%滤波器的频率响应
plot(w/(2*pi),20*log10(abs(H)+eps),'r','LineWidth',1);
xlabel('Hz','FontSize',14);
ylabel('20log_1_0|H(j\Omega)|','FontSize',14);
%计算Rp 和As
w = [wp ws];
H = freqs(num,den,w);
fprintf('Rp = %.4f\n',-20*log10(abs(H(1))));
fprintf('As = %.4f\n',-20*log10(abs(H(2))));
N
figure(2);
pzmap(num,den);