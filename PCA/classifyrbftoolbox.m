clc;
clear;
clc;
clear;
load 400pic15pca
%load 400pic12awgn
wmatrix = zeros(40,40);
Index = [1:400];
Index = reshape(Index,10,40)';
%pcanum = [2,5,7,10,15,20,25,30,40,50,60,80,150,200,500];
gwn = [2,5,7,10,15,20,25,30,40,50,60,80];
Trainingerror=[1:9];
Testingerror =[1:9];
trainnum = [100:100:900];
for i = 1:9
Yp = Y{10};
%TrainingIndex = [1:2:400];
TrainingIndex = Index(:,1:i);
TrainingIndex = reshape(TrainingIndex,1,[]);
%TestingIndex = [2:2:400];
TestingIndex = Index(:,i+1:end);
TestingIndex = reshape(TestingIndex,1,[]);
Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);
Dp = Label(:,TrainingIndex);
Tp = Label(:,TestingIndex);

net = newrbe(Train,Dp,12);
predict = sim(net,Xtest);

[~,testlabel] = max(predict);
[~,Dplabel] = max(Tp);
Testingerror(i) = sum(testlabel~=Dplabel)/(10-i)/40;

predict = sim(net,Train);
[~,trainlabel] = max(predict);
[~,Dplabel] = max(Dp);
Trainingerror(i) = sum(trainlabel~=Dplabel)/i/40;
end

figure,plot(trainnum,Trainingerror,'s-');
hold on,plot(trainnum,Testingerror,'d-');
title('RBF网络loss情况');
xlabel('训练集数量');
ylabel('loss');
legend('trainloss','testloss');
grid;

