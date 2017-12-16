function [ s ] = nothingshjica( x )
%UNTITLED12 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[numx,~] = size(x);

w = rand(numx,numx);
w = diag(diag(w)) + eye(numx);

eta = 0.01;
maxiter = 10000;
e = 1e-5;
for i = 1:maxiter
    y = (eye(numx) + w)\x;
    dw = eta.*(eye(numx) - (y.^3)*(y)');
    w = w + dw;
    w = w - diag(diag(w)) + eye(numx);
    if(max(abs(dw)) < e)
        break;
    end
end

s = (eye(numx)+w)\x;

end

