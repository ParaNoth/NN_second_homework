clc;
clear;
audiopath = 'voice/music';
outpath = 'result/audio4-3/fastica/';
sourcenum = [1,2,3];
outputnum = [1 2 3];
figure;
title('分离后的信号');
for i = 1:3
    pathofaudio = [outpath,num2str(outputnum(i)),'.wav'];
    [audio,FS] = audioread(pathofaudio);
    subplot(3,1,i);plot(audio);
    output(i,:)=audio';
end
figure;
title('混合后的信号');
for i = 1:4
    pathofaudio = [outpath,'mix',num2str(i),'.wav'];
    [audio,FS] = audioread(pathofaudio);
    subplot(4,1,i);plot(audio);
    mix(i,:)=audio';
end
figure;
title('源信号');
for i = 1:3
    pathofaudio = [audiopath,num2str(sourcenum(i)),'.wav'];
    [audio,FS] = audioread(pathofaudio);
    subplot(3,1,i);plot(audio);
    source(i,:)=audio';
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
