function p = rgb_to_ycbcr(img)
    flag=2;
    if(size(img,3) ==3)

        tf=isa(img,'double');
        if(tf==1)
            flag=0;
        end
        
        tf=isa(img,'uint8');
        if(tf==1)
            img =cast(img,'double');
            flag=1;
        end
        
        if(flag==2)
            error('Input Data type was incorrect, must be double or uint8');
        end      
    end
        

    img_height = size(img,1);    
    img_width = size(img,2);
 
    output=zeros(img_height,img_width,3);
  
    %1 is Y
    %2 is Cb
    %3 is Cr
    
    conversion = [0.299 0.587 0.114; -0.1687 -0.3313 0.5; 0.5 -0.4187 -0.0813];
    offset = [0; 128; 128];
    
    for i=1:(img_height) 
         for j=1:(img_width)

            R= (img(i,j,1));
            G= (img(i,j,2));
            B= (img(i,j,3));
         
           
            win = [R;G;B];
            
            result= conversion*win;
            if (flag==1)
                result = result + offset;
            end
            
            output(i,j,1)=result(1);
            output(i,j,2)=result(2);
            output(i,j,3)=result(3);
       
         end 
     end    
     if (flag==1)
     output=cast(output,'uint8');
     end
  p=output;


end
