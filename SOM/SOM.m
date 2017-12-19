function [ W ] = SOM( Data, N_neurons, lr, delta, epoch )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[inputdim, NUM] = size(Data);
x = double(Data);
w = normrnd(0,0.5,inputdim,N_neurons);
% 神经元分布
if N_neurons == 3
    w_pos = [ 1 1; 1 2; 2 1 ]';
else
    w_pos = zeros(2,N_neurons);
    S = ceil(sqrt(N_neurons));
    for ii = 1:N_neurons
        w_pos(1,ii) = ceil(ii/S);
        w_pos(2,ii) = mod(ii,S);
        if w_pos(2,ii) == 0
            w_pos(2,ii) = S;
        end
    end
end

iter = 1;
delta_t = delta;
n_t = lr;
while iter<=epoch
    for ii = 1:NUM
        x_i = x(:,ii);
        % 计算神经元竞争获胜者
        D = 999999;
        c = 0;
        for jj = 1:N_neurons
            D_temp = norm(x_i-w(:,jj));
            if D_temp<D
                D = D_temp;
                c = jj;
            end
        end
        % 更新权值
        for jj = 1:N_neurons
            d2 = norm(w_pos(:,jj)-w_pos(:,c))^2;
            h_c_t = exp(-d2/delta_t);
            w(:,jj) = w(:,jj) + n_t*h_c_t*(x_i - w(:,jj));
        end
    end
    if ~mod(iter,50)
        fprintf('iter:%d\n',iter);
    end
    n_t = lr*(1-iter/epoch);
    delta_t = delta*exp(-iter/epoch);
    iter = iter + 1;
end
W = w;

end

