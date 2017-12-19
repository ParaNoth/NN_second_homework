function [ s ] = nothingshjica( x )
%UNTITLED12 此处显示有关此函数的摘要
%   此处显示详细说明
[numx,~] = size(x);

w = rand(numx,numx);
w = w - diag(diag(w)) + eye(numx);

eta = 0.0001;
maxiter = 20000;
e = 1e-7;
for i = 1:maxiter
    y = (eye(numx) + w)\x;
    dw = (eye(numx)-(y.^3)*(y)');
    %dw = (y.^3)*(y.^3)';
    w = w + eta.*dw;
    w = w - diag(diag(w)) + eye(numx);
    if(max(abs(dw-diag(diag(dw)))) < e)
        break;
    end
end
if i == maxiter
    fprintf('out of maxiter!\n')
end
s = (eye(numx)+w)\x;

end

