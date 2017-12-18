clc;
clear;
clc;
clear;
load 400pic15pca
wmatrix = zeros(40,40);
pcanum = [1:50];
Trainingerror=[1:50];
Testingerror =[1:50];
for i = 1:50
Yp = Y{6};
TrainingIndex = [1:2:400];

TestingIndex = [2:2:400];
Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);20
Dp = Label(:,TrainingIndex);

net = newrbe(Train,Dp,i);
predict = sim(net,Xtest);

[~,testlabel] = max(predict);
[~,Dplabel] = max(Dp);
Testingerror(i) = sum(testlabel~=Dplabel);

predict = sim(net,Train);
[~,trainlabel] = max(predict);
[~,Dplabel] = max(Dp);
Trainingerror(i) = sum(trainlabel~=Dplabel);
end

figure,plot(pcanum,Trainingerror,'s-');
hold on,plot(pcanum,Testingerror,'d-');
title('RBF网络loss情况');
xlabel('扩散系数');
ylabel('loss');
legend('trainloss','testloss');
grid;

