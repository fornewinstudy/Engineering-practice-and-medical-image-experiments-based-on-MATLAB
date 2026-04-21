% 第1题
% if
score = input('请输入百分制成绩：'); % 输入
if score >= 0 && score <= 100 % 判断该成绩的合理性
if score >= 90 %A分段
disp('成绩等级为A');
elseif score >= 80 %B分段
disp('成绩等级为B');
elseif score >= 70 %C分段
disp('成绩等级为C');
elseif score >= 60 %D分段
disp('成绩等级为D');
else  %E分段
disp('成绩等级为E');
end
else %对不合理的成绩应输出出错信息
disp('成绩输入不合理，请重新输入');
end
% switch
score = input('请输入百分制成绩：');
if score >= 0 && score <= 100 % 判断该成绩的合理性
switch floor(score/10) % 成绩换算
case {10,9}
disp('成绩等级为A'); %A分段
case 8
disp('成绩等级为B'); %B分段
case 7
disp('成绩等级为C'); %C分段
case 6
disp('成绩等级为D'); %D分段
otherwise
disp('成绩等级为E'); %E分段
end
else %对不合理的成绩应输出出错信息
disp('成绩输入不合理，请重新输入');
end
% 第2题
% 循环
tic % 计算运行时间
y = 1;
n = input('请输入n:');
for x = 1:n
    y = y.*((2.*x).^2)./((2.*x-1).*(2.*x+1)); % 计算公式
end
toc
disp(y) %显示
% 向量运算
tic
n = input('请输入n:');
A = zeros(1,n);% 预先分配内存
for x = 1:n
    A(x)=((2.*x).^2)./((2.*x-1).*(2.*x+1)); % 计算公式
end
toc
Y = prod(A); % prod函数
disp(Y) %显示
% 第3题
x = input('请输入x:'); % 输入
%x = 1:10; % x为向量
%x = [1 2 3;4 5 6]; % x为矩阵
b = fx(x); % 函数引用
disp(x)
disp(b) %展示