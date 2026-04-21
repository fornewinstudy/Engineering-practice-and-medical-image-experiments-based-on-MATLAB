% 生成数据
x = linspace(-5, 5);
% 曲线函数
y = exp(-(x.^2)./2)./(2*pi);
% 绘制图形
subplot(1,2,1);
plot(x, y);
% 设定坐标与标题
xlabel('x');
ylabel('y');
title('y = exp(-x.^2/2)./(2*pi)');
hold on;
subplot(1,2,2);
fplot( @(t)t.^2, @(t)5*t.^3, [-1,1], 'r');
% 设定坐标与标题
xlabel('x');
ylabel('y');
title('x=t^2, y=5t^3');

% 生成数据
u = linspace(0, pi, 100);
v = linspace(0, pi, 100);
% meshfrid得到平面区域内的网格坐标矩阵
[U, V] = meshgrid(u, v);
% 曲面函数
X = (1 + cos(U)).*cos(V);
Y = (1 + cos(U)).*sin(V);
Z = sin(U);
% 绘制图形
figure;
% 子图1: plot3函数
subplot(1, 3, 1);
% plot3函数
plot3(X(:), Y(:), Z(:), '.', 'MarkerSize', 10);
% 设定坐标与标题
xlabel('x');
ylabel('y');
zlabel('z');
title('plot3');
% 子图2: mesh函数
subplot(1, 3, 2);
% mesh函数
mesh(X, Y, Z);
% 设定坐标与标题
xlabel('x');
ylabel('y');
zlabel('z');
title('mesh');
% 子图3: surf函数
subplot(1, 3, 3);
% surf函数
surf(X, Y, Z);
% 设定坐标与标题
xlabel('x');
ylabel('y');
zlabel('z');
title('surf');

% 读取gif图像
[img,map] = imread('C:\Users\86187\Desktop\shuxueshiyan.gif','frames','all');
% 显示动画
for i=1:size(img,4) %显示img中第i帧图像
    imshow(img(:,:,:,i),map);
    drawnow; % 更新图像并显示
end

% 制作动画
for i=1:3
    % 转换为str，便于格式化
    k=int2str(i);
    % 读取一连串图片
    k1=strcat('C:\Users\86187\Desktop\',k,'.png');
    a1=imread(k1);
    % 图片格式
    image(a1);
    % 捕获图像作为影片帧
    m(:,i)=getframe;
end
% 播放动画
movie(m,40);

