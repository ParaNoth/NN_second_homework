clc;
clear;
%%��ȡͼƬ����������
Xp = zeros(112*92,10);
In = zeros(112,92,10);
psnrbuffer = [1:9];
%for j = 1:40
for k = 1:9
j=1;
    picdir = ['face/s',num2str(j),'/'];
    outdir = ['compress1/s',num2str(j),'/'];
for i = 1:10
    picpath = [picdir,num2str(i),'.bmp'];
    pic = imread(picpath);
    pic = im2double(pic);
    In(:,:,i) = pic;
    pic = reshape(pic,1,112*92);
    Xp(:,i) = pic;
end
[Xh,Yh,u] = nothingsconpca(Xp,k);

Out = zeros(112,92,10);

for i = 1:10
pic = Xh(:,i);
pic = reshape(pic,112,92);
Out(:,:,i) = pic;
pic = im2uint8(pic);
if ~exist(outdir)
    mkdir(outdir)
end
picpath = [outdir,num2str(i),'.bmp']
imwrite(pic,picpath);
end
figure;
for i = 1:4
    subplot(2,4,2*i-1);imshow(In(:,:,i));
    subplot(2,4,2*i);imshow(Out(:,:,i));
end
Xp1 = im2uint8(Xp);
Xh1 = im2uint8(Xh);
psnr=PSNR(Xp1,Xh1)
psnrbuffer(k) = psnr;
end
%end