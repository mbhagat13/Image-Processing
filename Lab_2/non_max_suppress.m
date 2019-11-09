function p = non_max_suppress(img, H, W)
   
    size_img=size(img);
    img_height=(size_img(1));
    img_width=(size_img(2));

    pad_img = padarray(img, [W, H], 'both');
    
    p = img;
    
    for i = (1:img_height)
        for j =(1:img_width)
            
            max1 = max(pad_img(i:i+2*W-1, j:j+2*H-1));
            max2= max(max1);
            if (max2 ~= img(i, j))
                p(i, j) = 0;
            end
        end
    end
end