

#include "mex.h"



void contrast_highlight(int width, int height, const unsigned char *input, unsigned char *output, int A, int B, int I)
{

int check;

    for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++)
        {
            int ind = x*height + y;
			if(input[ind] < A || input[ind] > B){
			output[ind] = I;
			}else{
			output[ind] = input[ind];
			}
        }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){

   
    if (nlhs != 1)
        mexErrMsgTxt("contrast_highlight can only accept 1 output argument");
    
    if (nrhs != 4)
        mexErrMsgTxt("contrast_highlight requires 4 input arguments");
    

    const mxArray *img = prhs[0];
    int A = mxGetScalar(prhs[1]);
	int B = mxGetScalar(prhs[2]);
	int I = mxGetScalar(prhs[3]);
	
    if (!mxIsUint8(img))
        mexErrMsgTxt("contrast_highlight can only accept images of type 'd=uint8'");
    

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
        
        contrast_highlight(width, height, img_ptr, out_ptr, A, B, I);
    }
  
    
 
}
