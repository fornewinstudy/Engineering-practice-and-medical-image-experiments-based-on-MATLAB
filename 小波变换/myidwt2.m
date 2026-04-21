function [idwc]=myidwt2(L,H,width,height)
 
idwc1=zeros(height,width);
idwc2=zeros(height,width);
 
% h=[0.482962913145,0.836516303738,0.224143868042,-0.129409522551];
% g=[-0.129409522551,-0.224143868042,0.836516303738,-0.482962913145];
 
h=[-0.129409522551,0.224143868042,0.836516303738,0.482962913145];
g=[-0.482962913145,0.836516303738,-0.224143868042,-0.129409522551];
 
image2=zeros(height,width+3);
% image2(:,1)=L(:,1);
% image2(:,2)=L(:,1);
% image2(:,3)=L(:,1);
image2(:,1)=0;
image2(:,2)=0;
image2(:,3)=0;
 
image2(:,4:width+3)=L(:,:);
 
for i=1:height
    for j=1:width
        sum=h(1)*image2(i,j)+h(2)*image2(i,j+1)+h(3)*image2(i,j+2)+h(4)*image2(i,j+3);
        idwc1(i,j)=sum;
    end
end
 
image2=zeros(height,width+3);
%image2(:,1)=H(:,1);
image2(:,1)=0;
image2(:,width+2)=H(:,width);
image2(:,width+3)=H(:,width);
image2(:,2:width+1)=H(:,:);
 
 
for i=1:height
    for j=1:width
        sum=g(1)*image2(i,j)+g(2)*image2(i,j+1)+g(3)*image2(i,j+2)+g(4)*image2(i,3);
        idwc2(i,j)=sum;
    end
end
 
idwc=idwc1+idwc2;
 
end