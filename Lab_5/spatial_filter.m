function p = spatial_filter(img,H)

total =0;
count =1;

img =cast(img,'double');
img_height_unpadded=(size(img,1));
img_width_unpadded =(size(img,2));
size_h=size(H);
h_height=(size_h(1));
h_width=(size_h(2));

 if(size(img,3) ==3) %colour image
       flag =1;
       R= (img(:,:,1));
       G= (img(:,:,2));
       B= (img(:,:,3));
       output =zeros(img_height_unpadded,img_width_unpadded,3);
       R = padarray(R, [ceil(((h_height-1)/2)),ceil(((h_width-1)/2))]); 
       G = padarray(G, [ceil(((h_height-1)/2)),ceil(((h_width-1)/2))]); 
       B = padarray(B, [ceil(((h_height-1)/2)),ceil(((h_width-1)/2))]); 
       img_height=size(R,1);
       img_width=size(R,2);
 elseif(size(img,3) ==1) %gray image
     output =zeros(img_height_unpadded,img_width_unpadded);
     img = padarray(img, [ceil(((h_height-1)/2)),ceil(((h_width-1)/2))]); 
     img_height=size(img,1);
     img_width=size(img,2);
     flag =0;
 else
     error('Wrong Dimensions of Input Image');
 end
 

height_limit= ceil((h_height-1)); 
width_limit= ceil((h_width-1)); 

    while(count <=3)
        if (flag ==1)
            if (count ==1)
                img=R;
            elseif (count ==2)
                img=G;
            elseif (count ==3)
                img=B;
            end
        end
        
         for i=1:(img_height - height_limit) 
             for j=1:(img_width - width_limit)
                 for k=1:h_height
                     for m=1:h_width      
                        total = total +((img(i+(k-1),j+(m-1))*H(k,m))); 
                     end
                 end
                 output(i,j,count)=(total);
                 total =0;
             end 
         end    
         count =count+1;
         if (flag ==0)
            count =4;
         end
    end
    p = cast(output,'uint8');

end
