function y = filterbank(eeg, fs, idx_fb)
% 滤波器组设计，将脑电图数据分解成子带分量
%
% function y = filterbank(eeg, fs, idx_fb)
%
% 输入:
%   eeg             : 输入的脑电图数据
%                     （通道数，数据长度[样本数]，试次数）
%   fs              : 采样率
%   idx_fb          : 滤波器组分析中的滤波器索引
%
% 输出:
%   y               : 经过滤波器组分解的子带分量

if nargin < 2
    error('stats:test_fbcca:LackOfInput', '输入参数不足。'); 
end

if nargin < 3 || isempty(idx_fb)
    warning('stats:filterbank:MissingInput',...
        '缺少滤波器索引。将使用默认值 (idx_fb = 1)。'); 
    idx_fb = 1;
elseif idx_fb < 1 || 10 < idx_fb
    error('stats:filterbank:InvalidInput',...
        '子带数量必须在 0 < idx_fb <= 10 之间。'); 
end

[num_chans, ~, num_trials] = size(eeg);
fs=fs/8;
passband = [6, 14, 22, 30, 38, 46, 54, 62, 70, 78];
stopband = [4, 10, 16, 24, 32, 40, 48, 56, 64, 72];
Wp = [passband(idx_fb)/fs, 90/fs];
Ws = [stopband(idx_fb)/fs, 100/fs];
[N, Wn]=cheb1ord(Wp, Ws, 3, 40);
[B, A] = cheby1(N, 0.5, Wn);

y = zeros(size(eeg));
if num_trials == 1
    for ch_i = 1:1:num_chans
        y(ch_i, :) = filter(B, A, eeg(ch_i, :));
    end % ch_i
else
    for trial_i = 1:1:num_trials
        for ch_i = 1:1:num_chans
            y(ch_i, :, trial_i) = filter(B, A, eeg(ch_i, :, trial_i));
        end % trial_i
    end % ch_i
end % if num_trials == 1
