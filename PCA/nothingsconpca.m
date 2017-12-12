function [ Xh,Yp,u ] = nothingsconpca( Xp, m )
%Xp为输入样本矩阵，m为要提取的主元数
%u为主元对应的特征向量，Yp为，Xh为主元表示后的Xp,Yp
[np,nx] = size(Xp);
xm = mean(Xp',1)';
Xp=Xp-repmat(xm,1,nx);
Cx=cov(Xp);
[u,d]=eig(Cx);
u = u(:,nx-m+1:nx);
Yp = (Xp)*u;
Xh = Yp*u' + repmat(xm,1,nx);
end

