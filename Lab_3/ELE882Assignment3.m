%% Section 2.1.1 Q1 %%

img = imread('MBG500.tif'); 

out = histogram_equalize(img);

figure (1);
montage({img,out});
title(sprintf('Original Image (Left) Vs. Histogram Equalization Image (Right)'));
%% Section 2.1.1 Q2 %%

img = imread('MBG500.tif'); 
h_val=9;
w_val=9;
out = adaptive_histogram(img,h_val,w_val);

figure (1);
montage({img,out});
title(sprintf('Original Image (Left) Vs. Adaptive Histogram (Right) with %d x %d Window', h_val, w_val));
%% Section 2.1.1 Q3 %%

img = imread('G500.tif'); 
r_val=2;
k_val=10;
out = unsharp_mask(img,r_val,k_val);

figure (1);
montage({img,out});
title(sprintf('Original Image (Left) Vs. Unsharp Mask (Right) with r = %d and k = %d', r_val, k_val));
%% Section 2.1.1 Q4 %%

img = imread('G500.tif'); 
k_val=1;
out = laplacian_sharpen(img,k_val);

figure (1);
montage({img,out});
title(sprintf('Original Image (Left) Vs. Laplacian Sharpening Mask (Right) with k = %d', k_val));

%% Section 2.2.1 Q1 & Q2 %%
i=2;
h_val=9;
w_val=9;
figure_count = 1;
    for c = 1:i
        if (c == 1)
            img = imread('Section 2.2 Q1_2 Image 1.png');
        elseif (c==2)
            img = imread('Section 2.2 Q1_2 Image 2.jpg');
     
        end
        out = histogram_equalize(img);
        out2 = adaptive_histogram(img,h_val,w_val);

        figure (figure_count);
        montage({img,out});
        title(sprintf('Original Image (Left) Vs. Histogram Equalization Image (Right)'));
        figure_count =figure_count+1;
        
        figure (figure_count);
        montage({img,out2});
        title(sprintf('Original Image (Left) Vs. Adaptive Histogram (Right) with %d x %d Window', h_val, w_val));
        figure_count =figure_count+1;
        
    end  
    
 %% Section 2.2.1 Q3 & Q4 %%
i=2;
r_val=2;
k_val_un=1;
k_val_la=2;

figure_count = 1;
    for c = 1:i
        if (c == 1)
            img = imread('Section 2.2 Q3_4 Image 1.png');
        elseif (c==2)
            img = imread('Section 2.2 Q3_4 Image 2.png');
     
        end
        out = unsharp_mask(img,r_val,k_val_un);
        out2 = laplacian_sharpen(img,k_val_la);

        figure (figure_count);
        montage({img,out});
        title(sprintf('Original Image (Left) Vs. Unsharp Mask (Right) with r = %d and k = %d', r_val, k_val_un));
        figure_count =figure_count+1;
        
        figure (figure_count);
        montage({img,out2});
        title(sprintf('Original Image (Left) Vs. Laplacian Sharpening Mask (Right) with k = %d', k_val_la));
        figure_count =figure_count+1;
        
    end  
    
  %% Section 2.3 Noise Additive %%
    img = imread('noise_additive.png'); 
    H2 = (1/331)*[1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1];%Gaussian Filter
    out2 = spatial_filter(img,H2);
    out2 =cast(out2,'uint8');
    out3 = histogram_equalize(out2);
    figure (1);
    montage({img,out3});
    title(sprintf('Noise Additive: Original Image vs. Gaussian 5x5 Filter and Histogram Equalization Image (Right)'));
  
  %% Section 2.3 Noise Multiplicative %%
    img = imread('noise_multiplicative.png'); 
    H2 = (1/331)*[1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1];%Gaussian Filter
    H2= cast(H2,'double');
    out = spatial_filter(img,H2);
    out =cast(out,'uint8');
    out2 = histogram_equalize(out);
    figure (1);
    montage({img,out2});
    title(sprintf('Noise Multiplicative: Original Image vs. Gaussian 5x5 Filter and Histogram Equalization Image (Right)'));
  
  %% Section 2.3 Noise Impulsive %%
    k_value=1;
    img = imread('noise_impulsive.png'); 
    out = medfilt2(img);
    out2 = laplacian_sharpen(out,k_value);
    figure (1);
    montage({img,out2});
    title(sprintf('Noise Impulsive: Original Image vs. Median 3x3 Filter and Laplacian Sharpen Image (Right) with k = %d', k_value));
    
  %% Section 2.3 Snowglobe %%
    r_val=2;
    k_val=1;
    img = imread('snowglobe.png'); 
    H2 = (1/331)*[1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1];%Gaussian Filter
    out = spatial_filter(img,H2);
    out =cast(out,'uint8');
    
    out2 = histogram_equalize(img);
    out3 = unsharp_mask(out2,r_val,k_val);

    figure (1);
    montage({img,out3});
    title(sprintf('Original Image (Left) Vs. Histogram Equalization and Unsharp Mask Image (Right) with r = %d and k = %d (Right)', r_val, k_val));
    