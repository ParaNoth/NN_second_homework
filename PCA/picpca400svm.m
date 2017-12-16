clc
clear
Xp = zeros(112*92,400);
Label = zeros(1,400);
for j = 1:40
    picdir = ['face/s',num2str(j),'/'];
    outdir = ['compress1/s',num2str(j),'/'];
for i = 1:10
    picpath = [picdir,num2str(i),'.bmp'];
    pic = imread(picpath);
    pic = im2double(pic);
    pic = reshape(pic,1,112*92);
    Label(:,10*(j-1)+i) = j;
    Xp(:,10*(j-1)+i) = pic;
end
end


save 400picsvm