I = double(imread('1.jpg')) / 255;
p = I;
r = 4; % try r=2, 4, or 8
eps = 0.2^2; % try eps=0.1^2, 0.2^2, 0.4^2
 
O = guidedfilter(I, p, r, eps);
 
subplot(121), imshow(I);
subplot(122), imshow(O);