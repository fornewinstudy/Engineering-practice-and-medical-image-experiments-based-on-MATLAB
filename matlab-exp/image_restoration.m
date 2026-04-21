% 粗线涂画图像填充
original = imread('Fingerprint256.png');
im = original;
% 均值滤波
% 应用迭代中值滤波
for i = 1:10
    im = medfilt2(im, [3 3]);
end
%未填充区域应取消滤波效果

% 显示模糊后的图像和填充图像
figure;
subplot(2,1,1); 
imshow(original); title('Original Image');
subplot(2,1,2); 
imshow(im); title('filled Image');
% Compute the PSNR value
psnrVal = psnr(im, original);
disp(['PSNR value: ', num2str(psnrVal)]);


% 执行正则化反卷积
imDeconv = deconvreg(im, psf, 0.01);

% 进行盲反卷积
imDeconvBlind = deconvblind(im, psf, 10);

% 显示原始、模糊和恢复的图像
figure;
subplot(2,2,1); imshow(im); title('Original Image');
subplot(2,2,2); imshow(psf); title('Point Spread Function');
subplot(2,2,3); imshow(imDeconv); title('Regularized Deconvolution');
subplot(2,2,4); imshow(imDeconvBlind); title('Blind Deconvolution');

% 细线涂画图像填充
im = imread('Fingerprint256.png');
% 进行边缘检测
edges = edge(im, 'canny');
% Perform segmentation
labels = bwlabel(edges);
numRegions = max(labels(:));
% 使用LSC填充缺失的区域
for i = 1:numRegions
    region = im;
    region(labels ~= i) = 0;
    im(labels == i) = lsc_smooth(region, 5, 0.2);
end
% Display the restored image
imshow(im);

% Compute the PSNR value
original = imread('original_image.jpg');
psnrVal = psnr(im, original);
disp(['PSNR value: ', num2str(psnrVal)]);

% 粗线涂画图像填充
% Perform edge detection
edges = edge(im, 'canny');

% Perform segmentation
labels = bwlabel(edges);
numRegions = max(labels(:));

% Fill in the missing regions using LSC
for i = 1:numRegions
    region = im;
    region(labels ~= i) = 0;
    im(labels == i) = lsc_smooth(region, 5, 0.2);
end

% Display the restored image
imshow(im);

% 逆滤波去模糊
% Load the blurred image and the point spread function
im = imread('blurred_image.jpg');
psf = imread('psf.png');

% Perform inverse filtering
imDeconv = deconvwnr(im, psf, 0);

% Display the restored image
imshow(imDeconv);

% Compute the PSNR value
original = imread('original_image.jpg');
psnrVal = psnr(imDeconv, original);
disp(['PSNR value: ', num2str(psnrVal)]);

% 盲反卷积
% Load the blurred image
im = imread('CrossGame_Blurred.png');

% Perform blind deconvolution
imDeconv = deconvblind(im,10);

% Display the restored image
imshow(imDeconv);

% Compute the PSNR value
original = imread('CrossGame_Blurred.png');
psnrVal = psnr(imDeconv, original);
disp(['PSNR value: ', num2str(psnrVal)]);