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
 
     
            img = imread('2.1.2_Q3_Image1.jpg');
     
        
        out = contrast_highlight_matlab(img, A, B, I);
        figure (1);
        imshow(out); title(sprintf('Section 2.1.2 Q3 Image 1'));
    