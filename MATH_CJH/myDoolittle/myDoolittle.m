function [L, U] = myDoolittle(A)
    [m, n] = size(A);
    
    if m ~= n
        error('输入矩阵必须是方阵。');
    end
    
    L = eye(n);
    U = zeros(n);
    
    for k = 1:n
        % 计算 U 的第 k 行
        U(k, k:n) = A(k, k:n);
        
        % 计算 L 的第 k 列
        L(k+1:end, k) = A(k+1:end, k) / U(k, k);
        
        % 更新矩阵 A
        A(k+1:end, k+1:end) = A(k+1:end, k+1:end) - L(k+1:end, k) * U(k, k+1:end);
    end
end
