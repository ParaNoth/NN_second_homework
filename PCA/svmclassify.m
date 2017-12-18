clc;
clear;
load 400pic15pca
load 400picsvm.mat
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80,150,200,500];
Trainingerror=[1:15];
Testingerror =[1:15];
for i=1:15
%[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
Yp = Y{i}
TrainingIndex = [1:2:400];
TestingIndex = [2:2:400];

Train = Yp(:,TrainingIndex);
Xtest = Yp(:,TestingIndex);
Dp = Label(:,TrainingIndex);

svm40pic = svmtrain2(Dp',Train','-s 0 -t 2');

[predict_label,accuracy,decision_values] = svmpredict2(Dp',Xtest',svm40pic);

testloss = (100-accuracy(1))*2;
Testingerror(i) = testloss;
end
hold on,plot(pcanum,Testingerror,'d-');
title('SVMloss情况');
xlabel('主元数');
ylabel('loss');
legend('testloss');
grid;