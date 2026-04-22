% Step 1: 获取多个.mat文件列表
fileList = dir('./data_ssvep-7_19_CJH_*.mat'); % 修改为你.mat文件的实际路径

% Step 2: 创建一个空矩阵
mergedData = [];

% Step 3: 逐个加载.mat文件并叠加数据
for i = 1:length(fileList)
    % 加载.mat文件
    data = load(fullfile(fileList(i).folder, fileList(i).name));
    
    % 假设每个.mat文件中都包含一个名为'dataMatrix'的矩阵
    % 如果你的.mat文件中矩阵的变量名不同，需要相应修改下一行代码
    dataMatrix = data.data;
    
    % 确保矩阵的列数相同，如果不同可以在这里进行处理
    % 这里假设每个.mat文件的矩阵都具有相同的列数
    
    % 将当前矩阵追加到空矩阵中
    mergedData = [mergedData; dataMatrix];
end

% Step 4: 保存新的矩阵为一个新的.mat文件
save('./merged_data.mat', 'mergedData'); % 修改为你保存的目标路径和文件名
