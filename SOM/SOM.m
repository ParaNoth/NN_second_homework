clear all;  
clc;  
%% 网络初始化及相应参数初始化  
%加载数据并归一化  
train_path = 'data\train\';
test_path = 'data\test\';
pic_size = 64*64;
train_num = 35;
test_num = 35;
type = 3;
loop_num = 1;
Ratio=zeros(1,loop_num);
Time = zeros(1,loop_num);
node_row = 20;
node_num = node_row^2;
weight_test=[0.01,0.2,0.6,10,20,30];
number_num = train_num*type;
datasize = pic_size*number_num;
for i = 1:type
    for j = 1:train_num
        filename = strcat(train_path,int2str(i),'\',int2str(j),'.bmp');
        temp = imread(filename);
        train_data(:,train_num*(i-1)+j)=reshape(double(temp),pic_size,1);
        train_data(:,train_num*(i-1)+j)=train_data(:,train_num*(i-1)+j)./sqrt(sum(train_data(:,train_num*(i-1)+j).*train_data(:,train_num*(i-1)+j))) ;%归一化
    end
end
train_label = [zeros(1,35),ones(1,35),2.*ones(1,35)];
for i = 1:type
    for j = 1:test_num
        filename = strcat(test_path,int2str(i),'\',int2str(35+j),'.bmp');
        temp = imread(filename);
        test_data(:,test_num*(i-1)+j)=reshape(double(temp),pic_size,1);
        test_data(:,test_num*(i-1)+j)=test_data(:,test_num*(i-1)+j)./sqrt(sum(test_data(:,test_num*(i-1)+j).*test_data(:,test_num*(i-1)+j))) ;%归一化
    end
end
dataset = [train_data,test_data];
[Xh,Yp,u]=nothingsconpca(dataset,50);%PCA
train_data = Yp(:,1:105);
test_data = Yp(:,106:end);
test_label = [zeros(1,35),ones(1,35),2.*ones(1,35)];
%weight init
pic_size = 50;

%%
for loop=1:loop_num
    tic
    weight = rand(pic_size,node_num);
    %weight = zeros(pic_size,node_num);
    %weight = ones(pic_size,node_num)*weight_test(loop);
    %邻域函数参数  
    delta=20;  
    %调整步幅  
    alpha=0.1;
    interation = 1000;
    %% SOM算法学习过程  
    for t= 4:-1:1                                   %%总体迭代次数  
        index_active=ones(1,node_num);              %%结点活跃标志  
        for n=1:number_num                            %%每个样本的输入 
            %alpha = 0.9*(1-n/300);
            %delta = 2*(1-n/100);
            % 竞争部分，根据最小距离确定获胜神经元  
            %[j_min]=SOM_compare(weight,train_data(:,n),node_num,index_active);  
            for j=1:node_num  
                distant(j,1)=sum((weight(:,j)-train_data(:,n)).^2);  
            end  
            [~,j_min]=min(distant);  
            while(index_active(1,j_min)==0)  
                distant(j_min,1)=10000000;  
                [~,j_min]=min(distant);  
            end
            %去激活，确保数据结点1对1映射  
            index_active(1,j_min)=0;  

            %为后续绘图部分服务  
            index_plot(1,n)=j_min;
            [x,y]=line_to_array(j_min,node_row);
            %fprintf('坐标[%d,%d]处为字符%s \n',x,y,train_label(1,n));  
            % 学习部分网络权值调整  
            st=num2str(t-1);
            weightlast = weight;
            for i=1:interation
                switch   st  
                    case '3'  
                        [weight]=SOM_neighb3(weight,train_data(:,n),j_min,delta,alpha,node_row);  
                    case '2'  
                        [weight]=SOM_neighb2(weight,train_data(:,n),j_min,delta,alpha,node_row);  
                    case '1'  
                        [weight]=SOM_neighb1(weight,train_data(:,n),j_min,delta,alpha,node_row);  
                    otherwise  
                        [weight]=SOM_neighb0(weight,train_data(:,n),j_min,alpha);  
                end  
            end
        end  
    end 
    indexraw_active=ones(1,node_num);
    for n=1:number_num                            %%每个样本的输入 
        for j=1:length(index_plot)  
            distantraw(j,1)=sum((weightlast(:,index_plot(j))-test_data(:,n)).^2);  
        end  
        [~,j_min]=min(distantraw); 
        %为后续绘图部分服务  
        indexraw_plot(1,n)=index_plot(j_min);
        output_label(1,n) = train_label(j_min); 
    end

    %% 绘制结点分布图像  
    figure;  
    for n=1:number_num   
        [x,y]=line_to_array(index_plot(1,n),node_row);  
        axis([-1,node_row+2,-1,node_row+4]);  
        switch num2str(train_label(1,n))
            case '0'
                text(x,y,'\bf\color{blue}\bullet');
                %text(x+0.2,y+0.2,int2str(train_label(1,n)));
            case '1'
                text(x,y,'\bf\color{red}\bullet');  
                %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
            case '2'
                text(x,y,'\bf\color{magenta}\bullet');  
                %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
%             case '3'
%                 text(x,y,'\bf\color{cyan}\bullet');  
%                 %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
%             case '4'
%                 text(x,y,'\bf\color{green}\bullet');  
%                 %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
%             case '5'
%                 text(x,y,'\bf\color{black}\bullet');  
%                 %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
%             case '6'
%                 text(x,y,'\bf\color[rgb]{1,0.84,0}\bullet');  
%                 %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
%             case '7'
%                 text(x,y,'\bf\color{gray}\bullet');  
%                 %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
%             case '8'
%                 text(x,y,'\bf\color{orange}\bullet');  
%                 %text(x+0.2,y+0.2,int2str(train_label(1,n))); 
%             case '9'
%                 text(x,y,'\bf\color{lightBlue}\bullet');  
%                 %text(x+0.2,y+0.2,int2str(train_label(1,n)));
        end
    %     [x2,y2]=line_to_array(indexraw_plot(1,n),node_row);  
    %     text(x2,y2,'-');  
    %     text(x2-0.1,y2+0.1,int2str(test_label(1,n)));
        hold on;  
    end 
    text(node_row+0.2,node_row+2,'\bf\color{blue}\bullet  0');
    text(node_row+0.2,node_row+1,'\bf\color{red}\bullet  1');
    text(node_row+0.2,node_row,'\bf\color{magenta}\bullet  2');
%     text(node_row+0.2,node_row-1,'\bf\color{cyan}\bullet  3');
%     text(node_row+0.2,node_row-2,'\bf\color{green}\bullet  4');
%     text(node_row+0.2,node_row-3,'\bf\color{black}\bullet  5');
%     text(node_row+0.2,node_row-4,'\bf\color[rgb]{1,0.84,0}\bullet  6');
%     text(node_row+0.2,node_row-5,'\bf\color{gray}\bullet  7');
%     text(node_row+0.2,node_row-6,'\bf\color{orange}\bullet  8');
%     text(node_row+0.2,node_row-7,'\bf\color{lightBlue}\bullet  9');
    hold on
    ratio=0;
    for i = 1:number_num
        if(test_label(i)==output_label(i))
            ratio = ratio+1;
        end
    end
    ratio = ratio/105;
    toc
    title(sprintf('Num=%d Ratio=%s Time=%s',loop,num2str(ratio),num2str(toc)));
    sprintf('第%d次迭代完成!',loop);
    Ratio(loop)=ratio;
    Time(loop)=toc;
    hold off
end
average_ratio = mean(Ratio);
average_time  = mean(Time);
