function output = soft_threshold(img, epsilon, phi)

if size ( img ,3) > 1
    img = rgb2gray ( img );
end

size_img=size(img);
img_height=(size_img(1));
img_width=(size_img(2));
output=zeros(size(img));

img = im2double(img);
epsilon=cast(epsilon,'double');
phi=cast(phi,'double');


  for i=1:img_height
         for j=1:img_width
            if(img(i,j)>epsilon)
                output(i,j) = 1; 
            else
                output(i,j) = 1 + tanh(phi*(img(i,j)-epsilon)); 
            end
         end 
  end  
output = im2uint8(output);



end
