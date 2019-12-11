function p = change_hue(img,hue_angle)
    
           
result_hsi= rgb_to_hsi(img);
H = result_hsi(:,:,1);
H = H + mod(hue_angle,(2*pi));
result_hsi(:,:,1)=H;
p =  hsi_to_rgb(result_hsi);

end
