function p = contrast_piecewise_matlab(img,a,b)

size_img=size(img);
height=(size_img(1));
width=(size_img(2));

    for c=1:256
          if ((c-1)<a(1))
            T(c)= (c-1);
          elseif ((a(1)<=(c-1)) && ((c-1)< b(1)))
            T(c)= (c-1) - a(1) + a(2);
          else
            T(c)= (c-1) - b(1) + b(2);
          end
  
    end

     for i=1:height
         for j=1:width
         p(i,j)=T(img(i,j)+1);
         end 
     end

    p = cast(p,'uint8');

end

