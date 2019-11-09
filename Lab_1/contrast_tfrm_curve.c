

#include "mex.h"



void contrast_tfrm_curve(int width, int height, const unsigned char *input, unsigned char *output, const unsigned char *T)
{

int check;

    for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++)
        {
            int ind = x*height + y;
			output[ind]= T[input[ind]];
			
        }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){

   
    if (nlhs != 1)
        mexErrMsgTxt("contrast_tfrm_curve can only accept 1 output argument");
    
    if (nrhs != 2)
        mexErrMsgTxt("contrast_tfrm_curve requires 2 input arguments");
    

    const mxArray *img = prhs[0];
    const mxArray *T = prhs[1];
	
	
    if (!mxIsUint8(img))
        mexErrMsgTxt("contrast_tfrm_curve can only accept images of type 'd=uint8'");
    

    mwSize ndims = mxGetNumberOfDimensions(img);
    const mwSize *dims = mxGetDimensions(img);
    

    
    int height   = dims[0];
    int width    = dims[1];
	

    mxClassID input_type = mxGetClassID(img);
   
    mxArray *output = mxCreateNumericArray(ndims, dims, input_type, mxREAL);
    plhs[0] = output;
   

    if (mxIsUint8(img))
    {
        unsigned char *img_ptr = (unsigned char *)mxGetData(img);
		unsigned char *T_ptr = (unsigned char *)mxGetData(T);
		
        unsigned char *out_ptr = (unsigned char *)mxGetData(output);
        
        contrast_tfrm_curve(width, height, img_ptr, out_ptr,T_ptr);
    }
  
    
 
}
