

#include "mex.h"



void contrast_piecewise(int width, int height, const unsigned char *input, unsigned char *output,  unsigned char  *a,  unsigned char  *b)
{

int check;

    for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++)
        {
            int ind = x*height + y;
			
			
			if(input[ind]<(a[0])){
			
			check=input[ind];
			
			}else if (((a[0])<=input[ind])&&(input[ind]<(b[0]))){
			
			check = input[ind] - a[0] +a[1];
			
			}else if (((b[0])<=input[ind])&&(input[ind]<=(255))){
			
			check = input[ind] - b[0] +b[1];				
			
			}
		
			if(check>255){
			output[ind] = 255;
			}else{
			output[ind] = (unsigned char *)(check);
			}
        }
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){

   
    if (nlhs != 1)
        mexErrMsgTxt("contrast_piecewise can only accept 1 output argument");
    
    if (nrhs != 3)
        mexErrMsgTxt("contrast_piecewise requires 3 input arguments");
    

    const mxArray *img = prhs[0];
    const mxArray *a1 = prhs[1];
	const mxArray *b1 = prhs[2];
	
	
    if (!mxIsUint8(img))
        mexErrMsgTxt("contrast_piecewise can only accept images of type 'd=uint8'");
    

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
		unsigned char  *a_ptr = ( unsigned char  *)mxGetData(a1);
		unsigned char  *b_ptr = ( unsigned char  *)mxGetData(b1);
		
		printf("r1:%d\n",a_ptr[0]);
		printf("s1:%d\n",a_ptr[1]);
		printf("r2:%d\n",b_ptr[0]);
		printf("s2:%d\n",b_ptr[1]);

		
        unsigned char *out_ptr = (unsigned char *)mxGetData(output);
        
        contrast_piecewise(width, height, img_ptr, out_ptr,a_ptr,b_ptr);
    }
  
    
 
}
