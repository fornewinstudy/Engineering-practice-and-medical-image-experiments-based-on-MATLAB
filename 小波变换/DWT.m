function ww = DWT(N)
    % 获取'sym8'小波的低通和高通分解滤波器系数
    [h, g] = wfilters('sym8', 'd');  
    
    % 计算滤波器长度
    L = length(h);
    % 计算最大分解层数
    rank_max = log2(N);  
    % 计算最小分解层数，使用floor替代int8
    rank_min = floor(log2(L)) + 1;
    
    % 初始化变换矩阵为单位矩阵
    ww = speye(N);
    
    % 矩阵构造
    for jj = rank_min:rank_max
        % 计算当前层的信号长度
        nn = 2^jj;
        
        % 构造稀疏格式的低通和高通滤波器向量，后面补零
        p1_0 = sparse([h, zeros(1, nn - L)]);
        p2_0 = sparse([g, zeros(1, nn - L)]);
        
        % 初始化p1和p2
        p1 = sparse(nn/2, nn);
        p2 = sparse(nn/2, nn);
        
        % 向量循环移位构造滤波器组
        for ii = 1:nn/2
            p1(ii, :) = circshift(p1_0', 2 * (ii - 1))';
            p2(ii, :) = circshift(p2_0', 2 * (ii - 1))';
        end
        
        % 构造正交矩阵
        w1 = [p1; p2];
        mm = N - length(w1);
        w = sparse([w1, zeros(length(w1), mm); zeros(mm, length(w1)), speye(mm)]);
        
        % 累积变换矩阵
        ww = ww * w;
        
        clear p1; clear p2;
    end
end
