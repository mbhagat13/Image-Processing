%% Section 3.1 Q1 and Q2 %%

img = imread('Lenna.png'); 
%img = imread('G500.tif');
img =im2double(img);


result_hsi= rgb_to_hsi(img);

H = result_hsi(:,:,1);
S = result_hsi(:,:,2);
I = result_hsi(:,:,3);

result_hsi_to_rgb =  hsi_to_rgb(result_hsi);

figure (1);
montage({img,H,S,I},'Size', [1 4]);
title(sprintf('Original Image (Left) Vs. HSI'));

figure (2);
montage({img,result_hsi_to_rgb});
title(sprintf('Original Image (Left) Vs. After HSI to RGB(Right)'));

%% Section 3.1 Q3 and Q4 %%

img = imread('mandrill.png'); 
%img = imread('G500.tif');
%img =im2double(img);

result_YCbCr= rgb_to_ycbcr(img);


Y = result_YCbCr(:,:,1);
Cb = result_YCbCr(:,:,2);
Cr = result_YCbCr(:,:,3);

%Cb = Cb + 0.5;
%Cr = Cr + 0.5;

result_YCbCr_to_rgb =  ycbcr_to_rgb(result_YCbCr);

figure (1);
montage({img,Y,Cb,Cr},'Size', [1 4]);
title(sprintf('Original Image (Left) Vs. YCbCr'));

figure (2);
montage({img,result_YCbCr_to_rgb});
title(sprintf('Original Image (Left) Vs. YCbCr Transform(Right)'));


%% Section 3.2 Q1 %%
img = imread('Lenna.png'); 
%img = imread('G500.tif');
img =im2double(img);

%angle is in radians
result_change_hue =  change_hue(img,pi);

figure (1);
montage({img,result_change_hue},'Size', [1 2]);
title(sprintf('Original Image (Left) Vs. Change of Hue (Right)'));

%% Section 3.2 Q2 %%
img = imread('Lenna.png'); 
%img = imread('G500.tif');
img =im2double(img);

result_change_saturation =  change_saturation(img,0.5);

figure (1);
montage({img,result_change_saturation},'Size', [1 2]);
title(sprintf('Original Image (Left) Vs. Change of Saturation (Right)'));

%% Section 3.2 Q3 %%
img = imread('monarch.png'); 
prompt = 'What is the C value?';
Cuser = input(prompt);
prompt = 'What is the B value?';
Buser = input(prompt);

%img=im2double(img);
out = apply_point_tfrm_colour(img, Cuser, Buser);
figure (1);
montage({img,out},'Size', [1 2]);
title(sprintf('Section 3.2 Q3 Image 1'));

%% Section 3.2 Q4 %%
%H1= [1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9;];% average 3x3 filter
H1= [0,-1,0;-1,4,-1;0,-1,0;];% Laplacian
H1=cast(H1,'double');

img = imread('monarch.png');
%img = imread('G500.tif'); 
out = spatial_filter(img,H1);
figure (1);
montage({img,out},'Size', [1 2]);
title(sprintf('Section 3.2 Q4 Image 1'));

%% Section 3.2 Q5 %%

%img = imread('MBG500.tif'); 
img = imread('mandrill.png');

out = histogram_equalize(img);

figure (1);
montage({img,out});
title(sprintf('Original Image (Left) Vs. Histogram Equalization Image (Right)'));

%% Section 3.2 Q6 %%

%img = imread('MBG500.tif'); 
img = imread('mandrill.png');

out = histogram_equalize_ycbcr(img);

figure (1);
montage({img,out});
title(sprintf('Original Image (Left) Vs. Histogram Equalization Image (Right)'));
