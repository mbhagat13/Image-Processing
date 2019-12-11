function p = histogram_equalize(img)

count =1;

if  ~isa(img, 'uint8')
  error('input image must be a uint8')
end

    counter_histogram_nm = 1;
    img_height=(size(img,1));
    img_width=(size(img,2));
    
    img_cast=cast(img,'double');
    
 if(size(img_cast,3) ==3) %colour image
     R = (img_cast(:,:,1));
     G = (img_cast(:,:,2));
     B = (img_cast(:,:,3));
     flag =1;
     p = zeros(img_height,img_width,3);

 elseif(size(img_cast,3) ==1) %gray image
     flag =0;
     p = zeros(img_height,img_width,1);

 else
     error('Wrong Dimensions of Input Image');
 end

 
    while(count <=3)
        if (flag ==1)
            if (count ==1)
                img_cast=R;
            elseif (count ==2)
                img_cast=G;
            elseif (count ==3)
                img_cast=B;
            end
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
                  p(i,j,count) = LUT(img_cast(i,j)+1);
             end 
         end
         counter_histogram_nm =1;
         count = count +1;
         if(flag ==0)
             count =4;
         end    
    end
    
    p=cast(p,'uint8');

   

end
