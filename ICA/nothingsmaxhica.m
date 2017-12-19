function [ s ] = nothingsmaxhica( x )
%����ط���
%
[numx,numn]=size(x);
w = 0.5*rand(numx,numx);
I = ones(numx,numn);

maxiter = 40000;
eta = 0.000001;
e = 1e-7;
for i = 1:maxiter

u = w*x;
y = 1./(1+exp(-u));
dw = inv(w') + (I-2*y)*x';
if(max(abs(dw)) < e)
        break;
end
w = eta*dw+w;
end

if i == maxiter
    fprintf('out of maxiter!\n')
end
s = u;
dw
end