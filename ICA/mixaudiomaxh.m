clc;
clear;
audiobuffer = [];
path1 = 'voice/';
outpath = 'result/audio4-3/maxh/';

aa = dir(path1);
[n,~]=size(aa);
%audionum = randperm(n-2);
audionum = [1,2,3];
filelist = {};
for i = 1:n-2
    filelist{i}=aa(i+2).name;
end

%picnum = [1 2 3];
FSbuffer = zeros(3,1);
for i = 1:3
    audiopath = [path1,filelist{audionum(i)}];
    [audio,FS] = audioread(audiopath);
    FSbuffer(i) = FS;
    audiobuffer = [audiobuffer;audio'];
end
mixmatrix = rand(4,3)';
mixmatrix = (mixmatrix./sum(mixmatrix))';
audiomix = mixmatrix*audiobuffer;

for i = 1:4
    if ~exist(outpath)
        mkdir(outpath);
    end
    audiopath = [outpath,'mix',num2str(i),'.wav'];
    audio = audiomix(i,:)';
    audio = audio./max(abs(audio));
    audiowrite(audiopath,audio,FS);
end
[M,Z] = nothingswhiteningmatrix(audiomix);
s = nothingsmaxhica(Z);
for i = 1:3
    if ~exist(outpath)
        mkdir(outpath);
    end
    audiopath = [outpath,num2str(i),'.wav'];
    audio = s(i,:)';
    audio = audio./max(abs(audio));
    audiowrite(audiopath,audio,FS);
end
