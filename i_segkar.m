function opt=i_segkar(inpt_image)
%
line_no = 1;
word_no = 1;
char_no = 1;
%
b=inpt_image;
q = 0;
[m n]=size(b);
l=1;
u=zeros(1,400);
for i=1:m
    
    if (sum(b(i,:)) < n)
        u(1,l)=i;
        l=l+1;
        
    end;
end

h=zeros(1,m);
h(1,1)=u(1,1);
j=2;

for i=2:m-1
    if ((u(1,i+1)-u(1,i)) > 1)
        h(1,j)=u(1,i);
        j=j+1;
        h(1,j)=u(1,i+1);
        j=j+1;
        
    end;
    if(u(1,i)==0)
        break;
    end;
    
end;
h(1,j)=u(1,i-1);
for line_no = 1 : 2 : 9
    c=zeros(h(1,line_no+1)-h(1,line_no)+1,n);
    
    j=1;
    if h(1,line_no) ~= 0
        for i=h(1,line_no):h(1,line_no+1)
            
            
            c(j,:) = b(i,:);
            j = j+1;
            
        end;
        
        
        h(1,j)=u(1,i-1);
    end;
    l=1;
    u=zeros(1,1000);
    for i=1:n
        
        if (sum(c(:,i)) < (h(1,line_no+1)-h(1,line_no)+1))
            u(1,l)=i;
            l=l+1;
            
        end;
    end
    k=zeros(1,n);
    k(1,1)=u(1,1);
    j=2;
    
    for i=2:n-1
        if(u(1,i)==0)
            break;
        end;
        if ((u(1,i+1)-u(1,i)) > 1)
            k(1,j)=u(1,i);
            j=j+1;
            k(1,j)=u(1,i+1);
            j=j+1;
            
        end;
        
    end;
    k(1,j)=u(1,i-1);
    for word_no = 1 : 2 : 19
        d=zeros(h(1,line_no+1)-h(1,line_no)+1,k(1,word_no+1)-k(1,word_no)+1);
        
        i=k(1,word_no);
        if i ~= 0
            for j=1:k(1,word_no+1)-k(1,word_no)+1
                
                
                d(:,j) = c(:,i);
                i = i+1;
            end;
            %end;
            
            %eliminate shirolekha
            [x_shiro y_shiro]=size(d);
            new1 = 1*x_shiro/5;
            lekhaless=zeros(x_shiro,y_shiro);
            for i=1:x_shiro;
                for j=1:y_shiro;
                    if (i >=1 && i < new1)                                                % ||
                        %if( sum(d(i,:))< 1*(y_shiro-y_shiro/2));
                        lekhaless(i,:)=1;
                    else
                        lekhaless(i,j)=d(i,j);
                    end;
                end;
            end;
        end;
        
        
        l=1;
        u=zeros(1,1000);
        for i=1:k(1,word_no+1)-k(1,word_no)+1
            
            if (sum(lekhaless(:,i)) < (h(1,line_no+1)-h(1,line_no)+1))
                u(1,l)=i;
                l=l+1;
                
            end;
        end
        s=size(u);
        ch=zeros(1,n);
        ch(1,1)=u(1,1);
        j=2;
        
        for i=2:n-1
            if(u(1,i)==0)
                break;
            end;
            if ((u(1,i+1)-u(1,i)) > 1)
                ch(1,j)=u(1,i);
                j=j+1;
                ch(1,j)=u(1,i+1);
                j=j+1;
                
            end;
            
        end;
        ch(1,j)=u(1,i-1);
        
        %
        %--------------------------------
        
        for char_no = 1 : 2 : 19
            
            cha=zeros(h(1,line_no+1)-h(1,line_no)+1,ch(1,char_no+1)-ch(1,char_no)+1);
            
            i=ch(1,char_no);
            if i ~= 0
                for j=1:ch(1,char_no+1)-ch(1,char_no)+1
                    
                    
                    cha(:,j) = lekhaless(:,i);
                    i = i+1;
                end;
                [x_cha y_cha]=size(cha);
                if x_cha > 2 && y_cha > 2
                    q=q+1;
                    cha1 = imresize(cha, [20 20]);
                    opt(:,:,q)=cha1;
                    
                end;
            end;
            
            
            
        end;
        
    end;
end;
end

