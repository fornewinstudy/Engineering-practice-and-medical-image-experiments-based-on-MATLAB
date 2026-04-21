clc
clear all
close all

load iris.dat
indices = crossvalind('Kfold',size(iris,1),10);
avg_acc=[]; returnK=5;
for i=1:max(indices)
    train_set=[]; train_label=[];
    train_set=iris(find(indices~=i),1:4);
    train_label=iris (find(indices~=i),5);
    
    test_set=[]; test_label=[];
    test_set= iris(find(indices==i),1:4);
    test_label=iris (find(indices==i),5);
    
    predictLabel=[];
    for j=1:size(test_set,1)
        tempTest=[];tempTest=test_set(j,:);
        distList=[];
        for k=1:size(train_set,1)
            tempTrain=[];tempTrain=train_set(k,:);
            dist=[];dist=sqrt(sum((tempTest-tempTrain).^2));
            distList(k,1)=dist;
            clear tempTrain dist
        end
        [c,v]=sort(distList);
%         predictLabel(j,1)=train_label(v(1:returnK));
        potentialLabel=[];potentialLabel=train_label(v(1:returnK));
        if min(potentialLabel)==max(potentialLabel)
            predictLabel(j,1)=potentialLabel(1);
        else  
%             predictLabel(j,1)=round(mean(potentialLabel));
            count1=length(find(potentialLabel==1)); weightCount1=0.2;
            count2=length(find(potentialLabel==2));weightCount1=0.6;
            count3=length(find(potentialLabel==3));weightCount1=0.2;
            [c,v]=max([count1,count2,count3])
            predictLabel(j,1)=v(1);
            
        end 
           
        clear tempTest distList k c v
    end
    acc=sum(predictLabel == test_label) / length(test_label) ;
    avg_acc(i)=acc;
   clear train_set train_label test_set test_label class acc
end

performance_avg=mean(avg_acc)
performance_std=std(avg_acc)