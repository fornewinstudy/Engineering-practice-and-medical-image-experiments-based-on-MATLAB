function [dwc1,dwc2]=mydwt2(image,width,height)
 
dwc1=zeros(height,width);
dwc2=zeros(height,width);
 
h=[0.482962913145,0.836516303738,0.224143868042,-0.129409522551];
g=[-0.129409522551,-0.224143868042,0.836516303738,-0.482962913145];
 
image2=zeros(height,width+5);
image2(:,1)=image(:,1);
image2(:,2)=image(:,1);
image2(:,width+3)=image(:,width);
image2(:,width+4)=image(:,width);
image2(:,width+5)=image(:,width);
image2(:,3:width+2)=image(:,:);
 
for i=1:height
    for j=1:width
        sum=h(1)*image2(i,j+2)+h(2)*image2(i,j+3)+h(3)*image2(i,j+4)+h(4)*image2(i,j+5);
        dwc1(i,j)=sum;
    end
end
 
 
for i=1:height
    for j=1:width
        sum=g(1)*image2(i,j)+g(2)*image2(i,j+1)+g(3)*image2(i,j+2)+g(4)*image2(i,j+3);
        dwc2(i,j)=sum;
    end
end
 
end
3061