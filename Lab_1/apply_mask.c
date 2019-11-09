

#include "mex.h"


void apply_point_tfrm(int width, int height, const unsigned char *input1,const unsigned char *input2,const unsigned char *input3, unsigned char *output)
{

    for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++)
        {
            int ind = x*height + y;
          if (input3[ind]>0)
            output[ind]= input1[ind];
          else
            output[ind]= input2[ind];

        }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){

   
    if (nlhs != 1)
        mexErrMsgTxt("apply_mask can only accept 1 output argument");
    
    if (nrhs != 3)
        mexErrMsgTxt("apply_mask requires 3 input arguments");
    

    const mxArray *img1 = prhs[0];
    const mxArray *img2 = prhs[1];
    const mxArray *img3 = prhs[2];
    	
	
    if (!mxIsUint8(img1) || !mxIsUint8(img2))
        mexErrMsgTxt("apply_mask can only accept image1 and image2 of type 'd=uint8'");
    

    mwSize ndims = mxGetNumberOfDimensions(img1);
    const mwSize *dims = mxGetDimensions(img1);
    

    int height   = dims[0];
    int width    = dims[1];
	

    mxClassID input_type = mxGetClassID(img1);
   
    mxArray *output = mxCreateNumericArray(ndims, dims, input_type, mxREAL);
    plhs[0] = output;
   

    if (mxIsUint8(img1) && mxIsUint8(img2))
    {
        unsigned char *img_ptr1 = (unsigned char *)mxGetData(img1);
		unsigned char *img_ptr2 = (unsigned char *)mxGetData(img2);
		unsigned char *img_ptr3 = (unsigned char *)mxGetData(img3);
		
		
        unsigned char *out_ptr = (unsigned char *)mxGetData(output);
        
        apply_point_tfrm(width, height, img_ptr1, img_ptr2, img_ptr3, out_ptr);
    }
  
    
 
}
