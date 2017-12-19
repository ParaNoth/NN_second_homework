function psnr=PSNR(Img,ImgHat)
%�������һ��Ϊԭͼ�񣬵ڶ���Ϊѹ�����ͼ��
[rs,cs]=size(Img);
[rhs,chs]=size(ImgHat);
if rs~=rhs || cs ~=chs
    error('Two image are not the same size');
end
dImg=Img-ImgHat;
MSquErr=mse(dImg);
MaxI=255;
psnr=10*log10(MaxI^2/MSquErr);