function [ M,Z ] = nothingswhiteningmatrix( X )
%输入样本X，输出M为白化矩阵
%   X为观测样本，一行为一个样本。
[~,col_size]=size(X);

%白化处理
MeanX=mean(X,2);
X=X-MeanX;
CorrX = (X * X')/col_size;
[U,lambda]=eig(CorrX);

% 白化矩阵
[lambda,I]=sort(diag(lambda),'descend');
U=U(:,I);
lambda=lambda';
lambda=lambda(abs(lambda)>1e-4);

% 源的个数为n
[~,n]=size(lambda);
U=U(:,1:n);

lambda=lambda.^(-0.5);
M=diag(lambda) * U';
Z=M*X;

end

