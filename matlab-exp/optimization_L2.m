function theta=optimization_L2(lamda)
%{
它通过近似目标函数的海森矩阵来求解最优解。
在该代码中，使用fminunc函数进行拟牛顿优化，
其中@costFunc表示要优化的目标函数，inittheta为初始的参数值，
options为优化选项，GradObj表示目标函数是否需要梯度（这里需要），
MaxIter表示最大迭代次数。最终输出的theta即为最优解。
%}
options=optimset('GradObj','on','MaxIter',10);
inittheta=[0.1 0.1 0.1 0.1 0.1]';
theta=fminunc(@costFunc_L2,inittheta,options,lamda);
end