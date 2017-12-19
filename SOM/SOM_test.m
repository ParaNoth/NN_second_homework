function [ Distance,Labels ] = SOM_test( Test ,W )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
[~,NUM] = size(Test);
[~,N_neuron] = size(W);
x = double(Test);
Labels = zeros(1,NUM);
Distance = zeros(1,NUM);
for ii = 1:NUM
    x_i = x(:,ii);
    D = 99999;
    c = 0;
    for jj = 1:N_neuron
       D_tmp = norm(x_i-W(:,jj));
       if D_tmp<D
           D = D_tmp;
           c = jj;
       end
    end
    Labels(ii) = c;
    Distance(ii) = D;
end

