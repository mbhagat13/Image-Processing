function p = histogram_equalize_ycbcr(img)

    if  ~isa(img, 'uint8')
      error('input image must be a uint8')
    end

     counter_histogram_nm = 1;
     img_height=(size(img,1));
     img_width=(size(img,2));

     if(size(img,3) ==3) %colour image
         YCbCr = rgb_to_ycbcr(img);
         Y = (YCbCr(:,:,1));
         flag =1;

     elseif(size(img,3) ==1) %gray image
         flag =0;
     else
         error('Wrong Dimensions of Input Image');
     end
     
     img_cast=cast(img,'double');
     out = zeros(img_height,img_width,1);
 
    if (flag ==1)
           img_cast=cast(Y,'double');
    end

    histogram = zeros(256,1);
    CDF = zeros(256,1);

    for i=1:(img_height) 
         for j=1:(img_width)         
             histogram(img_cast(i,j)+1)= histogram(img_cast(i,j)+1)+1; 
         end 
    end    

    histogram_nm=histogram./(img_height*img_width);
    CDF(counter_histogram_nm) = histogram_nm(counter_histogram_nm);          
    counter_histogram_nm = counter_histogram_nm +1;

    while (counter_histogram_nm <=256)
        CDF(counter_histogram_nm) = CDF(counter_histogram_nm-1) + histogram_nm(counter_histogram_nm);    
        counter_histogram_nm = counter_histogram_nm +1;
    end

    LUT = CDF.*255;
    LUT=cast(LUT,'uint8');

    for i=1:(img_height) 
         for j=1:(img_width)         
              out(i,j) = LUT(img_cast(i,j)+1);
         end 
    end
    
    if(flag==0)
        p=cast(out,'uint8');
    elseif(flag==1)
        YCbCr(:,:,1) = out;
        RGB_img = ycbcr_to_rgb(YCbCr);
        p=cast(RGB_img,'uint8');
    end

end
