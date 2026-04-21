%拟牛顿法
%它通过近似目标函数的海森矩阵来求解最优解
function theta=optimization_L1(lamda)
% GradObj表示目标函数是否需要梯度（这里需要）
% MaxIter表示最大迭代次数
options=optimset('GradObj','on','MaxIter',10);
% inittheta为初始的参数值
inittheta=[0.1 0.1 0.1 0.1 0.1]';
% @costFunc表示要优化的目标函数,options为优化选项,传入lamda
theta=fminunc(@costFunc_L1,inittheta,options,lamda);
% 最终输出的theta即为最优解
end
