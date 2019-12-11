function output = three_tone(img, epsilon1, epsilon2, phi)

if size ( img ,3) > 1
    img = rgb2gray ( img );
end

size_img=size(img);
img_height=(size_img(1));
img_width=(size_img(2));
output=zeros(size(img));

img = im2double(img);
epsilon1=cast(epsilon1,'double');
epsilon2=cast(epsilon2,'double');
phi=cast(phi,'double');

value = (atanh(1-0.5)/phi)+epsilon2;
  for i=1:img_height
         for j=1:img_width
            if(img(i,j)>value)
                output(i,j) = 1; 
            elseif ((img(i,j)<=value))
                a=0.25 + 0.25 * tanh(phi * (img(i,j) - epsilon1));
                b=0.5 + tanh(phi * (img(i,j) - epsilon2));
                if (a>b)
                output(i,j) = a;          
                else
                output(i,j) = b;                              
                end
            end
         end 
  end  
output = im2uint8(output);



end
