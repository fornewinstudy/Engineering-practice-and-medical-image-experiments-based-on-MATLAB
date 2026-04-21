clear;close all;
% 原图
img = imread('CrossGame_Clear.png');
img = im2double(img);

% 读取模糊图像
blurredImage = imread('CrossGame_Blurred.png');
blurredImage = im2double(blurredImage);

% 显示原图像
figure(1),imshow(img);
title('原图像');

% 显示模糊图像
figure,imshow(blurredImage);
title('模糊图像');

% 原图像傅里叶变换
J=rgb2gray(img);

K=fft2(J);%傅里叶变换

M=fftshift(K);%直流分量移到频谱中心

N=abs(M);%计算频谱幅值

P=(N-min(min(N)))/(max(max(N))-min(min(N)))*225;%归一化

figure;
subplot(1,2,1);
imshow(P);
title('原图像傅里叶变换频谱');

% 模糊图像傅里叶变换
J1=rgb2gray(blurredImage);

K1=fft2(J1);%傅里叶变换

M1=fftshift(K1);%直流分量移到频谱中心

N1=abs(M1);%计算频谱幅值

P1=(N1-min(min(N1)))/(max(max(N1))-min(min(N1)))*225;%归一化

subplot(1,2,2);
imshow(P1);
title('模糊图像傅里叶变换频谱');

% 对模糊图像模糊长度进行估计
f1=rgb2gray(blurredImage);

f1=im2double(f1);

h = fspecial('Sobel'); %Sobel算子

J = conv2(f1,h,'same'); %Sobel算子微分

IP=abs(fft2(J));

%图像能量谱密度
S=fftshift(real(ifft2(IP)));

figure;
plot(S);
title('自相关图');

% 设定运动模糊长度和角度
len=12; theta=30;

% psf
psf=fspecial('motion',len,theta);

% 图像复原
lucy=deconvlucy(blurredImage,psf);

% 显示复原图像
figure;
imshow(lucy);
title(' Lucy richardson图像复原');

% 计算PSNR值
psnr_blur = psnr(img, blurredImage);
fprintf('PSNR value of blurry image: %f\n', psnr_blur);
psnr_blind = psnr(lucy, img);
fprintf('PSNR value of blind deconvolution image: %f\n', psnr_blind);

