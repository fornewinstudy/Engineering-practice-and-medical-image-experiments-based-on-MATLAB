clc;clear;close all;
Image = im2double(rgb2gray(imread('CT.png')));   % 通过消除图像色调和饱和度信息同时保留亮度实现将RGB图像或彩色图转换为灰度图像，即灰度化处理的功能 
                                                    % 将读取的图像灰度化并增大精度
[h,w] = size(Image);        % 获取图像尺寸  h:height,高度；w:width 宽度
imshow(Image);title('原始lotus图像');    %  展示灰度图像Image
NewImage1 = zeros(h,w);      %  生成 h行 w 列的二维矩阵
NewImage2 = zeros(h,w);       
NewImage3 = Image;           
a = 30/256;b = 100/256;c= 75/256;d= 200/256;            
for x = 1 : w               % 最外层循环 宽度
    for y = 1 : h           % 内层循环   高度
        if Image(y,x)<a     % 在灰度图像中 按列从上至下循环 若（y,x）处值<a时 对图像进行下行处理
            NewImage1(y,x) = Image(y,x)*c/a;        %  分段处理
        elseif Image(y,x)<b  % 若（y,x）处值<b时 对图像进行下行处理
            NewImage1(y,x) = (Image(y,x)-a)*(d-c)/(b-a)+c;
        else                 % 其他情况 做以下处理
            NewImage1(y,x) = (Image(y,x)-b)*(1-d)/(1-b)+d;
        end
        if Image(y,x)>a&& Image(y,x)<b    % 介于(a,b)之间  做下行处理
            NewImage3(y,x) = (Image(y,x)-a)*(d-c)/(b-a)+c;
        end
    end
end
NewImage2 = imadjust(Image,[a;b],[c;d]);    % imadjust(image, [low_in high_in], [low_out high_out], gamma)  
                                            % 低于low_in与高于high_in的值被剪裁，低于low_in映射到low_out;高于high_in
                                            % 映射到high_out  ;
                                            % 另一个参数：gamma指定曲线的形状，该曲线将图像中的强度值映射为函数图像。此行代码未使用此参数
figure;imshow(NewImage1);title('分段线性灰度级变换图像');
figure;imshow(NewImage2);title('截断式灰度级变换图像');
figure;imshow(NewImage3);title('高低灰度级保持不变图像');


