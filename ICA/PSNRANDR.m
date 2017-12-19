clc;
clear;
picpath = '�羰ͼ/';
outpath = 'result/4-3/fastica/';
sourcenum = [1,2,3];

outputnum = [4 2 6];

for i = 1:3
    pathofpic = [outpath,num2str(outputnum(i)),'.bmp'];
    pic = imread(pathofpic);
    pic = pic(:)';
    output(i,:)=pic;
end
for i = 1:4
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
psnr(i,j) = PSNR(double(source(j,:)),double(output(i,:)));
end
end
for i = 1:3
for j = 1:3
r(i,j) = corr(im2double(source(j,:)'),im2double(output(i,:)'));
end
end
for i = 1:4
for j = 1:3
rm(i,j) = corr(im2double(source(j,:)'),im2double(mix(i,:)'));
end
end
