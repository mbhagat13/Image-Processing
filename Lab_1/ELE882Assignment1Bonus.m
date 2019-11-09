%% Section 2.1.2 #5 for #2 %%
i =2;
r1=0;
s1=0;

r2=0;
s2=0;

    prompt = 'What is the r1 value?';
    r1 = input(prompt);
    prompt = 'What is the s1 value?';
    s1 = input(prompt);
    prompt = 'What is the r2 value?';
    r2 = input(prompt);
    prompt = 'What is the s2 value?';
    s2 = input(prompt);
  
    a=[r1,s1];
    b=[r2,s2];
    a=cast (a, 'uint8');
    b=cast (b, 'uint8');

    for c = 1:i
        if (c == 1)
            img = imread('2.1.2_Q2_Image1.TIFF');
        elseif (c==2)
            img = imread('2.1.2_Q2_Image2.TIFF');
     
        end
        out = contrast_piecewise_matlab(img, a,b);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q2 Image %d',c));
    end 
    
 %% Section 2.1.2 #5 for #3 %%
 
 i =2;
A=0;
B=0;
I=0;


    prompt = 'What is the A value?';
    A = input(prompt);
    prompt = 'What is the B value?';
    B = input(prompt);
    prompt = 'What is the I value?';
    I = input(prompt);
    
    A=cast (A, 'uint8')
    B=cast (B, 'uint8')
    I=cast (I, 'uint8')
 
     
    for c = 1:i
        if (c == 1)
            img = imread('2.1.2_Q3_Image1.jpg');
        elseif (c==2)
            img = imread('2.1.2_Q3_Image2.jpg');
     
        end
        out = contrast_highlight_matlab(img, A, B, I);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q3 Image %d',c));
    end
  %% Section 2.1.2 #5 for #4 %%
  i=2;
  
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
        out = contrast_tfrm_curve_matlab(img, T);
        figure (c);
        imshow(out); title(sprintf('Section 2.1.2 Q4 Image %d',c));
    end  


  