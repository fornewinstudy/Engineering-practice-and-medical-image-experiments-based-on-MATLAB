function hat_y=omp(s,T,N)                          %定义omp函数，输入参数为测量值向量s，传感矩阵T和稀疏度N  
                                                   %获取传感矩阵T的大小，返回一个包含行数和列数的数组  
Size=size(T);                                     %  提取传感矩阵T的行数，即测量值的数目  
M=Size(1);                                        %  初始化待重构的谱域(变换域)向量为长度为N的零向量 
hat_y=zeros(1,N);                                                  
Aug_t=[];                                         %  初始化增量矩阵为空矩阵  
r_n=s;                                            % 初始化残差值为测量值向量s  
 
for times=1:M/4;                                  % 开始迭代，迭代次数设定为测量值数目的1/4（这里可能是一个经验值或者特定设置）  
    for col=1:N;                                  % 遍历传感矩阵T的所有列向量 
        product(col)=abs(T(:,col)'*r_n);          % 计算传感矩阵的每一列与当前残差的内积，并取其绝对值  
    end
    [val,pos]=max(product);                       %  找到内积绝对值最大的列，并返回其值和位置
    Aug_t=[Aug_t,T(:,pos)];                       %  将找到的列添加到增量矩阵中
    T(:,pos)=zeros(M,1);                          %  将传感矩阵中已选中的列置为零（实际上应该去掉这列，但这里简化了操作）
    aug_y=(Aug_t'*Aug_t)^(-1)*Aug_t'*s;           %  使用最小二乘法求解当前增量矩阵下的稀疏系数  
    r_n=s-Aug_t*aug_y;                            %  更新残差
    pos_array(times)=pos;                         %  记录本次迭代中找到的列的位置
    
    if (norm(r_n)<9)                              %   判断残差二范数是否小于9（这个阈值可能需要根据具体问题调整）  
        break;
    end
end
hat_y(pos_array)=aug_y;                           %  根据记录的位置信息，将稀疏系数赋值给重构向量对应的位置