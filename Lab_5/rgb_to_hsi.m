function p = rgb_to_hsi(img)
    
    if(size(img,3) ==3)
        tf=isa(img,'uint8');
        if(tf==1)
           img =im2double(img);
        end
        tf2=isa(img,'double');
        if(tf2==0 && tf==0)
            error('Input Data type was incorrect, must be double or uint8');     
        end  
    else
        error('Image is not a colour image');     
    end      
        
        
    
    
    sort_done =0;
    k=1;

    img_height = size(img,1);    
    img_width = size(img,2);
 
    output=zeros(img_height,img_width,3);
  
    %1 is H
    %2 is S
    %3 is I
    
     for i=1:(img_height) 
         for j=1:(img_width)

            R= (img(i,j,1));
            G= (img(i,j,2));
            B= (img(i,j,3));
           
            
            if(R==G && G==B && R==B)
                output(i,j,1)=0;
            else
                output(i,j,1) = ((R-G) + (R-B))*0.5;
                denom=(R-B)*(G-B) +(R-G)^2;
                denom = sqrt(denom);
                output(i,j,1) = output(i,j,1)/denom;
                output(i,j,1) = acos(output(i,j,1));
            end
            
            if (B>G)
                output(i,j,1) = (2*pi) - output(i,j,1);
            end
           
            win = [R,G,B];
            
             %bubble sort
             while (sort_done >= 0)                 
                 if(win(k+1)<win(k))
                    temp = win(k+1);
                    win(k+1)=win(k);
                    win(k)=temp;
                    sort_done =sort_done + 1;
                 end
                 k=k+1;
                 if(k==(size(win,2)))
                   k=1;
                   if(sort_done==0)
                       sort_done= -1;
                   else
                       sort_done=0;
                   end
                 end                 
             end
            sort_done=0;
            
            %find min value
            min = win(1);      
            
            if(R==0 && B==0 && G==0)
                output(i,j,2) = 0;
            else
                output(i,j,2) = 1 - ((3/(R+G+B))*min);
            
            end
            
            output(i,j,3) =(R+G+B)/3;
            
            
         end 
     end    
    
  p=output;


end
