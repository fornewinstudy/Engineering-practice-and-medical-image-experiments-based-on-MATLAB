%利用 mat2gray、imadjust 对图像进行变换
I0=dicomread('CT000010');
Iinfo=dicominfo('CT000010');
subplot(1,3,1);imshow(I0);title('原始图像CT000010');
ww=Iinfo.WindowWidth;
wc=Iinfo.WindowCenter;
wl=wc-ww/2;
wh=wc+ww/2;
slope=Iinfo.RescaleSlope;
inter=Iinfo.RescaleIntercept;
%CT值转灰度值
cwl=(wl-inter)/slope;
cwh=(wh-inter)/slope;
%使用函数mat2gray
Imat2=mat2gray(I0,[cwl,cwh]);
imwrite(Imat2,'Imat2.bmp');%另存为 bmp 格式图像
%使用函数imadjust
I0=double(I0);
I1=double(I0+abs(min(I0(:))));
I2=I1/(max(I1(:)));
l=(cwl+abs(min(I0(:))))/max(I1(:));
h=(cwh+abs(min(I0(:))))/max(I1(:));
Iad=imadjust(I2,[l,h],[0,1]);
imwrite(Iad,'Iad.bmp');%另存为 bmp 格式图像
subplot(1,3,2);imshow(Imat2);title('mat2gray处理后的图像');
subplot(1,3,3);imshow(Iad);title('imadjust处理后的图像');
