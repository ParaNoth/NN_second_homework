clc;
clear;
%%读取图片，产生样本
Xp = zeros(10,112*92);
for i = 1:10
    picpath = ['face/s1/',num2str(i),'.bmp']
    pic = imread(picpath);
    pic = im2double(pic);
    pic = reshape(pic,1,112*92);
    Xp(i,:) = pic;
end
[Xh,Yh,u] = nothingsconpca(Xp,5);