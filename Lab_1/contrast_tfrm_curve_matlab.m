function p = contrast_tfrm_curve_matlab (img,T)
size_img=size(img);
height=(size_img(1));
width=(size_img(2));

     for i=1:height
         for j=1:width
            p(i,j)=T(img(i,j)+1);
         end 
     end


end

