%2 
% 读取图像
img = im2bw(imread('D:\Matlab.R2021a\Data_CJH\exp_B.png'));
% 找到非0元素的坐标
[x1 ,x2] = find(img);
% 组成以每个元素为样本（每行），坐标为数据的矩阵
X = [x1 x2];
% 每个样本提取2个主成分
[coeff, B, latent] = pca(X, 'NumComponents', 2);
% 计算需要旋转的角度
theta = atan2d(coeff(2,1), coeff(1,1));
% 将图像旋转回正面
rotated_img = imrotate(img, -theta);
% 显示结果图像
subplot(1,2,1);
imshow(img);
title('原图');
subplot(1,2,2);
imshow(rotated_img);
title('结果图像');

% 1
f1 = im2bw(imread('D:\Matlab.R2021a\Data_CJH\exp_A.png'));
f2 = im2bw(imread('D:\Matlab.R2021a\Data_CJH\exp_B.png'));
f3 = im2bw(imread('D:\Matlab.R2021a\Data_CJH\exp_C.png'));
subplot(131),imshow(f1),title('第一幅图像');
subplot(132),imshow(f2),title('第二幅图像');
subplot(133),imshow(f3),title('第三幅图像');
[x1 ,x2] = find(f1);
X = [x1 x2];
P = principalcomps(X,2);
A = P.A;
Y = (A*(X'))';
miny1 = min(Y(:,1));
miny2 = min(Y(:,2));
y1 = round(Y(:,1) - miny1+min(x1));
y2 = round(Y(:,2) - miny2+min(x2));
idx = sub2ind(size(f1),y1,y2);
fout = false(size(f1));
fout(idx) = 1;
fout = imclose(fout,ones(3));
fout = rot90(fout,2);
subplot(131),imshow(fout),title('第一幅图主分量的变换');
subplot(132),imshow(fout),title('第二幅图主分量的变换');  %将上面的f1换成f2即可
subplot(133),imshow(fout),title('第三幅图主分量的变换');    %将上面的f1换成f3即可
