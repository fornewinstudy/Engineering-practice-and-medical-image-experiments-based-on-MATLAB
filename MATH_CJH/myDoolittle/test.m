% 测试矩阵
A = [1 -1 3; 2 -4 6; 4 -9 2];

% 调用函数
[L, U] = myDoolittle(A);

% 验证分解的正确性
result = L * U;

% 显示结果
disp('原始矩阵 A：');
disp(A);

disp('分解得到的下三角矩阵 L：');
disp(L);

disp('分解得到的上三角矩阵 U：');
disp(U);

disp('L * U 的结果：');
disp(result);

% 验证可靠性
tolerance = 1e-6;
isCorrect = isequal(A, result) || max(abs(A - result)) < tolerance;

disp(['结果是否正确：', num2str(isCorrect)]);

