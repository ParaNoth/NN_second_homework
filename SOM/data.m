clc;
clear;
clc
clear
Xp = zeros(64*64,400);
Label = zeros(40,400);
for j = 1:3
    picdir = ['data/',num2str(j),'/'];
for i = 1:70
    picpath = [picdir,num2str(i),'.bmp'];
    pic = imread(picpath);
    pic = im2double(pic);
    pic = reshape(pic,1,64*64);
    Label(j,10*(j-1)+i) = 1;
    Xp(:,10*(j-1)+i) = pic;
end
end
