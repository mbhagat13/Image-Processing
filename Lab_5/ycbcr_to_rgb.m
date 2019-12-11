function p = ycbcr_to_rgb(img)
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
    
    conversion = [1 0 1.402; 1 -0.34414 -0.71414; 1 1.772 0];
    offset = [0; 128; 128];
    
    for i=1:(img_height) 
         for j=1:(img_width)

            Y= (img(i,j,1));
            Cb= (img(i,j,2));
            Cr= (img(i,j,3));
            win = [Y;Cb;Cr];
            if (flag==1)
                win = win - offset;
            end
            result= conversion*win;  
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
