function [ Xh,Yp,u ] = nothingsconpca( Xp, m )
%XpΪ������������mΪҪ��ȡ����Ԫ��
%uΪ��Ԫ��Ӧ������������YpΪ��XhΪ��Ԫ��ʾ���Xp,YpΪϵ������
[nx,np] = size(Xp);
xm = mean(Xp,1);
Xp=Xp-repmat(xm,nx,1);
Cx = cov(Xp');
[u,d] = eig(Cx);
u = u(:,nx-m+1:nx);
Yp = u'*(Xp);
Xh = u*Yp + repmat(xm,nx,1);
end

