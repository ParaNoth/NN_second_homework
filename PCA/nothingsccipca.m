function [ Xh, V ] = nothingsccipca( Xp, m )
% CCIPCA算法
% Xp - 图像样本矩阵n*N，每一列为一个样本,N为样本个数
% m - CCIPCA主元个数
% Xh - 压缩后数据矩阵，每一行为一个样本
% V - 特征向量
[nx,np] = size(Xp);
xm = mean(Xp,1);
Xp=Xp-repmat(xm,nx,1);

N = size(Xp, 2);
V = zeros(size(Xp, 1), m);
xmean = Xp(:,1);
%xmean = zeros(size(x, 1), 1);
V(:, 1) = Xp(:, 1); %在t=1,i=1时获得u的值
for t=2: m
    xi = Xp(:, t);
    xmean = ((t - 1) / t) * xmean + (xi - xmean) / t; 
    x1 = xi - xmean;
    for i = 1: t-1
        V(:, i) = ((t - 1) / t) * V(:, i) + (1 / t) .* x1 * x1' * normc(V(:, i));
        x1 = x1 - x1' * normc(V(:, i)) * normc(V(:, i));
    end
    V(:, t) = x1;
end
for t = m + 1: N
    xi = Xp(:, t);
    xmean = ((t - 1) / t) * xmean + (xi - xmean) / t;
    x1 = xi - xmean;
    for i = 1: m
        V(:, i) = ((t - 1) / t) * V(:, i) + (1 / t) .* x1 * x1' * normc(V(:, i));
        x1 = x1 - x1' * normc(V(:, i)) * normc(V(:, i));
    end
end
V = normc(orth(V));
Yp = V'*Xp;
Xh = V*Yp + repmat(xm,nx,1);
end