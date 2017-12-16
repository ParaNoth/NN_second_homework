clc;
clear;
clc;
clear;
load 400picrbf
wmatrix = zeros(40,40);
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80];
Trainingerror=[1:12];
Testingerror =[1:12];
for i = 1:12
[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
TrainingIndex = [1:2:400];

TestingIndex = [2:2:400];
Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);
Dp = Label(:,TrainingIndex);

net = newrbe(Train,Dp,8);
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
