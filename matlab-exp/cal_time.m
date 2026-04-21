function [x, elapsedTime] = cal_time(A, b, method)
% 运行时间开始
tic;
switch method
% SVD
    case 'svd'
    [U, S, V] = svd(A,'econ');
    % 由svd得到广义逆矩阵
    G = V*(S\U');
    % 求解
    x = G*b; 
% 左逆
    case 'left_inv'
        A_left_inv = (A'* A ) \ A';
        x = A_left_inv * b;
% 右逆
    case 'right_inv'
        A_right_inv = A' / (A * A');
        x = A_right_inv * b;
% pinv
    case 'pinv'
        x = pinv(A) * b;
% QR分解
    case 'QR'
        [Q,R] = qr(A);
        x = R \ Q' * b;
otherwise
error('Invalid method');
end
elapsedTime = toc;
end