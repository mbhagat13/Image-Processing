

%% Section 2.1.1 Q1 Image Size Not Reduced%%

H1= [1/9,1/9,1/9;1/9,1/9,1/9;1/9,1/9,1/9;];% average 3x3 filter
%H1= [0,-1,0;-1,4,-1;0,-1,0;];% Laplacian

H1=cast(H1,'double');

%img = imread('Lena-gray.tif'); 
img = imread('G500.tif'); 

img2=cast(img,'double');
out = spatial_filter(img2,H1);

out=cast(out,'uint8');

figure (1);
imshow(out); title(sprintf('Section 2.1.1 Q1 Image 1'));
%% Gaussian Filter%%

H2 = (1/331)*[1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1];%Gaussian Filter
H2= cast(H2,'double');
img = imread('G500.tif'); 

img2=cast(img,'double');

out = spatial_filter(img2,H2);
out = cast(out,'uint8');

figure (2);
imshow(out); title(sprintf('Section 2.1.1 Q1 Image 2'));


%% Section 2.1.1 Q2 NMS Function %%

img = imread('nms-test.png');        
%img = imread('Lena-gray.tif'); 

img2=cast(img,'double');

H=5.0;
W=5.0;
out = non_max_suppress(img2,H,W);
out=cast(out,'uint8');
figure (1);
imshow(out); title(sprintf('Section 2.1.1 Q2 Image %d',1));
  


%% Section 2.1.1 Q3 Threshold Function %%
T= 0.25;

img = imread('threshold-test.png');        
img2=cast(img,'double');

out = image_threshold(img2,T);
out=cast(out,'uint8');
figure (1);
imshow(out); title(sprintf('Section 2.1.1 Q3 Image %d',1));


%% Section 2.2 Edge Detector %%

H1 = [1,0,-1;2,0,-2;1,0,-1;];
H1=cast(H1,'double');

img = imread('G500.tif'); 

img2=cast(img,'double');

out1 = edge_detector(img2,H1,(135/255),3); 

out1=cast(out1,'uint8');
figure (1);
imshow(out1); title(sprintf('Section 2.2 Image 1'));


%% Section 2.3 Derivative Kernel%%
i =4;
img = imread('G500.tif'); 
img2=cast(img,'double');

type=["Central Difference","Forward Difference","Prewitt","Sobel"];

    for c = 1:i
    if (c == 1)
        H1= derivative_kernel('c');        
    elseif (c==2)
        H1=derivative_kernel('f');     
    elseif (c==3)
        H1=derivative_kernel('p');     
    elseif (c==4)
        H1=derivative_kernel('s');         
    end
    out1 = edge_detector(img2,H1,(70/255),3);
    out1=cast(out1,'uint8');    
    
    figure (c);
    imshow(out1); title(sprintf('Section 2.3 Image %d: %s', c, type(c)));
    end  
