

#include "mex.h"



void contrast_stretch(int width, int height, const unsigned char *input, unsigned char *output)
{

int check;
double rmax=0;
double rmin=255;


    for (int y = 0; y < height; y++){
        for (int x = 0; x < width; x++)
        {
            int ind = x*height + y;

			if(input[ind]>rmax){
				rmax = input[ind];
			}
			
			if(input[ind]<rmin){
				rmin= input[ind];
			}
        }
	}
//	printf("rmax: %f\n", rmax);
//	printf("rmin: %f\n", rmin);
	
	
	for (int y = 0; y < height; y++){
        for (int x = 0; x < width; x++){
            int ind = x*height + y;
		
			check = 255*(((1/(rmax-rmin))*(1.0*input[ind])) -(rmin/(rmax-rmin)));
			output[ind]=check;
		}
	}
	
	
	
	
	
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]){

   
    if (nlhs != 1)
        mexErrMsgTxt("contrast_stretch can only accept 1 output argument");
    
    if (nrhs != 1)
        mexErrMsgTxt("contrast_stretch requires 1 input argument");
    

    const mxArray *img = prhs[0];
  
    if (!mxIsUint8(img))
        mexErrMsgTxt("contrast_stretch can only accept images of type 'd=uint8'");
    

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
        
        contrast_stretch(width, height, img_ptr, out_ptr);
    }
  
    
 
}
