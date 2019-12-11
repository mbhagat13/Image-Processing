function output = hard_threshold(img, epsilon)

if size ( img ,3) > 1
    img = rgb2gray ( img );
end

size_img=size(img);
img_height=(size_img(1));
img_width=(size_img(2));
output=zeros(size(img));

epsilon =(epsilon*255);
epsilon=cast(epsilon,'uint8');

  for i=1:img_height
         for j=1:img_width
            if(img(i,j)>epsilon)
                output(i,j)=255; 
            else
                output(i,j)=0; 
            end
         end 
  end  
output = im2uint8(output);



end
