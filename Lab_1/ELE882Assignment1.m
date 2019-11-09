%% Section 2.1.1 #1 %%
i =2;
mex apply_point_tfrm.c

    prompt = 'What is the C value?';
    Cuser = input(prompt);
    prompt = 'What is the B value?';
    Buser = input(prompt);

    for c = 1:i
    if (c == 1)
        img = imread('2.1.1_Q1_Image1.jpg');
    elseif (c==2)
        img = imread('2.1.1_Q1_Image2.jpg');
     
    end
    out = apply_point_tfrm(img, Cuser, Buser);
    figure (c);
    imshow(out); title(sprintf('Section 2.1.1 Q1 Image %d',c));
    end  

%% Section 2.1.1 #2 %%
  

img1 = imread('2.1.1_Q2_Image1.png');
img2 = imread('2.1.1_Q2_Image2.png');   
img3 = imread('2.1.1_Q2_Image3.png');

mex apply_mask.c
out = apply_mask(img1, img2, img3);

figure (1);
imshow(out); title('Section 2.1.1 Q2 Image 1');

%% Section 2.1.1 #3 %%

img1 = imread('2.1.1_Q3_Image1.png');
img2 = imread('2.1.1_Q3_Image2.png');
img3 = imread('2.1.1_Q3_Image3.png');
img4 = imread('2.1.1_Q3_Image4.png');

mex average_images.c
out = average_images(img1, img2, img3,img4);

figure (1);

imshow(out); title('Section 2.1.1 Q3 Image 1');

%% Section 2.1.2 #1 %%
i = 2;
mex contrast_stretch.c
    for c = 1:i
        if (c == 1)
            img = imread('2.1.2_Q1_Image1.jpg');
        elseif (c==2)
            img = imread('2.1.2_Q1_Image2.TIFF');
        end
        out = contrast_stretch(img);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q1 Image %d',c));
    end  

%% Section 2.1.2 #2 %%
i =2;
r1=0;
s1=0;

r2=0;
s2=0;

mex contrast_piecewise.c

    prompt = 'What is the r1 value?';
    r1 = input(prompt);
    prompt = 'What is the s1 value?';
    s1 = input(prompt);
    prompt = 'What is the r2 value?';
    r2 = input(prompt);
    prompt = 'What is the s2 value?';
    s2 = input(prompt);
  
    a=[r1,s1]
    b=[r2,s2]

    a= cast(a,'uint8');
    b= cast(a,'uint8');

    for c = 1:i
        if (c == 1)
            img = imread('2.1.2_Q2_Image1.TIFF');
        elseif (c==2)
            img = imread('2.1.2_Q2_Image2.TIFF');
     
        end
        out = contrast_piecewise(img, a, b);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q2 Image %d',c));
    end  


%% Section 2.1.2 #3 %%
i =2;
A=0;
B=0;
I=0;

mex contrast_highlight.c

    prompt = 'What is the A value?';
    A = input(prompt);
    prompt = 'What is the B value?';
    B = input(prompt);
    prompt = 'What is the I value?';
    I = input(prompt);
     
    for c = 1:i
        if (c == 1)
            img = imread('2.1.2_Q3_Image1.jpg');
        elseif (c==2)
            img = imread('2.1.2_Q3_Image2.jpg');
     
        end
        out = contrast_highlight(img, A, B, I);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q3 Image %d',c));
    end  
%% Section 2.1.2 #4 %%
i =2;

mex contrast_tfrm_curve.c

    for c=1:256
        if (mod(c,2)==0)
            T(c)= c/2;
        else
            T(c)= c/2 + 0.5;
        end
    
    end
    T=cast (T, 'uint8')
 
  %The function T(r), halves the intensity value of each point in the function
  %rounding up in case the result is a decimal value. This will make the
  %image darker.
   
    for c = 1:i
        if (c == 1)
            img = imread('2.1.2_Q3_Image1.jpg');
        elseif (c==2)
            img = imread('2.1.2_Q3_Image2.jpg');
     
        end
        out = contrast_tfrm_curve(img, T);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q4 Image %d',c));
    end  


%% Section 2.1.2 #5 %%
i = 2;

for c = 1:i
        if (c == 1)
            img = imread('2.1.2_Q1_Image1.jpg');
        elseif (c==2)
            img = imread('2.1.2_Q1_Image2.TIFF');
        end
        out = contrast_stretch_matlab(img);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q5 Image %d',c));
end  
    




