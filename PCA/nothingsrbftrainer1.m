function [ w,phi,rbfs_mean,rbfs_varible ] = nothingsrbftrainer1( x,t,N )
%x为输入变量，t为教师，N为RBF中心个数，w为输出权值，phi为样本的核矩阵,rbfs_mean为拟合向量,聚类使用matlab内建函数。
%   此处显示详细说明
[x_num,s_num] = size(x);
[len_t,~] = size(t);
if x_num~=len_t
    fprintf('sample numbers does not match!');
    return;
end

[Idx,C]=kmeans(x,N);
%由聚类结果对x求均值和方差
rbfs_mean = zeros(N,s_num);
meanoftempx = C(1,:);
dmax = 0;
for i = 1:N
    %提取每类元素的索引
    lastofmean = meanoftempx;
    meanoftempx = C(i,:);
    dmax = max(dmax, norm(meanoftempx'-lastofmean'));
    %放入对应位置
    rbfs_mean(i,:) = meanoftempx;
end

rbfs_varible = dmax/sqrt(N);
%生成核矩阵
phi = nothingsRBFvector(x, rbfs_mean, rbfs_varible);
%求取w
%w = inv(phi'*phi)*phi'*t;
w = phi\t;
end


