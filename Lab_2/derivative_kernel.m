function p = derivative_kernel(kernel)
% derivative_kernel returns the either of the following horizontal derivative kernels:
% Central Difference
% Forward Difference
% Prewitt 
% Sobel
%
%  Call function via following function call:
%
%  h = derivative_kernel('char') 
%
%   where 'char' can be as follows;
%   
%   'c' for Central Difference
%   'f' for Forward Difference
%   'p' for Prewitt
%   's' for Sobel

    if(kernel=='c')
        p = [1,0,-1];
    elseif(kernel=='f')
        p = [0,1,-1];
    elseif(kernel=='p')
        p = [1,0,-1;1,0,-1;1,0,-1;];
    elseif(kernel=='s')
        p = [1,0,-1;2,0,-2;1,0,-1;];
    else
        p=NaN;
        
    end


end
