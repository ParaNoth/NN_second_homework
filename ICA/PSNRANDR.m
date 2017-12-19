clc;
clear;
picpath = '�羰ͼ/';
outpath = 'result/3-3/r4/';
sourcenum = [1,3,4];

outputnum = [1 3 5];

for i = 1:3
    pathofpic = [outpath,num2str(outputnum(i)),'.bmp'];
    pic = imread(pathofpic);
    pic = pic(:)';
    output(i,:)=pic;
end
for i = 1:3
    pathofpic = [outpath,'mix',num2str(i),'.bmp'];
    pic = imread(pathofpic);
    pic = pic(:)';
    mix(i,:)=pic;
end
for i = 1:3
    pathofpic = [picpath,num2str(sourcenum(i)),'.bmp'];
    pic = imread(pathofpic);
    pic = pic(:)';
    source(i,:)=pic;
end
for i = 1:3
for j = 1:3
psnr(i,j) = PSNR(double(source(i,:)),double(output(j,:)));
end
end
for i = 1:3
for j = 1:3
r(i,j) = corr(im2double(source(j,:)'),im2double(output(i,:)'));
end
end
for i = 1:3
for j = 1:3
rm(i,j) = corr(im2double(source(j,:)'),im2double(mix(i,:)'));
end
end
