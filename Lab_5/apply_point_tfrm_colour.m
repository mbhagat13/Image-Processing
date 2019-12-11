function p = apply_point_tfrm_colour(img,Cuser,Buser)
    count =1;
    
    if(size(img,3) ==3) %colour image
        tf=isa(img,'uint8');
        tf2=isa(img,'double');
        if(tf==1)
           img =im2double(img);
        end
        if(tf2==0 && tf==0)
            error('Input Data type was incorrect, must be double or uint8');     
        end
        
        img = img.*255;

    img_height = size(img,1);    
    img_width = size(img,2);
 
    output=zeros(img_height,img_width,3);
     for i=1:(img_height) 
         for j=1:(img_width)
            R= (img(i,j,1));
            G= (img(i,j,2));
            B= (img(i,j,3));
            win =[R G B];
            while (count<=3)
            result = win(count)*Cuser + Buser;         
                if (result >255)
                result =255;
                end
            output(i,j,count)=result;
            count =count+1;
            end
            count =1;
         end
     end
     
     output = im2uint8(output./255);
     p=output;
     
    elseif (size(img,3) ==1)
        mex apply_point_tfrm.c
        p = apply_point_tfrm(img, Cuser, Buser);
    else
        error('Incorrect Image Dimensions');
    end      
      
end
