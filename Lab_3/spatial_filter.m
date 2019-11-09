function p = spatial_filter(img,H)

size_img = size(img);
img_height_unpadded=(size_img(1));
img_width_unpadded =(size_img(2));
output =zeros(img_height_unpadded,img_width_unpadded);
img =cast(img,'double');

total =0;
    
size_h=size(H);
h_height=(size_h(1));
h_width=(size_h(2));
img = padarray(img, [ceil(((h_height-1)/2)),ceil(((h_width-1)/2))]); 

size_img = size(img);
img_height=(size_img(1));
img_width=(size_img(2));

height_limit= ceil((h_height-1)); 
width_limit= ceil((h_width-1)); 


     for i=1:(img_height - height_limit) 
         for j=1:(img_width - width_limit)

             for k=1:h_height
                 for m=1:h_width      
                     
                    total = total +((img(i+(k-1),j+(m-1))*H(k,m))); 
                     
                 end
             end
             output(i,j)=(total);
             total =0;
         end 
     end    
   p = output;
end
