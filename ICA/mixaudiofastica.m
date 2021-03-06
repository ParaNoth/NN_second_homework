clc;
clear;
audiobuffer = [];
path1 = 'voice/';
outpath = 'result/audio3-3/FASTICA/';

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
mixmatrix = rand(3,3)';
mixmatrix = (mixmatrix./sum(mixmatrix))';
audiomix = mixmatrix*audiobuffer;

for i = 1:3
    if ~exist(outpath)
        mkdir(outpath);
    end
    audiopath = [outpath,'mix',num2str(i),'.wav'];
    audio = audiomix(i,:)';
    audio = audio./max(abs(audio));
    audiowrite(audiopath,audio,FS);
end

s = nothingsfastica(audiomix);
for i = 1:3
    if ~exist(outpath)
        mkdir(outpath);
    end
    audiopath = [outpath,num2str(i),'.wav'];
    audio = s(i,:)';
    audio = audio./max(abs(audio));
    audiowrite(audiopath,audio,FS);
end
