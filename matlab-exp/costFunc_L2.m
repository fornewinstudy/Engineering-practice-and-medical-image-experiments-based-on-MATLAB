function  [J,gradient]= costFunc_L2(theta,lamda)
x=[1;2;3;4;5;6;7;8;9;10];
% y=[1.1;2.2;5.5;6.8;5.8;5.5;4.3;4.3;5.6;10.1];
y=[1.1;2.2;1.2;0.5;4.8;5.5;6.3;8.4;7.3;6.1];
% 定义目标函数
m=size(x,1);
hypothesis=theta(1)+theta(2).*x+theta(3).*x.^2+theta(4).*x.^3+theta(5).*x.^4;
delta=hypothesis-y;
%  lamda = 0;
% L2范数正则化项的加入可以使得某些参数被压缩为零，特征选择
J = sum(delta .^ 2)/(2 * m)+lamda*norm(theta,2)^2;
% 对于每个参数的梯度都加入符号函数sign(theta(i))
% 在theta(i)不为零时，让梯度为lamda，否则梯度为0，即将theta(i)压缩为零。
gradient(1)=sum(delta.*1)/m + lamda*sign(theta(1));
gradient(2)=sum(delta.*x)/m + lamda*sign(theta(2));
gradient(3)=sum(delta.*x.^2)/m + lamda*sign(theta(3));
gradient(4)=sum(delta.*x.^3)/m + lamda*sign(theta(4));
gradient(5)=sum(delta.*x.^4)/m + lamda*sign(theta(5));
end