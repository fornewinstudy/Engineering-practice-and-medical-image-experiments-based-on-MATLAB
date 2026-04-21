clc
clear all
% 依次读取样本文件并将图像矩阵变成1*784，按列储存在data矩阵内
%读取目录下的png图像，数据结构为结构体
file = dir('.\mnist\0\*.png');
% 计算图像文件数量
n=length(file); 
data=[]; % 初始化
for i=1:n
% 读取图像
img=imread(['.\mnist\0\',file(i).name]); 
% 将28*28的图像矩阵先变成1*784
I=imresize(img,[1,784]);
% 图像矩阵按列储存在data矩阵内
data(i,:)=I(:,:); 
end
% 同上
file = dir('.\mnist\1\*.png');
n=length(file);
for i=11:10+n
img=imread(['.\mnist\1\',file(i-10).name]);
I=imresize(img,[1,784]);
data(i,:)=I(:,:);
end
% 同上
file = dir('.\mnist\6\*.png');
n=length(file);
for i=21:20+n
img=imread(['.\mnist\6\',file(i-20).name]);
I=imresize(img,[1,784]);
data(i,:)=I(:,:);
end
% 对图像向量进行归一化处理
img_norm = zscore(double(data));
% 对图像进行PCA降维（pca函数）
% 每个样本提取2个主成分
[coeff, B, latent] = pca(img_norm, 'NumComponents', 2);
% 输出降维后的score矩阵
disp(B);
% 将score矩阵按照不同行分组（即不同数字图像文件）
group1 = B(1:10,:);
group2 = B(11:20,:);
group3 = B(21:30,:);
% 第一组数据用红色圆形表示，第二组数据用绿色三角形表示，第三组数据用蓝色正方形表示
scatter(group1(:,1), group1(:,2), 'ro');
hold on;
scatter(group2(:,1), group2(:,2), 'g^');
scatter(group3(:,1), group3(:,2), 'bs');
hold off;
% 分组命名
legend('Group 1（0）', 'Group 2（1）', 'Group 3（6）');
xlabel('PC1');
ylabel('PC2');
title('0,1,6 降维分类PCA ');