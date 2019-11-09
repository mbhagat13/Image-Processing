function p = adaptive_histogram(img,H,W)

if  ~isa(img, 'uint8')
  error('input image must be a uint8')
end

size_img = size(img);
img_height_unpadded=(size_img(1));
img_width_unpadded =(size_img(2));
p =zeros(img_height_unpadded,img_width_unpadded);

img = padarray(img, [ceil(((H-1)/2)),ceil(((W-1)/2))]); 
size_img = size(img);
img_height=(size_img(1));
img_width=(size_img(2));

     for i=1:(img_height - H-1) 
         for j=1:(img_width - W-1)
             histo_subset= img(i:(i+H-1),j:(j+W-1)); 
             answer=histogram_equalize(histo_subset);
             p(i,j)=answer(ceil(((H-1)/2))+1,ceil(((W-1)/2))+1);
         end 
     end
     
     p=cast(p,'uint8');

end
