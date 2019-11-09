function p = unsharp_mask(img,r,k)

img =cast(img,'double');


[X,Y]=meshgrid(-r:1:r,-r:1:r);
sigma=1.0; %assuming sigma will be 1 for this lab
z=(1/(2*pi*sigma^2))*exp(-(X.^2+Y.^2)/(2*sigma^2));

H=z;

img_G=spatial_filter(img,H);

mask = img - img_G;

p = img+(k.*mask);
p=cast(p,'uint8');
   
end
