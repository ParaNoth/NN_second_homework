clc;
clear;
load 400pic15pca.mat
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80,150,200,500];
Trainingerror=[1:15];
Testingerror =[1:15];
%for i=1:15
i = 11
%[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
Yp = Y{i};
fprintf('pca done!\n');
TrainingIndex = [1:2:400];
TestingIndex = [2:2:400];

Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);
Dp = Label(:,TrainingIndex);
net = newff(minmax(Train),[90,50,40],{'purelin','tansig','tansig','softmax'},'traingdm');
net.trainParam.lr=0.1;
net.trainParam.epochs=40000;

net = train(net,Train,Dp);
y = sim(net,Train);
[~,plabel] = max(y);
[~,dplabel] = max(Dp);
trainloss = sum(plabel~=dplabel);

y = sim(net,Xtest);
[~,plabel] = max(y);
[~,dplabel] = max(Dp);
testloss = sum(plabel~=dplabel);
Trainingerror(i) = trainloss;
Testingerror(i)=testloss; 
%end
figure;
plot(pcanum,Trainingerror,'s-');
hold on;
plot(pcanum,Testingerror,'d-');
title('BP网络loss情况');
xlabel('主元数');
ylabel('loss');
legend('trainloss','testloss');
grid;


