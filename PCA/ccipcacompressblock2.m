clc;
clear;
%%读取图片，产生样本
%Xp = zeros(112,92*10);
Xp = [];
In = zeros(112,92,10);
%for j = 1:40
j=1;
    picdir = ['face/s',num2str(j),'/'];
    outdir = ['compress2block/s',num2str(j),'/'];
for i = 1:10
    picpath = [picdir,num2str(i),'.bmp'];
    pic = imread(picpath);
    pic = im2double(pic);
    In(:,:,i) = pic;
    %pic = reshape(pic,112*92,1);
    Xp = [Xp,pic];
end
[Xh,v] = nothingsccipca(Xp,95);
Xh1 = reshape(Xh,[112,92,10]);
Out = zeros(112,92,10);
for i = 1:10

pic = Xh1(:,:,i);
Out(:,:,i) = pic;
pic = im2uint8(pic);
if ~exist(outdir)
    mkdir(outdir)
end
picpath = [outdir,num2str(i),'.bmp'];
imwrite(pic,picpath);
end
for i = 1:4
    subplot(2,4,2*i-1);imshow(In(:,:,i));
    subplot(2,4,2*i);imshow(Out(:,:,i));
end
psnr = PSNR(Xp,Xh)
%end