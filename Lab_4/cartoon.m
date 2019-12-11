function out = cartoon (img,img_edge)
check=0;
if size ( img ,3) > 1
    %img = rgb2gray ( img );
    check =1;
end

out=img;
img_height=size(img,1);
img_width=size(img,2);

     for i=1:(img_height) 
         for j=1:(img_width)
            if(img_edge(i,j)==255)
             if (check==0)
                out(i,j)=0;
             else
                out(i,j,:)=0;
             end
            end
         end 
     end    






end



