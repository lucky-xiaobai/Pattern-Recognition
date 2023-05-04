%% 方法1：使用knn分类器
clear,clc
%读取数据
[order,f1,f2,f3,f4,class]=textread('iris.txt');
%也可以使用下面系统自带的数据集，和上面的一样，但训练集和测试集需要自行分割
%load fisheriris

%特征值归一化处理
[input,minI,maxI] = premnmx( [f1 , f2 , f3 , f4 ]');

Mdl = fitcknn(input',class,'NumNeighbors',4,'Standardize',1);
%计算交叉验证损失
CVMdl = crossval(Mdl);
kloss = kfoldLoss(CVMdl);
sprintf('识别率是 %3.3f%%',100*(1-kloss))

%% 方法2：使用knnsearch
clear,clc
%读取训练数据
[order,f1,f2,f3,f4,class] = textread('train.txt');

%特征值归一化处理
[input,minI,maxI] = premnmx( [f1 , f2 , f3 , f4 ]');

%读取测试数据
[order_t,f1_t,f2_t,f3_t,f4_t,class_t]=textread('test.txt');

%特征值归一化处理
[input_t,minI_t,maxI_t] = premnmx( [f1_t , f2_t , f3_t , f4_t ]');

%调用knnsearch
Idx = knnsearch(input',input_t','K',5);

%统计损失率,测试数据集的数量
loss=0;
size=length(input_t);

for i=1:size
    index=mode(class(Idx(i,:)));
    if index~=class_t(i)
        loss=loss+1;
    end
end 
sprintf('识别率是 %3.3f%%',100*(1-loss/size))