function [weight]=SOM_neighb3(weight,train_data_active,j_min,delta,alpha,node_row)  
  
%% Ȩֵ�������ȷֲ�  
%                          -0.2  
%                           0.2  
%                           0.6  
%        -0.2   0.2   0.6    1    0.6   0.2   -0.2  
%                           0.6  
%                           0.2  
%                          -0.2  
% ��λ����ת������Ϊ0.4  
%% ����ת��  
[x,y]=line_to_array(j_min,node_row);  
% ��1*70�����е�����ת��Ϊ7*10�����е�����  
%    1   8    ������  
%    col   14   ������  
row = node_row;
col = node_row;
%% Ȩֵ��������  
%��㿿�ϱ����  
if (x<=3)  
    for m=1:1:x+3  
        if (y<=3)          %��㿿���  
            for n=1:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        elseif (y>=row-2)      %��㿿�ұ�  
            for n=y-3:1:row  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        else  
            for n=y-3:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        end  
    end  
    %��㿿�±����  
elseif (x>=col-2)  
    for m=x-3:1:col  
         if (y<=3)          %��㿿���  
            for n=1:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        elseif (y>=row-2)      %��㿿�ұ�  
            for n=y-3:1:row  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        else  
            for n=y-3:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        end  
    end  
    %����������м�  
else  
    for m=1:col  
         if (y<=3)          %��㿿���  
            for n=1:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        elseif (y>=row-2)      %��㿿�ұ�  
            for n=y-3:1:row  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        else  
            for n=y-3:1:y+3  
                distant=sqrt((x-m)^2+(y-n)^2);  
                weight(:,(n-1)*col+m)=weight(:,(n-1)*col+m)-alpha*exp(-distant^2/delta^2)*(weight(:,(n-1)*col+m)-train_data_active);  
            end  
        end  
    end  
end  
end  