function G=ContrastWidening(ImPath,fa,fb,ga,gb)
x  = imread(ImPath);            %%% 图片读取 
[m,n,c] = size(x);
if(c>1)
    F=rgb2gray(x);
end
G=zeros(m,n);
k1 = ga/fa;                          
k2 = (gb-ga)/(fb-fa);             
k3 = (255-gb)/(255-fb);              
for i=1:m    
    for j=1:n
        if F(i,j)<fa
            G(i,j) = k1*F(i,j);
        elseif F(i,j)<fb
            G(i,j) = k2*(F(i,j)-fa)+ga;
        else
            G(i,j) = k3*(F(i,j)-fb)+gb;
        end
    end
end
G = uint8(G);
figure,imshow(x);
figure,imshow(G);
end
