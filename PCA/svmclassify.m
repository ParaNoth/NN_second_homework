clc;
clear;
load 400picsvm.mat
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80];
Trainingerror=[1:10];
Testingerror =[1:10];
for i=1:12
[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
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