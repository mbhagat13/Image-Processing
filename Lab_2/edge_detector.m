function edges = edge_detector (img,H,T ,wndsz)
% Detect edges in an image .
%
% Inputs : img, image being processed ( can be either greyscale or RGB )

% H: the filtering kernel that approximates the horizontal derivative

% T [ optional ] the threshold value used by the edge detector ( default is
% 0.1)
% wndsz [ optional ] the size of the NMS filter window ( default is 5)

% Outputs : edges, a binary image where a value of ’1 ’ indicates an image edge

img = im2double ( img );

% if ‘img ’ is a colour image , convert it to greyscale first

if size ( img ,3) > 1
img = rgb2gray ( img );
end

% ‘ nargin ’ returns the number of input arguments so you can set
% arguments that have not been provided
if nargin == 2
T = 0.1;
wndsz = 5;
end

G1 = (1/331)*[1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1];%Gaussian Filter
img = spatial_filter(img,G1);



out = spatial_filter(img,H);

H2=rot90(H,3);
out2 = spatial_filter(img,H2);

out3= sqrt(out.^2 +out2.^2);

nms1 = non_max_suppress(out3,wndsz,1);
nms2 = non_max_suppress(out3,1,wndsz);
nms_final=nms1+nms2;

out = image_threshold(nms_final,T);

edges = out;

end



