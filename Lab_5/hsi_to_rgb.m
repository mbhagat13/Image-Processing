function p = hsi_to_rgb(img)
  
    arguments
        img (:,:,3) double 
    end

    
    
    img_height = size(img,1);    
    img_width = size(img,2);
 
    output=zeros(img_height,img_width,3);
  
    %1 is H
    %2 is S
    %3 is I
    
     for i=1:(img_height) 
         for j=1:(img_width)
            H= (img(i,j,1));
            S= (img(i,j,2));
            I= (img(i,j,3));
            if ( 0<=H && H<((2/3)*pi))
                output(i,j,1) = I*(1+(S*cos(H))/cos((pi/3)-H));
                output(i,j,3) = I*(1-S);
                output(i,j,2) = 3*I -(output(i,j,1)+output(i,j,3));
            elseif ( ((2/3)*pi)<=H && H<((4/3)*pi))
                H=H-((2/3)*pi);
                output(i,j,1) = I*(1-S);
                output(i,j,2) = I*(1+(S*cos(H))/cos((pi/3)-H));
                output(i,j,3) = 3*I -(output(i,j,1)+output(i,j,2));
            elseif ( ((4/3)*pi)<=H && H<=(2*pi))
                H=H-((4/3)*pi);
                output(i,j,2) = I*(1-S);
                output(i,j,3) = I*(1+(S*cos(H))/cos((pi/3)-H));
                output(i,j,1) = 3*I -(output(i,j,2)+output(i,j,3));     
            end    
         end 
     end    
    
  p=output;


end
