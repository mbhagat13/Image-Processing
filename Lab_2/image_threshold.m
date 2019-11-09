function p = image_threshold(img,T)

size_img=size(img);
img_height=(size_img(1));
img_width=(size_img(2));

T_value= T*255;       

     for i=1:img_height
         for j=1:img_width

            if(img(i,j)>=T_value)
                p(i,j)=255; 
            else
                p(i,j)=0; 
            end

         end 
     end    
     

end
