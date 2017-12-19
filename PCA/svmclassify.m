clc;
clear;
load 400pic15pca
%load 400pic12awgn
load 400picsvm.mat
Index = [1:400];
Index = reshape(Index,10,40)';
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80,150,200,500];
%gwn = [2,5,7,10,15,20,25,30,40,50,60,80];
Trainingerror=[1:9];
Testingerror =[1:9];
trainnum = [40:40:360];
for i=1:9
%[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
Yp = Y{10};
% TrainingIndex = [1:2:400];
TrainingIndex = Index(:,1:i);
TrainingIndex = reshape(TrainingIndex,1,[]);
% TestingIndex = [2:2:400];
TestingIndex = Index(:,i+1:end);
TestingIndex = reshape(TestingIndex,1,[]);
Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);
Dp = Label(:,TrainingIndex);
Tp = Label(:,TestingIndex);

svm40pic = svmtrain2(Dp',Train','-s 0 -t 2');

[predict_label,accuracy,decision_values] = svmpredict2(Tp',Xtest',svm40pic);

testloss = (100-accuracy(1))*2;
Testingerror(i) = testloss;
end
figure;
plot(trainnum,Testingerror,'d-');
title('SVMloss情况');
xlabel('训练集数量');
ylabel('loss');
legend('testloss');
grid;