function edges = edge_detector (img,T)

if size ( img ,3) > 1
    img = rgb2gray ( img );
end

H =[-1,0,1;-1,0,1;-1,0,1];
out = spatial_filter(img,H);
H2=rot90(H,3);
out2 = spatial_filter(img,H2);


H =[0,1,1;-1,0,1;-1,-1,0];
out3 = spatial_filter(img,H);
H2=rot90(H,1);
out4 = spatial_filter(img,H2);

edges= sqrt(out.^2 +out2.^2 + out3.^2 +out4.^2);
edges = hard_threshold(edges,T);

end



