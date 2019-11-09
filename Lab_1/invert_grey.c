/**
 * @file
 * @brief Simple mex function to invert the greyscale values in an image.
 * @author Richard Rzeszutek (Ryerson University)
 * @date January 10, 2014
 * @copyright BSD 3-Clause (see COPYING file for more details)
 *
 * The invert_colours() function will take a greyscale image and invert all
 * of the values.  The purpose is to demonstrate how a mex function is 
 * structured and how pixels are accessed inside of an image.  The function
 * itself is very simple and has some rudimentary error checking to make 
 * sure that what is being provided is an valid matlab array/matrix that it
 * can operate on.
 *
 * Usage:
 *  >> img_inv = invert_grey(img);
 *
 * The output variable will contain the inverted version of the colours 
 * inside of the "img" variable.
 */

#include "mex.h"

/**
 * @brief Inverts an array of type "double".
 * @param[in] width
 *      the width of the image in pixels
 * @param[in] height
 *      the height of the image in pixels
 * @param[in] input
 *      pointer to the first element of the image that we're modifying
 * @param[out] output
 *      pointer to the first element of where the output image will be 
 *      stored
 */
void invertDouble(int width, int height, const double *input, double *output)
{
    // TODO: write the code to invert the values for a 'double' image.
}

/**
 * @brief Inverts an array of type "uint8".
 * @param[in] width
 *      the width of the image in pixels
 * @param[in] height
 *      the height of the image in pixels
 * @param[in] input
 *      pointer to the first element of the image that we're modifying
 * @param[out] output
 *      pointer to the first element of where the output image will be 
 *      stored
 */
void invertUint8(int width, int height, const unsigned char *input, unsigned char *output)
{
    // Matlab stores arrays in a COLUMN-MAJOR format (this is actually the
    // transpose of how images are *normally* stored but the math still 
    // works out to be mostly the same).  That means for a 4-row by 
    // 3-column matrix, the memory layout looks like:
    //
    //       0 | 1 | 2  --> x-axis
    //    ||============||
    //  0 || 0 | 4 | 8  ||
    //  - ||------------||
    //  1 || 1 | 5 | 9  ||
    //  - ||------------||
    //  2 || 2 | 6 | 10 ||
    //  - ||------------||
    //  3 || 3 | 7 | 11 ||
    //    ||============||
    //  ^
    //  y-axis
    //
    // That means if the (x,y) coordinate is (2,1) it refers to element 9.
    // The basic formula to compute this is:
    //
    //   index = x*HEIGHT + y
           
    // This isn't the only way to loop through the pixels in the image.
    // Think about this: you're running through all of the pixels in 
    // sequence so do you really need to have two loops?
    for (int y = 0; y < height; y++)
        for (int x = 0; x < width; x++)
        {
            int ind = x*height + y;
            output[ind] = 255 - input[ind];
        }
}

/**
 * @brief Main entry point into the mex function.
 * @param[in] nlhs
 *      the number of <em>input</em> arguments
 * @param[in] plhs
 *      an array of pointers to the matlab array objects
 * @param[in] nrhs
 *      the number of <em>output</em> arguments
 * @param[out]
 *      an array of uninitialized matlab array objects where the output 
 *      will be stored
 */
void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
    // One: ALWAYS check that the number of input and output arguments are 
    // correct otherwise the mex function will crash and take matlab down 
    // with it.  
    //
    // The mexErrMsgTxt() function will (safely) crash your mexfile and 
    // print the error message to let you know what went wrong.  The code
    // below returns errors if the number of inputs isn't '1' and if the
    // number of outputs isn't '1'.
    
    if (nlhs != 1)
        mexErrMsgTxt("invert_colours can only accept one input argument");
    
    if (nrhs != 1)
        mexErrMsgTxt("invert_colours requires one output argument");
    
    // Two: make sure that the input arguments are the right type.
    //
    // That means first verifying they're a data type that the mex function
    // will accept (this function can accept 'uint8' and 'double') because 
    // otherwise the results won't make sense and even possibly cause 
    // matlab to crash.  The mxIs*() functions return '1' if the array is
    // that type and '0' if it's not.
    
    const mxArray *img = prhs[0];
    if (!mxIsDouble(img) && !mxIsUint8(img))
        mexErrMsgTxt("invert_colours can only accept images of type 'double' or 'uint8'");
    
    // Three: extract the dimensions from the array.  
    // 
    // For this example, it's not a big deal if the size is weird (like a 
    // single row or column vector) but in more complicated applications 
    // you might need a minimum image size before your algorithm will work.
    // If you need a minimum size then you would put some extra checks to
    // avoid processing if the input image wasn't the right size.
    
    mwSize ndims = mxGetNumberOfDimensions(img);
    const mwSize *dims = mxGetDimensions(img);
    
    // Matlab returns the matrix dimensions inside of an array of length 
    // 'ndims' (or whatever you want to call the variable).  For a 
    // greyscale image, ndims will be 2 but for an RGB image, it should be
    // 3.  All matrices have two dimensions (even scalar values) so you 
    // don't need to check if there are two dimensions.
    
    int height   = dims[0];
    int width    = dims[1];
    
    // Four: allocate storage for the output.
    //
    // This is a bit tricky to set up because MATLAB doesn't allocate the
    // memory for the output.  Instead it allocates an array of pointers to
    // to where the outputs will go.  It's your responsibility to create 
    // the output arrays.  That's because MATLAB doesn't know what you want
    // the outputs to be.  Luckily, for this example the output will be the
    // same type and size of the input, making creating the array really 
    // easy.
    
    mxClassID input_type = mxGetClassID(img);
    
    // The mxCreateNumericArray() function is a generic way to create an
    // arbitrarily-sized matrix.  You tell matlab how large the matrix is 
    // by providing your own mwSize[] array.  You need to also specify the
    // data type of the array; that's what the output from the 
    // mxGetClassID() is (it's basically a more general form of the mxIs*()
    // functions).  The mxREAL flag tells matlab that the array will only 
    // contain real numbers.
    //
    // NOTE: There's an mxCreateDoubleMatrix() function that will let you 
    // create a MxN array of type double but for image processing, the 
    // more general mxCreateNumericArray() is usually more useful because 
    // it lets you chose the data type of the array.
    //
    // ANOTHER NOTE: the array is completely filled with zeros when it's 
    // first created so you don't have to worry about zeroing it out 
    // yourself.
    mxArray *output = mxCreateNumericArray(ndims, dims, input_type, mxREAL);
    plhs[0] = output;
   
    // Five: do the processing
    //
    // It's good practice to do the processing outside of mexFunction().  
    // All mexFunction() should do is just setup everything needed for the
    // processing to happen.  That way the processing code is kept separate
    // from any of the "plumbing" code that used to do the setup.
    //
    // NOTE: the mxGetData() function used below returns a void pointer.  
    // That means you have to cast it to the correct type before using it.
    if (mxIsUint8(img))
    {
        unsigned char *img_ptr = (unsigned char *)mxGetData(img);
        unsigned char *out_ptr = (unsigned char *)mxGetData(output);
        
        invertUint8(width, height, img_ptr, out_ptr);
    }
    else if (mxIsDouble(img))
    {
        // TODO: implement this
    }
    
    // Six: release any resources that you may have allocated
    // 
    // This step is OPTIONAL and depends on whether or not you used 
    // mxMalloc() to allocate any memory that is used internally by the 
    // mex function.  Because we didn't allocate anything, nothing else 
    // needs to be done.
}
