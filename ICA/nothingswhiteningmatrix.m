function [ M,Z ] = nothingswhiteningmatrix( X )
%��������X�����MΪ�׻�����
%   XΪ�۲�������һ��Ϊһ��������
[~,col_size]=size(X);
MeanX=mean(X,2);
X=X-MeanX;
CorrX = (X * X')/col_size;
[U,lambda]=eig(CorrX);
[lambda,I]=sort(diag(lambda),'descend');
U=U(:,I);
lambda=lambda';
lambda=lambda(abs(lambda)>1e-4);
[~,n]=size(lambda);
U=U(:,1:n);
lambda=lambda.^(-0.5);
M=diag(lambda) * U';
Z=M*X;

end

