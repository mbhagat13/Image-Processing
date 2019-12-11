function med_result = mult_median(img)


if size ( img ,3) > 1
    img = rgb2gray ( img );
end

    med_result=median_filter(img,7);
    med_result=median_filter(med_result,3);
    med_result=median_filter(med_result,3);
    med_result=median_filter(med_result,3);
    med_result=cast(med_result,'uint8');
end
