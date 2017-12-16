function [ S ] = nothingsfastica( X )
%����ΪX�����ΪS
[M,Z]=nothingswhiteningmatrix(X);
[n,~]=size(Z);
[~,col_size]=size(X);
delta=1e-9;
MaxIteration=1000;
w=zeros(n,n);
for i=1:n
    wp=zeros(n,1);
    w(:,i)=rand(n,1)*1-0.5;w(:,i)=w(:,i)/norm(w(:,i));
    maxi=0;
    fprintf('����ִ�е�%d���źŵ���������\n',i);
    while 1-abs(wp' * w(:,i)) > delta && maxi<=MaxIteration
        maxi=maxi+1;
        wp=w(:,i);
        Eg2= w(:,i)' * Z;
        Eg2p=mean((1-Eg2.^2).*exp(-(Eg2.^2)/2));
        Eg2=Z*(Eg2.*exp(-(Eg2.^2)/2))'/col_size;
        w(:,i)=-Eg2p *w(:,i)+Eg2;
        w(:,i)=w(:,i)-w*w'*w(:,i);
        w(:,i)=w(:,i)/norm(w(:,i));
    end
    if maxi>MaxIteration
        fprintf('Warning: ��%d�������ź��޷�����!\n',i);
    end
end
S=w' * Z;  

end

