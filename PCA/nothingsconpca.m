function [ Xh,Yp,u ] = nothingsconpca( Xp, m )
%XpΪ������������mΪҪ��ȡ����Ԫ��
%uΪ��Ԫ��Ӧ������������YpΪ��XhΪ��Ԫ��ʾ���Xp,Yp
[np,nx] = size(Xp);
xm = mean(Xp',1)';
Xp=Xp-repmat(xm,1,nx);
Cx=cov(Xp);
[u,d]=eig(Cx);
u = u(:,nx-m+1:nx);
Yp = (Xp)*u;
Xh = Yp*u' + repmat(xm,1,nx);
end

