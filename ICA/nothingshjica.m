function [ s ] = nothingshjica( x )
%UNTITLED12 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[numx,~] = size(x);

w = rand(numx,numx);
w = diag(diag(w)) + eye(numx);

eta = 0.001;
maxiter = 100000;
e = 1e-5;
for i = 1:maxiter
    y = (eye(numx) + w)\x;
    dw = ((y.^3)*(y.^3)');
    w = w + eta.*dw;
    w = w - diag(diag(w)) + eye(numx);
    if(max(abs(dw)) < e)
        break;
    end
end
if i == maxiter
    fprintf('out of maxiter!\n')
end
s = (eye(numx)+w)\x;

end

