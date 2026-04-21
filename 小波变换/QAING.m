load woman;  
subplot(121);
image(X);colormap(map);title('原始图像');%画出原图像
 
[c,s]=wavedec2(X,3,'sym4');  %进行二层小波分解
 
len=length(c);
justdet = prod(s(1,:));%截取细节系数起始位置（不处理近似系数）  
%处理低频分解系数，突出轮廓
for I =1:justdet
    if(c( I )>250)
      c( I )=1.5*c( I );
    end
end
%处理高频分解系数，弱化细节
for I =justdet:len
    if(c( I ) < 150)
      c( I )=0.75*c( I );
    end
end
 
nx=waverec2(c,s,'sym4');%分解系数重构
 
subplot(122);
image(nx);title('增强图像')%画出增强图像