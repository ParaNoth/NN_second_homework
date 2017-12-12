clc;
clear;
%%读取图片，产生样本
Xp = zeros(112*92,10);
In = zeros(112,92,10);
for i = 1:10
    picpath = ['face/s3/',num2str(i),'.bmp']
    pic = imread(picpath);
    pic = im2double(pic);
    In(:,:,i) = pic;
    pic = reshape(pic,112*92,1);
    Xp(:,i) = pic;
end
[Xh,v] = nothingsccipca(Xp,5);

Out = zeros(112,92,10);
for i = 1:10
pic = Xh(:,i);
pic = reshape(pic,112,92);
Out(:,:,i) = pic;
pic = im2uint8(pic);
picpath = ['compress1/s3/',num2str(i),'.bmp']
imwrite(pic,picpath);
end
for i = 1:4
    subplot(2,4,2*i-1);imshow(In(:,:,i));
    subplot(2,4,2*i);imshow(Out(:,:,i));
end