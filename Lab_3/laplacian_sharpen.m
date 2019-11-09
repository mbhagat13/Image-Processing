function p = laplacian_sharpen(img,k)

img =cast(img,'double');


L=abs(k).*[-1,-1,-1;-1,8,-1;-1,-1,-1]; %center is positive therefore k is assumed to be positive
img_mask=[0,0,0;0,1,0;0,0,0];

kernel = img_mask + L;

p=spatial_filter(img,kernel);
p=cast(p,'uint8');
   
end
