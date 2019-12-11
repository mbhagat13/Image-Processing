function p = change_saturation(img,sat)
    
           
    result_hsi= rgb_to_hsi(img);

    S = result_hsi(:,:,2);
    S = S + sat;

    S_height = size(S,1);    
    S_width = size(S,2);
 

    for i=1:(S_height) 
         for j=1:(S_width)
             if(S(i,j)>1)
                 S(i,j)=1;
             elseif(S(i,j)<0)
                 S(i,j)=0;
             end
         end
    end

    result_hsi(:,:,2)=S;
    p =  hsi_to_rgb(result_hsi);

end
