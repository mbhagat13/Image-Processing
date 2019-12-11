function output = xDoG(img,sigma,k,p)

img = im2double(img);

if size ( img ,3) > 1
    img = rgb2gray ( img );
end

r=5;
[X,Y]=meshgrid(-r:1:r,-r:1:r);
z=(1/(2*pi*sigma^2))*exp(-(X.^2+Y.^2)/(2*sigma^2));

img_G=spatial_filter(img,z);

sigma =k*sigma;
z=(1/(2*pi*sigma^2))*exp(-(X.^2+Y.^2)/(2*sigma^2));
img_kG=spatial_filter(img,z);


output=(((1+p).*img_G)-p.*img_kG);
output = im2uint8(output);

end
