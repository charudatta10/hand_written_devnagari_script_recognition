function simplegui_neww
f=figure('visible','off','color','white','position',[0,0,600,400]);
set(f,'name','simplegui')
b=0;
hsttext=uicontrol('style','text','position',[100,300,400,50],'string',...
    'Devnagri Script Recognition','FontSize',24,'backgroundcolor','white');
hsttext1=uicontrol('style','text','position',[100,250,200,50],...
         'FontSize',20,'visible','off','backgroundcolor','white');
huitext=uicontrol('style','edit','position',[300,250,200,50],'visible','off');
uicontrol('style','pushbutton','string','rgb2gray',...
        'position',[100,200,200,50],'callback',@callbackfn1);
uicontrol('style','pushbutton','string','mask',...
        'position',[300,200,200,50],'callback',@callbackfn2); 
uicontrol('style','pushbutton','string','threshhold',...
        'position',[100,150,200,50],'callback',@callbackfn3);
uicontrol('style','pushbutton','string','segment',...
        'position',[300,150,200,50],'callback',@callbackfn4);   
uicontrol('style','pushbutton','string','recognition',...
        'position',[100,100,200,50],'callback',@callbackfn5); 
uicontrol('style','pushbutton','string','select',...
        'position',[300,100,200,50],'callback',@callbackfn6); 
movegui(f,'center')
set(f,'visible','on');
set([hsttext,hsttext1,huitext],'visible','on'); 
function callbackfn1(~,~)
 set(hsttext1,'string','rgb2gray');
  printstr=get(huitext,'string');
  factnum=str2num(printstr);
  b=iconv(b,factnum(1),factnum(2),factnum(3));
  figure;
  imshow(b)
  title('grayscale image')
  
end
function callbackfn2(~,~)
    set(hsttext1,'string','filter coef.');
 printstr=get(huitext,'string');
 factnum=str2num(printstr);
  b=imask(b,factnum);
  figure;
  imshow(b)
  title('filterd image')
end
function callbackfn3(~,~)
    set(hsttext1,'string','threshold level');
 printstr=get(huitext,'string');
 factnum=str2num(printstr);
  b=itresh(b,factnum);
  figure;
  imshow(b)
  title('binary image')
end
function callbackfn4(~,~)
    set(hsttext1,'string','segment');
    set(huitext,'visible','off');
    b=i_segrecn(b);
   disp('segmentetion complete');
end
function callbackfn5(~,~)
   set(hsttext1,'string','recognise');
   set(huitext,'visible','off'); 
   x=load('final_wght');
   w=load('final_desire');
   b=cell2mat(b);
   b=it_perceptron(x.input,w.desired_out,b);
   disp(b);
   c=fopen('new_file.txt','w');
   b = unicode2native(b, 'UTF-8');
   fwrite(c, b, 'uint8');
   fclose(c);
end
function callbackfn6(~,~)
a = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' });
b=imread(a);
figure;
imshow(b)
title('original image')
end
end