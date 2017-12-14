clc;
clear;
load 400pic.mat

[Xh,Yp,V] = nothingsconpca(Xp,20);
save 400picpca20