function x = imask(image,mask)
%general form of mask
%inpt=image is coloured
%b=mask is of odd order
inpt=image;
b=mask;
inpt=double(inpt);
opt=inpt;
[m,n]=size(b);
[e,f]=size(inpt);
for i=1:e-m+1
    for j=1:f-n+1
        d=inpt(i:i+m-1,j:j+m-1);
        g=b.*d;
        opt(i+(m-1)/2,j+(n-1)/2)=sum(sum(g));
    end 
end 
    x=uint8(opt);
    end 
