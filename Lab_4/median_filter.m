function p = median_filter(img,win_limit)

sort_done =0;
k=1;

if size ( img ,3) > 1
    img = rgb2gray ( img );
end
img_height_unpadded=(size(img,1));
img_width_unpadded =(size(img,2));
output =zeros(img_height_unpadded,img_width_unpadded);

img = padarray(img, [((win_limit-1)/2),((win_limit-1)/2)]); 
img_height=(size(img,1));
img_width=(size(img,2));

    for i=1:(img_height - win_limit) 
         for j=1:(img_width - win_limit)
             win = img(i:(i+win_limit-1),j:(j+win_limit-1)); 
             win_row = reshape(win,1,[]);
             
             %bubble sort
             while (sort_done >= 0)                 
                 if(win_row(k+1)<win_row(k))
                    temp = win_row(k+1);
                    win_row(k+1)=win_row(k);
                    win_row(k)=temp;
                    sort_done =sort_done + 1;
                 end
                 k=k+1;
                 if(k==(size(win_row,2)-1))
                   k=1;
                   if(sort_done==0)
                       sort_done= -1;
                   else
                       sort_done=0;
                   end
                 end                 
             end
            
            sort_done=0;
            output(i,j)= win_row(ceil(size(win_row,2)/2));
             
         end 
    end

     p=cast(output,'uint8');

end
