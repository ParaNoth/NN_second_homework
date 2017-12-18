clc;
clear;
load 400pic.mat
gwn = [2,5,7,10,15,20,25,30,40,50,60,80];
Y={};
for i=1:12
    i
    Xp1 = awgn(Xp,gwn(i));
[Xh,Yp,V] = nothingsconpca(Xp1,50);
Y{i} = Yp;
end
save 400pic12awgn