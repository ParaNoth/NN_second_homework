clc;
clear;
load 400pic15pca.mat
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80,150,200,500];
Index = [1:400];
Index = reshape(Index,10,40)';
Trainingerror=[1:9];
Testingerror =[1:9];
trainnum = [100:100:900];
%for i=1:9
i=3
%[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
Yp = Y{10};
fprintf('pca done!\n');

TrainingIndex = Index(:,1:i);
TrainingIndex = reshape(TrainingIndex,1,[]);
TestingIndex = Index(:,i+1:end);
TestingIndex = reshape(TestingIndex,1,[]);
Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);
Dp = Label(:,TrainingIndex);
Tp = Label(:,TestingIndex);
net = newff(minmax(Train),[70,40],{'purelin','tansig','softmax'},'traingdm');
net.trainParam.lr=0.1;
net.trainParam.epochs=40000;

net = train(net,Train,Dp);
y = sim(net,Train);
[~,plabel] = max(y);
[~,dplabel] = max(Dp);
trainloss = sum(plabel~=dplabel);

y = sim(net,Xtest);
[~,plabel] = max(y);
[~,dplabel] = max(Tp);
testloss = sum(plabel~=dplabel);
Trainingerror(i) = trainloss/(i)/40;
Testingerror(i)=testloss/(10-i)/40; 
%end
figure,plot(trainnum,Trainingerror,'s-');
hold on,plot(trainnum,Testingerror,'d-');
title('BP网络loss情况');
xlabel('训练集数量');
ylabel('loss');
legend('trainloss','testloss');
grid;


