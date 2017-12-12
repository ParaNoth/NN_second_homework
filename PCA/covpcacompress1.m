clc;
clear;
%%读取图片，产生样本
Xp = zeros(10,112*92);
In = zeros(112,92,10);
for i = 1:10
    picpath = ['face/s3/',num2str(i),'.bmp']
    pic = imread(picpath);
    pic = im2double(pic);
    In(:,:,i) = pic;
    pic = reshape(pic,1,112*92);
    Xp(i,:) = pic;
end
[Xh,Yh,u] = nothingsconpca(Xp,6);

Out = zeros(112,92,10);

for i = 1:10
pic = Xh(i,:);
pic = reshape(pic,112,92);
Out(:,:,i) = pic;
pic = im2uint8(pic);
if ~exist('compress1/s3/')
    mkdir('compress1/s3/')
end
picpath = ['compress1/s3/',num2str(i),'.bmp']
imwrite(pic,picpath);
end
for i = 1:4
    subplot(2,4,2*i-1);imshow(In(:,:,i));
    subplot(2,4,2*i);imshow(Out(:,:,i));
end