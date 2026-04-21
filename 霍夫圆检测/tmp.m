clear;
clc;
close all;
fname = 'img2.png';
test_img = "img2.png";
I = imread(fname);
[m,n,k] = size(I);
if k==3
    I=rgb2gray(I); % Transform RGB image to a Gray one. 
end
figure; imshow(uint8(I));

% % prerprocessing,histogram equation and filter
% I = adapthisteq(I);
% fltr4img = fspecial('gaussian',5,1);
% I = filter2( fltr4img,I);

% CACD main
cirparam = curature_HT(I,7,1.8,0);
cirparam = circheck(cirparam);

if ~isempty(cirparam)
%     figure; imshow(rgb2gray((imread(fname)))); colormap('gray'); axis image;
    figure; imshow((imread(test_img))); colormap('gray'); axis image;
    hold on;
    plot(cirparam(:,1), cirparam(:,2), 'r+','LineWidth',1);
    for k = 1 : size(cirparam, 1),
       distance = sqrt((cirparam(k,1) - 281)^2 + (cirparam(k,2) - 230)^2);
       % 检查距离是否大于16
       if distance < 3.3
            DrawCircle(cirparam(k,1), cirparam(k,2), cirparam(k,3), 128, 'r-');
       end
    end
    hold off;
    title(['Raw Image with Circles Detected ', ...
     '(center positions and radii marked)']);
    % 保存图像
    imwrite(imread(test_img), 'detected_circles.png'); % 或者使用 imwrite 函数保存图像
end

size(cirparam,1)