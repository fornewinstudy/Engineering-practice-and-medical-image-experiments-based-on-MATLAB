clc;clear;close all;

test=importdata('iris.mat');
test1=test(:,1:4);
%temp=test1(:,3);
%test1(:,3)=test1(:,1);
%test1(:,1)=temp;
%test1([1:60],1)=test1([1:60],1)*0.67;

r=size(test1,1);
c=size(test1,2);

avg=repmat(mean(test1),r,1);
new_test=test1./avg;

%灰色关联求权重
Y=max(test1,[],2);
Y1=repmat(Y,1,c);
new_test=abs(new_test-Y1);

a=min(min(new_test));
b=max(max(new_test));
ro=0.5;%灰色关联系数
new_test=(a+ro*b)./(new_test+ro*b);

gamma=mean(new_test);%贡献度
weight=gamma./(sum(gamma,2));%权重

%topsis求分数
test1=zscore(test1);
 
test_max=max(test1);
test_min=min(test1);

test_max1=sum(weight.*(test1-repmat(test_max,r,1)).^2,2).^0.5;
test_min1=sum(weight.*(test1-repmat(test_min,r,1)).^2,2).^0.5;
 
S=test_min1./(test_min1+test_max1);
S_stand=S./(repmat(sum(S),r,1));
%final存放一列分数和一列对于target
final(:,1)=S(:,1);
final(:,2)=test(:,5);
 
%探索整体规律即不同标签分数排布
class1=final(1:50,:);
class2=final(51:100,:);
class3=final(101:150,:);

mean1=mean(class1(:,1));
min1=min(class1(:,1));
max1=max(class1(:,1));

mean2=mean(class2(:,1));
min2=min(class2(:,1));
max2=max(class2(:,1));

mean3=mean(class3(:,1));
min3=min(class3(:,1));
max3=max(class3(:,1));
%发现分数随标签数增大整体上涨

%交叉验证
indices = crossvalind('Kfold',size(final,1),3);
acc=[15,1];
for n=1:max(indices)
    %训练，求出不同标签分数均值
    train_set=[]; train_label=[];
    train_set=final(find(indices~=n),1);
    train_label=final (find(indices~=n),2);
    
    tp1=0;
    tp_size1=0;
    tp2=0;
    tp_size2=0;
    tp3=0;
    tp_size3=0;
    for m=1:size(train_set)
        if train_label(m)==1
            tp1=tp1+train_set(m);
            tp_size1=tp_size1+1;
        end
        if train_label(m)==2
            tp2=tp2+train_set(m);
            tp_size2=tp_size2+1;
        end
        if train_label(m)==3
            tp3=tp3+train_set(m);
            tp_size3=tp_size3+1;
        end
    end
    c1_mean=tp1/tp_size1;
    c2_mean=tp2/tp_size2;
    c3_mean=tp3/tp_size3;
    
    %测试，根据距方大小确定分类
    test_set=[]; test_label=[];
    test_set= final(find(indices==n),1);
    test_label=final(find(indices==n),2);
    
    true_number=0;
    tp1_test=0;
    tp2_test=0;
    tp3_test=0;
    tp_label=0;
    
    for m1=1:size(test_set)
        tp1_test=(test_set(m1)-c1_mean).^2;
        tp2_test=(test_set(m1)-c2_mean).^2;
        tp3_test=(test_set(m1)-c3_mean).^2;
        
        if(tp1_test<tp2_test)&(tp1_test<tp3_test)
            tp_label=1;
        end
        if(tp2_test<tp1_test)&(tp2_test<tp3_test)
            tp_label=2;
        end
        if(tp3_test<tp1_test)&(tp3_test<tp2_test)
            tp_label=3;
        end
        
        if tp_label==test_label(m1)
            true_number=true_number+1;%正确则正确数加一
        end
    end
    
    acc(n)=true_number/size(test_set,1);%求正确率
end

avg_acc=mean(acc);
std=std(acc);