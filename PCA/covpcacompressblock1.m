clc;
clear;
%%读取图片，产生样本
%Xp = zeros(112,92*10);

In = zeros(112,92,10);
%for j = 1:40
psnrbuffer = [5:9];
pcanum = [50,60,70,80,90,95];
for k = 1:6
    Xp = [];
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
[Xh,Yp,v] = nothingsconpca(Xp,pcanum(k));
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
Xp1 = im2uint8(Xp);
Xh2 = im2uint8(Xh);
psnr=PSNR(Xp1,Xh2)
psnrbuffer(k) = psnr;
end
%end