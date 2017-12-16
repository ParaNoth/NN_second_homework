function [ k ] = nothingskurt( X )
%四阶统计量计算，输入X，输出k。
d3 = Data.^3;
d4 = Data.^4;
m1 = mean(Data);
m2 = mean(d2);
m3 = mean(d3);
m4 = mean(d4);
k = m4-3*m2^2-4*m3*m1+12*m2*m1^2-6*m1^4;
end

