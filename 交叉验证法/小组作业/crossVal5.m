clc
clear all
close all

load iris.mat
indices = crossvalind('Kfold',size(iris,1),5);
avg_acc=[];
for i=1:max(indices)
    train_set=[]; train_label=[];
    train_set=iris(find(indices~=i),1:4);
    train_label=iris (find(indices~=i),5);
    
    test_set=[]; test_label=[];
    test_set= iris(find(indices==i),1:4);
    test_label=iris (find(indices==i),5);
    class= classify(test_set, train_set, train_label);
    acc=sum(class == test_label) / length(test_label) ;
    avg_acc(i)=acc;
   clear train_set train_label test_set test_label class acc
end

avg=mean(avg_acc);
std=std(avg_acc);