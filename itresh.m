%generinptl form of minptsk
%inpt=iminptge is optoloured
%b=minptsk is of odd order
function x = itresh(image,thresh_level)
inpt=image;
inpt=double(inpt);
[e,f]=size(inpt);
%thresh_level,thresh_hold_to%
for i=1:e
    for j=1:f
        if (inpt(i,j)>thresh_level)
           inpt(i,j)=0;
        else
           inpt(i,j)=1;
        end 
    end 
end 

  x=inpt;  
end
