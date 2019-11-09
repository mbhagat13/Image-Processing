function p = contrast_stretch_matlab(img)

    rmax = max(max(img));
    rmin = min(min(img));
    
    rmax = cast(rmax,'double');
    rmin = cast(rmin,'double');
    dif=rmax-rmin;
    size_img=size(img);
    height=(size_img(1));
    width=(size_img(2));

    for c=1:256
    T(c) =255*(((c-1)/dif) - (rmin/dif));
    end
    
     for i=1:height
         for j=1:width
         p(i,j)=T(img(i,j)+1);

         end 
     end    
    p = cast(p,'uint8');

end
