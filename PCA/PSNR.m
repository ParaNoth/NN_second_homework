function psnr=PSNR(Img,ImgHat)
%用输入第一项为原图像，第二项为压缩后的图。
[rs,cs]=size(Img);
[rhs,chs]=size(ImgHat);
if rs~=rhs || cs ~=chs
    error('Two image are not the same size');
end
dImg=Img-ImgHat;
MSquErr=mse(dImg);
MaxI=255;
psnr=10*log10(MaxI^2/MSquErr);