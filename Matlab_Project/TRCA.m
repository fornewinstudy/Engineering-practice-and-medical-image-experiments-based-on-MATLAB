% -------------------------------------------------------------------------
% 主程序，用于任务相关成分分析
%
% 数据集 (Sx.mat)：
%   从单个被试者记录的包含40个目标的SSVEP数据集。刺激通过联合频率-相位调制（JFPM）生成
%     - 刺激频率：8.0 - 15.8 Hz，间隔为0.2 Hz
%     - 刺激相位：0pi, 0.5pi, 1.0pi, 和 1.5pi
%     - 通道数：Oz
%     - 记录块数：6
%     - 每个时段的数据长度：1.5 [秒]
%     - 采样率：250 [Hz]
%     - 数据格式：# 通道数，# 数据点数，# 目标数，# 块数
%
% 其他相关函数：
%   TRCA.m
% -------------------------------------------------------------------------
 
clear all
close all
 
load('Freq_Phase.mat') % 加载刺激频率和相位信息
load('subject1.mat') % 加载SSVEP数据集
eeg = subject1; % 将SSVEP数据集存储到变量eeg中
[N_channel, ~, N_target, N_block] = size(eeg); % 获取数据集的通道数、目标数和块数
 
%% ------------分类-------------
tic % 启动计时器，用于计算代码运行时间
% LOO交叉验证（Leave-One-Out Cross Validation）
for loocv_i = 1:N_block
    Testdata = squeeze(eeg(:, :, :, loocv_i)); % 获取测试数据
    Traindata = eeg;
    Traindata(:, :, :, loocv_i) = []; % 剔除测试数据后的训练数据
    
    for targ_i = 1:N_target
        aver_Traindata(:, :, targ_i) = squeeze(mean(squeeze(Traindata(:,:,targ_i,:)),3)); % 计算平均训练数据
    end % end targ_i
    
    % 分配标签（根据测试数据的频率信息）
    truelabels = freqs;
    
    N_testTrial = size(Testdata, 3);
    for trial_i = 1:N_testTrial
        coefficience = zeros(1, length(truelabels));
        for targ_j = 1:length(freqs)
            % 使用训练数据计算空间滤波器wn
            wn = TRCA(squeeze(Traindata(:,:,targ_j,:)));
            % 计算测试数据和平均训练数据之间的相关性
            weighted_train = wn' * aver_Traindata(:,:,targ_j);
            weighted_test = wn' * Testdata(:,:,trial_i);
            coefficienceMatrix = corrcoef(weighted_test, weighted_train);
            coefficience(targ_j) = coefficienceMatrix(1, 2);
        end % end targ_i
        
        % 目标检测
        [~, index] = max(coefficience);
        outputlabels(trial_i) = freqs(index);
    end % end trial_i
    
    trueNum = sum((outputlabels - truelabels) == 0);
    acc(loocv_i) = trueNum / length(truelabels); % 计算准确率
    fprintf('第 %d 折交叉验证的准确率为：%.4f，样本数：%d/%d\n', loocv_i, acc(loocv_i), trueNum, N_testTrial)
end % end looCv_i
t = toc; % 停止计时器，获取总运行时间

% 数据可视化
fprintf('\n-----------------------------------------\n')
disp(['总时间：', num2str(t), ' 秒'])
fprintf('6折交叉验证的平均准确率为：%.4f\n', mean(acc))
