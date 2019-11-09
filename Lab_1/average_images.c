

#include "mex.h"


void average_images(int width, int height, const unsigned char *input[], unsigned char *output, int amount){

	int check =0;
	
	 for (int y = 0; y < height; y++){
        for (int x = 0; x < width; x++){
            int ind = x*height + y;		
            output[ind]= 0;
        }
	}
	
	for (int k = 0; k < amount; k++){
   
		for (int y = 0; y < height; y++){
			for (int x = 0; x < width; x++){
				int ind = x*height + y;
				check = output[ind] + (*(input[k] + ind)) ;
			
				if(check>255){
					output[ind]=255;
				}else{
					output[ind]=check;
				}
			
				if(k==(amount-1)){
					output[ind]=output[ind]/amount;
				}			
			}
		}
	}
}


void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){

   
    if (nlhs != 1)
        mexErrMsgTxt("average_images can only accept 1 output argument");
    
	int i =0;	
	const mxArray *img[nrhs];
        
	for(i=0;i<nrhs;i++){
		img[i]=prhs[i];
	
		if (!mxIsUint8(img[i]))
			mexErrMsgTxt("average_images can only accept images of type 'd=uint8'");	
	}
	
		
    mwSize ndims = mxGetNumberOfDimensions(img[0]);
    const mwSize *dims = mxGetDimensions(img[0]);
    

    int height   = dims[0];
    int width    = dims[1];
	
	
//	printf("height%d\n", height);
//	printf("width%d\n", width);
	

    mxClassID input_type = mxGetClassID(img[0]);   
    mxArray *output = mxCreateNumericArray(ndims, dims, input_type, mxREAL);
	plhs[0] = output;
   
   
  int valid =0;
 const unsigned char *img_ptr[nrhs];   
   		for(i=0;i<nrhs;i++){	
			if (mxIsUint8(img[i])){
				img_ptr[i]=mxGetData(img[i]);
       			//printf("Print function %d\n", (*(img_ptr[i])));
                valid++;
            }	
		}

        
        if(valid==(nrhs)){
		unsigned char *out_ptr = (unsigned char *)mxGetData(output);  
		average_images(width, height, img_ptr, out_ptr, nrhs);
        }
		
 
}
