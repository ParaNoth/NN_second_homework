function [ Xh,Yp,u ] = nothingsconpca( Xp, m )
%Xp为输入样本矩阵，m为要提取的主元数
%u为主元对应的特征向量，Yp为，Xh为主元表示后的Xp,Yp为系数矩阵
[nx,np] = size(Xp);
xm = mean(Xp,1);
Xp=Xp-repmat(xm,nx,1);
Cx = cov(Xp');
[u,d] = eig(Cx);
u = u(:,nx-m+1:nx);
Yp = u'*(Xp);
Xh = u*Yp + repmat(xm,nx,1);
end

