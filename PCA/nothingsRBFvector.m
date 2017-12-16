function [ X ] = nothingsRBFvector(x, rbfs_mean, rbfs_varible)
%返回一组RBF值，输入mean为RBF基的中心向量，varible为RBF基的方差，若x为标量，返回一个列向量。若x为n维列矢量，则返回一个由行向量组成的矩阵.mean为列矢量,与varible为标量 此处显示有关此函数的摘要
%   x为一个数据,
[sizeofx,~] = size(x);
[lenofmean,~] = size(rbfs_mean);
if sizeofx >= 1
    tempx = zeros(1,lenofmean);
    X = zeros(sizeofx,lenofmean);
    for i = 1:sizeofx
        for j = 1:lenofmean
            tempx(j)=exp(-norm(x(i,:)'-rbfs_mean(j,:)')^2/rbfs_varible/2);
        end
        X(i,:)=tempx;
    end
else
    X = 0;
end
end

