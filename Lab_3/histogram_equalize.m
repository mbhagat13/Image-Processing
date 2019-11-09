function p = histogram_equalize(img)


if  ~isa(img, 'uint8')
  error('input image must be a uint8')
end

counter_histogram_nm = 1;

size_img = size(img);
img_height=(size_img(1));
img_width=(size_img(2));

histogram = zeros(256,1);
CDF = zeros(256,1);
 p = zeros(img_height,img_width);

img_cast=cast(img,'double');

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
              p(i,j) = LUT(img_cast(i,j)+1);
         end 
     end    
   
   p=cast(p,'uint8');

   

end
