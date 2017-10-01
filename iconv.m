function opt = iconv(image,red,green,blue)
c=image(:,:,1);
d=image(:,:,2);
f=image(:,:,3);
opt=(red*c+green*d+blue*f);
end

