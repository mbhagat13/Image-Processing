function p = oilify(img,N,R,gamma)

if size ( img ,3) > 1
    img = rgb2gray ( img );
end
img_height_unpadded=(size(img,1));
img_width_unpadded =(size(img,2));
output =zeros(img_height_unpadded,img_width_unpadded);

R=2*R +1;

img = padarray(img, [((R-1)/2),((R-1)/2)]); 
img_height=(size(img,1));
img_width=(size(img,2));
img_max=max(max(img));

img_max=cast(img_max,'double');
img=cast(img,'double');
N=cast(N,'double');
R=cast(R,'double');
gamma=cast(gamma,'double');

local_h = zeros(1,N);
acc = zeros(1,N);

    for i=1:(img_height - R) 
         for j=1:(img_width - R)
             win = img(i:(i+R-1),j:(j+R-1));             
                 for k=1:(R) 
                    for m=1:(R) 
                     quant_level= (win(k,m)/img_max)*(N-1);
                     quant_level =cast(quant_level,'uint8');
                     local_h(quant_level+1)=local_h(quant_level+1) + 1;
                     acc(quant_level+1) = acc(quant_level+1)+ win(k,m);
                    end         
                 end

                hmax= max(local_h);
                A=0;
                B=0;
                for n=1:(R)
                     w = ((local_h(n)/hmax)^gamma);   
                     B=B+w;           
                     if(local_h(n)~=0)
                        scaling = (acc(n)/local_h(n));
                        A=A+(w*scaling);
                     end
                end
                if (A==0 && B==0)
                    final = img(i,j);
                else
                    final=A/B;
                end
                output(i,j)= (final);
                local_h = zeros(1,N);
                acc = zeros(1,N);
         end 
    end

     p=cast(output,'uint8');

end
