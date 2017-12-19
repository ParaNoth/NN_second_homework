function [weight]=SOM_neighb0(weight,train_data_active,j_min,alpha)  
weight(:,j_min)=weight(:,j_min)+alpha*(weight(:,j_min)-train_data_active);  
end  