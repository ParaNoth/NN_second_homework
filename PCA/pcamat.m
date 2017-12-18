clc;
clear;
load 400pic.mat
pcanum = [2,5,7,10,15,20,25,30,40,50,60,80,150,200,500];
Y={};
for i=1:15
    i
[Xh,Yp,V] = nothingsconpca(Xp,pcanum(i));
Y{i} = Yp;
end
save 400pic15pca