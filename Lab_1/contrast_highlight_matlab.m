function p = contrast_highlight_matlab(img,A,B,I)

size_img=size(img);
height=(size_img(1));
width=(size_img(2));


    for c=1:256
          if ((c-1)<A)
            T(c)= I;
          elseif ((A<=(c-1))&&((c-1)<=B))
            T(c)= (c-1);
          else
            T(c)= I;
          end
  
    end    
     
     for i=1:height
         for j=1:width
         p(i,j)=T(img(i,j)+1);
         end 
     end

    p = cast(p,'uint8');


end

