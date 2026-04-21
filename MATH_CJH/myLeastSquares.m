function [a0, a1] = myLeastSquares(Q, y)
    % 使用最小二乘法拟合经验公式
    
    % 确保输入是列向量
    Q = Q(:);
    y = y(:);
    
    % 构建矩阵A和向量b
    A = [Q, Q.^2];
    b = y;
    
    % 使用最小二乘法求解系数
    coefficients = A\b;
    
    % 提取系数
    a0 = coefficients(1);
    a1 = coefficients(2);
end
