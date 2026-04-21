clc;
clear;
close all;

f = imread('CT.png');
f = f(:,:,1);
imshow(f);
w = fspecial('laplacian',0);
g1 = imfilter(f,w,'replicate');

%%
%二阶微分算子-laplace
% imshow(g1);

%加法运算得到锐化图像
% figure; imshow(f+g1);

%解决出现负灰度归零的问题
f2=im2double(f);
g2=imfilter(f2,w,'replicate');
% figure; imshow(g2);
% figure; imshow(f2-g2);

%换模板
w2 = [1 1 1;1 -8 1;1 1 1];
g3=imfilter(f2,w2,'replicate');
% imshow(f2-g3);

% %幂变换增强对比度
% res=imadjust(f2-g3,[0  1],[0  1],0.6);
% imshow(res);
%%
%一阶微分算子-sobel
hx=[-1 -2 -1;0 0 0 ;1 2 1];%生产sobel垂直梯度模板  
hy=hx';                    %生产sobel水平梯度模板  

grad_x=filter2(hx,f2,'same'); 
grad_y=filter2(hy,f2,'same');  

grad=abs(grad_x) + abs(grad_y);  %得到图像的sobel梯度  

% imshow(grad);

%平滑Sobel图像

wAve = fspecial('average',[3 3]);
ave = imfilter(f2, wAve);
% figure; imshow(ave);

%c*e掩模图像
mask = (f2-g2).*ave;
% imshow(mask);

%加法运算锐化图像
res = mask + f2;
% figure; imshow(res);
%幂变换增强对比度
res=imadjust(f,[0  1],[0  1],0.6);
figure; imshow(res);