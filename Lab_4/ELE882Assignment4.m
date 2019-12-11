%% Section 3.1.1 Q1 xDoG %%

img = imread('digital_orca_blurred.png'); 

sig=0.9;
k_val=1.2;
p_val=100;
result_xDoG = xDoG(img,sig,k_val,p_val);
figure (1);
montage({img,result_xDoG});
title(sprintf('Original Image (Left) Vs. eXtended Difference of Gaussians (Right)'));
% Section 3.1.1 Q2 Hard Threshold 
ep = 0.5;
out_hard = hard_threshold(result_xDoG,ep);
figure (2);
montage({result_xDoG,out_hard});
title(sprintf('eXtended Difference of Gaussians (Left) vs. Hard Thresholding (Right)'));

% Section 3.1.1 Q2 Soft Threshold

ph=6;

out_soft = soft_threshold(result_xDoG,ep,ph);
figure (3);
montage({result_xDoG,out_soft});
title(sprintf('eXtended Difference of Gaussians (Left) vs. Soft Thresholding (Right)'));

figure (4);
montage({out_hard,out_soft});


% Section 3.1.1 Q3 Threetone
ep1 = 0.2;
ep2 = 0.7;
out_three_tone = three_tone(result_xDoG,ep1,ep2,ph);
figure (4);
montage({result_xDoG,out_three_tone});
title(sprintf('eXtended Difference of Gaussians (Left) vs. Three-tone Filter (Right)'));

figure(5)
montage({result_xDoG,out_hard,out_soft,out_three_tone}, 'Size', [1 4]);
title(sprintf('eXtended Difference of Gaussians, Hard Thresholding, Soft Thresholding, and Three-tone Filter'));


%% Section 3.1.2 Bonus %%
%img = imread('monarch.png'); 
img =imread('IMG_20190827_133005.jpg');

img = rgb2gray ( img );
N=16;
R=3;
gamma=10;
result_xDoG = oilify(img,N,R,gamma);
figure (1);
montage({img,result_xDoG});
title(sprintf('Original Image (Left) Vs. Oilify Filter (Right)'));

%% Section 3.2 Q1 %%
%img = imread('monarch.png'); 
img =imread('IMG_20190827_133005.jpg');
result_med = mult_median(img);
figure (1);
montage({img,result_med});
title(sprintf('Original Image (Left) Vs. Multiple Median Filter (Right)'));

% Section 3.2 Q2
T=0.2;
edge_detect_out=edge_detector(result_med,T);
figure(2);
montage({img,edge_detect_out});
title(sprintf('Original Image (Left) Vs. Edge Detector (Right)'));

% Section 3.2 Q3

result_cartoon = cartoon(img,edge_detect_out);
figure (3);
montage({img,result_cartoon});
title(sprintf('Original Image (Left) Vs. Cartoon Filter using Prewitt Edge Map (Right)'));


%% Section 3.2 Q4 Bonus %%
img = imread('monarch.png'); 
sig=1.8;
k_val=0.9;
p_val=500;
result_xDoG = xDoG(img,sig,k_val,p_val);

ep = 0.90;
out_hard = hard_threshold(result_xDoG,ep);
figure (1);
montage({img,result_xDoG,out_hard},'Size',[1 3]);
title(sprintf('Original Image (Left), eXtended Difference of Gaussians (Middle), and Hard Thresholding (Right)'));

result_cartoon = cartoon(img,out_hard);
figure (2);
montage({img,result_cartoon});
title(sprintf('Original Image (Left) Vs. Cartoon Filter using xDoG Hard Thresholded Edge Map (Right)'));