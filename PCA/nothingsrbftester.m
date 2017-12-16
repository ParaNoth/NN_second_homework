function [ y ] = nothingsrbftester( w,rbfs_mean,rbfs_varible,xt )
%输入为w是权重系数，rbfs_mean为各rbf核中心，rbfs_varible为rbf的方差。xt为测试集矩阵。输出为y
%   此处显示详细说明
phi = nothingsRBFvector(xt, rbfs_mean, rbfs_varible);
y = phi*w;
end

