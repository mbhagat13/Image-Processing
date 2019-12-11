

#include "mex.h"



void apply_point_tfrm(int width, int height, const unsigned char *input, unsigned char *output, int C, int B)
{

int check;

    for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++)
        {
            int ind = x*height + y;
			check =C*input[ind] +B;
			if(check>255){
			output[ind] = 255;
			}else{
			output[ind] = (unsigned char *)(check);
			}
        }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){

   
    if (nlhs != 1)
        mexErrMsgTxt("apply_point_tfrm can only accept 1 output argument");
    
    if (nrhs != 3)
        mexErrMsgTxt("apply_point_tfrm requires 3 input arguments");
    

    const mxArray *img = prhs[0];
    int C = mxGetScalar(prhs[1]);
	int B = mxGetScalar(prhs[2]);
	
	
    if (!mxIsUint8(img))
        mexErrMsgTxt("apply_point_tfrm can only accept images of type 'd=uint8'");
    

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
        unsigned char *out_ptr = (unsigned char *)mxGetData(output);
        
        apply_point_tfrm(width, height, img_ptr, out_ptr,C,B);
    }
  
    
 
}
