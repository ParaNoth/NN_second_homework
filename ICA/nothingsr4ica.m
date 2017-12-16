function [ S ] = nothingsr4ica( X )
%�Ľ׾ط���ICA������x�����s

[M,Z] = nothingswhiteningmatrix(X);
[n,~] = size(Z);
[~,col_size]=size(X);
Rz4=zeros(n,n);
for i=1:col_size
    Rz4=(Rz4*(i-1)+(Z(:,i) * Z(:,i)' * Z(:,i) * Z(:,i)'))/i;
end
[B,lambda]=eig(Rz4);
S=B' * Z;
end

