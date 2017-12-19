function [weight]=SOM_neighb1(weight,train_data_active,j_min,delta,alpha,node_row)  
  
%% 权值调整幅度分布  
%                          -0.2  
%                           0.2  
%                           0.6  
%        -0.2   0.2   0.6    1    0.6   0.2   -0.2  
%                           0.6  
%                           0.2  
%                          -0.2  
% 单位距离转化比例为0.4  
%% 坐标转换  
[x,y]=line_to_array(j_min,node_row);  
% 将1*70向量中的坐标转化为7*10矩阵中的坐标  
%    1   8    ···  
%    col   14   ···  
row = node_row;
col = node_row; 
%% 权值调整过程  
%结点靠上边情况  
if (x<=1)  
    for m=1:1:x+1  
        if (y<=1)          %结点靠左边  
            for n=1:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        elseif (y>=row)      %结点靠右边  
            for n=y-1:1:row  
                distant=sqrt((x-m)^2+(y-n)^2);  
weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        else  
            for n=y-1:1:y+1  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        end  
    end  
    %结点靠下边情况  
elseif (x>=col)  
    for m=x-3:1:col  
        if (y<=1)          %结点靠左边  
            for n=1:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        elseif (y>=row)      %结点靠右边  
            for n=y-1:1:row  
                distant=sqrt((x-m)^2+(y-n)^2);  
weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        else  
            for n=y-1:1:y+1  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        end  
    end  
    %结点正好在中间  
else  
    for m=x-1:1:x+1  
        if (y<=1)          %结点靠左边  
            for n=1:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        elseif (y>=row)      %结点靠右边  
            for n=y-1:1:row  
                distant=sqrt((x-m)^2+(y-n)^2);  
weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        else  
            for n=y-1:1:y+1  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        end  
    end  
end  
end 