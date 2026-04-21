img_rgb = imread('Lenna.png');
img_gray_init = rgb2gray(img_rgb); %将图片改为灰度图
img_gray = double(img_gray_init);%将图片改为双精度型用于计算

%加高斯白噪声,为double型（1）
%img1=double(img_gray) +wgn(size(img_gray,1),size(img_gray,2),20);
% 加椒盐噪声（2）

img1 = img_gray;
noise_density = 0.05; % 噪声密度
noise = rand(size(img1)); % 生成随机矩阵
img1(noise <= noise_density/2) = 0; % 加入黑色噪声
img1(noise >= 1 - noise_density/2) = 255; % 加入白色噪声

[U,S,V] = svd(img_gray);%奇异值分解
[U1,S1,V1] = svd(img1);%噪声图像奇异值分解

%计算对角矩阵S的非零元素个数
S_diag = diag(S);
k = sum(S_diag~=0);
k1=fix(0.05*k);k2=fix(0.1*k);k3=fix(0.4*k);%分别输出压缩为0.05，0.1和0.4的图像
S1_diag = diag(S1);
k_1 = sum(S1_diag~=0);
k4=fix(0.9*k_1);%输出压缩为0.4的图像

%低秩近似表示
BD1 = U(:, 1:k1) * S(1:k1, 1:k1) * V(:, 1:k1)';
BD2 = U(:, 1:k2) * S(1:k2, 1:k2) * V(:, 1:k2)';
BD3 = U(:, 1:k3) * S(1:k3, 1:k3) * V(:, 1:k3)';
BD4 = U1(:, 1:k4) * S1(1:k4, 1:k4) * V1(:, 1:k4)';

%用1-error近似表示相似度
BD1_error=mean(abs((img_gray-BD1)./img_gray));%取前5%个特征值时的error
BD1_error_wipe=find(BD1_error==Inf);%如果原图灰度值为0，就会出现Inf影响求均值，所以将这些Inf值变为0
BD1_error(BD1_error_wipe)=0;
BD1_error_mean=1-mean(BD1_error);

BD2_error=mean(abs((img_gray-BD2)./img_gray));%取前10%个特征值时的error
BD2_error_wipe=find(BD2_error==Inf);
BD2_error(BD2_error_wipe)=0;
BD2_error_mean=1-mean(BD2_error);

BD3_error=mean(abs((img_gray-BD3)./img_gray));%取前40%个特征值时的error
BD3_error_wipe=find(BD3_error==Inf);
BD3_error(BD3_error_wipe)=0;
BD3_error_mean=1-mean(BD3_error);

img_error=mean(abs((img_gray - img1)./img_gray));%噪声图像的error
img_error_wipe=find(img_error==Inf);
img_error(img_error_wipe)=0;
img_error_mean=1-mean(img_error);

BD4_error=mean(abs((img_gray - BD4)./img_gray));%取前40%个特征值时的error
BD4_error_wipe=find(BD4_error==Inf);
BD4_error(BD4_error_wipe)=0;
BD4_error_mean=1-mean(BD4_error);

%用图像矩阵的元素（像素）比来计算压缩比press
n1 = numel(img_gray_init);% 原矩阵的元素数
u1 = numel(U(:, 1:k1));% 左奇异矩阵的元素数
v1 = numel(V(:, 1:k1)');% 右奇异矩阵的元素数
s1 = k1.^2;% 奇异矩阵的元素数
press1 = (u1+v1+s1)/n1;

u2 = numel(U(:, 1:k2));% 左奇异矩阵的元素数
v2 = numel(V(:, 1:k2)');% 右奇异矩阵的元素数
s2 = k2.^2;% 奇异矩阵的元素数
press2 = (u2+v2+s2)/n1;

u3 = numel(U(:, 1:k3));% 左奇异矩阵的元素数
v3 = numel(V(:, 1:k3)');% 右奇异矩阵的元素数
s3 = k3.^2;% 奇异矩阵的元素数
press3 = (u3+v3+s3)/n1;

u4 = numel(U1(:, 1:k4));% 左奇异矩阵的元素数
v4 = numel(V1(:, 1:k4)');% 右奇异矩阵的元素数
s4 = k4.^2;% 奇异矩阵的元素数
press4 = (u4+v4+s4)/n1;

%BD转换回uint类型用于显示
img_svd1 = uint8(BD1);
img_svd2 = uint8(BD2);
img_svd3 = uint8(BD3);
img_svd4 = uint8(BD4);

%原图转换回uint类型用于显示
img_gray_int = uint8(img_gray);
img1_int = uint8(img1);

%plt画图
subplot(2,3,1);
imshow(img_gray_int);
title('原图');
subplot(2,3,2);
imshow(img_svd1);
title({['压缩至0.05,相似度为',num2str(BD1_error_mean)];['压缩比为',num2str(press1)]});
subplot(2,3,3);
imshow(img_svd1);
title({['压缩至0.1,相似度为',num2str(BD2_error_mean)];['压缩比为',num2str(press2)]});
subplot(2,3,4);
imshow(img_svd2);
title({['压缩至0.4,相似度为',num2str(BD3_error_mean)];['压缩比为',num2str(press3)]});
subplot(2,3,5);
imshow(img1_int);
title(['加噪声原图','相似度为',num2str(img_error_mean)]);
subplot(2,3,6);
imshow(img_svd4);
title({['噪声图像压缩至0.9,相似度为',num2str(BD4_error_mean)];['压缩比为',num2str(press4)]});