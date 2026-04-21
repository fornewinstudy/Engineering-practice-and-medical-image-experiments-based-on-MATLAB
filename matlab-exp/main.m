clc
clear all
close all

fs = 44100; % 采样频率
dt = 1/fs;  % 采样周期
T16 = 1/fs*2899; % 1/16拍所需时长
t16 = [0:dt:T16];  % 1/16拍
[~,k] = size(t16); % k-记录1/16拍采样点数
t2 = linspace(0,8*T16,8*k);  % 1/2拍
t4 = linspace(0,4*T16,4*k);  % 1/4拍
t8 = linspace(0,2*T16,2*k);  % 1/8拍
% 定义基本的振幅函数
mod2 = sin(pi*t2/t2(end)); % 1/2拍
mod4 = sin(pi*t4/t4(end)); % 1/4拍
mod8 = sin(pi*t8/t8(end)); % 1/8拍

f0 = 261.6; % C调
ScaleTable = [2^(14/12),2^(13/12),2,2^(11/12),2^(10/12),2^(9/12),2^(7/12),2^(5/12),2^(4/12),2^(2/12),2^(1/12),1];
% 1/2拍
h_re2 = mod2.*cos(2*pi*ScaleTable(1)*f0*t2); % 高音re
h_do2s = mod2.*cos(2*pi*ScaleTable(2)*f0*t2); % 高音升do
h_do2 = mod2.*cos(2*pi*ScaleTable(3)*f0*t2); % 高音do
si2 =  mod2.*cos(2*pi*ScaleTable(4)*f0*t2); % si
si2f =  mod2.*cos(2*pi*ScaleTable(5)*f0*t2); % 降si
la2 = mod2.*cos(2*pi*ScaleTable(6)*f0*t2); % la
so2 = mod2.*cos(2*pi*ScaleTable(7)*f0*t2); % so
fa2 = mod2.*cos(2*pi*ScaleTable(8)*f0*t2); % fa
mi2 = mod2.*cos(2*pi*ScaleTable(9)*f0*t2); % mi
re2 = mod2.*cos(2*pi*ScaleTable(10)*f0*t2); % re
do2 = mod2.*cos(2*pi*ScaleTable(12)*f0*t2); % do
blk2 = zeros(size(mod2)); % 休止符
% 1/4拍
h_do4 = mod4.*cos(2*pi*ScaleTable(3)*f0*t4); % 高音do
la4 = mod4.*cos(2*pi*ScaleTable(6)*f0*t4); % la
mi4 = mod4.*cos(2*pi*ScaleTable(9)*f0*t4); % mi
re4 = mod4.*cos(2*pi*ScaleTable(10)*f0*t4); % re
do4s = mod4.*cos(2*pi*ScaleTable(11)*f0*t4); % 升do
% 1/8 notes
fa8 = mod8.*cos(2*pi*ScaleTable(8)*f0*t8); % fa
mi8 = mod8.*cos(2*pi*ScaleTable(9)*f0*t8); % mi
blk8 = zeros(size(mod8)); % 休止符

% 卡门（节选）
s = [h_re2+mi2 h_do2s+mi2 h_do4+mi4 h_do2 h_do4 si2+mi2+re2 si2f+mi2+re2 la2+mi2+re2,...
    blk8 la4 so2+re2 fa2+re2 mi4+do4s fa8 mi8 re4 mi4 so2+re2 fa2+re2 mi2 blk2,...
    h_re2+mi2 h_do2s+mi2 h_do4+mi4 h_do2 h_do4 si2+mi2+re2 si2f+mi2+re2 la2+mi2+re2,...
    blk8 la4 so2+re2 fa2+re2 mi4+do4s fa8 mi8 re4 mi4 fa2+do2 mi2+do2 re2 blk2];
s = s/max(s);
sound(s,fs); % 播放音乐
% 保存音乐到文件
audiowrite('Carmen.mp4',s,fs);
audiowrite('Carmen.flac',s,fs);
