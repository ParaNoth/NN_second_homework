clc;
clear;
rawpic = [];
path1 = '�羰ͼ/';
outpath = 'result/4-3/FASTICA/';
picnum = randperm(4);
%picnum = [1 2 3];
for i = 1:3
    picpath = [path1,num2str(picnum(i)),'.bmp'];
    pic = imread(picpath);
    pic = im2double(pic);
    pic = pic(:)';
    rawpic = [rawpic;pic];
end
mixmatrix = rand(4,3);
mixmatrix = mixmatrix./sum(mixmatrix);
picmix = mixmatrix*rawpic;



s = nothingsfastica(picmix);
for i = 1:3
    if ~exist(outpath)
        mkdir(outpath);
    end
    picpath = [outpath,num2str(i),'.bmp'];
    pic = s(i,:);
    pic = pic - min(pic);
    pic = pic./max(pic);
    pic = reshape(pic,256,512);
    imwrite(pic,picpath);
end
for i = 4:6
    if ~exist(outpath)
        mkdir(outpath);
    end
    picpath = [outpath,num2str(i),'.bmp'];
    pic = s(i-3,:);
    pic = pic - min(pic);
    pic = 1-pic./max(pic);
    pic = reshape(pic,256,512);
    imwrite(pic,picpath);
end