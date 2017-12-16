clc;
clear;
load 400pic.mat
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80];
Trainingerror=[1:12];
Testingerror =[1:12];
for i=1:10
i
[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
fprintf('pca done!\n');
TrainingIndex = [1:2:400];
TestingIndex = [2:2:400];

Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);
Dp = Label(:,TrainingIndex);
net = newff(minmax(Train),[50,40],{'purelin','tansig','softmax'},'traingdm');
net.trainParam.lr=0.1;
net.trainParam.epochs=40000;

net = train(net,Train,Dp);
y = sim(net,Train);
a = max(y);
aa =repmat(a,40,1);
ylabel = (y==aa);
trainloss = sum(sum(ylabel~=Label(:,TrainingIndex)))/2;

y = sim(net,Xtest);
a = max(y);
aa =repmat(a,40,1);
ylabel = (y==aa);
testloss = sum(sum(ylabel~=Label(:,TestingIndex)))/2;
Trainingerror(i) = trainloss;
Testingerror(i)=testloss; 
end

save pcanumandloss



